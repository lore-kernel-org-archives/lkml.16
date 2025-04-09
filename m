Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F81E0B91;
	Wed,  9 Apr 2025 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179147; cv=none; b=SK0Cho519a37PdYG4MgP+74wfEOZkukqg3fAhvBa5Fgtnq8Y+lfQo/aPXAMeYguEWfDXuoCAUzQoAI9o+GYKUTzu9dYW99HpSIlnXEiMjXukuhRC08jhe9ebxwnGoPCN2AWiSzzojZnEAczrXxMTxBd8qQJCC28U08lCbvavuMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179147; c=relaxed/simple;
	bh=MPL5LjbDLvl682U7sjz19vJhlVLzeTlLRdMI0CYUnJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eds8+v/mXux374ujabnhvNnFHDGlKvCrkVP5HoAi1tDqhRj0PMM8U9Rc0y4L/r4e+q7S8CTzuhj3/oWk84Ov0eyYpcX9Z/SuZFC5jgI6RA2DkAIjJiZyKnnzZclO8b1XdlAglJp4KqZVJAcNP15xM5aKX1XchLjh7wYnuwZwA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd0FXfVO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd0FXfVO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3031354f134so4875762a91.3;
        Tue, 08 Apr 2025 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744179145; x=1744783945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M5d1vrdeOAvtBGH1S7JlUf/9cb5pC5XVB1481DKZGqQ=;
        b=Zd0FXfVON2bQdbWrc8IeHINZ3/5gmLVEBc3MdYqjoh/XJkDPUnD419vSYCSAxpOaQx
         S4djlCzwOF/5CwR/R1DsIiVwIqrU9JaGhMlYY7SlX6mqgcUxhvx0mfwZs9nwFbOnpKsM
         5bnGLSnVOhkxNwwUXeBmVnVQt84ANlxzjAkGmXtuxexvgYsDHuyo57cXTXmMc0m0JLIJ
         j9R3b7FIh0NnsnFWv1Ck2BA9Jj971S6cBB4HdN4yZUinv3/EbUT18jB6NNGno4hqfQh1
         erqvLs/Q8XLSre2pT57IaZxOq1Ut43UCr2jWjhAYldzXDjVYfO/Y71ch/Io3AWfpC+CI
         +YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179145; x=1744783945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5d1vrdeOAvtBGH1S7JlUf/9cb5pC5XVB1481DKZGqQ=;
        b=YLrzp+WSJ/lFeFSJg9UnmhY+YDToX1wB6ejnk/saz5ygO2lH+K7pY5dFrFdp307edh
         dxtIvhKuwkGDmHY8nS0blCyYwY4aGEzztJb770yArl41QdN6iy4O/9pZ+u1M8wHijz0g
         8623qyzF26QeGTvIWJKdh0DpmOsc+TcMeKyjvtDIrhruIZ2FSXB2pnbHx2e7mjlpR4GJ
         DKlm5CvSDZIZiy7oLHBSMhaBuYGcFCJXJGlBaM0vrZjTZcRKEd1Mud2ULLvZFU/m8R3y
         bheEbaiy+6PY2iBuPD0wZgiEQrMxiTIv+rAp9G7IVm3B3Z4/9KvlQkZNB07pP90ew9Xb
         gsjA==
X-Forwarded-Encrypted: i=1; AJvYcCV0gu61B5KIOHikJcDJ5A5HLtjyDzzyfbQTmtp+YEe/qo/DI4Raa5FRK3vdaErQiL5Jw2Ykevz49TpbqrVXRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdhe2IntMIQ8mQtF0YpPg8TINiGN4DRPh6Llks324sFWP75EZI
	0glPlREwhyPYfUKoaqYM1Uabfc/KP8kSizpPyE5ye4tp6nwwUKzpDgquHDDH
X-Gm-Gg: ASbGncvjjj1usGkT6orJFw4+BJELw4zdDE51KDFN2DVJawtITA+6dQw/YVfz0AVK7p7
	jEacEP5st+HNMqvbtEDY7KW9iDGmedkLz3j9dQlls7CpwQq4UxLNnpClE5JmyKUM1gTXer0LR6Y
	gszme4vzvcwayoNH+hjF7L+GE39top7MWD8A1hdZOS/KtKbYb7aRqRrQ4iP7X9mcb+N27k9Nwci
	45X4fTOmrwQqIUGk/Ux10Rax4QRs4yQ1wpViHXSRHGapXcvDOPSiF2A/4/qvojMfYKlOoUmJuSr
	hjMnc25KMx7kXnqTPmCBTBvNDVzQRvdZqkTV3bbaeM788Dvs+Upx90ZhneBFidQbmnjbLEa7WtI
	qFZ9KDHZRBDRciqYupQ==
X-Google-Smtp-Source: AGHT+IFGiqW2qskrqgDwvIQltpBvtl1olae4VZELvymcrigFhnNPIoe4mErrMW378w8tWc44LV65pQ==
X-Received: by 2002:a17:90b:2811:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-306dba7dfe3mr3160703a91.0.1744179144759;
        Tue, 08 Apr 2025 23:12:24 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a767sm594492a91.6.2025.04.08.23.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:12:24 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	linux-um@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] um: fix incompatible argument type in iounmap()
Date: Wed,  9 Apr 2025 15:11:29 +0900
Message-ID: <20250409061129.136788-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align iounmap() signature with other architectures.

This fixes the following build error on CONFIG_RUST enabled:

In file included from /home/fujita/git/linux-rust/rust/helpers/helpers.c:19:
/home/fujita/git/linux-rust/rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
   12 |         iounmap(addr);
      |                 ^~~~
/home/fujita/git/linux-rust/arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   19 | static inline void iounmap(void __iomem *addr)
      |                                          ^
1 error generated.

Fixes: ce30d94e6855 ("rust: add `io::{Io, IoRaw}` base types")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/um/include/asm/io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/include/asm/io.h b/arch/um/include/asm/io.h
index 9ea42cc746d9..ce0e8cf4834d 100644
--- a/arch/um/include/asm/io.h
+++ b/arch/um/include/asm/io.h
@@ -16,7 +16,7 @@ static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
 
 #ifndef iounmap
 #define iounmap iounmap
-static inline void iounmap(void __iomem *addr)
+static inline void iounmap(volatile void __iomem *addr)
 {
 }
 #endif /* iounmap */

base-commit: c59026c0570a2a97ce2e7d5ae5e9c48fc841542b
-- 
2.43.0

