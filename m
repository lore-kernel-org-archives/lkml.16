Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DA1E766F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471032; cv=none; b=IimPVFFhR8sFsHnrrLATsXRgj53kRT3vLTzGQL4kntBMpSXMyp942L61i67VCCdpQr1c7KqO0etVf4JpTaCKydK+k3fOP+GjWqERQyWX1HbI4D9o2lWM+Ux+41XXDTkqsrOe8wEsrdl4FCsLWilrsU4RrgWrNTgN/ElvX+y6LJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471032; c=relaxed/simple;
	bh=TY5zNAutl0m3oIw2/b9oWsgPeIA5NU3jWJazKcUAVDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9VaCCljahMyX7zGRuQhf6MEgViPDd7JWgQV37FV9fX/sAE/gbs0UizhCvp8GoNOwqHu4zJ2zT93Kyw0SfiqirDnH0DTpjy4lLv1hhhgE8+aDOMej1sxyRxtF9pLsE4RJIKpKcLq250f7TMMABltYVm5rT+WxHdIl8gwTXGJ7SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N/IY2dc1; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N/IY2dc1"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3556118f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749471028; x=1750075828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6N5f/+GPbCJ5uQVBP6ORFTMRuOc+3h+Og7u+CemS5s=;
        b=N/IY2dc1ViTurbeAvZQpsagRlrQVibf9jc9f7AdpI7JqzQvdLN5TIGiGKpsbT5bKNm
         FRR4ozflZL9fn7GmapEbLzDCp/EyqDiLppGB9n698xyf89Z6/6NUVMaK2UsVn6GHmhCe
         8s3CBvcjXVG7MmV2M7nX0NtnFmRDaYd/SqdqBXaXJbuNfqIB/zGp2weHd1SETOLI03tb
         VlMujLhAP9898YamuNzQ9+Jy+ckjEK68NFCgVOWG/iLfMA31zEEcLusNa35aWq5VWlbH
         R3crKx/dzLm4/R3eJhjr6REQUrOeEQvF2RfBwsJ39ei2fE7y0JUgzIxbKNFISKX3F5H5
         uFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749471028; x=1750075828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6N5f/+GPbCJ5uQVBP6ORFTMRuOc+3h+Og7u+CemS5s=;
        b=j5lh0F0nlRyDnc+50B+sQkAv7HSBXsxnS6Yu5CXiMXFLLsH7w0qf3y5RlVV8ghl/WA
         1wYuyGhsaRXTNlkv2KXlAfMOMu6w/djUblj/47UPDgW0Qwnn3tNjocAdcIF42WcpiOaB
         qoJHH3q6BRBFAznbl4IpHVzI9od69srrNdty8i3tjbk3ojZASdFzf6LEDm7+jUSOzRw5
         KPQC0J60Bwc64x1I4mA6cd3LFhB/Um8WhEpfMytH2Exd9rVcMxssd2ML/HJ7DbuObXmz
         Tir2ypFbEsiCD5VOkJ8+mVNyX0wUQ7KdE4L73dB7Fqcv/uQQMy9Vj+W96mnsUlyoaYZj
         VHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwIFjI2yxi7z/mlu3nMaI9dNNK/PC1ktN+KzzE0yqTHiBhqcGq2v05xWnI+I8wpbWXapwPEh7l/Hj3CmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVU2EkHfo3gv/U2idbA/fLxp6V5HSgKmyFNRtS7ETzcI5PSdJM
	7F56msPY3Vr4B9BcGT6tXld5IPgFvQ4IJ1jOJ60iHOyvowGW4Ysafc4tqJqfVIiqzghEZFTEy2U
	69VZ9
X-Gm-Gg: ASbGncs2TMPLjtjGsrTsmDix+oeMPz6hpFjFC8H5C2KSotmTfxeooQhGjp9Vvd/Ute4
	ShAhsdSROYosOkAS36TidtrYrmWYNkQ5Rxpe6msGwBm0mB/ZPmE/w1hRFtEU/LFeygRWcAfUVgL
	F7jkuOm0IJpmeqxcw3RTup1pDTp5Bw7Eda17fYU4M5J2j7kiX1t7Nw9R+sXXummInpk+lscduq5
	hwfK2q0RoxPW87NZAAuDBFU8ObBD64ocuFU6uFDel3xBN6C0xolK9hc7AjkH/JsTAp9cuqNs0uo
	MjRkqyk2xlibKURP/XEmxAO/rGZOKo67p64Av5zQ113RHGy2yeRvU0ApnP+21Ql9
X-Google-Smtp-Source: AGHT+IEx4Ye29a424Oycvt0TTSzkDEp16kZB0ZMd8N7KGHi65ZlLyVud1xJwUXJ9t230L/eyg7P9hw==
X-Received: by 2002:adf:f147:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a531ce1495mr9228500f8f.45.1749471027883;
        Mon, 09 Jun 2025 05:10:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078941sm53232035ad.7.2025.06.09.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:10:27 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:10:17 +0200
From: Petr Mladek <pmladek@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: Raul E Rangel <rrangel@chromium.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: init/main.c:753:(.init.text+0x7a): relocation truncated to fit:
 R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section
 in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)
Message-ID: <aEbPKan7PwHZfZvk@pathway.suse.cz>
References: <202506080718.Q9VUfXsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506080718.Q9VUfXsm-lkp@intel.com>

On Sun 2025-06-08 08:01:08, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8630c59e99363c4b655788fd01134aef9bcd9264
> commit: 17b655759e83fd5e28931a0ece96fa9c2ab718e7 init: Don't proxy `console=` to earlycon
> date:   8 months ago
> config: arc-randconfig-r113-20250607 (https://download.01.org/0day-ci/archive/20250608/202506080718.Q9VUfXsm-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250608/202506080718.Q9VUfXsm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506080718.Q9VUfXsm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    init/main.o: in function `do_early_param':
> >> init/main.c:753:(.init.text+0x7a): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)

It might help to add -mmodel=medium or -mmodel=large into CFLAGS.
Something like:

diff --git a/init/Makefile b/init/Makefile
index d6f75d8907e0..83966686dcd3 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -6,6 +6,10 @@
 ccflags-y := -fno-function-sections -fno-data-sections
 
 obj-y                          := main.o version.o mounts.o
+ifeq ($(CONFIG_ARC),y)
+CFLAGS_main.o                  := -mmodel=large
+endif
+
 ifneq ($(CONFIG_BLK_DEV_INITRD),y)
 obj-y                          += noinitramfs.o
 else


Unfortunately, I can't test the compilation for ARC architecture easily...

Best Regards,
Petr


> vim +753 init/main.c
> 
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  749  
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  750  /* Check for early params. */
> ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  751  static int __init do_early_param(char *param, char *val,
> ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  752  				 const char *unused, void *arg)
> ^1da177e4c3f41 Linus Torvalds    2005-04-16 @753  {
> 914dcaa84c53f2 Rusty Russell     2010-08-11  754  	const struct obs_kernel_param *p;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  755  
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  756  	for (p = __setup_start; p < __setup_end; p++) {
> 17b655759e83fd Raul E Rangel     2024-09-11  757  		if (p->early && parameq(param, p->str)) {
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  758  			if (p->setup_func(val) != 0)
> ea676e846a8171 Andrew Morton     2013-04-29  759  				pr_warn("Malformed early option '%s'\n", param);
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  760  		}
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  761  	}
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  762  	/* We accept everything at this stage. */
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  763  	return 0;
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  764  }
> ^1da177e4c3f41 Linus Torvalds    2005-04-16  765  
> 
> :::::: The code at line 753 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
> 
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
