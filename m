Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEEA2147EA;
	Tue, 20 May 2025 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751558; cv=none; b=XbaKtDupyLAmdEOxjM6t76Je8i8B4BsM+fLu/w/Uo5ygPehsrR+WklXvEcxecvzOGxU5b9umu1qPmtmVeS3DvtGU/ATPio3RKjvoLIbGvS6XNCSC1mHelhnfSW8vm6kEtIT8l+f8NI2nW+kQHzDJ1mDoJEAb0fYNDzGP8qXOLaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751558; c=relaxed/simple;
	bh=793u0ZInVK5p/flwWCSEM2PSQhqZpKVf1oYfEk1gMPA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aDfUZ2ivbRkxplX5YhTxwApMx6OPp7tv9c6C2QQ3oEOf+yN34AKa0Ir4/PdQKD1lzp2KMpY7BzzaVojLt8d7orKR89tIY+IzdBu3EW+gbx84ZzEb4tbi3Nu5XAQp2k8WhFK8O681EMg19oKG5GrUYvw34R1AuYbXK+IJhhijW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddqncBfU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddqncBfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747751556; x=1779287556;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=793u0ZInVK5p/flwWCSEM2PSQhqZpKVf1oYfEk1gMPA=;
  b=ddqncBfUEjKm2cMcGEAkfGK4kVWNJqt/GmO6cZNaYFY7Rtls2H8ypGSq
   6TR6FDSTrWsyZnSJnVk1js9TbBKJwmnmfU9O83eYmSaAFfBk0NC+HeKuZ
   DWXIV+09JBfxuFsOOmNQkuaYf+SN6p3UT33z2Za4puL/Gt7eesNLO9hpl
   OxuURtzI7f83LzEgUrugOUxITTOIr8WHB5RGjAfiw+G+r9hoIHmwc4uyD
   HM7dgDemiBqEdCIAWd+G2AQMaEHqvU5XbkU0w7lcWkADbrYswjLu5ti9Y
   IYjpNtg8yw4eKbhhPW9vCUcg4qVfsgcdpsorqMA8iPMJzqFu5dMvfK1H9
   w==;
X-CSE-ConnectionGUID: 7uHmZrxbQBqlBe0PrnGY9w==
X-CSE-MsgGUID: f+Dz/bLuR0e5yzGMVwHE3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="75091226"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="75091226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:32:35 -0700
X-CSE-ConnectionGUID: JoccjYr9RTevFBodzQsSNQ==
X-CSE-MsgGUID: SDKM6CoqSVaLZ1lfT6JpXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140637570"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:32:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 17:32:29 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 08/15] platform/x86/intel/pmt: Add PMT Discovery driver
In-Reply-To: <20250430212106.369208-9-david.e.box@linux.intel.com>
Message-ID: <2caddb52-dc05-a589-e7d7-de4035e5c803@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com> <20250430212106.369208-9-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1359848925-1747750577=:936"
Content-ID: <5690a3cb-f923-c949-7aa6-da0767329881@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1359848925-1747750577=:936
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <ea06bdef-2153-0c38-35de-dc749b093cf2@linux.intel.com>

On Wed, 30 Apr 2025, David E. Box wrote:

> This patch introduces a new driver to enumerate and expose Intel Platform
> Monitoring Technology (PMT) capabilities via a simple discovery mechanism=
=2E
> The PMT Discovery driver parses hardware-provided discovery tables from
> Intel Out of Band Management Services Modules (OOBMSM) and extracts featu=
re
> information for various providers (such as TPMI, Telemetry, Crash Log,
> etc). This unified interface simplifies the process of determining which
> manageability and telemetry features are supported by a given platform.
>=20
> This new feature is described in the Intel Platform Monitoring Technology
> 3.0 specification, section 6.6 Capability.
>=20
> Key changes and additions:
>=20
> New file drivers/platform/x86/intel/pmt/discovery.c:
>   =E2=80=93 Implements the discovery logic to map the discovery resource,=
 read
