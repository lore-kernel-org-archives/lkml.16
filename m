Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0F524C07F;
	Tue, 20 May 2025 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752854; cv=none; b=eELqGMOaJCExKbzZ6R8+FySQhhHMyuTmMyLAu6j8wnyeY+CG+xOIpxaRSRqvOsLXnbnK32wj14BSFLxhXAlXaJb42WT9lcg15MUdPbXUmbXfSwhniws2YHfZnDqdZNSnT+FG+CXWPALklmXSJ0tjjVgWL8W1hTiaGFDqgmHcCwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752854; c=relaxed/simple;
	bh=OeKfSVs/1QSZvK90pEfiggOvCGaV0fnju6Pbjxm6QD0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TtBJxf8gyW0xDz4A+6O1rsvV2q52nwF1Y+UUJ6a6xZ2QjWysUF5kLSnAWv0wohj8ZrUZFeymln2AgN5PNNbbqa75n8XlYQ1k5sLXMhN1fo6dmLL28OeGYMnQnTVXkEYYnZckUMrqbG0KrDNW2H2P+SiN8DfNjRl5FZa9t1nPrv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfTlj2D8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfTlj2D8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747752853; x=1779288853;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OeKfSVs/1QSZvK90pEfiggOvCGaV0fnju6Pbjxm6QD0=;
  b=HfTlj2D8OGpVng25aHkEGbGVms49LoI4L/+r11KFlIGfaF/trxeew3za
   /xtEjeAlroxzDRCQXK8UOYax/gg2SlQk0ZJdGKWpELVBjlmoDO4cVJvqi
   TuFC/01jIYLdrlG8XboaHYY8GjUXrKu8+OguChmO2DGM3KYEW4eWPiSXn
   1KPzw6f8SY0zM/4GGQZIvd5Aw+jSlcLapRH3Xc3iTMSDSogV4BKzZMpZJ
   XmHHVGBw7SB7QAAQ5JdAHwglMpmjdcnqMVOUFTFw1XOAWspI0mR37dbbD
   BqXM09H4TVP6vjxv29iRWewnTy+i/HIR9iz475Sm0t4Q+CsmBOJFs0k4Y
   A==;
X-CSE-ConnectionGUID: uck0+I18QdKgPcnMRK8+Fg==
X-CSE-MsgGUID: HgvFF8tdQ86/A0JmBNW4Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49792613"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49792613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:54:12 -0700
X-CSE-ConnectionGUID: rRvW8EdYTXmXpCdQ3c/WXg==
X-CSE-MsgGUID: w6TSiCYCRJKypAfjwHEufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144457832"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:54:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 17:54:05 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 10/15] platform/x86/intel/tpmi: Relocate platform info
 to intel_vsec.h
In-Reply-To: <20250430212106.369208-11-david.e.box@linux.intel.com>
Message-ID: <b8b5bcf8-bac9-4e92-f876-2c6ac595596f@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com> <20250430212106.369208-11-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1116251625-1747752845=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1116251625-1747752845=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 30 Apr 2025, David E. Box wrote:

> The TPMI platform information provides a mapping of OOBMSM PCI devices to
> logical CPUs. Since this mapping is consistent across all OOBMSM features
> (e.g., TPMI, PMT, SDSi), it can be leveraged by multiple drivers. To
> facilitate reuse, relocate the struct intel_tpmi_plat_info to intel_vsec.=
h,
> renaming it to struct oobmsm_plat_info, making it accessible to other
> features. While modifying headers, place them in alphabetical order.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/plr_tpmi.c         |  3 ++-
>  .../intel/speed_select_if/isst_tpmi_core.c    |  9 ++++---
>  .../uncore-frequency/uncore-frequency-tpmi.c  |  5 ++--
>  drivers/platform/x86/intel/vsec_tpmi.c        |  4 +--
>  drivers/powercap/intel_rapl_tpmi.c            |  9 ++++---
>  include/linux/intel_tpmi.h                    | 26 ++-----------------
>  include/linux/intel_vsec.h                    | 22 ++++++++++++++++
>  7 files changed, 41 insertions(+), 37 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/plr_tpmi.c b/drivers/platform/x86=
/intel/plr_tpmi.c
> index 2b55347a5a93..58132da47745 100644
> --- a/drivers/platform/x86/intel/plr_tpmi.c
> +++ b/drivers/platform/x86/intel/plr_tpmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/err.h>
>  #include <linux/gfp_types.h>
>  #include <linux/intel_tpmi.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kstrtox.h>
> @@ -256,7 +257,7 @@ DEFINE_SHOW_STORE_ATTRIBUTE(plr_status);
> =20
>  static int intel_plr_probe(struct auxiliary_device *auxdev, const struct=
 auxiliary_device_id *id)
