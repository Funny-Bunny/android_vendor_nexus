PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BUILD_TYPE=user

EXCLUDE_SYSTEMUI_TESTS := true

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0 \
    ro.setupwizard.rotation_locked=true \
    ro.opa.eligible_device=true

# Jack server heap size
export ANDROID_JACK_VM_ARGS += "-Xmx4096m"

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/nexus/overlay/common

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Latin IME lib - gesture typing
PRODUCT_COPY_FILES += \
    vendor/nexus/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Extra packages
PRODUCT_PACKAGES += \
    Busybox \
    LockClock

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# Init.d script support
PRODUCT_COPY_FILES += \
    vendor/nexus/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/nexus/prebuilt/common/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \
    vendor/nexus/prebuilt/common/etc/init.d.rc:root/init.d.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/nexus/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/nexus/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/nexus/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \

# Disable HDCP check
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wfd.nohdcp=1

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# PN version
$(call inherit-product-if-exists, vendor/nexus/products/version.mk)

# Pull in Prebuilt applications for phones
$(call inherit-product-if-exists, vendor/prebuilt/prebuilt.mk)

