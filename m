Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042C61F12F8;
	Thu, 30 Jan 2025 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738275297; cv=none; b=RT3gsslDPxzzSBf6TNreMPIJu0B/oXQRsTMCZoQYVgb74km/Z6aBo8Nhr8X/MEzGQxbhNDo010jhvvcvjpKt4DXyOnea+YxVk109NmEoqwrOlFlSeC4dnEep1d76A7OBRSO4GNYSp3iDWsLrgJHnVBWyUBzeUisIEgWdfuNL7jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738275297; c=relaxed/simple;
	bh=nZeIcXk+g1AN59UdrfZD3xV4Z8ZK2+hAv8aw0JH66JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPzbslS8X4f1prcNI+OXGr9fSAev5Poq62kAqTWk4skgAp17yhqs4WJealsDGmGfw137ESvDTEegsRUR0eJVdNs009tCm66tTqsoAq59BOkaC1t1PhzFBKGscV0dwRZYXxWoNXxIMJFqjflX6iVGsv0ACAQZgc+3efcJ3w72mzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJWn4Fup; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJWn4Fup"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3ebb4aae80dso591606b6e.2;
        Thu, 30 Jan 2025 14:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738275295; x=1738880095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XkCIT5fr45Mrw6Mw0REjFDmGlM7aCZjHShzrCHNS+9I=;
        b=gJWn4Fupl8Q0K8QmVT/q/T8nUvwW+aUnB5VuuhhUjqsn4sTm80mRfVro9nV1zvLBej
         G9oejAot4XJ8p/JdUbI/sa9OvhV6Qjbvi1Getmh6f3V49Q+fX3GNemQXtV15KlKUE/BI
         Z53vPYSpxJBxAHVTKfzHmQEsiR4fmaBD1kifPCVGO+uIM7ndAMKq8FDZ0YXzX2YDNchU
         tFyMIu9TrqmyTBHsuzmyozKgpQa+ZxiiLJaEhp63j3+PwAaAXViFLZsoe7Ud/IPAEDEy
         lSM/ccb9AAOeG/RJd/9m6TpDPfMW2QrLKKApA6QGQR4cHo7q3etYQXXya8bQy4qB6RO7
         rOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738275295; x=1738880095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkCIT5fr45Mrw6Mw0REjFDmGlM7aCZjHShzrCHNS+9I=;
        b=UbcYsZZbso9epE5lKxsKkPjpsrd8Cnyc2PUskjVI+5f+rWAl/DNZNRNMSl6sAuZCsE
         J9iQkl2Ag8mlzffVViEq1zkCMSn2+N38/Np5P3LS89sJoGXeJxf2LoYh+QXNVky8MYKt
         8/Gn5tlsRPWnc2ToVdZG+bqZC77HQy9ZxehMXFN4HqExxKP5H8WSEfxAywAI8LOCQgYn
         E7nAQNDeFGU0HMbQse6PT2tt213GJarVQUTO8aDywfamd9JPEaKx8YTP6faNVYWXBuEY
         coJ44ER2g7ABKKiMdv3n1snkvhpgaxf4TlW11zRFwSOheBJySC/5C4A99k1yipXnb6jo
         OvRA==
X-Forwarded-Encrypted: i=1; AJvYcCVeGvZ5eGSEiORI3u/6Z8qxAOPVMzjnBxzkZW1HeNdFhRRo7xFhfCmNcJOg1mdjGGfDz/CE3pLsvBCea4xtcOoNFeOP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2RsEb+slTQOSR2NdGqKBPx14skyv+5JmvFY9D2ANlPMiZdlJ3
	ieBrywB/GCClqNQHfK/3kyy7nYL0GSO44xdfo289GMq7hQAiDAPs
