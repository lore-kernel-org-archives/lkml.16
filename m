Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72C4C83
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743123725; cv=none; b=UWuECMJLElC5PE5PpBr46bZw2ck8GQYAC8RHtGMCLva1AywymTwG8pu300BK86QmO6C1YKgg0byn6hJseE12C6qQZKAzJAnVjubFYmzO1VGLCBVoEanJjisIAZM2J+wE3O5rP73DHTUYNY0yF/2kRKwp3bRa3xSymY+4cdgPSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743123725; c=relaxed/simple;
	bh=4ijHWtF/hQX4sDh+/dNDifJ7F5Gsup7zO72/M9k4cAo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Ts8LudCAo7SiK/G1VvtybDgGiSFPJAVrP9TAbbELqZdm9ygHbyknYxsFYg0lrXBlakibqZNPtaIpabn/VioJvHaa+jSohCaHztsrqOTX4GegLxt341dRCmZOhUjVg8Md1dLPVcmfmp/0wgHOBuoX8viExwJewAz4H0WFEy7IxzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PM/hUbRe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PM/hUbRe"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7430e27b2so309568966b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743123722; x=1743728522; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCvmfFnfEf5oydk6tsBORoFu01om0VgdooobXp+ffDg=;
        b=PM/hUbReWS1FBM5CbUzD3NeXJBOZCVFR3luYehDJqyQ0rBcpAh8TpLn7XrLBv0ndL+
         8mpkr6MR3AORSouQCJWcNeCXZZ69F0SBpk/DpBouuJZVhVFrQocmxJkiPFwc27aU5a4g
         357IbqBeKCDUQ5spMOp4rSd4rByD+2SSVAi3yC0ZtSVuEDeW4OmBZ6NhRScGGAzrTrhK
         baRHymwi2zT6ghAceHLruuKclimAdDaQY7oETPXFLg9IcZEdiRGAqqjFoGgx1b9ISWw5
         W/HgFaKs4l9hLP1en1foKjXNGQj3so27r60VArVbjmP5PmQuQeAAcvHBbDe3pbg5jf0p
         H57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743123722; x=1743728522;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCvmfFnfEf5oydk6tsBORoFu01om0VgdooobXp+ffDg=;
        b=msfam1ERwDn2Z89VQttlkRkpUaXZs1bV0UA/o7xr1Su8zgJw3TN/pUNod144Gxz2rm
         7wZsxAYU0BFiVEClp6BtJBtSvNE2wwB9+NqHPUQAa+WtAM0QBDinrtVLC1O+B2znv7ss
         n7SGEtbeWLztaQItd/EHL7JZHv70M+S3o290luhv9G0MASKv3+nANfBCarPMd0TQ+sAH
         //f2hI0Sdq1aakt2yVRyoyUKV2BdSRQucDhxzvxZkQQfKJxQKra7jLFHjx9y2pH22bGN
         qRdhLIdqq03TOI64HCq2B7fVyfJGXou+tB596Lgs0I8LrP4YlCKCw/16w1ix4lrFl38W
         uCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrGisVsVXIRVmKI5DX6y8OK0gkyrox9G5uWvQJnpBgUtK6ovo0aGI/Q11v36YcfaqdStPp9bKBMrfr8Is=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFAFr2ucryp2Vovp6b9la8hk2qOWnWXB02BbufHpFqu17qXpM
	0fyOos5WdZ64+Ys3u81l6ZFtaS/o81J7k0J231ffKlsJIiZqnYp4
X-Gm-Gg: ASbGncvmrlW3GckUavcCG1CCVh9VHxwURG6jTR12m3ml+AOlyy380jEkMKBWjnSQTLk
	Qn5CengvsHsHXNWVgnUSM8audhBfhIpVPkNr99B9pN0LIAusrFFjZidcqtVFbDhrt1urQ8a35Nz
	+bTwGJEabT3rXEOARokSwBZ6KXiXp2LazyFeAsxCyIqdzx8NsujB7MWP2CHUP1Imp1JO7YAtyZE
	oewZCRdFSnPymTpc8unpFTxASwhkiju+bHDKDAev/ONoKTfmzdVZkyOls+YZNJy+gXglhaEdtBF
	GINgbTPO53OzfIBsF2fFvU+jBFcoA2lNnUbc4tlDjcRj
X-Google-Smtp-Source: AGHT+IFWjbpikg+3hE3SwOFTEC3CKQkxvg5PpQ3SiGlYA8+DmLsKNQUDtga+yVxm0Xcp/vZHY82YfQ==
X-Received: by 2002:a17:907:6d28:b0:ac4:16a:1863 with SMTP id a640c23a62f3a-ac6faef40e9mr544586966b.26.1743123722150;
        Thu, 27 Mar 2025 18:02:02 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71922ba63sm76680266b.2.2025.03.27.18.02.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 18:02:01 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: akpm@linux-foundation.org,
	monstr@monstr.eu
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] microblaze/mm: put mm_cmdline_setup() in .init.text section
Date: Fri, 28 Mar 2025 01:01:36 +0000
Message-Id: <20250328010136.13139-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

As reported by lkp, there is a section mismatch of mm_cmdline_setup() and
memblock. The reason is we don't specify the section of mm_cmdline_setup()
and gcc put it into .text.unlikely.

As mm_cmdline_setup() is only used in mmu_init(), which is in .init.text
section, put mm_cmdline_setup() into it too.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503241259.kJV3U7Xj-lkp@intel.com/
---
 arch/microblaze/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index 4520c5741579..e98cfaf1c62b 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -143,7 +143,7 @@ int page_is_ram(unsigned long pfn)
 /*
  * Check for command-line options that affect what MMU_init will do.
  */
-static void mm_cmdline_setup(void)
+static void __init mm_cmdline_setup(void)
 {
 	unsigned long maxmem = 0;
 	char *p = cmd_line;
-- 
2.34.1

