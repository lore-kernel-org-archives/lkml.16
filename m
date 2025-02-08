Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EF3194C8B;
	Sat,  8 Feb 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036592; cv=none; b=OHExu0Bju7KFSzhHvRMHQ2EBR0xCE7ns7NekQInncJ3fChYNK2pj2ROJOI0whOuzbke9oCG29ywcPRMrxI9AlE4awSEG6s63nmcQcV27AIVY8iWd+YjA63o4NuUlJ7uxkYI+ubI9FM2U0pdfwgB322dw3JraYNsj9GJzVRbUkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036592; c=relaxed/simple;
	bh=3XNi8c+5O9/wGq9UMbfnhq0lX0Hgcw5QqTGoWqMEM5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jv64dVZgHDYb0zLc9f4wr/pHch1dUJUY6ppzoKuFJkqAMVlO/o3fzbD9LAhs3GmLYYIUwiLqzCK5DRCapcRMDN/S8u7hdq4lQdGmTaCyLD438p8k+bebwH1jePKgAkcU1FW9WGfritifE8SwLdMw22dkDn0PEo+iLST35lZs8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THXe+ej1; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THXe+ej1"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fa1fb3c445so3280696a91.2;
        Sat, 08 Feb 2025 09:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739036590; x=1739641390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDr9K6NjgkJte6FIg1/4kGyjFZF0Bg871DBJOAHBsU4=;
        b=THXe+ej1ee1ujD9SaWkU6uDqqUZeOEvQRr1nZyg4sMFoHNjbXX7I4NiELjctOG/tYO
         ogUnPbOT+NlnH5fFjGO6Fv3/yOG/eFOBBBCcZWPgq4mgf9WDPxtXZDG9nC8BIZKGXlaj
         3pFnaom2CTuGIQKzoXw/Xnw//nO3zChIE4skDWVrW6WnLyrGI9fHra+xVoLUmh+/LSJq
         tKTL8anCjDUuITPZIjW8Q4jna9pTqrRJy8RYehrTvnEwoMavedaVUn0AXBQbQEi9Ijbm
         wi4QJeibzRvaFyREnTx3DbdojjSHBkUPqfol8NFSSqvk8Q45dSehRHglJYqq9UpYzUnU
         X7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739036590; x=1739641390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aDr9K6NjgkJte6FIg1/4kGyjFZF0Bg871DBJOAHBsU4=;
        b=lVv8KEc4If+o0o646y/DKODH4dmuVOLmj8eERyTKnCtb+Sq4PQsN7yooTWZFEPRnTQ
         +v4K3HBSSSvZclyDIHbhCaX3/l2CzHpeHn5BmRjt3oLy5pUoPRN/ZRp/rzD1kYAcUEBj
         gI/EuKtgNHNFhO2sfZsZEZF2OjM0yf7V7tSTdEAWJ5S7K1h5NEK8VamrX/ZzMvO271Q6
         l9KlSbsIpdJofobq/Vre4qFytUAcEncxYwWN6rJYQFk4VSiE6Uk3SfLvZbPnBVE9uP1z
         5wl0aYmKDcV68TrO/jisXsnWglINQ9Ig1EvNN12ipRVVa6Ta4poJJH4eADljkEwl8lY0
         9Dng==
X-Forwarded-Encrypted: i=1; AJvYcCWV5519wPxHf221oHGhxCpVr0qA15E23y+SvML8tbIYp1xsDHBbfIuUndtCd4324JK1LXBUeLGcWbwDI6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqFSGsmBfU5FvkJO6zcmzTJiugO3WAkgVRoC5yL+4xkDSSADxu
	TTZ6ahonQGy2lqVSWzuzKOqOJq7keWXPBLKUPPr92tdqdk5O3myIaZyscg==
X-Gm-Gg: ASbGncttpvCQrGpjrwAmO2c4BedmNkkGjkhIFYWKY43KWElNo/Fr3nxDYbGmqGu8SVF
	yHNFyzIbsMC39XeAbFFCXroUSzzZe8S/l7Rl4Y5syc428EZmYygOJhyOWCJHctdwSI4H0/W7HL3
	PKWqc6ZedLTVZyxQM1qUb4jPIuTikOt8k7OwjcUwuu2rmoGsvPxLnVDf4mUgpSUsdkEu5mW0795
	ZxHjJ6ooTEPMBU49i12KYh09L7CGyNYepiyy88PNSxAILa/YD/t1kS5TySgSpb5OiFevnBLbD9X
	EvG6O6ay2uwbYkgizuQ5
X-Google-Smtp-Source: AGHT+IFbiqZCA2w0VgGgTVt43/4MqMDNaFUoW/AlB+ZeZemgg3d7sKJa7g1C47N4UFcCY3OKXf7KQg==
X-Received: by 2002:a05:6a00:2289:b0:727:3fd5:b530 with SMTP id d2e1a72fcca58-7305d4f01f2mr12619055b3a.15.1739036590345;
        Sat, 08 Feb 2025 09:43:10 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730796ba9d7sm1140820b3a.86.2025.02.08.09.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:43:09 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: James.Bottomley@HansenPartnership.com,
	deller@gmx.de
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] parisc: PDT: Fix missing prototype warning
Date: Sun,  9 Feb 2025 01:43:04 +0800
Message-ID: <20250208174304.2627078-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by the kernel test robot, the following error occurs:

arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      65 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~

arch_report_meminfo() is declared in include/linux/proc_fs.h and only
defined when CONFIG_PROC_FS is enabled. Wrap its definition in #ifdef
CONFIG_PROC_FS to fix the -Wmissing-prototypes warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502082315.IPaHaTyM-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 arch/parisc/kernel/pdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/kernel/pdt.c b/arch/parisc/kernel/pdt.c
index 0f9b3b5914cf..b70b67adb855 100644
--- a/arch/parisc/kernel/pdt.c
+++ b/arch/parisc/kernel/pdt.c
@@ -63,6 +63,7 @@ static unsigned long pdt_entry[MAX_PDT_ENTRIES] __page_aligned_bss;
 #define PDT_ADDR_PERM_ERR	(pdt_type != PDT_PDC ? 2UL : 0UL)
 #define PDT_ADDR_SINGLE_ERR	1UL
 
+#ifdef CONFIG_PROC_FS
 /* report PDT entries via /proc/meminfo */
 void arch_report_meminfo(struct seq_file *m)
 {
@@ -74,6 +75,7 @@ void arch_report_meminfo(struct seq_file *m)
 	seq_printf(m, "PDT_cur_entries: %7lu\n",
 			pdt_status.pdt_entries);
 }
+#endif
 
 static int get_info_pat_new(void)
 {
-- 
2.43.0