X-Gm-Gg: ASbGncujESz0mY2O4pWaxYPcNpnOO9AWlBYURqg0nTn8y3L5L0HGZs/yQ7xEc1BfXYR
	HCGdyUZsoHMHA1D8DM6MesOQV61gdryjomTHnPpp9NORQVGfl+ZzKW0rfv9Gs4UdEvGsMZ/Tvxb
	ozbAakU2RvCJvpO+w4svbajjNvOBVLBlmDy74HLfMiqlfk/7gD1jfZzYxK7wfdn6ix/1Cj7PoiT
	9aRIUsGlz5LPmxK+zAKT6UatA73GRARtzLf9uBGGdHyAHhSaB8SQRzIB3mIQGyNIYSsOgDi5ctD
	qGheRgfSQiVnuZv2Wg7SUXDPnuk/lpQCBJFMyre4QW2L5IPBJbRfYLsZTDVKRkGR+TJnc6A=
X-Google-Smtp-Source: AGHT+IETfVQFR7Fx2mKQzN53I4jvHbAFXshooqYTQm2QXMgNMBXjv87849uHNkpp8c3dilWjfbXuHw==
X-Received: by 2002:a05:6871:a10c:b0:261:16da:decb with SMTP id 586e51a60fabf-2b32eff0d2emr5345842fac.11.1738275294842;
        Thu, 30 Jan 2025 14:14:54 -0800 (PST)
Received: from [10.7.51.199] (syn-076-187-124-123.res.spectrum.com. [76.187.124.123])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d225sm666354fac.27.2025.01.30.14.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 14:14:54 -0800 (PST)
Message-ID: <91f7912f-e1d3-471a-bc45-e928d0de1e62@gmail.com>
Date: Thu, 30 Jan 2025 16:14:52 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86/amd_node, platform/x86/amd/hsmp: Have HSMP use
 SMN through AMD_NODE
To: Yazen Ghannam <yazen.ghannam@amd.com>, x86@kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Suma Hegde <Suma.Hegde@amd.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20250130-wip-x86-amd-nb-cleanup-v4-0-b5cc997e471b@amd.com>
 <20250130-wip-x86-amd-nb-cleanup-v4-1-b5cc997e471b@amd.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20250130-wip-x86-amd-nb-cleanup-v4-1-b5cc997e471b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/30/25 13:48, Yazen Ghannam wrote:

> The HSMP interface is just an SMN interface with different offsets.
>
> Define an HSMP wrapper in the SMN code and have the HSMP platform driver
> use that rather than a local solution.
>
> Also, remove the "root" member from AMD_NB, since there are no more
> users of it.
>
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>
> Notes:
>     Link:
>     https://lore.kernel.org/20241213152206.385573-1-yazen.ghannam@amd.com
>     
>     v2.2->v4
>     * Was left out of v3 set.
>     * Fix build issue for amd_smn_hsmp_rdwr().
>     
>     v2.1-v2.2:
>     * Include <linux/build_bug.h> for static_assert()
>     
>     v2->v2.1:
>     * Include static_assert() and comment for sysfs attributes.
>     
>     v1->v2:
>     * Rebase on recent HSMP rework.
>
>  arch/x86/include/asm/amd_nb.h         |  1 -
>  arch/x86/include/asm/amd_node.h       | 13 +++++++++++++
>  arch/x86/kernel/amd_nb.c              |  1 -
>  arch/x86/kernel/amd_node.c            |  9 +++++++++
>  drivers/platform/x86/amd/hsmp/Kconfig |  2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c  |  7 ++++---
>  drivers/platform/x86/amd/hsmp/hsmp.c  |  1 -
>  drivers/platform/x86/amd/hsmp/hsmp.h  |  3 ---
>  drivers/platform/x86/amd/hsmp/plat.c  | 36 ++++++++++++-----------------------
>  9 files changed, 39 insertions(+), 34 deletions(-)
>
> diff --git a/arch/x86/include/asm/amd_nb.h b/arch/x86/include/asm/amd_nb.h
> index 4c4efb93045e..adfa0854cf2d 100644
> --- a/arch/x86/include/asm/amd_nb.h
> +++ b/arch/x86/include/asm/amd_nb.h
> @@ -27,7 +27,6 @@ struct amd_l3_cache {
>  };
>  
>  struct amd_northbridge {
> -	struct pci_dev *root;
>  	struct pci_dev *misc;
>  	struct pci_dev *link;
>  	struct amd_l3_cache l3_cache;
> diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd_node.h
> index 113ad3e8ee40..002c3afbd30f 100644
> --- a/arch/x86/include/asm/amd_node.h
> +++ b/arch/x86/include/asm/amd_node.h
> @@ -30,7 +30,20 @@ static inline u16 amd_num_nodes(void)
>  	return topology_amd_nodes_per_pkg() * topology_max_packages();
>  }
>  
> +#ifdef CONFIG_AMD_NODE
>  int __must_check amd_smn_read(u16 node, u32 address, u32 *value);
>  int __must_check amd_smn_write(u16 node, u32 address, u32 value);
>  
> +/* Should only be used by the HSMP driver. */
> +int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bool write);
> +#else
> +static inline int __must_check amd_smn_read(u16 node, u32 address, u32 *value) { return -ENODEV; }
> +static inline int __must_check amd_smn_write(u16 node, u32 address, u32 value) { return -ENODEV; }
> +
> +static inline int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bool write)
> +{
> +	return -ENODEV;
> +}
> +#endif /* CONFIG_AMD_NODE */
> +
>  #endif /*_ASM_X86_AMD_NODE_H_*/
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
> index 11fac09e3a8c..24d7a87edf9c 100644
> --- a/arch/x86/kernel/amd_nb.c
> +++ b/arch/x86/kernel/amd_nb.c
> @@ -73,7 +73,6 @@ static int amd_cache_northbridges(void)
>  	amd_northbridges.nb = nb;
>  
>  	for (i = 0; i < amd_northbridges.num; i++) {
> -		node_to_amd_nb(i)->root = amd_node_get_root(i);
>  		node_to_amd_nb(i)->misc = amd_node_get_func(i, 3);
>  
>  		/*
> diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
> index d2ec7fd555c5..65045f223c10 100644
> --- a/arch/x86/kernel/amd_node.c
> +++ b/arch/x86/kernel/amd_node.c
> @@ -97,6 +97,9 @@ static DEFINE_MUTEX(smn_mutex);
>  #define SMN_INDEX_OFFSET	0x60
>  #define SMN_DATA_OFFSET		0x64
>  
> +#define HSMP_INDEX_OFFSET	0xc4
> +#define HSMP_DATA_OFFSET	0xc8
> +
>  /*
>   * SMN accesses may fail in ways that are difficult to detect here in the called
>   * functions amd_smn_read() and amd_smn_write(). Therefore, callers must do
> @@ -179,6 +182,12 @@ int __must_check amd_smn_write(u16 node, u32 address, u32 value)
>  }
>  EXPORT_SYMBOL_GPL(amd_smn_write);
>  
> +int __must_check amd_smn_hsmp_rdwr(u16 node, u32 address, u32 *value, bool write)
> +{
> +	return __amd_smn_rw(HSMP_INDEX_OFFSET, HSMP_DATA_OFFSET, node, address, value, write);
> +}
> +EXPORT_SYMBOL_GPL(amd_smn_hsmp_rdwr);
> +
>  static int amd_cache_roots(void)
>  {
>  	u16 node, num_nodes = amd_num_nodes();
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index 7d10d4462a45..d6f7a62d55b5 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -7,7 +7,7 @@ config AMD_HSMP
>  	tristate
>  
>  menu "AMD HSMP Driver"
> -	depends on AMD_NB || COMPILE_TEST
> +	depends on AMD_NODE || COMPILE_TEST
>  
>  config AMD_HSMP_ACPI
>  	tristate "AMD HSMP ACPI device driver"
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 444b43be35a2..c1eccb3c80c5 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -10,7 +10,6 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
>  
>  #include <linux/acpi.h>
>  #include <linux/device.h>
> @@ -24,6 +23,8 @@
>  
>  #include <uapi/asm-generic/errno-base.h>
>  
> +#include <asm/amd_node.h>
> +
>  #include "hsmp.h"
>  
>  #define DRIVER_NAME		"amd_hsmp"
> @@ -321,8 +322,8 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	if (!hsmp_pdev->is_probed) {
> -		hsmp_pdev->num_sockets = amd_nb_num();
> -		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
> +		hsmp_pdev->num_sockets = amd_num_nodes();
> +		if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
>  			return -ENODEV;
>  
>  		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 03164e30b3a5..a3ac09a90de4 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -8,7 +8,6 @@
>   */
>  
>  #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
>  
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index e852f0a947e4..af8b21f821d6 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -21,8 +21,6 @@
>  
>  #define HSMP_ATTR_GRP_NAME_SIZE	10
>  
> -#define MAX_AMD_SOCKETS 8
> -
>  #define HSMP_CDEV_NAME		"hsmp_cdev"
>  #define HSMP_DEVNODE_NAME	"hsmp"
>  
> @@ -41,7 +39,6 @@ struct hsmp_socket {
>  	void __iomem *virt_base_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
> -	struct pci_dev *root;
>  	struct device *dev;
>  	u16 sock_ind;
>  	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 02ca85762b68..b9782a078dbd 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -10,14 +10,16 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
>  
> +#include <linux/build_bug.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  
> +#include <asm/amd_node.h>
> +
>  #include "hsmp.h"
>  
>  #define DRIVER_NAME		"amd_hsmp"
> @@ -34,28 +36,12 @@
>  #define SMN_HSMP_MSG_RESP	0x0010980
>  #define SMN_HSMP_MSG_DATA	0x00109E0
>  
> -#define HSMP_INDEX_REG		0xc4
> -#define HSMP_DATA_REG		0xc8
> -
>  static struct hsmp_plat_device *hsmp_pdev;
>  
>  static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>  			     u32 *value, bool write)
>  {
> -	int ret;
> -
> -	if (!sock->root)
> -		return -ENODEV;
> -
> -	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
> -				     sock->mbinfo.base_addr + offset);
> -	if (ret)
> -		return ret;
> -
> -	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
> -		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
> -
> -	return ret;
> +	return amd_smn_hsmp_rdwr(sock->sock_ind, sock->mbinfo.base_addr + offset, value, write);
>  }
>  
>  static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj,
> @@ -95,7 +81,12 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>   * Static array of 8 + 1(for NULL) elements is created below
>   * to create sysfs groups for sockets.
>   * is_bin_visible function is used to show / hide the necessary groups.
> + *
> + * Validate the maximum number against MAX_AMD_NUM_NODES. If this changes,
> + * then the attributes and groups below must be adjusted.
>   */
> +static_assert(MAX_AMD_NUM_NODES == 8);
> +
>  #define HSMP_BIN_ATTR(index, _list)					\
>  static const struct bin_attribute attr##index = {			\
>  	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
> @@ -159,10 +150,7 @@ static int init_platform_device(struct device *dev)
>  	int ret, i;
>  
>  	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
> -		if (!node_to_amd_nb(i))
> -			return -ENODEV;
>  		sock = &hsmp_pdev->sock[i];
> -		sock->root			= node_to_amd_nb(i)->root;
>  		sock->sock_ind			= i;
>  		sock->dev			= dev;
>  		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
> @@ -305,11 +293,11 @@ static int __init hsmp_plt_init(void)
>  		return -ENOMEM;
>  
>  	/*
> -	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> +	 * amd_num_nodes() returns number of SMN/DF interfaces present in the system
>  	 * if we have N SMN/DF interfaces that ideally means N sockets
>  	 */
> -	hsmp_pdev->num_sockets = amd_nb_num();
> -	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_SOCKETS)
> +	hsmp_pdev->num_sockets = amd_num_nodes();
> +	if (hsmp_pdev->num_sockets == 0 || hsmp_pdev->num_sockets > MAX_AMD_NUM_NODES)
>  		return ret;
>  
>  	ret = platform_driver_register(&amd_hsmp_driver);
>

Reviewed-by: Carlos Bilbao <carlos.bilbao@kernel.org>


Thanks, Carlos

