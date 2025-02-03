Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879A205AB7;
	Mon,  3 Feb 2025 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588650; cv=none; b=pj+KWLbPDKum5gp/BrL8y4MTYBMqEeTQa6WNhMuwy3QLVsIQkWEOXsj1LQlPUGctLlRfzx+/s6pZ+jPebSjX18ezGaq/cj56AzvbPTmLtKcpvp2w4kz1r0Z7AWJ+h90EBSM5CD5QG3rpN43L+dcEMBwItLdosd9s5UStjYO7llc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588650; c=relaxed/simple;
	bh=ou0BAZWdpb06WegBvce+6w/2/gdnBPC0rooWXHkrvss=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QN+JJrl1M4A5XGHTsVnVeqLfZRWRejs9SiEuQfeeC7X/bpBaDCNIT3H/fAeOXx/ZbzfH2v73f418J4RaEtOZAd1DiFGLdtwVOzkrYJca+JgN4IA1RqIow0MvXopqtpSPibydEvf9byO1P/sEOLY2zRySWIQUzdXQKZY8EYS+G5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNsCKbZU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNsCKbZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588649; x=1770124649;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ou0BAZWdpb06WegBvce+6w/2/gdnBPC0rooWXHkrvss=;
  b=cNsCKbZU/1K8X2F1j0xvBWkdrPINQuP9HqgBn20IOK9h/ZqKWNBy5iXN
   xOR4+V6GygJyocufFmqHcRSBvy7fAv0KM+pIAefbcbllb9OMvF+wIQo36
   NENndeYk7FIy/tsySbVZYJb+kxTzDji6ucUVJRchhLMXBl760oSjpxOz5
   yGeWfirarIcQxb5I1ulZCX1sdnX2+IaXNJi31uwzWV73rVYyaMd0Vn4Lv
   V2MjN7e1HNXuqdgRYgJZhjd2wj0XkKYyU1wdZ8zkToYJA3iykSD4E82Eh
   4BPOthVkjMnMytcdZ5vF7yHLaDsP8v6VxI8NZGWgQikRjRfT2fdYPhD55
   w==;
X-CSE-ConnectionGUID: ZRGt9zKxTOaZ+U4omog2BQ==
X-CSE-MsgGUID: ydyi4SNXRmyhWhKo785dIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43002439"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="43002439"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:17:28 -0800
X-CSE-ConnectionGUID: 15YBUrnmQCitQkTt5pg+xQ==
X-CSE-MsgGUID: 1InKVKXEQ8yuGZnn+94H1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115320198"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:17:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 15:17:21 +0200 (EET)
To: Yazen Ghannam <yazen.ghannam@amd.com>
cc: x86@kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
    Suma Hegde <Suma.Hegde@amd.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
    Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 1/3] x86/amd_node, platform/x86/amd/hsmp: Have HSMP
 use SMN through AMD_NODE
In-Reply-To: <20250130-wip-x86-amd-nb-cleanup-v4-1-b5cc997e471b@amd.com>
Message-ID: <ec229c88-f142-acb9-2e95-565a72be8444@linux.intel.com>
References: <20250130-wip-x86-amd-nb-cleanup-v4-0-b5cc997e471b@amd.com> <20250130-wip-x86-amd-nb-cleanup-v4-1-b5cc997e471b@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2018012855-1738588641=:934"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2018012855-1738588641=:934
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 30 Jan 2025, Yazen Ghannam wrote:

> The HSMP interface is just an SMN interface with different offsets.
>=20
> Define an HSMP wrapper in the SMN code and have the HSMP platform driver
> use that rather than a local solution.
>=20
> Also, remove the "root" member from AMD_NB, since there are no more
> users of it.
>=20
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>=20
> Notes:
>     Link:
>     https://lore.kernel.org/20241213152206.385573-1-yazen.ghannam@amd.com
>    =20
>     v2.2->v4
>     * Was left out of v3 set.
>     * Fix build issue for amd_smn_hsmp_rdwr().
>    =20
>     v2.1-v2.2:
>     * Include <linux/build_bug.h> for static_assert()
>    =20
>     v2->v2.1:
>     * Include static_assert() and comment for sysfs attributes.
>    =20
>     v1->v2:
>     * Rebase on recent HSMP rework.
>=20
>  arch/x86/include/asm/amd_nb.h         |  1 -
>  arch/x86/include/asm/amd_node.h       | 13 +++++++++++++
>  arch/x86/kernel/amd_nb.c              |  1 -
>  arch/x86/kernel/amd_node.c            |  9 +++++++++
>  drivers/platform/x86/amd/hsmp/Kconfig |  2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c  |  7 ++++---
>  drivers/platform/x86/amd/hsmp/hsmp.c  |  1 -
>  drivers/platform/x86/amd/hsmp/hsmp.h  |  3 ---
>  drivers/platform/x86/amd/hsmp/plat.c  | 36 ++++++++++++-----------------=
------
>  9 files changed, 39 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/x86/include/asm/amd_nb.h b/arch/x86/include/asm/amd_nb.=
h
> index 4c4efb93045e..adfa0854cf2d 100644
> --- a/arch/x86/include/asm/amd_nb.h
> +++ b/arch/x86/include/asm/amd_nb.h
> @@ -27,7 +27,6 @@ struct amd_l3_cache {
>  };
> =20
>  struct amd_northbridge {
> -=09struct pci_dev *root;
>  =09struct pci_dev *misc;
>  =09struct pci_dev *link;
>  =09struct amd_l3_cache l3_cache;
> diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd_n=
ode.h
> index 113ad3e8ee40..002c3afbd30f 100644
> --- a/arch/x86/include/asm/amd_node.h
> +++ b/arch/x86/include/asm/amd_node.h
> @@ -30,7 +30,20 @@ static inline u16 amd_num_nodes(void)
>  =09return topology_amd_nodes_per_pkg() * topology_max_packages();
>  }
> =20
> +#ifdef CONFIG_AMD_NODE
>  int __must_check amd_smn_read(u16 node, u32 address, u32 *value);
>  int __must_check amd_smn_write(u16 node, u32 address, u32 value);
> =20
> +/* Should only be used by the HSMP driver. */
> +int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bo=
ol write);
> +#else
> +static inline int __must_check amd_smn_read(u16 node, u32 address, u32 *=
value) { return -ENODEV; }
> +static inline int __must_check amd_smn_write(u16 node, u32 address, u32 =
value) { return -ENODEV; }
> +
> +static inline int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, =
u32 *value, bool write)
> +{
> +=09return -ENODEV;
> +}
> +#endif /* CONFIG_AMD_NODE */
> +
>  #endif /*_ASM_X86_AMD_NODE_H_*/
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index 11fac09e3a8c..24d7a87edf9c 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -73,7 +73,6 @@ static int amd_cache_northbridges(void)
>  =09amd_northbridges.nb =3D nb;
> =20
>  =09for (i =3D 0; i < amd_northbridges.num; i++) {
> -=09=09node_to_amd_nb(i)->root =3D amd_node_get_root(i);
>  =09=09node_to_amd_nb(i)->misc =3D amd_node_get_func(i, 3);
> =20
>  =09=09/*
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index d2ec7fd555c5..65045f223c10 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -97,6 +97,9 @@ static DEFINE_MUTEX(smn_mutex);
>  #define SMN_INDEX_OFFSET=090x60
>  #define SMN_DATA_OFFSET=09=090x64
> =20
> +#define HSMP_INDEX_OFFSET=090xc4
> +#define HSMP_DATA_OFFSET=090xc8
> +
>  /*
>   * SMN accesses may fail in ways that are difficult to detect here in th=
e called
>   * functions amd_smn_read() and amd_smn_write(). Therefore, callers must=
 do
> @@ -179,6 +182,12 @@ int __must_check amd_smn_write(u16 node, u32 address=
, u32 value)
>  }
>  EXPORT_SYMBOL_GPL(amd_smn_write);
> =20
> +int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bo=
ol write)
> +{
> +=09return __amd_smn_rw(HSMP_INDEX_OFFSET, HSMP_DATA_OFFSET, node, addres=
s, value, write);
> +}
> +EXPORT_SYMBOL_GPL(amd_smn_hsmp_rdwr);
> +
>  static int amd_cache_roots(void)
>  {
>  =09u16 node, num_nodes =3D amd_num_nodes();
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86=
/amd/hsmp/Kconfig
> index 7d10d4462a45..d6f7a62d55b5 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -7,7 +7,7 @@ config AMD_HSMP
>  =09tristate
> =20
>  menu "AMD HSMP Driver"
> -=09depends on AMD_NB || COMPILE_TEST
> +=09depends on AMD_NODE || COMPILE_TEST
> =20
>  config AMD_HSMP_ACPI
>  =09tristate "AMD HSMP ACPI device driver"
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index 444b43be35a2..c1eccb3c80c5 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -10,7 +10,6 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
> =20
>  #include <linux/acpi.h>
>  #include <linux/device.h>
> @@ -24,6 +23,8 @@
> =20
>  #include <uapi/asm-generic/errno-base.h>
> =20
> +#include <asm/amd_node.h>
> +
>  #include "hsmp.h"
> =20
>  #define DRIVER_NAME=09=09"amd_hsmp"
> @@ -321,8 +322,8 @@ static int hsmp_acpi_probe(struct platform_device *pd=
ev)
>  =09=09return -ENOMEM;
> =20
>  =09if (!hsmp_pdev->is_probed) {
> -=09=09hsmp_pdev->num_sockets =3D amd_nb_num();
> -=09=09if (hsmp_pdev->num_sockets =3D=3D 0 || hsmp_pdev->num_sockets > MA=
X_AMD_SOCKETS)
> +=09=09hsmp_pdev->num_sockets =3D amd_num_nodes();
> +=09=09if (hsmp_pdev->num_sockets =3D=3D 0 || hsmp_pdev->num_sockets > MA=
X_AMD_NUM_NODES)
>  =09=09=09return -ENODEV;
> =20
>  =09=09hsmp_pdev->sock =3D devm_kcalloc(&pdev->dev, hsmp_pdev->num_socket=
s,
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 03164e30b3a5..a3ac09a90de4 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -8,7 +8,6 @@
>   */
> =20
>  #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
> =20
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index e852f0a947e4..af8b21f821d6 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -21,8 +21,6 @@
> =20
>  #define HSMP_ATTR_GRP_NAME_SIZE=0910
> =20
> -#define MAX_AMD_SOCKETS 8
> -
>  #define HSMP_CDEV_NAME=09=09"hsmp_cdev"
>  #define HSMP_DEVNODE_NAME=09"hsmp"
> =20
> @@ -41,7 +39,6 @@ struct hsmp_socket {
>  =09void __iomem *virt_base_addr;
>  =09struct semaphore hsmp_sem;
>  =09char name[HSMP_ATTR_GRP_NAME_SIZE];
> -=09struct pci_dev *root;
>  =09struct device *dev;
>  =09u16 sock_ind;
>  =09int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, boo=
l rw);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/=
amd/hsmp/plat.c
> index 02ca85762b68..b9782a078dbd 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -10,14 +10,16 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
>  #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
> =20
> +#include <linux/build_bug.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
> =20
> +#include <asm/amd_node.h>
> +
>  #include "hsmp.h"
> =20
>  #define DRIVER_NAME=09=09"amd_hsmp"
> @@ -34,28 +36,12 @@
>  #define SMN_HSMP_MSG_RESP=090x0010980
>  #define SMN_HSMP_MSG_DATA=090x00109E0
> =20
> -#define HSMP_INDEX_REG=09=090xc4
> -#define HSMP_DATA_REG=09=090xc8
> -
>  static struct hsmp_plat_device *hsmp_pdev;
> =20
>  static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>  =09=09=09     u32 *value, bool write)
>  {
> -=09int ret;
> -
> -=09if (!sock->root)
> -=09=09return -ENODEV;
> -
> -=09ret =3D pci_write_config_dword(sock->root, HSMP_INDEX_REG,
> -=09=09=09=09     sock->mbinfo.base_addr + offset);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09ret =3D (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *v=
alue)
> -=09=09     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
> -
> -=09return ret;
> +=09return amd_smn_hsmp_rdwr(sock->sock_ind, sock->mbinfo.base_addr + off=
set, value, write);
>  }
> =20
>  static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobje=
ct *kobj,
> @@ -95,7 +81,12 @@ static umode_t hsmp_is_sock_attr_visible(struct kobjec=
t *kobj,
>   * Static array of 8 + 1(for NULL) elements is created below
>   * to create sysfs groups for sockets.
>   * is_bin_visible function is used to show / hide the necessary groups.
> + *
> + * Validate the maximum number against MAX_AMD_NUM_NODES. If this change=
s,
> + * then the attributes and groups below must be adjusted.
>   */
> +static_assert(MAX_AMD_NUM_NODES =3D=3D 8);
> +
>  #define HSMP_BIN_ATTR(index, _list)=09=09=09=09=09\
>  static const struct bin_attribute attr##index =3D {=09=09=09\
>  =09.attr =3D { .name =3D HSMP_METRICS_TABLE_NAME, .mode =3D 0444},=09\
> @@ -159,10 +150,7 @@ static int init_platform_device(struct device *dev)
>  =09int ret, i;
> =20
>  =09for (i =3D 0; i < hsmp_pdev->num_sockets; i++) {
> -=09=09if (!node_to_amd_nb(i))
> -=09=09=09return -ENODEV;
>  =09=09sock =3D &hsmp_pdev->sock[i];
> -=09=09sock->root=09=09=09=3D node_to_amd_nb(i)->root;
>  =09=09sock->sock_ind=09=09=09=3D i;
>  =09=09sock->dev=09=09=09=3D dev;
>  =09=09sock->mbinfo.base_addr=09=09=3D SMN_HSMP_BASE;
> @@ -305,11 +293,11 @@ static int __init hsmp_plt_init(void)
>  =09=09return -ENOMEM;
> =20
>  =09/*
> -=09 * amd_nb_num() returns number of SMN/DF interfaces present in the sy=
stem
> +=09 * amd_num_nodes() returns number of SMN/DF interfaces present in the=
 system
>  =09 * if we have N SMN/DF interfaces that ideally means N sockets
>  =09 */
> -=09hsmp_pdev->num_sockets =3D amd_nb_num();
> -=09if (hsmp_pdev->num_sockets =3D=3D 0 || hsmp_pdev->num_sockets > MAX_A=
MD_SOCKETS)
> +=09hsmp_pdev->num_sockets =3D amd_num_nodes();
> +=09if (hsmp_pdev->num_sockets =3D=3D 0 || hsmp_pdev->num_sockets > MAX_A=
MD_NUM_NODES)
>  =09=09return ret;
> =20
>  =09ret =3D platform_driver_register(&amd_hsmp_driver);

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2018012855-1738588641=:934--
