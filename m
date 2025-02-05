Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE122A7F8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749383; cv=none; b=GsiWVj882mV0nGKTZU+b3kOx9Pg7GRUEzZUxMRyt0UHVHtfQAsceklm5SUpnXDCgfgjdTTZdqIeLap8d8X/OqcTzAdojNb90LYCsesFuCSq2rX6BnWIvO8KFsheO6JFfbcl1tON/TwDVDgmPt6fuYX+6WfTVdv2vUcv91Ldb42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749383; c=relaxed/simple;
	bh=SsKqSH8khhI1f4StWwxKL1SCy6oP89Kr5TbmmGuKQ3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ac4bQjeFvtmvGZaGQwV1cjWc7lkqN471Btu9lkAWBcxa2wjgyshC06qL8K8CM5sPZPCPRoFdv6UsynFTa+950nb3adwiDorfl7iTs69ZnbaPkCHrhN8VqRLSDLjWVKaaBNJkNutb5fwjLQniMB7wAfBKUvELsdH97P5jrbFEg5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbmQr2op; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbmQr2op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749379; x=1770285379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsKqSH8khhI1f4StWwxKL1SCy6oP89Kr5TbmmGuKQ3M=;
  b=YbmQr2opcDlsKxwQaG0A/F+GJ2usM327a5eDUPb0I63QzcFWLc1J+0R5
   qkxXoaMKQsp+E+qhPK9MASmySilAIPquQhaM7uYv8MR5749qYMFPbdbCq
   5Xitf3ihg59orM81mhRo0Ad9ZWCAngUuFc9TLT/y593I8LLDqjZeATqGF
   NLxwHT9ENUjG/n9j8/y4xpXFcA2Cty6AS0ZOFzjxMX/HUeYTklCD9x87N
   A7bNL3D7VEdYHWZJrbETAjDvHokeHnCwtZhHQxTvCdhzNHIB1sloqqK5m
   /qatWp295WhrnvsRxr7bh3VKQ94GdWKJd5uUu3fvialCj1hQdN5pRMTtM
   Q==;
X-CSE-ConnectionGUID: e4g9DY8oTWOsChJli/ibng==
X-CSE-MsgGUID: Cazlcpb1T4i+mN2UJphSfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39208227"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39208227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:56:19 -0800
X-CSE-ConnectionGUID: qKBIqlHXQKqbdRQvlD1J6A==
X-CSE-MsgGUID: t02wzJ0iQ5WhfF0Js2hLHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110648737"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2025 01:56:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfc8k-000tie-1Y;
	Wed, 05 Feb 2025 09:56:14 +0000
Date: Wed, 5 Feb 2025 17:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@stackframe.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Helge Deller <deller@gmx.de>
Subject: kernel/kexec_elf.c:64: warning: Function parameter or struct member
 'ehdr' not described in 'elf_is_ehdr_sane'
Message-ID: <202502051744.Bjxxm10L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sven,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c8c229261f14159b54b9a32f12e5fa89d88b905
commit: e16260c21f87b16a33ae8ecac9e8c79f3a8b89bd parisc: fix compilation when KEXEC=n and KEXEC_FILE=y
date:   5 years ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250205/202502051744.Bjxxm10L-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051744.Bjxxm10L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051744.Bjxxm10L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kexec_elf.c:64: warning: Function parameter or struct member 'ehdr' not described in 'elf_is_ehdr_sane'
>> kernel/kexec_elf.c:186: warning: Function parameter or struct member 'phdr' not described in 'elf_is_phdr_sane'
>> kernel/kexec_elf.c:253: warning: Function parameter or struct member 'buf' not described in 'elf_read_phdrs'
>> kernel/kexec_elf.c:253: warning: Function parameter or struct member 'len' not described in 'elf_read_phdrs'
>> kernel/kexec_elf.c:253: warning: Function parameter or struct member 'elf_info' not described in 'elf_read_phdrs'
>> kernel/kexec_elf.c:320: warning: Function parameter or struct member 'elf_info' not described in 'kexec_free_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'buf' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'len' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'ehdr' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'elf_info' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'image' not described in 'kexec_elf_load'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'ehdr' not described in 'kexec_elf_load'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'elf_info' not described in 'kexec_elf_load'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'kbuf' not described in 'kexec_elf_load'