>  {
> -=09struct intel_tpmi_plat_info *plat_info;
> +=09struct oobmsm_plat_info *plat_info;
>  =09struct dentry *dentry;
>  =09int i, num_resources;
>  =09struct resource *res;
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c =
b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 9978cdd19851..875afa6835cd 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -22,6 +22,7 @@
>  #include <linux/auxiliary_bus.h>
>  #include <linux/delay.h>
>  #include <linux/intel_tpmi.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/fs.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -1446,7 +1447,7 @@ int tpmi_sst_dev_add(struct auxiliary_device *auxde=
v)
>  {
>  =09struct tpmi_per_power_domain_info *pd_info;
>  =09bool read_blocked =3D 0, write_blocked =3D 0;
> -=09struct intel_tpmi_plat_info *plat_info;
> +=09struct oobmsm_plat_info *plat_info;
>  =09struct device *dev =3D &auxdev->dev;
>  =09struct tpmi_sst_struct *tpmi_sst;
>  =09u8 i, num_resources, io_die_cnt;
> @@ -1598,7 +1599,7 @@ EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_add, "INTEL_TPMI_=
SST");
>  void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
>  {
>  =09struct tpmi_sst_struct *tpmi_sst =3D auxiliary_get_drvdata(auxdev);
> -=09struct intel_tpmi_plat_info *plat_info;
> +=09struct oobmsm_plat_info *plat_info;
> =20
>  =09plat_info =3D tpmi_get_platform_data(auxdev);
>  =09if (!plat_info)
> @@ -1620,7 +1621,7 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *=
auxdev)
>  {
>  =09struct tpmi_sst_struct *tpmi_sst =3D auxiliary_get_drvdata(auxdev);
>  =09struct tpmi_per_power_domain_info *power_domain_info;
> -=09struct intel_tpmi_plat_info *plat_info;
> +=09struct oobmsm_plat_info *plat_info;
>  =09void __iomem *cp_base;
> =20
>  =09plat_info =3D tpmi_get_platform_data(auxdev);
> @@ -1648,7 +1649,7 @@ void tpmi_sst_dev_resume(struct auxiliary_device *a=
uxdev)
>  {
>  =09struct tpmi_sst_struct *tpmi_sst =3D auxiliary_get_drvdata(auxdev);
>  =09struct tpmi_per_power_domain_info *power_domain_info;
> -=09struct intel_tpmi_plat_info *plat_info;
> +=09struct oobmsm_plat_info *plat_info;
>  =09void __iomem *cp_base;
> =20
>  =09plat_info =3D tpmi_get_platform_data(auxdev);
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency=
-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi=
=2Ec
> index 4aa6c227ec82..23a86feb12ef 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> @@ -22,9 +22,10 @@
>  #include <linux/auxiliary_bus.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/intel_tpmi.h>
> +#include <linux/intel_vsec.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> -#include <linux/intel_tpmi.h>
> =20
>  #include "uncore-frequency-common.h"
> =20
> @@ -421,7 +422,7 @@ static void remove_cluster_entries(struct tpmi_uncore=
_struct *tpmi_uncore)
>  static int uncore_probe(struct auxiliary_device *auxdev, const struct au=
xiliary_device_id *id)
>  {
>  =09bool read_blocked =3D 0, write_blocked =3D 0;
> -=09struct intel_tpmi_plat_info *plat_info;
> +=09struct oobmsm_plat_info *plat_info;
>  =09struct tpmi_uncore_struct *tpmi_uncore;
>  =09bool uncore_sysfs_added =3D false;
>  =09int ret, i, pkg =3D 0;
> diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x8=
6/intel/vsec_tpmi.c
> index 5c383a27bbe8..d95a0d994546 100644
> --- a/drivers/platform/x86/intel/vsec_tpmi.c
> +++ b/drivers/platform/x86/intel/vsec_tpmi.c
> @@ -116,7 +116,7 @@ struct intel_tpmi_info {
>  =09struct intel_vsec_device *vsec_dev;
>  =09int feature_count;
>  =09u64 pfs_start;
> -=09struct intel_tpmi_plat_info plat_info;
> +=09struct oobmsm_plat_info plat_info;
>  =09void __iomem *tpmi_control_mem;
>  =09struct dentry *dbgfs_dir;
>  };
> @@ -187,7 +187,7 @@ struct tpmi_feature_state {
>  /* Used during auxbus device creation */
>  static DEFINE_IDA(intel_vsec_tpmi_ida);
> =20
> -struct intel_tpmi_plat_info *tpmi_get_platform_data(struct auxiliary_dev=
ice *auxdev)
> +struct oobmsm_plat_info *tpmi_get_platform_data(struct auxiliary_device =
*auxdev)
>  {
>  =09struct intel_vsec_device *vsec_dev =3D auxdev_to_ivdev(auxdev);
> =20
> diff --git a/drivers/powercap/intel_rapl_tpmi.c b/drivers/powercap/intel_=
rapl_tpmi.c
> index af2368f4db10..82201bf4685d 100644
> --- a/drivers/powercap/intel_rapl_tpmi.c
> +++ b/drivers/powercap/intel_rapl_tpmi.c
> @@ -9,9 +9,10 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #include <linux/auxiliary_bus.h>
> -#include <linux/io.h>
> -#include <linux/intel_tpmi.h>
>  #include <linux/intel_rapl.h>
> +#include <linux/intel_tpmi.h>
> +#include <linux/intel_vsec.h>
> +#include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> =20
> @@ -48,7 +49,7 @@ enum tpmi_rapl_register {
> =20
>  struct tpmi_rapl_package {
>  =09struct rapl_if_priv priv;
> -=09struct intel_tpmi_plat_info *tpmi_info;
> +=09struct oobmsm_plat_info *tpmi_info;
>  =09struct rapl_package *rp;
>  =09void __iomem *base;
>  =09struct list_head node;
> @@ -253,7 +254,7 @@ static int intel_rapl_tpmi_probe(struct auxiliary_dev=
ice *auxdev,
>  =09=09=09=09 const struct auxiliary_device_id *id)
>  {
>  =09struct tpmi_rapl_package *trp;
> -=09struct intel_tpmi_plat_info *info;
> +=09struct oobmsm_plat_info *info;
>  =09struct resource *res;
>  =09u32 offset;
>  =09int ret;
> diff --git a/include/linux/intel_tpmi.h b/include/linux/intel_tpmi.h
> index ff480b47ae64..d1fe2469b0a4 100644
> --- a/include/linux/intel_tpmi.h
> +++ b/include/linux/intel_tpmi.h
> @@ -7,6 +7,7 @@
>  #define _INTEL_TPMI_H_
> =20
>  #include <linux/bitfield.h>

Add an empty line here.

Once that is addressed,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


> +struct oobmsm_plat_info;
> =20
>  #define TPMI_VERSION_INVALID=090xff
>  #define TPMI_MINOR_VERSION(val)=09FIELD_GET(GENMASK(4, 0), val)
> @@ -26,30 +27,7 @@ enum intel_tpmi_id {
>  =09TPMI_INFO_ID =3D 0x81,=09/* Special ID for PCI BDF and Package ID inf=
ormation */
>  };
> =20
> -/**
> - * struct intel_tpmi_plat_info - Platform information for a TPMI device =
instance
> - * @cdie_mask:       Mask of all compute dies in the partition
> - * @package_id:      CPU Package id
> - * @partition:       Package partition id when multiple VSEC PCI devices=
 per package
> - * @segment:         PCI segment ID
> - * @bus_number:      PCI bus number
> - * @device_number:   PCI device number
> - * @function_number: PCI function number
> - *
> - * Structure to store platform data for a TPMI device instance. This
> - * struct is used to return data via tpmi_get_platform_data().
> - */
> -struct intel_tpmi_plat_info {
> -=09u16 cdie_mask;
> -=09u8 package_id;
> -=09u8 partition;
> -=09u8 segment;
> -=09u8 bus_number;
> -=09u8 device_number;
> -=09u8 function_number;
> -};
> -
> -struct intel_tpmi_plat_info *tpmi_get_platform_data(struct auxiliary_dev=
ice *auxdev);
> +struct oobmsm_plat_info *tpmi_get_platform_data(struct auxiliary_device =
*auxdev);
>  struct resource *tpmi_get_resource_at_index(struct auxiliary_device *aux=
dev, int index);
>  int tpmi_get_resource_count(struct auxiliary_device *auxdev);
>  int tpmi_get_feature_status(struct auxiliary_device *auxdev, int feature=
_id, bool *read_blocked,
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index a07796d7d43b..cd78d0b2e623 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -144,6 +144,28 @@ struct intel_vsec_device {
>  =09unsigned long cap_id;
>  };
> =20
> +/**
> + * struct oobmsm_plat_info - Platform information for a device instance
> + * @cdie_mask:       Mask of all compute dies in the partition
> + * @package_id:      CPU Package id
> + * @partition:       Package partition id when multiple VSEC PCI devices=
 per package
> + * @segment:         PCI segment ID
> + * @bus_number:      PCI bus number
> + * @device_number:   PCI device number
> + * @function_number: PCI function number
> + *
> + * Structure to store platform data for a OOBMSM device instance.
> + */
> +struct oobmsm_plat_info {
> +=09u16 cdie_mask;
> +=09u8 package_id;
> +=09u8 partition;
> +=09u8 segment;
> +=09u8 bus_number;
> +=09u8 device_number;
> +=09u8 function_number;
> +};
> +
>  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  =09=09       struct intel_vsec_device *intel_vsec_dev,
>  =09=09       const char *name);
>=20

--=20
 i.

--8323328-1116251625-1747752845=:936--
