Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A04438B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747184133; cv=none; b=av9E5N5uMPEGy0BibbDsh0r+16EtxO3gREeDavGQr9FHEhVT6GKQSIpyKwixrbZqyXwTfrmQzJVtcxNai28RhxQx8LLQfRQr8tnNZVKer21FhKmYRcUVT3E2yKzr5IHJQbhM8LvPqQ0pdykPj19Q5mxAmPRyoF/6mT/PeXQkvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747184133; c=relaxed/simple;
	bh=7t98y0UDifv3Ct/sxp1uuZA41CTr5B8ij87advFfUG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzFWLHWIZ9M8JbiLYnayoI3Rg/awavUNFqahahtAHOjwne655TTUwA5/bPC4z9s3FD6mM1IXujng1HhfKtHOdh03KasSEnXSleHeYwdbaMV50yatE1u8E1ry970fPx36gmLlKc5jBfCdo6VqTFwduG16X8LToTh/SflWJdF06x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOowN6i8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOowN6i8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747184131; x=1778720131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7t98y0UDifv3Ct/sxp1uuZA41CTr5B8ij87advFfUG0=;
  b=HOowN6i8x672faQiFYkzfhsEZi7FZEJQ15pO2mMrxOXaMy+LedooNFL2
   U33Bo25aD3hsuOOex/UlcR3f9D5ic+h51br+U56gBexbXMiZWClDw3P1a
   RxYWWllGhx6mc+/E0LM/sNg1znExEzQML5VVYF3iatY7mHyy7DS1gLKfL
   qmGugJ0HiaKo5CyR0eI0H+0M/pcBZkgFLrC9n+h0xWpusxKbd5iV54+Ab
   LLFTnpkwggS8Uhj5i2i7Fu/dpaIBoVX8KuQDjfeTl7itWDLuy/H7yeJKm
   UXa5+0n9rN2eR9KNvc6/hh0ilJwUpg9PYlBmo8FiI9oTAkBZkvFRZ0pJJ
   w==;
X-CSE-ConnectionGUID: PJnj7rJORt6BTMiavkk26A==
X-CSE-MsgGUID: MXprFLJ8TiWd+JPvjOZylQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48932042"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="48932042"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 17:55:30 -0700
X-CSE-ConnectionGUID: br3IwOFKQR23ZwIIxxCoXQ==
X-CSE-MsgGUID: CrAgaGlaQSqJ9cQt6R9bWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="141899938"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2025 17:55:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF0P3-000GY3-2c;
	Wed, 14 May 2025 00:55:21 +0000
Date: Wed, 14 May 2025 08:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	kasan-dev@googlegroups.com,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] init.h: Disable sanitizer coverage for __init and
 __head