vim +64 kernel/kexec_elf.c

175fca3bf91a11 Sven Schnelle 2019-08-23   58  
175fca3bf91a11 Sven Schnelle 2019-08-23   59  /**
175fca3bf91a11 Sven Schnelle 2019-08-23   60   * elf_is_ehdr_sane - check that it is safe to use the ELF header
175fca3bf91a11 Sven Schnelle 2019-08-23   61   * @buf_len:	size of the buffer in which the ELF file is loaded.
175fca3bf91a11 Sven Schnelle 2019-08-23   62   */
175fca3bf91a11 Sven Schnelle 2019-08-23   63  static bool elf_is_ehdr_sane(const struct elfhdr *ehdr, size_t buf_len)
175fca3bf91a11 Sven Schnelle 2019-08-23  @64  {
175fca3bf91a11 Sven Schnelle 2019-08-23   65  	if (ehdr->e_phnum > 0 && ehdr->e_phentsize != sizeof(struct elf_phdr)) {
175fca3bf91a11 Sven Schnelle 2019-08-23   66  		pr_debug("Bad program header size.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23   67  		return false;
175fca3bf91a11 Sven Schnelle 2019-08-23   68  	} else if (ehdr->e_shnum > 0 &&
175fca3bf91a11 Sven Schnelle 2019-08-23   69  		   ehdr->e_shentsize != sizeof(struct elf_shdr)) {
175fca3bf91a11 Sven Schnelle 2019-08-23   70  		pr_debug("Bad section header size.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23   71  		return false;
175fca3bf91a11 Sven Schnelle 2019-08-23   72  	} else if (ehdr->e_ident[EI_VERSION] != EV_CURRENT ||
175fca3bf91a11 Sven Schnelle 2019-08-23   73  		   ehdr->e_version != EV_CURRENT) {
175fca3bf91a11 Sven Schnelle 2019-08-23   74  		pr_debug("Unknown ELF version.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23   75  		return false;
175fca3bf91a11 Sven Schnelle 2019-08-23   76  	}
175fca3bf91a11 Sven Schnelle 2019-08-23   77  
175fca3bf91a11 Sven Schnelle 2019-08-23   78  	if (ehdr->e_phoff > 0 && ehdr->e_phnum > 0) {
175fca3bf91a11 Sven Schnelle 2019-08-23   79  		size_t phdr_size;
175fca3bf91a11 Sven Schnelle 2019-08-23   80  
175fca3bf91a11 Sven Schnelle 2019-08-23   81  		/*
175fca3bf91a11 Sven Schnelle 2019-08-23   82  		 * e_phnum is at most 65535 so calculating the size of the
175fca3bf91a11 Sven Schnelle 2019-08-23   83  		 * program header cannot overflow.
175fca3bf91a11 Sven Schnelle 2019-08-23   84  		 */
175fca3bf91a11 Sven Schnelle 2019-08-23   85  		phdr_size = sizeof(struct elf_phdr) * ehdr->e_phnum;
175fca3bf91a11 Sven Schnelle 2019-08-23   86  
175fca3bf91a11 Sven Schnelle 2019-08-23   87  		/* Sanity check the program header table location. */
175fca3bf91a11 Sven Schnelle 2019-08-23   88  		if (ehdr->e_phoff + phdr_size < ehdr->e_phoff) {
175fca3bf91a11 Sven Schnelle 2019-08-23   89  			pr_debug("Program headers at invalid location.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23   90  			return false;
175fca3bf91a11 Sven Schnelle 2019-08-23   91  		} else if (ehdr->e_phoff + phdr_size > buf_len) {
175fca3bf91a11 Sven Schnelle 2019-08-23   92  			pr_debug("Program headers truncated.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23   93  			return false;
175fca3bf91a11 Sven Schnelle 2019-08-23   94  		}
175fca3bf91a11 Sven Schnelle 2019-08-23   95  	}
175fca3bf91a11 Sven Schnelle 2019-08-23   96  
175fca3bf91a11 Sven Schnelle 2019-08-23   97  	if (ehdr->e_shoff > 0 && ehdr->e_shnum > 0) {
175fca3bf91a11 Sven Schnelle 2019-08-23   98  		size_t shdr_size;
175fca3bf91a11 Sven Schnelle 2019-08-23   99  
175fca3bf91a11 Sven Schnelle 2019-08-23  100  		/*
175fca3bf91a11 Sven Schnelle 2019-08-23  101  		 * e_shnum is at most 65536 so calculating
175fca3bf91a11 Sven Schnelle 2019-08-23  102  		 * the size of the section header cannot overflow.
175fca3bf91a11 Sven Schnelle 2019-08-23  103  		 */
175fca3bf91a11 Sven Schnelle 2019-08-23  104  		shdr_size = sizeof(struct elf_shdr) * ehdr->e_shnum;
175fca3bf91a11 Sven Schnelle 2019-08-23  105  
175fca3bf91a11 Sven Schnelle 2019-08-23  106  		/* Sanity check the section header table location. */
175fca3bf91a11 Sven Schnelle 2019-08-23  107  		if (ehdr->e_shoff + shdr_size < ehdr->e_shoff) {
175fca3bf91a11 Sven Schnelle 2019-08-23  108  			pr_debug("Section headers at invalid location.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  109  			return false;
175fca3bf91a11 Sven Schnelle 2019-08-23  110  		} else if (ehdr->e_shoff + shdr_size > buf_len) {
175fca3bf91a11 Sven Schnelle 2019-08-23  111  			pr_debug("Section headers truncated.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  112  			return false;
175fca3bf91a11 Sven Schnelle 2019-08-23  113  		}
175fca3bf91a11 Sven Schnelle 2019-08-23  114  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  115  
175fca3bf91a11 Sven Schnelle 2019-08-23  116  	return true;
175fca3bf91a11 Sven Schnelle 2019-08-23  117  }
175fca3bf91a11 Sven Schnelle 2019-08-23  118  
175fca3bf91a11 Sven Schnelle 2019-08-23  119  static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
175fca3bf91a11 Sven Schnelle 2019-08-23  120  {
175fca3bf91a11 Sven Schnelle 2019-08-23  121  	struct elfhdr *buf_ehdr;
175fca3bf91a11 Sven Schnelle 2019-08-23  122  
175fca3bf91a11 Sven Schnelle 2019-08-23  123  	if (len < sizeof(*buf_ehdr)) {
175fca3bf91a11 Sven Schnelle 2019-08-23  124  		pr_debug("Buffer is too small to hold ELF header.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  125  		return -ENOEXEC;
175fca3bf91a11 Sven Schnelle 2019-08-23  126  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  127  
175fca3bf91a11 Sven Schnelle 2019-08-23  128  	memset(ehdr, 0, sizeof(*ehdr));
175fca3bf91a11 Sven Schnelle 2019-08-23  129  	memcpy(ehdr->e_ident, buf, sizeof(ehdr->e_ident));
175fca3bf91a11 Sven Schnelle 2019-08-23  130  	if (!elf_is_elf_file(ehdr)) {
175fca3bf91a11 Sven Schnelle 2019-08-23  131  		pr_debug("No ELF header magic.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  132  		return -ENOEXEC;
175fca3bf91a11 Sven Schnelle 2019-08-23  133  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  134  
175fca3bf91a11 Sven Schnelle 2019-08-23  135  	if (ehdr->e_ident[EI_CLASS] != ELF_CLASS) {
175fca3bf91a11 Sven Schnelle 2019-08-23  136  		pr_debug("Not a supported ELF class.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  137  		return -ENOEXEC;
175fca3bf91a11 Sven Schnelle 2019-08-23  138  	} else  if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB &&
175fca3bf91a11 Sven Schnelle 2019-08-23  139  		ehdr->e_ident[EI_DATA] != ELFDATA2MSB) {
175fca3bf91a11 Sven Schnelle 2019-08-23  140  		pr_debug("Not a supported ELF data format.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  141  		return -ENOEXEC;
175fca3bf91a11 Sven Schnelle 2019-08-23  142  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  143  
175fca3bf91a11 Sven Schnelle 2019-08-23  144  	buf_ehdr = (struct elfhdr *) buf;
175fca3bf91a11 Sven Schnelle 2019-08-23  145  	if (elf16_to_cpu(ehdr, buf_ehdr->e_ehsize) != sizeof(*buf_ehdr)) {
175fca3bf91a11 Sven Schnelle 2019-08-23  146  		pr_debug("Bad ELF header size.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  147  		return -ENOEXEC;
175fca3bf91a11 Sven Schnelle 2019-08-23  148  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  149  
175fca3bf91a11 Sven Schnelle 2019-08-23  150  	ehdr->e_type      = elf16_to_cpu(ehdr, buf_ehdr->e_type);
175fca3bf91a11 Sven Schnelle 2019-08-23  151  	ehdr->e_machine   = elf16_to_cpu(ehdr, buf_ehdr->e_machine);
175fca3bf91a11 Sven Schnelle 2019-08-23  152  	ehdr->e_version   = elf32_to_cpu(ehdr, buf_ehdr->e_version);
175fca3bf91a11 Sven Schnelle 2019-08-23  153  	ehdr->e_flags     = elf32_to_cpu(ehdr, buf_ehdr->e_flags);
175fca3bf91a11 Sven Schnelle 2019-08-23  154  	ehdr->e_phentsize = elf16_to_cpu(ehdr, buf_ehdr->e_phentsize);
175fca3bf91a11 Sven Schnelle 2019-08-23  155  	ehdr->e_phnum     = elf16_to_cpu(ehdr, buf_ehdr->e_phnum);
175fca3bf91a11 Sven Schnelle 2019-08-23  156  	ehdr->e_shentsize = elf16_to_cpu(ehdr, buf_ehdr->e_shentsize);
175fca3bf91a11 Sven Schnelle 2019-08-23  157  	ehdr->e_shnum     = elf16_to_cpu(ehdr, buf_ehdr->e_shnum);
175fca3bf91a11 Sven Schnelle 2019-08-23  158  	ehdr->e_shstrndx  = elf16_to_cpu(ehdr, buf_ehdr->e_shstrndx);
175fca3bf91a11 Sven Schnelle 2019-08-23  159  
ea46a13ebf5366 Sven Schnelle 2019-08-23  160  	switch (ehdr->e_ident[EI_CLASS]) {
ea46a13ebf5366 Sven Schnelle 2019-08-23  161  	case ELFCLASS64:
ea46a13ebf5366 Sven Schnelle 2019-08-23  162  		ehdr->e_entry = elf64_to_cpu(ehdr, buf_ehdr->e_entry);
ea46a13ebf5366 Sven Schnelle 2019-08-23  163  		ehdr->e_phoff = elf64_to_cpu(ehdr, buf_ehdr->e_phoff);
ea46a13ebf5366 Sven Schnelle 2019-08-23  164  		ehdr->e_shoff = elf64_to_cpu(ehdr, buf_ehdr->e_shoff);
ea46a13ebf5366 Sven Schnelle 2019-08-23  165  		break;
ea46a13ebf5366 Sven Schnelle 2019-08-23  166  
ea46a13ebf5366 Sven Schnelle 2019-08-23  167  	case ELFCLASS32:
ea46a13ebf5366 Sven Schnelle 2019-08-23  168  		ehdr->e_entry = elf32_to_cpu(ehdr, buf_ehdr->e_entry);
ea46a13ebf5366 Sven Schnelle 2019-08-23  169  		ehdr->e_phoff = elf32_to_cpu(ehdr, buf_ehdr->e_phoff);
ea46a13ebf5366 Sven Schnelle 2019-08-23  170  		ehdr->e_shoff = elf32_to_cpu(ehdr, buf_ehdr->e_shoff);
ea46a13ebf5366 Sven Schnelle 2019-08-23  171  		break;
ea46a13ebf5366 Sven Schnelle 2019-08-23  172  
ea46a13ebf5366 Sven Schnelle 2019-08-23  173  	default:
ea46a13ebf5366 Sven Schnelle 2019-08-23  174  		pr_debug("Unknown ELF class.\n");
ea46a13ebf5366 Sven Schnelle 2019-08-23  175  		return -EINVAL;
ea46a13ebf5366 Sven Schnelle 2019-08-23  176  	}
ea46a13ebf5366 Sven Schnelle 2019-08-23  177  
175fca3bf91a11 Sven Schnelle 2019-08-23  178  	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
175fca3bf91a11 Sven Schnelle 2019-08-23  179  }
175fca3bf91a11 Sven Schnelle 2019-08-23  180  
175fca3bf91a11 Sven Schnelle 2019-08-23  181  /**
175fca3bf91a11 Sven Schnelle 2019-08-23  182   * elf_is_phdr_sane - check that it is safe to use the program header
175fca3bf91a11 Sven Schnelle 2019-08-23  183   * @buf_len:	size of the buffer in which the ELF file is loaded.
175fca3bf91a11 Sven Schnelle 2019-08-23  184   */
175fca3bf91a11 Sven Schnelle 2019-08-23  185  static bool elf_is_phdr_sane(const struct elf_phdr *phdr, size_t buf_len)
175fca3bf91a11 Sven Schnelle 2019-08-23 @186  {
175fca3bf91a11 Sven Schnelle 2019-08-23  187  
175fca3bf91a11 Sven Schnelle 2019-08-23  188  	if (phdr->p_offset + phdr->p_filesz < phdr->p_offset) {
175fca3bf91a11 Sven Schnelle 2019-08-23  189  		pr_debug("ELF segment location wraps around.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  190  		return false;
175fca3bf91a11 Sven Schnelle 2019-08-23  191  	} else if (phdr->p_offset + phdr->p_filesz > buf_len) {
175fca3bf91a11 Sven Schnelle 2019-08-23  192  		pr_debug("ELF segment not in file.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  193  		return false;
175fca3bf91a11 Sven Schnelle 2019-08-23  194  	} else if (phdr->p_paddr + phdr->p_memsz < phdr->p_paddr) {
175fca3bf91a11 Sven Schnelle 2019-08-23  195  		pr_debug("ELF segment address wraps around.\n");
175fca3bf91a11 Sven Schnelle 2019-08-23  196  		return false;
175fca3bf91a11 Sven Schnelle 2019-08-23  197  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  198  
175fca3bf91a11 Sven Schnelle 2019-08-23  199  	return true;
175fca3bf91a11 Sven Schnelle 2019-08-23  200  }
175fca3bf91a11 Sven Schnelle 2019-08-23  201  
175fca3bf91a11 Sven Schnelle 2019-08-23  202  static int elf_read_phdr(const char *buf, size_t len,
175fca3bf91a11 Sven Schnelle 2019-08-23  203  			 struct kexec_elf_info *elf_info,
175fca3bf91a11 Sven Schnelle 2019-08-23  204  			 int idx)
175fca3bf91a11 Sven Schnelle 2019-08-23  205  {
175fca3bf91a11 Sven Schnelle 2019-08-23  206  	/* Override the const in proghdrs, we are the ones doing the loading. */
175fca3bf91a11 Sven Schnelle 2019-08-23  207  	struct elf_phdr *phdr = (struct elf_phdr *) &elf_info->proghdrs[idx];
ea46a13ebf5366 Sven Schnelle 2019-08-23  208  	const struct elfhdr *ehdr = elf_info->ehdr;
175fca3bf91a11 Sven Schnelle 2019-08-23  209  	const char *pbuf;
175fca3bf91a11 Sven Schnelle 2019-08-23  210  	struct elf_phdr *buf_phdr;
175fca3bf91a11 Sven Schnelle 2019-08-23  211  
175fca3bf91a11 Sven Schnelle 2019-08-23  212  	pbuf = buf + elf_info->ehdr->e_phoff + (idx * sizeof(*buf_phdr));
175fca3bf91a11 Sven Schnelle 2019-08-23  213  	buf_phdr = (struct elf_phdr *) pbuf;
175fca3bf91a11 Sven Schnelle 2019-08-23  214  
175fca3bf91a11 Sven Schnelle 2019-08-23  215  	phdr->p_type   = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_type);
175fca3bf91a11 Sven Schnelle 2019-08-23  216  	phdr->p_flags  = elf32_to_cpu(elf_info->ehdr, buf_phdr->p_flags);
175fca3bf91a11 Sven Schnelle 2019-08-23  217  
ea46a13ebf5366 Sven Schnelle 2019-08-23  218  	switch (ehdr->e_ident[EI_CLASS]) {
ea46a13ebf5366 Sven Schnelle 2019-08-23  219  	case ELFCLASS64:
ea46a13ebf5366 Sven Schnelle 2019-08-23  220  		phdr->p_offset = elf64_to_cpu(ehdr, buf_phdr->p_offset);
ea46a13ebf5366 Sven Schnelle 2019-08-23  221  		phdr->p_paddr  = elf64_to_cpu(ehdr, buf_phdr->p_paddr);
ea46a13ebf5366 Sven Schnelle 2019-08-23  222  		phdr->p_vaddr  = elf64_to_cpu(ehdr, buf_phdr->p_vaddr);
ea46a13ebf5366 Sven Schnelle 2019-08-23  223  		phdr->p_filesz = elf64_to_cpu(ehdr, buf_phdr->p_filesz);
ea46a13ebf5366 Sven Schnelle 2019-08-23  224  		phdr->p_memsz  = elf64_to_cpu(ehdr, buf_phdr->p_memsz);
ea46a13ebf5366 Sven Schnelle 2019-08-23  225  		phdr->p_align  = elf64_to_cpu(ehdr, buf_phdr->p_align);
ea46a13ebf5366 Sven Schnelle 2019-08-23  226  		break;
ea46a13ebf5366 Sven Schnelle 2019-08-23  227  
ea46a13ebf5366 Sven Schnelle 2019-08-23  228  	case ELFCLASS32:
ea46a13ebf5366 Sven Schnelle 2019-08-23  229  		phdr->p_offset = elf32_to_cpu(ehdr, buf_phdr->p_offset);
ea46a13ebf5366 Sven Schnelle 2019-08-23  230  		phdr->p_paddr  = elf32_to_cpu(ehdr, buf_phdr->p_paddr);
ea46a13ebf5366 Sven Schnelle 2019-08-23  231  		phdr->p_vaddr  = elf32_to_cpu(ehdr, buf_phdr->p_vaddr);
ea46a13ebf5366 Sven Schnelle 2019-08-23  232  		phdr->p_filesz = elf32_to_cpu(ehdr, buf_phdr->p_filesz);
ea46a13ebf5366 Sven Schnelle 2019-08-23  233  		phdr->p_memsz  = elf32_to_cpu(ehdr, buf_phdr->p_memsz);
ea46a13ebf5366 Sven Schnelle 2019-08-23  234  		phdr->p_align  = elf32_to_cpu(ehdr, buf_phdr->p_align);
ea46a13ebf5366 Sven Schnelle 2019-08-23  235  		break;
ea46a13ebf5366 Sven Schnelle 2019-08-23  236  
ea46a13ebf5366 Sven Schnelle 2019-08-23  237  	default:
ea46a13ebf5366 Sven Schnelle 2019-08-23  238  		pr_debug("Unknown ELF class.\n");
ea46a13ebf5366 Sven Schnelle 2019-08-23  239  		return -EINVAL;
ea46a13ebf5366 Sven Schnelle 2019-08-23  240  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  241  
175fca3bf91a11 Sven Schnelle 2019-08-23  242  	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
175fca3bf91a11 Sven Schnelle 2019-08-23  243  }
175fca3bf91a11 Sven Schnelle 2019-08-23  244  
175fca3bf91a11 Sven Schnelle 2019-08-23  245  /**
175fca3bf91a11 Sven Schnelle 2019-08-23  246   * elf_read_phdrs - read the program headers from the buffer
175fca3bf91a11 Sven Schnelle 2019-08-23  247   *
175fca3bf91a11 Sven Schnelle 2019-08-23  248   * This function assumes that the program header table was checked for sanity.
175fca3bf91a11 Sven Schnelle 2019-08-23  249   * Use elf_is_ehdr_sane() if it wasn't.
175fca3bf91a11 Sven Schnelle 2019-08-23  250   */
175fca3bf91a11 Sven Schnelle 2019-08-23  251  static int elf_read_phdrs(const char *buf, size_t len,
175fca3bf91a11 Sven Schnelle 2019-08-23  252  			  struct kexec_elf_info *elf_info)
175fca3bf91a11 Sven Schnelle 2019-08-23 @253  {
175fca3bf91a11 Sven Schnelle 2019-08-23  254  	size_t phdr_size, i;
175fca3bf91a11 Sven Schnelle 2019-08-23  255  	const struct elfhdr *ehdr = elf_info->ehdr;
175fca3bf91a11 Sven Schnelle 2019-08-23  256  
175fca3bf91a11 Sven Schnelle 2019-08-23  257  	/*
175fca3bf91a11 Sven Schnelle 2019-08-23  258  	 * e_phnum is at most 65535 so calculating the size of the
175fca3bf91a11 Sven Schnelle 2019-08-23  259  	 * program header cannot overflow.
175fca3bf91a11 Sven Schnelle 2019-08-23  260  	 */
175fca3bf91a11 Sven Schnelle 2019-08-23  261  	phdr_size = sizeof(struct elf_phdr) * ehdr->e_phnum;
175fca3bf91a11 Sven Schnelle 2019-08-23  262  
175fca3bf91a11 Sven Schnelle 2019-08-23  263  	elf_info->proghdrs = kzalloc(phdr_size, GFP_KERNEL);
175fca3bf91a11 Sven Schnelle 2019-08-23  264  	if (!elf_info->proghdrs)
175fca3bf91a11 Sven Schnelle 2019-08-23  265  		return -ENOMEM;
175fca3bf91a11 Sven Schnelle 2019-08-23  266  
175fca3bf91a11 Sven Schnelle 2019-08-23  267  	for (i = 0; i < ehdr->e_phnum; i++) {
175fca3bf91a11 Sven Schnelle 2019-08-23  268  		int ret;
175fca3bf91a11 Sven Schnelle 2019-08-23  269  
175fca3bf91a11 Sven Schnelle 2019-08-23  270  		ret = elf_read_phdr(buf, len, elf_info, i);
175fca3bf91a11 Sven Schnelle 2019-08-23  271  		if (ret) {
175fca3bf91a11 Sven Schnelle 2019-08-23  272  			kfree(elf_info->proghdrs);
175fca3bf91a11 Sven Schnelle 2019-08-23  273  			elf_info->proghdrs = NULL;
175fca3bf91a11 Sven Schnelle 2019-08-23  274  			return ret;
175fca3bf91a11 Sven Schnelle 2019-08-23  275  		}
175fca3bf91a11 Sven Schnelle 2019-08-23  276  	}
175fca3bf91a11 Sven Schnelle 2019-08-23  277  
175fca3bf91a11 Sven Schnelle 2019-08-23  278  	return 0;
175fca3bf91a11 Sven Schnelle 2019-08-23  279  }
175fca3bf91a11 Sven Schnelle 2019-08-23  280  

:::::: The code at line 64 was first introduced by commit
:::::: 175fca3bf91a1111b7e46f6655666640556b9059 kexec: add KEXEC_ELF

:::::: TO: Sven Schnelle <svens@stackframe.org>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