>     the feature discovery table, and validate feature parameters.
> New file drivers/platform/x86/intel/pmt/features.c:
>   =E2=80=93 Defines feature names, layouts, and associated capability mas=
ks.
>   =E2=80=93 Provides a mapping between raw hardware attributes and sysfs
>     representations for easier integration with user-space tools.
> New header include/linux/intel_pmt_features.h:
>   =E2=80=93 Declares constants, masks, and feature identifiers used acros=
s the
>     PMT framework.
> Sysfs integration:
>   =E2=80=93 Feature attributes are exposed under /sys/class/intel_pmt.
>   =E2=80=93 Each device is represented by a subfolder within the intel_pm=
t class,
>     named using its DBDF (Domain:Bus:Device.Function), e.g.:
>         features-0000:00:03.1
>   =E2=80=93 Example directory layout for a device:
>=20
>     /sys/class/intel_pmt/features-0000:00:03.1/
>     =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry
>     =E2=94=9C=E2=94=80=E2=94=80 crash_log
>     =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry
>     =E2=94=9C=E2=94=80=E2=94=80 per_core_performace_telemetry
>     =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry
>     =E2=94=9C=E2=94=80=E2=94=80 per_rmid_perf_telemetry
>     =E2=94=9C=E2=94=80=E2=94=80 tpmi_control
>     =E2=94=9C=E2=94=80=E2=94=80 tracing
>     =E2=94=94=E2=94=80=E2=94=80 uncore_telemetry
>=20
> By exposing PMT feature details through sysfs and integrating with the
> existing PMT class, this driver paves the way for more streamlined
> integration of PMT-based manageability and telemetry tools.
>=20
> Link: https://www.intel.com/content/www/us/en/content-details/710389/inte=
l-platform-monitoring-technology-intel-pmt-external-specification.html
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/pmt/Kconfig     |  12 +
>  drivers/platform/x86/intel/pmt/Makefile    |   2 +
>  drivers/platform/x86/intel/pmt/class.c     |  35 +-
>  drivers/platform/x86/intel/pmt/class.h     |   2 +
>  drivers/platform/x86/intel/pmt/discovery.c | 600 +++++++++++++++++++++
>  drivers/platform/x86/intel/pmt/features.c  | 205 +++++++
>  include/linux/intel_pmt_features.h         | 157 ++++++
>  7 files changed, 1011 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/pmt/discovery.c
>  create mode 100644 drivers/platform/x86/intel/pmt/features.c
>  create mode 100644 include/linux/intel_pmt_features.h
>=20
> diff --git a/drivers/platform/x86/intel/pmt/Kconfig b/drivers/platform/x8=
6/intel/pmt/Kconfig
> index e916fc966221..0ad91b5112e9 100644
> --- a/drivers/platform/x86/intel/pmt/Kconfig
> +++ b/drivers/platform/x86/intel/pmt/Kconfig
> @@ -38,3 +38,15 @@ config INTEL_PMT_CRASHLOG
> =20
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called intel_pmt_crashlog.
> +
> +config INTEL_PMT_DISCOVERY
> +=09tristate "Intel Platform Monitoring Technology (PMT) Discovery driver=
"
> +=09depends on INTEL_VSEC
> +=09select INTEL_PMT_CLASS
> +=09help
> +=09  The Intel Platform Monitoring Technology (PMT) discovery driver pro=
vides
> +=09  access to details about the various PMT features and feature specif=
ic
> +=09  attributes.
> +
> +=09  To compile this driver as a module, choose M here: the module
> +=09  will be called pmt_discovery.
> diff --git a/drivers/platform/x86/intel/pmt/Makefile b/drivers/platform/x=
86/intel/pmt/Makefile
> index 279e158c7c23..8aed7e1592e4 100644
> --- a/drivers/platform/x86/intel/pmt/Makefile
> +++ b/drivers/platform/x86/intel/pmt/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_INTEL_PMT_TELEMETRY)=09+=3D pmt_telemetry.=
o
>  pmt_telemetry-y=09=09=09=09:=3D telemetry.o
>  obj-$(CONFIG_INTEL_PMT_CRASHLOG)=09+=3D pmt_crashlog.o
>  pmt_crashlog-y=09=09=09=09:=3D crashlog.o
> +obj-$(CONFIG_INTEL_PMT_DISCOVERY)=09+=3D pmt_discovery.o
> +pmt_discovery-y=09=09=09=09:=3D discovery.o features.o
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index 7233b654bbad..a806a81ece52 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -9,11 +9,13 @@
>   */
> =20
>  #include <linux/kernel.h>
> +#include <linux/log2.h>
>  #include <linux/intel_vsec.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/pci.h>
> +#include <linux/sysfs.h>
> =20
>  #include "class.h"
> =20
> @@ -166,12 +168,41 @@ static struct attribute *intel_pmt_attrs[] =3D {
>  =09&dev_attr_offset.attr,
>  =09NULL
>  };
> -ATTRIBUTE_GROUPS(intel_pmt);
> =20
> -static struct class intel_pmt_class =3D {
> +static umode_t intel_pmt_attr_visible(struct kobject *kobj,
> +=09=09=09=09      struct attribute *attr, int n)
> +{
> +=09struct device *dev =3D container_of(kobj, struct device, kobj);
> +=09struct auxiliary_device *auxdev =3D to_auxiliary_dev(dev->parent);
> +=09struct intel_vsec_device *ivdev =3D auxdev_to_ivdev(auxdev);
> +
> +=09/*
> +=09 * Place the discovery features folder in /sys/class/intel_pmt, but
> +=09 * exclude the common attributes as they are not applicable.
> +=09 */
> +=09if (ivdev->cap_id =3D=3D ilog2(VSEC_CAP_DISCOVERY))
> +=09=09return 0;
> +
> +=09return attr->mode;
> +}
> +
> +static bool intel_pmt_group_visible(struct kobject *kobj)
> +{
> +=09return true;
> +}
> +DEFINE_SYSFS_GROUP_VISIBLE(intel_pmt);
> +
> +static const struct attribute_group intel_pmt_group =3D {
> +=09.attrs =3D intel_pmt_attrs,
> +=09.is_visible =3D SYSFS_GROUP_VISIBLE(intel_pmt),
> +};
> +__ATTRIBUTE_GROUPS(intel_pmt);
> +
> +struct class intel_pmt_class =3D {
>  =09.name =3D "intel_pmt",
>  =09.dev_groups =3D intel_pmt_groups,
>  };
> +EXPORT_SYMBOL_GPL(intel_pmt_class);
> =20
>  static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  =09=09=09=09    struct intel_vsec_device *ivdev,
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x8=
6/intel/pmt/class.h
> index b2006d57779d..ba276231ce74 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -20,6 +20,7 @@
>  #define GET_ADDRESS(v)=09=09((v) & GENMASK(31, 3))
> =20
>  struct pci_dev;
> +extern struct class intel_pmt_class;
> =20
>  struct telem_endpoint {
>  =09struct pci_dev=09=09*pcidev;
> @@ -48,6 +49,7 @@ struct intel_pmt_entry {
>  =09unsigned long=09=09base_addr;
>  =09size_t=09=09=09size;
>  =09u32=09=09=09guid;
> +=09u32=09=09=09num_rmids;

Could you mention somewhere what "RMID" stands for.

>  =09int=09=09=09devid;
>  };
> =20
> diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platfor=
m/x86/intel/pmt/discovery.c
> new file mode 100644
> index 000000000000..8124a5bcbb12
> --- /dev/null
> +++ b/drivers/platform/x86/intel/pmt/discovery.c
> @@ -0,0 +1,600 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel Platform Monitory Technology Discovery driver
> + *
> + * Copyright (c) 2025, Intel Corporation.
> + * All Rights Reserved.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/bug.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/kobject.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
> +#include <linux/pci.h>
> +#include <linux/slab.h>
> +#include <linux/string_choices.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +
> +#include <linux/intel_pmt_features.h>
> +#include <linux/intel_vsec.h>
> +
> +#include "class.h"
> +
> +#define MAX_FEATURE_VERSION=090
> +#define DT_TBIR=09=09=09GENMASK(2, 0)
> +#define FEAT_ATTR_SIZE(x)=09((x) * sizeof(u32))
> +#define PMT_GUID_SIZE(x)=09((x) * sizeof(u32))
> +#define SKIP_FEATURE=09=091
> +
> +struct feature_discovery_table {
> +=09u32=09access_type:4;
> +=09u32=09version:8;
> +=09u32=09size:16;
> +=09u32=09reserved:4;
> +=09u32=09id;
> +=09u32=09offset;
> +=09u32=09reserved2;
> +};
> +
> +/* Common feature table header */
> +struct feature_header {
> +=09u32=09attr_size:8;
> +=09u32=09num_guids:8;
> +=09u32=09reserved:16;
> +};
> +
> +/* Feature attribute fields */
> +struct caps {
> +=09u32=09=09caps;
> +};
> +
> +struct command {
> +=09u32=09=09max_stream_size:16;
> +=09u32=09=09max_command_size:16;
> +};
> +
> +struct watcher {
> +=09u32=09=09reserved:21;
> +=09u32=09=09period:11;
> +=09struct command=09command;
> +};
> +
> +struct rmid {
> +=09u32=09=09num_rmids:16;
> +=09u32=09=09reserved:16;
> +=09struct watcher=09watcher;
> +};
> +
> +struct feature_table {
> +=09struct feature_header=09header;
> +=09struct caps=09=09caps;
> +=09union {
> +=09=09struct command command;
> +=09=09struct watcher watcher;
> +=09=09struct rmid rmid;
> +=09};
> +=09u32=09=09=09*guids;
> +};
> +
> +/* For backreference in struct feature */
> +struct pmt_features_priv;
> +
> +struct feature {
> +=09struct feature_table=09=09table;
> +=09struct kobject=09=09=09kobj;
> +=09struct pmt_features_priv=09*priv;
> +=09struct list_head=09=09list;
> +=09const struct attribute_group=09*attr_group;
> +=09enum pmt_feature_id=09=09id;
> +};
> +
> +struct pmt_features_priv {
> +=09struct device=09=09*parent;
> +=09struct device=09=09*dev;
> +=09int=09=09=09count;
> +=09u32=09=09=09mask;
> +=09struct feature=09=09feature[];
> +};
> +
> +static LIST_HEAD(pmt_feature_list);
> +static DEFINE_MUTEX(feature_list_lock);
> +
> +#define to_pmt_feature(x) container_of(x, struct feature, kobj)
> +static void pmt_feature_release(struct kobject *kobj)
> +{
> +}
> +
> +static ssize_t caps_show(struct kobject *kobj, struct kobj_attribute *at=
tr,
> +=09=09=09 char *buf)
> +{
> +=09struct feature *feature =3D to_pmt_feature(kobj);
> +=09struct pmt_cap **pmt_caps;
> +=09u32 caps =3D feature->table.caps.caps;
> +=09ssize_t ret =3D 0;
> +
> +=09switch (feature->id) {
> +=09case FEATURE_PER_CORE_PERF_TELEM:
> +=09=09pmt_caps =3D pmt_caps_pcpt;
> +=09=09break;
> +=09case FEATURE_PER_CORE_ENV_TELEM:
> +=09=09pmt_caps =3D pmt_caps_pcet;
> +=09=09break;
> +=09case FEATURE_PER_RMID_PERF_TELEM:
> +=09=09pmt_caps =3D pmt_caps_rmid_perf;
> +=09=09break;
> +=09case FEATURE_ACCEL_TELEM:
> +=09=09pmt_caps =3D pmt_caps_accel;
> +=09=09break;
> +=09case FEATURE_UNCORE_TELEM:
> +=09=09pmt_caps =3D pmt_caps_uncore;
> +=09=09break;
> +=09case FEATURE_CRASH_LOG:
> +=09=09pmt_caps =3D pmt_caps_crashlog;
> +=09=09break;
> +=09case FEATURE_PETE_LOG:
> +=09=09pmt_caps =3D pmt_caps_pete;
> +=09=09break;
> +=09case FEATURE_TPMI_CTRL:
> +=09=09pmt_caps =3D pmt_caps_tpmi;
> +=09=09break;
> +=09case FEATURE_TRACING:
> +=09=09pmt_caps =3D pmt_caps_tracing;
> +=09=09break;
> +=09case FEATURE_PER_RMID_ENERGY_TELEM:
> +=09=09pmt_caps =3D pmt_caps_rmid_energy;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09while (*pmt_caps) {
> +=09=09struct pmt_cap *pmt_cap =3D *pmt_caps;
> +
> +=09=09while (pmt_cap->name) {
> +=09=09=09ret +=3D sysfs_emit_at(buf, ret, "%-40s Available: %s\n", pmt_c=
ap->name,
> +=09=09=09=09=09     str_yes_no(pmt_cap->mask & caps));
> +=09=09=09pmt_cap++;
> +=09=09}
> +=09=09pmt_caps++;
> +=09}
> +
> +=09return ret;
> +}
> +static struct kobj_attribute caps_attribute =3D __ATTR_RO(caps);
> +
> +static struct watcher *get_watcher(struct feature *feature)
> +{
> +=09switch (feature_layout[feature->id]) {
> +=09case LAYOUT_RMID:
> +=09=09return &feature->table.rmid.watcher;
> +=09case LAYOUT_WATCHER:
> +=09=09return &feature->table.watcher;
> +=09default:
> +=09=09return ERR_PTR(-EINVAL);
> +=09}
> +}
> +
> +static struct command *get_command(struct feature *feature)
> +{
> +=09switch (feature_layout[feature->id]) {
> +=09case LAYOUT_RMID:
> +=09=09return &feature->table.rmid.watcher.command;
> +=09case LAYOUT_WATCHER:
> +=09=09return &feature->table.watcher.command;
> +=09case LAYOUT_COMMAND:
> +=09=09return &feature->table.command;
> +=09default:
> +=09=09return ERR_PTR(-EINVAL);
> +=09}
> +}
> +
> +static ssize_t num_rmids_show(struct kobject *kobj,
> +=09=09=09      struct kobj_attribute *attr, char *buf)
> +{
> +=09struct feature *feature =3D to_pmt_feature(kobj);
> +
> +=09return sysfs_emit(buf, "%u\n", feature->table.rmid.num_rmids);
> +}
> +static struct kobj_attribute num_rmids_attribute =3D __ATTR_RO(num_rmids=
);
> +
> +static ssize_t min_watcher_period_ms_show(struct kobject *kobj,
> +=09=09=09=09=09  struct kobj_attribute *attr, char *buf)
> +{
> +=09struct feature *feature =3D to_pmt_feature(kobj);
> +=09struct watcher *watcher =3D get_watcher(feature);
> +
> +=09if (IS_ERR(watcher))
> +=09=09return (PTR_ERR(watcher));
> +
> +=09return sysfs_emit(buf, "%u\n", watcher->period);
> +}
> +static struct kobj_attribute min_watcher_period_ms_attribute =3D
> +=09__ATTR_RO(min_watcher_period_ms);
> +
> +static ssize_t max_stream_size_show(struct kobject *kobj,
> +=09=09=09=09    struct kobj_attribute *attr, char *buf)
> +{
> +=09struct feature *feature =3D to_pmt_feature(kobj);
> +=09struct command *command =3D get_command(feature);
> +
> +=09if (IS_ERR(command))
> +=09=09return (PTR_ERR(command));

Extra parenthesis.

> +
> +=09return sysfs_emit(buf, "%u\n", command->max_stream_size);
> +}
> +static struct kobj_attribute max_stream_size_attribute =3D
> +=09__ATTR_RO(max_stream_size);
> +
> +static ssize_t max_command_size_show(struct kobject *kobj,
> +=09=09=09=09     struct kobj_attribute *attr, char *buf)
> +{
> +=09struct feature *feature =3D to_pmt_feature(kobj);
> +=09struct command *command =3D get_command(feature);
> +
> +=09if (IS_ERR(command))
> +=09=09return (PTR_ERR(command));

Ditto.

> +
> +=09return sysfs_emit(buf, "%u\n", command->max_command_size);
> +}
> +static struct kobj_attribute max_command_size_attribute =3D
> +=09__ATTR_RO(max_command_size);
> +
> +static ssize_t guids_show(struct kobject *kobj, struct kobj_attribute *a=
ttr,
> +=09=09=09  char *buf)
> +{
> +=09struct feature *feature =3D to_pmt_feature(kobj);
> +=09int i, count =3D 0;
> +
> +=09for (i =3D 0; i < feature->table.header.num_guids; i++)
> +=09=09count +=3D sysfs_emit_at(buf, count, "0x%x\n",
> +=09=09=09=09       feature->table.guids[i]);
> +
> +=09return count;
> +}
> +static struct kobj_attribute guids_attribute =3D __ATTR_RO(guids);
> +
> +static struct attribute *pmt_feature_rmid_attrs[] =3D {
> +=09&caps_attribute.attr,
> +=09&num_rmids_attribute.attr,
> +=09&min_watcher_period_ms_attribute.attr,
> +=09&max_stream_size_attribute.attr,
> +=09&max_command_size_attribute.attr,
> +=09&guids_attribute.attr,
> +=09NULL
> +};
> +ATTRIBUTE_GROUPS(pmt_feature_rmid);
> +
> +static const struct kobj_type pmt_feature_rmid_ktype =3D {
> +=09.sysfs_ops =3D &kobj_sysfs_ops,
> +=09.release =3D pmt_feature_release,
> +=09.default_groups =3D pmt_feature_rmid_groups,
> +};
> +
> +static struct attribute *pmt_feature_watcher_attrs[] =3D {
> +=09&caps_attribute.attr,
> +=09&min_watcher_period_ms_attribute.attr,
> +=09&max_stream_size_attribute.attr,
> +=09&max_command_size_attribute.attr,
> +=09&guids_attribute.attr,
> +=09NULL
> +};
> +ATTRIBUTE_GROUPS(pmt_feature_watcher);
> +
> +static const struct kobj_type pmt_feature_watcher_ktype =3D {
> +=09.sysfs_ops =3D &kobj_sysfs_ops,
> +=09.release =3D pmt_feature_release,
> +=09.default_groups =3D pmt_feature_watcher_groups,
> +};
> +
> +static struct attribute *pmt_feature_command_attrs[] =3D {
> +=09&caps_attribute.attr,
> +=09&max_stream_size_attribute.attr,
> +=09&max_command_size_attribute.attr,
> +=09&guids_attribute.attr,
> +=09NULL
> +};
> +ATTRIBUTE_GROUPS(pmt_feature_command);
> +
> +static const struct kobj_type pmt_feature_command_ktype =3D {
> +=09.sysfs_ops =3D &kobj_sysfs_ops,
> +=09.release =3D pmt_feature_release,
> +=09.default_groups =3D pmt_feature_command_groups,
> +};
> +
> +static struct attribute *pmt_feature_guids_attrs[] =3D {
> +=09&caps_attribute.attr,
> +=09&guids_attribute.attr,
> +=09NULL
> +};
> +ATTRIBUTE_GROUPS(pmt_feature_guids);
> +
> +static const struct kobj_type pmt_feature_guids_ktype =3D {
> +=09.sysfs_ops =3D &kobj_sysfs_ops,
> +=09.release =3D pmt_feature_release,
> +=09.default_groups =3D pmt_feature_guids_groups,
> +};
> +
> +static int
> +pmt_feature_get_disc_table(struct pmt_features_priv *priv,
> +=09=09=09   struct resource *disc_res,
> +=09=09=09   struct feature_discovery_table *disc_tbl)
> +{
> +=09void __iomem *disc_base;
> +
> +=09disc_base =3D devm_ioremap_resource(priv->dev, disc_res);
> +=09if (IS_ERR(disc_base))
> +=09=09return PTR_ERR(disc_base);
> +
> +=09memcpy_fromio(disc_tbl, disc_base, sizeof(*disc_tbl));
> +
> +=09devm_iounmap(priv->dev, disc_base);
> +=09if (priv->mask & BIT(disc_tbl->id))
> +=09=09return dev_err_probe(priv->dev, -EINVAL, "Duplicate feature: %s\n"=
,
> +=09=09=09=09     pmt_feature_names[disc_tbl->id]);
> +
> +=09/*
> +=09 * Some devices may expose non-functioning entries that are
> +=09 * reserved for future use. They have zero size. Do not fail
> +=09 * probe for these. Just ignore them.
> +=09 */
> +=09if (disc_tbl->size =3D=3D 0 || disc_tbl->access_type =3D=3D 0xF)

Could that 0xF be named with define?

> +=09=09return SKIP_FEATURE;
> +
> +=09if (disc_tbl->version > MAX_FEATURE_VERSION)
> +=09=09return SKIP_FEATURE;
> +
> +=09if (!pmt_feature_id_is_valid(disc_tbl->id))
> +=09=09return SKIP_FEATURE;
> +
> +=09priv->mask |=3D BIT(disc_tbl->id);
> +
> +=09return 0;
> +}
> +
> +static int
> +pmt_feature_get_feature_table(struct pmt_features_priv *priv,
> +=09=09=09      struct feature *feature,
> +=09=09=09      struct feature_discovery_table *disc_tbl,
> +=09=09=09      struct resource *disc_res)
> +{
> +=09struct feature_table *feat_tbl =3D &feature->table;
> +=09struct feature_header *header;
> +=09struct resource res =3D {};
> +=09resource_size_t res_size;
> +=09void __iomem *feat_base, *feat_offset;
> +=09void *tbl_offset;
> +=09size_t size;
> +=09u32 *guids;
> +=09u8 tbir;
> +
> +=09tbir =3D FIELD_GET(DT_TBIR, disc_tbl->offset);
> +
> +=09switch (disc_tbl->access_type) {
> +=09case ACCESS_LOCAL:
> +=09=09if (tbir)
> +=09=09=09return dev_err_probe(priv->dev, -EINVAL,
> +=09=09=09=09"Unsupported BAR index %u for access type %u\n",
> +=09=09=09=09tbir, disc_tbl->access_type);
> +
> +
> +=09=09/*
> +=09=09 * For access_type LOCAL, the base address is as follows:
> +=09=09 * base address =3D end of discovery region + base offset + 1
> +=09=09 */
> +=09=09res =3D DEFINE_RES_MEM(disc_res->end + disc_tbl->offset + 1,
> +=09=09=09=09     disc_tbl->size * sizeof(u32));
> +=09=09break;
> +
> +=09default:
> +=09=09return dev_err_probe(priv->dev, -EINVAL, "Unrecognized access_type=
 %u\n",
> +=09=09=09=09     disc_tbl->access_type);
> +=09}
> +
> +=09feature->id =3D disc_tbl->id;
> +
> +=09/* Get the feature table */
> +=09feat_base =3D devm_ioremap_resource(priv->dev, &res);
> +=09if (IS_ERR(feat_base))
> +=09=09return PTR_ERR(feat_base);
> +
> +=09feat_offset =3D feat_base;
> +=09tbl_offset =3D feat_tbl;
> +
> +=09/* Get the header */
> +=09header =3D &feat_tbl->header;
> +=09memcpy_fromio(header, feat_offset, sizeof(*header));
> +
> +=09/* Validate fields fit within mapped resource */
> +=09size =3D sizeof(*header) + FEAT_ATTR_SIZE(header->attr_size) +
> +=09       PMT_GUID_SIZE(header->num_guids);
> +=09res_size =3D resource_size(&res);
> +=09if (WARN(size > res_size, "Bad table size %ld > %pa", size, &res_size=
))
> +=09=09return -EINVAL;
> +
> +=09/* Get the feature attributes, including capability fields */
> +=09tbl_offset +=3D sizeof(*header);
> +=09feat_offset +=3D sizeof(*header);
> +
> +=09memcpy_fromio(tbl_offset, feat_offset, FEAT_ATTR_SIZE(header->attr_si=
ze));
> +
> +=09/* Finally, get the guids */
> +=09guids =3D devm_kmalloc(priv->dev, PMT_GUID_SIZE(header->num_guids), G=
FP_KERNEL);
> +=09if (!guids)
> +=09=09return -ENOMEM;
> +
> +=09feat_offset +=3D FEAT_ATTR_SIZE(header->attr_size);
> +
> +=09memcpy_fromio(guids, feat_offset, PMT_GUID_SIZE(header->num_guids));
> +
> +=09feat_tbl->guids =3D guids;
> +
> +=09devm_iounmap(priv->dev, feat_base);
> +
> +=09return 0;
> +}
> +
> +static void pmt_features_add_feat(struct feature *feature)
> +{
> +=09guard(mutex)(&feature_list_lock);
> +=09list_add(&feature->list, &pmt_feature_list);
> +}
> +
> +static void pmt_features_remove_feat(struct feature *feature)
> +{
> +=09guard(mutex)(&feature_list_lock);
> +=09list_del(&feature->list);
> +}
> +
> +/* Get the discovery table and use it to get the feature table */
> +static int pmt_features_discovery(struct pmt_features_priv *priv,
> +=09=09=09=09  struct feature *feature,
> +=09=09=09=09  struct intel_vsec_device *ivdev,
> +=09=09=09=09  int idx)
> +{
> +=09struct feature_discovery_table disc_tbl =3D {}; /* For static analyze=
rs */

I suppose you meant the initialization is for static analyzers but that's=
=20
not what the comment now reads.

> +=09struct resource *disc_res =3D &ivdev->resource[idx];
> +=09const struct kobj_type *ktype;
> +=09int ret;
> +
> +=09ret =3D pmt_feature_get_disc_table(priv, disc_res, &disc_tbl);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D pmt_feature_get_feature_table(priv, feature, &disc_tbl, disc_=
res);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09switch (feature_layout[feature->id]) {
> +=09case LAYOUT_RMID:
> +=09=09ktype =3D &pmt_feature_rmid_ktype;
> +=09=09feature->attr_group =3D &pmt_feature_rmid_group;
> +=09=09break;
> +=09case LAYOUT_WATCHER:
> +=09=09ktype =3D &pmt_feature_watcher_ktype;
> +=09=09feature->attr_group =3D &pmt_feature_watcher_group;
> +=09=09break;
> +=09case LAYOUT_COMMAND:
> +=09=09ktype =3D &pmt_feature_command_ktype;
> +=09=09feature->attr_group =3D &pmt_feature_command_group;
> +=09=09break;
> +=09case LAYOUT_CAPS_ONLY:
> +=09=09ktype =3D &pmt_feature_guids_ktype;
> +=09=09feature->attr_group =3D &pmt_feature_guids_group;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09ret =3D kobject_init_and_add(&feature->kobj, ktype, &priv->dev->kobj,
> +=09=09=09=09   pmt_feature_names[feature->id]);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09kobject_uevent(&feature->kobj, KOBJ_ADD);
> +=09pmt_features_add_feat(feature);
> +
> +=09return 0;
> +}
> +
> +static void pmt_features_remove(struct auxiliary_device *auxdev)
> +{
> +=09struct pmt_features_priv *priv =3D auxiliary_get_drvdata(auxdev);
> +=09int i;
> +
> +=09for (i =3D 0; i < priv->count; i++) {
> +=09=09struct feature *feature =3D &priv->feature[i];
> +
> +=09=09pmt_features_remove_feat(feature);
> +=09=09sysfs_remove_group(&feature->kobj, feature->attr_group);
> +=09=09kobject_put(&feature->kobj);
> +=09}
> +
> +=09device_unregister(priv->dev);
> +}
> +
> +static int pmt_features_probe(struct auxiliary_device *auxdev, const str=
uct auxiliary_device_id *id)
> +{
> +=09struct intel_vsec_device *ivdev =3D auxdev_to_ivdev(auxdev);
> +=09struct pmt_features_priv *priv;
> +=09size_t size;
> +=09int ret, i;
> +
> +=09size =3D struct_size(priv, feature, ivdev->num_resources);
> +=09priv =3D devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
> +=09if (!priv)
> +=09=09return -ENOMEM;
> +
> +=09priv->parent =3D &ivdev->pcidev->dev;
> +=09auxiliary_set_drvdata(auxdev, priv);
> +
> +=09priv->dev =3D device_create(&intel_pmt_class, &auxdev->dev, MKDEV(0, =
0), priv,

#include for MKDEV() missing?

> +=09=09=09=09  "%s-%s", "features", dev_name(priv->parent));
> +=09if (IS_ERR(priv->dev))
> +=09=09return dev_err_probe(priv->dev, PTR_ERR(priv->dev),
> +=09=09=09=09     "Could not create %s-%s device node\n",
> +=09=09=09=09     "features", dev_name(priv->dev));
> +
> +=09/* Initialize each feature */
> +=09for (i =3D 0; i < ivdev->num_resources; i++) {
> +=09=09struct feature *feature =3D &priv->feature[priv->count];
> +
> +=09=09ret =3D pmt_features_discovery(priv, feature, ivdev, i);
> +=09=09if (ret =3D=3D SKIP_FEATURE)
> +=09=09=09continue;
> +=09=09if (ret !=3D 0)
> +=09=09=09goto abort_probe;
> +
> +=09=09feature->priv =3D priv;
> +=09=09priv->count++;
> +=09}
> +
> +=09return 0;
> +
> +abort_probe:
> +=09/*
> +=09 * Only fully initialized features are tracked in priv->count, which =
is
> +=09 * incremented only after a feature is completely set up (i.e., after
> +=09 * discovery and sysfs registration). If feature initialization fails=
,
> +=09 * the failing feature's state is local and does not require rollback=
=2E
> +=09 *
> +=09 * Therefore, on error, we can safely call the driver's remove() rout=
ine
> +=09 * pmt_features_remove() to clean up only those features that were
> +=09 * fully initialized and counted. All other resources are device-mana=
ged
> +=09 * and will be cleaned up automatically during device_unregister().
> +=09 */
> +=09pmt_features_remove(auxdev);
> +
> +=09return ret;
> +}
> +
> +static const struct auxiliary_device_id pmt_features_id_table[] =3D {
> +=09{ .name =3D "intel_vsec.discovery" },
> +=09{}
> +};
> +MODULE_DEVICE_TABLE(auxiliary, pmt_features_id_table);
> +
> +static struct auxiliary_driver pmt_features_aux_driver =3D {
> +=09.id_table=09=3D pmt_features_id_table,
> +=09.remove=09=09=3D pmt_features_remove,
> +=09.probe=09=09=3D pmt_features_probe,
> +};
> +module_auxiliary_driver(pmt_features_aux_driver);
> +
> +MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
> +MODULE_DESCRIPTION("Intel PMT Discovery driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("INTEL_PMT");
> diff --git a/drivers/platform/x86/intel/pmt/features.c b/drivers/platform=
/x86/intel/pmt/features.c
> new file mode 100644
> index 000000000000..7e7de76971f8
> --- /dev/null
> +++ b/drivers/platform/x86/intel/pmt/features.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Author: "David E. Box" <david.e.box@linux.intel.com>
> + */
> +
> +#include <linux/export.h>
> +#include <linux/types.h>
> +
> +#include <linux/intel_pmt_features.h>
> +
> +const char * const pmt_feature_names[] =3D {
> +=09[FEATURE_PER_CORE_PERF_TELEM]=09=3D "per_core_performace_telemetry",
> +=09[FEATURE_PER_CORE_ENV_TELEM]=09=3D "per_core_environment_telemetry",
> +=09[FEATURE_PER_RMID_PERF_TELEM]=09=3D "per_rmid_perf_telemetry",
> +=09[FEATURE_ACCEL_TELEM]=09=09=3D "accelerator_telemetry",
> +=09[FEATURE_UNCORE_TELEM]=09=09=3D "uncore_telemetry",
> +=09[FEATURE_CRASH_LOG]=09=09=3D "crash_log",
> +=09[FEATURE_PETE_LOG]=09=09=3D "pete_log",
> +=09[FEATURE_TPMI_CTRL]=09=09=3D "tpmi_control",
> +=09[FEATURE_TRACING]=09=09=3D "tracing",
> +=09[FEATURE_PER_RMID_ENERGY_TELEM]=09=3D "per_rmid_energy_telemetry",
> +};
> +EXPORT_SYMBOL_NS_GPL(pmt_feature_names, "INTEL_PMT_DISCOVERY");
> +
> +enum feature_layout feature_layout[] =3D {
> +=09[FEATURE_PER_CORE_PERF_TELEM]=09=3D LAYOUT_WATCHER,
> +=09[FEATURE_PER_CORE_ENV_TELEM]=09=3D LAYOUT_WATCHER,
> +=09[FEATURE_PER_RMID_PERF_TELEM]=09=3D LAYOUT_RMID,
> +=09[FEATURE_ACCEL_TELEM]=09=09=3D LAYOUT_WATCHER,
> +=09[FEATURE_UNCORE_TELEM]=09=09=3D LAYOUT_WATCHER,
> +=09[FEATURE_CRASH_LOG]=09=09=3D LAYOUT_COMMAND,
> +=09[FEATURE_PETE_LOG]=09=09=3D LAYOUT_COMMAND,
> +=09[FEATURE_TPMI_CTRL]=09=09=3D LAYOUT_CAPS_ONLY,
> +=09[FEATURE_TRACING]=09=09=3D LAYOUT_CAPS_ONLY,
> +=09[FEATURE_PER_RMID_ENERGY_TELEM]=09=3D LAYOUT_RMID,
> +};
> +
> +struct pmt_cap pmt_cap_common[] =3D {
> +=09{PMT_CAP_TELEM,=09=09"telemetry"},
> +=09{PMT_CAP_WATCHER,=09"watcher"},
> +=09{PMT_CAP_CRASHLOG,=09"crashlog"},
> +=09{PMT_CAP_STREAMING,=09"streaming"},
> +=09{PMT_CAP_THRESHOLD,=09"threashold"},
> +=09{PMT_CAP_WINDOW,=09"window"},
> +=09{PMT_CAP_CONFIG,=09"config"},
> +=09{PMT_CAP_TRACING,=09"tracing"},
> +=09{PMT_CAP_INBAND,=09"inband"},
> +=09{PMT_CAP_OOB,=09=09"oob"},
> +=09{PMT_CAP_SECURED_CHAN,=09"secure_chan"},
> +=09{PMT_CAP_PMT_SP,=09"pmt_sp"},
> +=09{PMT_CAP_PMT_SP_POLICY,=09"PMT SP Policy"},
> +=09{}
> +};
> +
> +struct pmt_cap pmt_cap_pcpt[] =3D {
> +=09{PMT_CAP_PCPT_CORE_PERF,=09"core_performance"},
> +=09{PMT_CAP_PCPT_CORE_C0_RES,=09"core_c0_residency"},
> +=09{PMT_CAP_PCPT_CORE_ACTIVITY,=09"core_activity"},
> +=09{PMT_CAP_PCPT_CACHE_PERF,=09"cache_performance"},
> +=09{PMT_CAP_PCPT_QUALITY_TELEM,=09"quality_telem"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_pcpt[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_pcpt,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_pcet[] =3D {
> +=09{PMT_CAP_PCET_WORKPOINT_HIST,=09"workpoint_histogram"},
> +=09{PMT_CAP_PCET_CORE_CURR_TEMP,=09"core_current_temp"},
> +=09{PMT_CAP_PCET_CORE_INST_RES,=09"core_inst_residency"},
> +=09{PMT_CAP_PCET_QUALITY_TELEM,=09"quality_telem"},
> +=09{PMT_CAP_PCET_CORE_CDYN_LVL,=09"core_cdyn_level"},
> +=09{PMT_CAP_PCET_CORE_STRESS_LVL,=09"core_stress_level"},
> +=09{PMT_CAP_PCET_CORE_DAS,=09=09"core_digital_aging_sensor"},
> +=09{PMT_CAP_PCET_FIVR_HEALTH,=09"fivr_health"},
> +=09{PMT_CAP_PCET_ENERGY,=09=09"energy"},
> +=09{PMT_CAP_PCET_PEM_STATUS,=09"pem_status"},
> +=09{PMT_CAP_PCET_CORE_C_STATE,=09"core_c_state"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_pcet[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_pcet,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_rmid_perf[] =3D {
> +=09{PMT_CAP_RMID_CORES_PERF,=09"core_performance"},
> +=09{PMT_CAP_RMID_CACHE_PERF,=09"cache_performance"},
> +=09{PMT_CAP_RMID_PERF_QUAL,=09"performance_quality"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_rmid_perf[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_rmid_perf,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_accel[] =3D {
> +=09{PMT_CAP_ACCEL_CPM_TELEM,=09"content_processing_module"},
> +=09{PMT_CAP_ACCEL_TIP_TELEM,=09"content_turbo_ip"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_accel[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_accel,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_uncore[] =3D {
> +=09{PMT_CAP_UNCORE_IO_CA_TELEM,=09"io_ca"},
> +=09{PMT_CAP_UNCORE_RMID_TELEM,=09"rmid"},
> +=09{PMT_CAP_UNCORE_D2D_ULA_TELEM,=09"d2d_ula"},
> +=09{PMT_CAP_UNCORE_PKGC_TELEM,=09"package_c"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_uncore[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_uncore,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_crashlog[] =3D {
> +=09{PMT_CAP_CRASHLOG_MAN_TRIG,=09"manual_trigger"},
> +=09{PMT_CAP_CRASHLOG_CORE,=09=09"core"},
> +=09{PMT_CAP_CRASHLOG_UNCORE,=09"uncore"},
> +=09{PMT_CAP_CRASHLOG_TOR,=09=09"tor"},
> +=09{PMT_CAP_CRASHLOG_S3M,=09=09"s3m"},
> +=09{PMT_CAP_CRASHLOG_PERSISTENCY,=09"presistency"},
> +=09{PMT_CAP_CRASHLOG_CLIP_GPIO,=09"crashlog_in_progress"},
> +=09{PMT_CAP_CRASHLOG_PRE_RESET,=09"pre_reset_extraction"},
> +=09{PMT_CAP_CRASHLOG_POST_RESET,=09"post_reset_extraction"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_crashlog[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_crashlog,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_pete[] =3D {
> +=09{PMT_CAP_PETE_MAN_TRIG,=09=09"manual_trigger"},
> +=09{PMT_CAP_PETE_ENCRYPTION,=09"encrpytion"},
> +=09{PMT_CAP_PETE_PERSISTENCY,=09"persistency"},
> +=09{PMT_CAP_PETE_REQ_TOKENS,=09"required_tokens"},
> +=09{PMT_CAP_PETE_PROD_ENABLED,=09"production_enabled"},
> +=09{PMT_CAP_PETE_DEBUG_ENABLED,=09"debug_enabled"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_pete[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_pete,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_tpmi[] =3D {
> +=09{PMT_CAP_TPMI_MAILBOX,=09=09"mailbox"},
> +=09{PMT_CAP_TPMI_LOCK,=09=09"bios_lock"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_tpmi[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_tpmi,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_tracing[] =3D {
> +=09{PMT_CAP_TRACE_SRAR,=09=09"srar_errors"},
> +=09{PMT_CAP_TRACE_CORRECTABLE,=09"correctable_errors"},
> +=09{PMT_CAP_TRACE_MCTP,=09=09"mctp"},
> +=09{PMT_CAP_TRACE_MRT,=09=09"memory_resiliency"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_tracing[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_tracing,
> +=09NULL
> +};
> +
> +struct pmt_cap pmt_cap_rmid_energy[] =3D {
> +=09{PMT_CAP_RMID_ENERGY,=09=09"energy"},
> +=09{PMT_CAP_RMID_ACTIVITY,=09=09"activity"},
> +=09{PMT_CAP_RMID_ENERGY_QUAL,=09"energy_quality"},
> +=09{}
> +};
> +
> +struct pmt_cap *pmt_caps_rmid_energy[] =3D {
> +=09pmt_cap_common,
> +=09pmt_cap_rmid_energy,
> +=09NULL
> +};
> diff --git a/include/linux/intel_pmt_features.h b/include/linux/intel_pmt=
_features.h
> new file mode 100644
> index 000000000000..53573a4a49b7
> --- /dev/null
> +++ b/include/linux/intel_pmt_features.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _FEATURES_H
> +#define _FEATURES_H
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +/* Common masks */
> +#define PMT_CAP_TELEM=09=09=09BIT(0)
> +#define PMT_CAP_WATCHER=09=09=09BIT(1)
> +#define PMT_CAP_CRASHLOG=09=09BIT(2)
> +#define PMT_CAP_STREAMING=09=09BIT(3)
> +#define PMT_CAP_THRESHOLD=09=09BIT(4)
> +#define PMT_CAP_WINDOW=09=09=09BIT(5)
> +#define PMT_CAP_CONFIG=09=09=09BIT(6)
> +#define PMT_CAP_TRACING=09=09=09BIT(7)
> +#define PMT_CAP_INBAND=09=09=09BIT(8)
> +#define PMT_CAP_OOB=09=09=09BIT(9)
> +#define PMT_CAP_SECURED_CHAN=09=09BIT(10)
> +
> +#define PMT_CAP_PMT_SP=09=09=09BIT(11)
> +#define PMT_CAP_PMT_SP_POLICY=09=09GENMASK(17, 12)
> +
> +/* Per Core Performance Telemetry (PCPT) specific masks */
> +#define PMT_CAP_PCPT_CORE_PERF=09=09BIT(18)
> +#define PMT_CAP_PCPT_CORE_C0_RES=09BIT(19)
> +#define PMT_CAP_PCPT_CORE_ACTIVITY=09BIT(20)
> +#define PMT_CAP_PCPT_CACHE_PERF=09=09BIT(21)
> +#define PMT_CAP_PCPT_QUALITY_TELEM=09BIT(22)
> +
> +/* Per Core Environmental Telemetry (PCET) specific masks */
> +#define PMT_CAP_PCET_WORKPOINT_HIST=09BIT(18)
> +#define PMT_CAP_PCET_CORE_CURR_TEMP=09BIT(19)
> +#define PMT_CAP_PCET_CORE_INST_RES=09BIT(20)
> +#define PMT_CAP_PCET_QUALITY_TELEM=09BIT(21)=09/* Same as PMT_CAP_PCPT *=
/
> +#define PMT_CAP_PCET_CORE_CDYN_LVL=09BIT(22)
> +#define PMT_CAP_PCET_CORE_STRESS_LVL=09BIT(23)
> +#define PMT_CAP_PCET_CORE_DAS=09=09BIT(24)
> +#define PMT_CAP_PCET_FIVR_HEALTH=09BIT(25)
> +#define PMT_CAP_PCET_ENERGY=09=09BIT(26)
> +#define PMT_CAP_PCET_PEM_STATUS=09=09BIT(27)
> +#define PMT_CAP_PCET_CORE_C_STATE=09BIT(28)
> +
> +/* Per RMID Performance Telemetry specific masks */
> +#define PMT_CAP_RMID_CORES_PERF=09=09BIT(18)
> +#define PMT_CAP_RMID_CACHE_PERF=09=09BIT(19)
> +#define PMT_CAP_RMID_PERF_QUAL=09=09BIT(20)
> +
> +/* Accelerator Telemetry specific masks */
> +#define PMT_CAP_ACCEL_CPM_TELEM=09=09BIT(18)
> +#define PMT_CAP_ACCEL_TIP_TELEM=09=09BIT(19)
> +
> +/* Uncore Telemetry specific masks */
> +#define PMT_CAP_UNCORE_IO_CA_TELEM=09BIT(18)
> +#define PMT_CAP_UNCORE_RMID_TELEM=09BIT(19)
> +#define PMT_CAP_UNCORE_D2D_ULA_TELEM=09BIT(20)
> +#define PMT_CAP_UNCORE_PKGC_TELEM=09BIT(21)
> +
> +/* Crash Log specific masks */
> +#define PMT_CAP_CRASHLOG_MAN_TRIG=09BIT(11)
> +#define PMT_CAP_CRASHLOG_CORE=09=09BIT(12)
> +#define PMT_CAP_CRASHLOG_UNCORE=09=09BIT(13)
> +#define PMT_CAP_CRASHLOG_TOR=09=09BIT(14)
> +#define PMT_CAP_CRASHLOG_S3M=09=09BIT(15)
> +#define PMT_CAP_CRASHLOG_PERSISTENCY=09BIT(16)
> +#define PMT_CAP_CRASHLOG_CLIP_GPIO=09BIT(17)
> +#define PMT_CAP_CRASHLOG_PRE_RESET=09BIT(18)
> +#define PMT_CAP_CRASHLOG_POST_RESET=09BIT(19)
> +
> +/* PeTe Log specific masks */
> +#define PMT_CAP_PETE_MAN_TRIG=09=09BIT(11)
> +#define PMT_CAP_PETE_ENCRYPTION=09=09BIT(12)
> +#define PMT_CAP_PETE_PERSISTENCY=09BIT(13)
> +#define PMT_CAP_PETE_REQ_TOKENS=09=09BIT(14)
> +#define PMT_CAP_PETE_PROD_ENABLED=09BIT(15)
> +#define PMT_CAP_PETE_DEBUG_ENABLED=09BIT(16)
> +
> +/* TPMI control specific masks */
> +#define PMT_CAP_TPMI_MAILBOX=09=09BIT(11)
> +#define PMT_CAP_TPMI_LOCK=09=09BIT(12)
> +
> +/* Tracing specific masks */
> +#define PMT_CAP_TRACE_SRAR=09=09BIT(11)
> +#define PMT_CAP_TRACE_CORRECTABLE=09BIT(12)
> +#define PMT_CAP_TRACE_MCTP=09=09BIT(13)
> +#define PMT_CAP_TRACE_MRT=09=09BIT(14)
> +
> +/* Per RMID Energy Telemetry specific masks */
> +#define PMT_CAP_RMID_ENERGY=09=09BIT(18)
> +#define PMT_CAP_RMID_ACTIVITY=09=09BIT(19)
> +#define PMT_CAP_RMID_ENERGY_QUAL=09BIT(20)
> +
> +enum pmt_feature_id {
> +=09FEATURE_INVALID=09=09=09=3D 0x0,
> +=09FEATURE_PER_CORE_PERF_TELEM=09=3D 0x1,
> +=09FEATURE_PER_CORE_ENV_TELEM=09=3D 0x2,
> +=09FEATURE_PER_RMID_PERF_TELEM=09=3D 0x3,
> +=09FEATURE_ACCEL_TELEM=09=09=3D 0x4,
> +=09FEATURE_UNCORE_TELEM=09=09=3D 0x5,
> +=09FEATURE_CRASH_LOG=09=09=3D 0x6,
> +=09FEATURE_PETE_LOG=09=09=3D 0x7,
> +=09FEATURE_TPMI_CTRL=09=09=3D 0x8,
> +=09FEATURE_RESERVED=09=09=3D 0x9,
> +=09FEATURE_TRACING=09=09=09=3D 0xA,
> +=09FEATURE_PER_RMID_ENERGY_TELEM=09=3D 0xB,
> +=09FEATURE_MAX=09=09=09=3D 0xB,
> +};
> +
> +enum feature_layout {
> +=09LAYOUT_RMID,
> +=09LAYOUT_WATCHER,
> +=09LAYOUT_COMMAND,
> +=09LAYOUT_CAPS_ONLY,
> +};
> +
> +struct pmt_cap {
> +=09u32=09=09mask;
> +=09const char=09*name;
> +};
> +
> +extern const char * const pmt_feature_names[];
> +extern enum feature_layout feature_layout[];
> +extern struct pmt_cap pmt_cap_common[];
> +extern struct pmt_cap pmt_cap_pcpt[];
> +extern struct pmt_cap *pmt_caps_pcpt[];
> +extern struct pmt_cap pmt_cap_pcet[];
> +extern struct pmt_cap *pmt_caps_pcet[];
> +extern struct pmt_cap pmt_cap_rmid_perf[];
> +extern struct pmt_cap *pmt_caps_rmid_perf[];
> +extern struct pmt_cap pmt_cap_accel[];
> +extern struct pmt_cap *pmt_caps_accel[];
> +extern struct pmt_cap pmt_cap_uncore[];
> +extern struct pmt_cap *pmt_caps_uncore[];
> +extern struct pmt_cap pmt_cap_crashlog[];
> +extern struct pmt_cap *pmt_caps_crashlog[];
> +extern struct pmt_cap pmt_cap_pete[];
> +extern struct pmt_cap *pmt_caps_pete[];
> +extern struct pmt_cap pmt_cap_tpmi[];
> +extern struct pmt_cap *pmt_caps_tpmi[];
> +extern struct pmt_cap pmt_cap_s3m[];
> +extern struct pmt_cap *pmt_caps_s3m[];
> +extern struct pmt_cap pmt_cap_tracing[];
> +extern struct pmt_cap *pmt_caps_tracing[];
> +extern struct pmt_cap pmt_cap_rmid_energy[];
> +extern struct pmt_cap *pmt_caps_rmid_energy[];
> +
> +static inline bool pmt_feature_id_is_valid(enum pmt_feature_id id)
> +{
> +=09if (id > FEATURE_MAX)
> +=09=09return false;
> +
> +=09if (id =3D=3D FEATURE_INVALID || id =3D=3D FEATURE_RESERVED)
> +=09=09return false;
> +
> +=09return true;
> +}
> +#endif
>=20

--=20
 i.
--8323328-1359848925-1747750577=:936--