Message-ID: <202505140811.z8Nb00zH-lkp@intel.com>
References: <20250507181615.1947159-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507181615.1947159-2-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/hardening]
[also build test WARNING on arm64/for-next/core masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.15-rc6 next-20250513]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/nvme-pci-Make-nvme_pci_npages_prp-__always_inline/20250508-021852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250507181615.1947159-2-kees%40kernel.org
patch subject: [PATCH 2/8] init.h: Disable sanitizer coverage for __init and __head
config: x86_64-buildonly-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140811.z8Nb00zH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140811.z8Nb00zH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140811.z8Nb00zH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/maps/ichxrom.c: In function 'ichxrom_init_one.constprop':
>> drivers/mtd/maps/ichxrom.c:115:12: warning: 'byte' is used uninitialized [-Wuninitialized]
     115 |         if (byte == 0xff) {
         |            ^
   drivers/mtd/maps/ichxrom.c:97:12: note: 'byte' was declared here
      97 |         u8 byte;
         |            ^~~~
--
   drivers/mtd/maps/amd76xrom.c: In function 'amd76xrom_init_one.constprop':
>> drivers/mtd/maps/amd76xrom.c:108:12: warning: 'byte' is used uninitialized [-Wuninitialized]
     108 |         u8 byte;
         |            ^~~~


vim +/byte +115 drivers/mtd/maps/ichxrom.c

^1da177e4c3f41 Linus Torvalds     2005-04-16   88  
^1da177e4c3f41 Linus Torvalds     2005-04-16   89  
e4106a7c8236eb Julia Lawall       2016-04-19   90  static int __init ichxrom_init_one(struct pci_dev *pdev,
^1da177e4c3f41 Linus Torvalds     2005-04-16   91  				   const struct pci_device_id *ent)
^1da177e4c3f41 Linus Torvalds     2005-04-16   92  {
^1da177e4c3f41 Linus Torvalds     2005-04-16   93  	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
^1da177e4c3f41 Linus Torvalds     2005-04-16   94  	struct ichxrom_window *window = &ichxrom_window;
^1da177e4c3f41 Linus Torvalds     2005-04-16   95  	struct ichxrom_map_info *map = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16   96  	unsigned long map_top;
^1da177e4c3f41 Linus Torvalds     2005-04-16   97  	u8 byte;
^1da177e4c3f41 Linus Torvalds     2005-04-16   98  	u16 word;
^1da177e4c3f41 Linus Torvalds     2005-04-16   99  
^1da177e4c3f41 Linus Torvalds     2005-04-16  100  	/* For now I just handle the ichx and I assume there
^1da177e4c3f41 Linus Torvalds     2005-04-16  101  	 * are not a lot of resources up at the top of the address
^1da177e4c3f41 Linus Torvalds     2005-04-16  102  	 * space.  It is possible to handle other devices in the
^1da177e4c3f41 Linus Torvalds     2005-04-16  103  	 * top 16MB but it is very painful.  Also since
^1da177e4c3f41 Linus Torvalds     2005-04-16  104  	 * you can only really attach a FWH to an ICHX there
^1da177e4c3f41 Linus Torvalds     2005-04-16  105  	 * a number of simplifications you can make.
^1da177e4c3f41 Linus Torvalds     2005-04-16  106  	 *
^1da177e4c3f41 Linus Torvalds     2005-04-16  107  	 * Also you can page firmware hubs if an 8MB window isn't enough
^1da177e4c3f41 Linus Torvalds     2005-04-16  108  	 * but don't currently handle that case either.
^1da177e4c3f41 Linus Torvalds     2005-04-16  109  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  110  	window->pdev = pdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  111  
^1da177e4c3f41 Linus Torvalds     2005-04-16  112  	/* Find a region continuous to the end of the ROM window  */
^1da177e4c3f41 Linus Torvalds     2005-04-16  113  	window->phys = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  114  	pci_read_config_byte(pdev, FWH_DEC_EN1, &byte);
^1da177e4c3f41 Linus Torvalds     2005-04-16 @115  	if (byte == 0xff) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  116  		window->phys = 0xffc00000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  117  		pci_read_config_byte(pdev, FWH_DEC_EN2, &byte);
^1da177e4c3f41 Linus Torvalds     2005-04-16  118  		if ((byte & 0x0f) == 0x0f) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  119  			window->phys = 0xff400000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  120  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  121  		else if ((byte & 0x0e) == 0x0e) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  122  			window->phys = 0xff500000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  123  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  124  		else if ((byte & 0x0c) == 0x0c) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  125  			window->phys = 0xff600000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  126  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  127  		else if ((byte & 0x08) == 0x08) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  128  			window->phys = 0xff700000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  129  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  130  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  131  	else if ((byte & 0xfe) == 0xfe) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  132  		window->phys = 0xffc80000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  133  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  134  	else if ((byte & 0xfc) == 0xfc) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  135  		window->phys = 0xffd00000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  137  	else if ((byte & 0xf8) == 0xf8) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  138  		window->phys = 0xffd80000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  139  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  	else if ((byte & 0xf0) == 0xf0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  		window->phys = 0xffe00000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  142  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  143  	else if ((byte & 0xe0) == 0xe0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  144  		window->phys = 0xffe80000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  145  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  146  	else if ((byte & 0xc0) == 0xc0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  147  		window->phys = 0xfff00000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  148  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  149  	else if ((byte & 0x80) == 0x80) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  150  		window->phys = 0xfff80000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  151  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  152  
^1da177e4c3f41 Linus Torvalds     2005-04-16  153  	if (window->phys == 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  154  		printk(KERN_ERR MOD_NAME ": Rom window is closed\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  155  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  156  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  157  	window->phys -= 0x400000UL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  158  	window->size = (0xffffffffUL - window->phys) + 1UL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  159  
^1da177e4c3f41 Linus Torvalds     2005-04-16  160  	/* Enable writes through the rom window */
^1da177e4c3f41 Linus Torvalds     2005-04-16  161  	pci_read_config_word(pdev, BIOS_CNTL, &word);
^1da177e4c3f41 Linus Torvalds     2005-04-16  162  	if (!(word & 1)  && (word & (1<<1))) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  163  		/* The BIOS will generate an error if I enable
^1da177e4c3f41 Linus Torvalds     2005-04-16  164  		 * this device, so don't even try.
^1da177e4c3f41 Linus Torvalds     2005-04-16  165  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  166  		printk(KERN_ERR MOD_NAME ": firmware access control, I can't enable writes\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  167  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  168  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  169  	pci_write_config_word(pdev, BIOS_CNTL, word | 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  170  
^1da177e4c3f41 Linus Torvalds     2005-04-16  171  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  172  	 * Try to reserve the window mem region.  If this fails then
01d0afddf37cbb Geert Uytterhoeven 2015-05-21  173  	 * it is likely due to the window being "reserved" by the BIOS.
^1da177e4c3f41 Linus Torvalds     2005-04-16  174  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  175  	window->rsrc.name = MOD_NAME;
^1da177e4c3f41 Linus Torvalds     2005-04-16  176  	window->rsrc.start = window->phys;
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  	window->rsrc.end   = window->phys + window->size - 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  178  	window->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  179  	if (request_resource(&iomem_resource, &window->rsrc)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  		window->rsrc.parent = NULL;
f9a5279c70af10 Joe Perches        2010-11-12  181  		printk(KERN_DEBUG MOD_NAME ": "
f9a5279c70af10 Joe Perches        2010-11-12  182  		       "%s(): Unable to register resource %pR - kernel bug?\n",
f9a5279c70af10 Joe Perches        2010-11-12  183  		       __func__, &window->rsrc);
^1da177e4c3f41 Linus Torvalds     2005-04-16  184  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  185  
^1da177e4c3f41 Linus Torvalds     2005-04-16  186  	/* Map the firmware hub into my address space. */
4bdc0d676a6431 Christoph Hellwig  2020-01-06  187  	window->virt = ioremap(window->phys, window->size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  188  	if (!window->virt) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  189  		printk(KERN_ERR MOD_NAME ": ioremap(%08lx, %08lx) failed\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  190  			window->phys, window->size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  191  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  192  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  193  
^1da177e4c3f41 Linus Torvalds     2005-04-16  194  	/* Get the first address to look for an rom chip at */
^1da177e4c3f41 Linus Torvalds     2005-04-16  195  	map_top = window->phys;
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  	if ((window->phys & 0x3fffff) != 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		map_top = window->phys + 0x400000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  198  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  199  #if 1
^1da177e4c3f41 Linus Torvalds     2005-04-16  200  	/* The probe sequence run over the firmware hub lock
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	 * registers sets them to 0x7 (no access).
^1da177e4c3f41 Linus Torvalds     2005-04-16  202  	 * Probe at most the last 4M of the address space.
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  204  	if (map_top < 0xffc00000) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  205  		map_top = 0xffc00000;
^1da177e4c3f41 Linus Torvalds     2005-04-16  206  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  207  #endif
^1da177e4c3f41 Linus Torvalds     2005-04-16  208  	/* Loop through and look for rom chips */
^1da177e4c3f41 Linus Torvalds     2005-04-16  209  	while((map_top - 1) < 0xffffffffUL) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  210  		struct cfi_private *cfi;
^1da177e4c3f41 Linus Torvalds     2005-04-16  211  		unsigned long offset;
^1da177e4c3f41 Linus Torvalds     2005-04-16  212  		int i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  213  
^1da177e4c3f41 Linus Torvalds     2005-04-16  214  		if (!map) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  215  			map = kmalloc(sizeof(*map), GFP_KERNEL);
4883307c6d8e59 Zhen Lei           2021-06-10  216  			if (!map)
^1da177e4c3f41 Linus Torvalds     2005-04-16  217  				goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  218  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  		memset(map, 0, sizeof(*map));
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  		INIT_LIST_HEAD(&map->list);
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  		map->map.name = map->map_name;
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  		map->map.phys = map_top;
^1da177e4c3f41 Linus Torvalds     2005-04-16  223  		offset = map_top - window->phys;
^1da177e4c3f41 Linus Torvalds     2005-04-16  224  		map->map.virt = (void __iomem *)
^1da177e4c3f41 Linus Torvalds     2005-04-16  225  			(((unsigned long)(window->virt)) + offset);
^1da177e4c3f41 Linus Torvalds     2005-04-16  226  		map->map.size = 0xffffffffUL - map_top + 1UL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  227  		/* Set the name of the map to the address I am trying */
3a38d3af92c423 Andrew Morton      2007-02-17  228  		sprintf(map->map_name, "%s @%08Lx",
3a38d3af92c423 Andrew Morton      2007-02-17  229  			MOD_NAME, (unsigned long long)map->map.phys);
^1da177e4c3f41 Linus Torvalds     2005-04-16  230  
^1da177e4c3f41 Linus Torvalds     2005-04-16  231  		/* Firmware hubs only use vpp when being programmed
^1da177e4c3f41 Linus Torvalds     2005-04-16  232  		 * in a factory setting.  So in-place programming
^1da177e4c3f41 Linus Torvalds     2005-04-16  233  		 * needs to use a different method.
^1da177e4c3f41 Linus Torvalds     2005-04-16  234  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		for(map->map.bankwidth = 32; map->map.bankwidth;
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  			map->map.bankwidth >>= 1)
^1da177e4c3f41 Linus Torvalds     2005-04-16  237  		{
^1da177e4c3f41 Linus Torvalds     2005-04-16  238  			char **probe_type;
^1da177e4c3f41 Linus Torvalds     2005-04-16  239  			/* Skip bankwidths that are not supported */
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  			if (!map_bankwidth_supported(map->map.bankwidth))
^1da177e4c3f41 Linus Torvalds     2005-04-16  241  				continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  
^1da177e4c3f41 Linus Torvalds     2005-04-16  243  			/* Setup the map methods */
^1da177e4c3f41 Linus Torvalds     2005-04-16  244  			simple_map_init(&map->map);
^1da177e4c3f41 Linus Torvalds     2005-04-16  245  
^1da177e4c3f41 Linus Torvalds     2005-04-16  246  			/* Try all of the probe methods */
^1da177e4c3f41 Linus Torvalds     2005-04-16  247  			probe_type = rom_probe_types;
^1da177e4c3f41 Linus Torvalds     2005-04-16  248  			for(; *probe_type; probe_type++) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  249  				map->mtd = do_map_probe(*probe_type, &map->map);
^1da177e4c3f41 Linus Torvalds     2005-04-16  250  				if (map->mtd)
^1da177e4c3f41 Linus Torvalds     2005-04-16  251  					goto found;
^1da177e4c3f41 Linus Torvalds     2005-04-16  252  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  253  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  254  		map_top += ROM_PROBE_STEP_SIZE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  255  		continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  256  	found:
^1da177e4c3f41 Linus Torvalds     2005-04-16  257  		/* Trim the size if we are larger than the map */
^1da177e4c3f41 Linus Torvalds     2005-04-16  258  		if (map->mtd->size > map->map.size) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  259  			printk(KERN_WARNING MOD_NAME
69423d99fc182a Adrian Hunter      2008-12-10  260  				" rom(%llu) larger than window(%lu). fixing...\n",
69423d99fc182a Adrian Hunter      2008-12-10  261  				(unsigned long long)map->mtd->size, map->map.size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  262  			map->mtd->size = map->map.size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  263  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  264  		if (window->rsrc.parent) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  265  			/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  266  			 * Registering the MTD device in iomem may not be possible
^1da177e4c3f41 Linus Torvalds     2005-04-16  267  			 * if there is a BIOS "reserved" and BUSY range.  If this
^1da177e4c3f41 Linus Torvalds     2005-04-16  268  			 * fails then continue anyway.
^1da177e4c3f41 Linus Torvalds     2005-04-16  269  			 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  270  			map->rsrc.name  = map->map_name;
^1da177e4c3f41 Linus Torvalds     2005-04-16  271  			map->rsrc.start = map->map.phys;
^1da177e4c3f41 Linus Torvalds     2005-04-16  272  			map->rsrc.end   = map->map.phys + map->mtd->size - 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  273  			map->rsrc.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  274  			if (request_resource(&window->rsrc, &map->rsrc)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  275  				printk(KERN_ERR MOD_NAME
^1da177e4c3f41 Linus Torvalds     2005-04-16  276  					": cannot reserve MTD resource\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  277  				map->rsrc.parent = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  278  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  279  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  280  
^1da177e4c3f41 Linus Torvalds     2005-04-16  281  		/* Make the whole region visible in the map */
^1da177e4c3f41 Linus Torvalds     2005-04-16  282  		map->map.virt = window->virt;
^1da177e4c3f41 Linus Torvalds     2005-04-16  283  		map->map.phys = window->phys;
^1da177e4c3f41 Linus Torvalds     2005-04-16  284  		cfi = map->map.fldrv_priv;
^1da177e4c3f41 Linus Torvalds     2005-04-16  285  		for(i = 0; i < cfi->numchips; i++) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  286  			cfi->chips[i].start += offset;
^1da177e4c3f41 Linus Torvalds     2005-04-16  287  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  288  
^1da177e4c3f41 Linus Torvalds     2005-04-16  289  		/* Now that the mtd devices is complete claim and export it */
^1da177e4c3f41 Linus Torvalds     2005-04-16  290  		map->mtd->owner = THIS_MODULE;
ee0e87b174bb41 Jamie Iles         2011-05-23  291  		if (mtd_device_register(map->mtd, NULL, 0)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  292  			map_destroy(map->mtd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  293  			map->mtd = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  294  			goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  295  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  296  
^1da177e4c3f41 Linus Torvalds     2005-04-16  297  
^1da177e4c3f41 Linus Torvalds     2005-04-16  298  		/* Calculate the new value of map_top */
^1da177e4c3f41 Linus Torvalds     2005-04-16  299  		map_top += map->mtd->size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  300  
^1da177e4c3f41 Linus Torvalds     2005-04-16  301  		/* File away the map structure */
^1da177e4c3f41 Linus Torvalds     2005-04-16  302  		list_add(&map->list, &window->maps);
^1da177e4c3f41 Linus Torvalds     2005-04-16  303  		map = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  304  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  305  
^1da177e4c3f41 Linus Torvalds     2005-04-16  306   out:
^1da177e4c3f41 Linus Torvalds     2005-04-16  307  	/* Free any left over map structures */
^1da177e4c3f41 Linus Torvalds     2005-04-16  308  	kfree(map);
fa671646f61182 Jesper Juhl        2005-11-07  309  
^1da177e4c3f41 Linus Torvalds     2005-04-16  310  	/* See if I have any map structures */
^1da177e4c3f41 Linus Torvalds     2005-04-16  311  	if (list_empty(&window->maps)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  312  		ichxrom_cleanup(window);
^1da177e4c3f41 Linus Torvalds     2005-04-16  313  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds     2005-04-16  314  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  315  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  316  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
