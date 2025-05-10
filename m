Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF44BA27
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863032; cv=none; b=BiSS1fWxRpR7f/87yfC7+rCiBnE3aVz7EWkFUXnUPWf61uEewSM5Zln5fpk2zN/yub9Iuwn0g+Rd7fjobyVH28UIloggK7bR3Fa6zGjI+/Blh1K2KZGt3kWnSAogB5WgWTJQP8X315mNS9GE12EqRk5X4nu5jLVkBw6OIo8mrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863032; c=relaxed/simple;
	bh=gVwu5i5dr8Gu8f8RQwH56pS50hW/bWmE75LzhrJPSX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCutYISS4GUBRaDq9myUvHtaOjr7RW9ECzYkk49X2TQFsaQFq9ewip5kZYk7eHpDK4MepnlaA2+XtcsEWu+Z8AQ1rsPT3YHSV6mWH3C8bA+f5sw6PKMtvNS86bt0/VxXemFcllad3flSk+rse/qIXg988CmXIfmyb86+UU4+Kbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5V0gDzh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5V0gDzh"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so1147172f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 00:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746863028; x=1747467828; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgxyHav/FDfAPqF2ubFj/kOjw60kxGTa94/J4F6aQhQ=;
        b=t5V0gDzh5p3+g5fx1X1GjTVNyZkl/iHGHqpQdUyKnO+pBIiFbdUukhe6GSzN6MZg73
         ClrV+GyKP8F/m/Uiz58SQHSWU9/8LHxZht4S6hv9IaV4B9I4k93Wu78cMTZR6p7YjGFR
         EhNdH0e9XXcIMet0WclJXfnxSHV2ONgkGgih/D1XhJ4bhlh0GEXhooYKuakidB+Ic8kD
         neESNben084jgBRkYIsub0L2jDRtobyDT7dKYwxYHGpMl4HH/LwxVY/mIOa9M2KK/2PF
         +qQQxBldXRVoQmuR4fEiMhGMUVCqZh5kZS+kqIVVwwERIHqt6uJfM2giMklxz/3NVun+
         zzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746863028; x=1747467828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgxyHav/FDfAPqF2ubFj/kOjw60kxGTa94/J4F6aQhQ=;
        b=U2k+ksmtofX/DtwYNQ98HdaMaH3qCKpxVsKk9XC6iAfW8OukNbXW57GkWdNTtWh+3S
         Rs4r4i4MzAfC/0ZIaSwAV13jdcydUO/T3riiBiwjN3IjR/twIK/cMoUNE1HhNrTddDu8
         5SQrWPLE3x+25b0EHb4dnqiONqnQF6OqAT0yVzGKaIjXylmWWtb41IBLsvUY2Ic3s50B
         kyTkubgGQ/mR4ZibXRklAQO13FHEaMIxYLTBdh8iy3oeHzJQSEI/AP6FwpxNYUroXf7i
         96WmqDqgdjIHy4iYdpN4ugyAJUYJX4UVu3sbMQNPikbvkUrdHUHGcJym0Kt77CbmhYMI
         BbFw==
X-Forwarded-Encrypted: i=1; AJvYcCXt63rluqgf4PiFFfBa8GTSFNvxGjtj0pJOpO6gAPcAAoiaQF7yIAXEU6RGXX2gWU0sjzQPcfMznI0XpF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcowRWDgnceuyG0Nr5H9BDuxibOXaKlvrroh8m2gdLugIfvQhs
	su47V25aqIfOg1ogqjmr8s7czjxDck7Fj1muoorEhEYIeYcGj7EPZbgo7+VEQ28=
X-Gm-Gg: ASbGncvDtl8tLOUdRaOYffMV1e9r03v+bimEtAoEbMEt/PfCPp7c0WJnxqQNRp8JUJb
	vaTemL68Dt5DEy6OkSjB2DEeZXQtSVO8fQXlSZJHdmWCUGV7qUC8rCfrAm7hgPnZ99rySjgEHMw
	Yq3aYGWmKERiqmziT2xdWr8frqK2h/JPLnWqJ+UvvtjTdxch2zDgMElo+vrc9G9GHPixnx/Rrd6
	nfbmPFLcNfhtu+9RHoHP8J/D1FKmt4GG1APa77bw0rG3adj/GxeDyumbwD21YUVHqBjEwGH5l+J
	2PtHkhFmKnc0P9QZzGViPkvFV3cnJuLcmECyRobgChaRz/y+wV4/kYWg
X-Google-Smtp-Source: AGHT+IEYxL7W6rw3MZmtN8Hifi8g47H7dZD22sCgXBrSPKpmdOCfDEnqQwAFYZ9z9qgI8K5Jh9yNrQ==
X-Received: by 2002:a05:6000:186e:b0:39d:724f:a8f1 with SMTP id ffacd0b85a97d-3a1f64279e0mr5124295f8f.10.1746863028389;
        Sat, 10 May 2025 00:43:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f57ddd2dsm5596666f8f.9.2025.05.10.00.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 00:43:48 -0700 (PDT)
Date: Sat, 10 May 2025 10:43:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/boot 10/10] arch/x86/boot/compressed/sev-handle-vc.c:104
 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null
 (see line 101)
Message-ID: <202505100719.9pE7wDfB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ard,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/

smatch warnings:
arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)

vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c

ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
ed4d95d033e359 Ard Biesheuvel 2025-05-04   98  	struct es_em_ctxt ctxt;
ed4d95d033e359 Ard Biesheuvel 2025-05-04   99  	enum es_result result;
ed4d95d033e359 Ard Biesheuvel 2025-05-04  100  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101  	if (!boot_ghcb && !early_setup_ghcb())
                                                    ^^^^^^^^^^
Check for NULL.  Should the && be ||?

ed4d95d033e359 Ard Biesheuvel 2025-05-04  102  		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
ed4d95d033e359 Ard Biesheuvel 2025-05-04  103  
ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104  	vc_ghcb_invalidate(boot_ghcb);
                                                                   ^^^^^^^^^
Unchecked dereference.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

