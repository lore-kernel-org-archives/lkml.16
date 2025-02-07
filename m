Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007E818DB01
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946583; cv=none; b=MYMGfkp5UXq8OAx6TMHQY1OBcIHTNQTxrMNPMHnw+AaY8IsRmD9kGoK4SEEkUoNiWIbXKddvWM1A9LqznArmoUz+P/RexXBoyYteWvGweDdplkXgyNp96zskVVhumbyzwiCDSL18m0qbesU4+frWC2fs2sO6Tcrh0sdZoTK9gp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946583; c=relaxed/simple;
	bh=rr0QmYvWEvOXfJauXEKOF5Ddo4waTvSOTRXAoEYEHKw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PLF3spa0hmMHR+PFlSkd5YVc1i1WNygQkK17c4DjcWq3E0KMTJ3XcCeVm76iPVOdDNZFO74DJPSt6K7zdnxlLI7SvN0CpKN55fIbt73k9taAwOAG3dubLzXmfL1wZMxBQkYCerHCuL8SWYs/az1AJCnm68Kco8F8Td9t/TGMP8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5cGHjMZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5cGHjMZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436341f575fso27842395e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946580; x=1739551380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=94n+NEgKc+2cWG3iry0+X20P0PdLxq4qF+vg5cgjhT0=;
        b=a5cGHjMZwVvKslLibP/8ba38IaL9CgKGWUEepFC5zLtgw6qPVamvbV9J2h+Te/n3mZ
         hOZ/UVXFEQruZU5isSF4JbSL/+nw8a61T5iwHUd3MUFxqHAXWMUEMP9fgpum6XTWLU35
         q9CNTN0FYSaLE9AxKS9mG8BT6j54hmOAB/yRuE/SXF7nZmpTuBKMg69XjD0xRsL4QzNy
         Gv8Q/jYqyv9o3LNB7XDRg287tentClDsHisc40cnsZ6w/H1/vPSiW/efl9m8obNlv9Ea
         cUJL9RUwN3JOOAiFJ7/rxRhPHwtVXv4pRSHm+F61ivq+5v7cJYx2Ctx/IOJT3V9Ks/oL
         lDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946580; x=1739551380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94n+NEgKc+2cWG3iry0+X20P0PdLxq4qF+vg5cgjhT0=;
        b=D2BhRkbmF2JAJ1iKQgnGL+MK2yY/aJpqTl/bjbgbF7LTOG1D/qirDxHM4OxsWHEGTM
         FlOBUFo1m5gVCPTin70QU/mTx/EUowBLh1K7Vja6/xUsGKAE3F5SlBZug1+CvUvvx15T
         ivPrWWJy0izeW25Cl6brindAxiw/ZDlDZHzbynPSkVE+Ww/WLfI+WnrsNk92I4TL0KxC
         y4ACTpXthuawbua+jooJWYSHlD5Ld9quqjFrMAop+Uc0UEFfCQH+PURDK84twUarT8Vl
         93ms+PkEw9s1jtaUb9uabIs/OjxvTtqOhI63DabonECGmlPc4wcPAKN48LkHjolYBbsk
         gxdg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8BXaitUXgSjilcMi6CBZKU43DBIzVuY1SACHjswG7u3+W5BxedG5v7yizx0b4OB0nzyDsT2h8HM8Dlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YynDWZl5pncv28n+n8ppqG1Ktzui9vUra1J9sZOV+BukPpFjVc+
	J0wuysI+gtWs0CSQVTC6OIG+vfbJBCowDJohPrU+dn+p+lfmHMTT
X-Gm-Gg: ASbGncvplKhhXfDmUzpVwItQA708SLZN3BxUXFUx8GwNWp+MtcHDqL6njBfvppWZb3N
	UPvZJtVA0kYWrIusTGNswhhBuLP5W0dzP7r35Tb8Ucl6C9uy8jXosx1cFw28G4JYfdgV+l4mOMB
	4BmaoFDI2/N7afobfYbi+kA/CKOeeMRQPPbAR6Fa0X2GEEeCmPDTx99CfzuEN0I7XwThmJqevVW
	1Un3OCHfcM49opplbKQv6VjNIxkVQxCsMbbnF8Nn2hJb1Au26Rkh/0gMZPwkjUOTZevhkbtG+r4
	4giQ0vft7LrRarax
X-Google-Smtp-Source: AGHT+IHNhdm8c/BnROBfa2eHYtjKUZM/v7sCi7EcfywJOh+0XskgQ2qUwxdeFBqrvcawI+IYSek5bA==
X-Received: by 2002:a05:600c:1c1c:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-4392497e6d5mr46165605e9.3.1738946580006;
        Fri, 07 Feb 2025 08:43:00 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:92bc:4d3e:76a7:a3cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b2fsm94615785e9.33.2025.02.07.08.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:42:59 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/mm: Replace manual bounding with clamp()
Date: Fri,  7 Feb 2025 16:42:18 +0000
Message-Id: <20250207164218.8247-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than manually bounding gap between gap_min and gap_max,
use the clamp() macro to make the code more concise.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 arch/x86/mm/mmap.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/x86/mm/mmap.c b/arch/x86/mm/mmap.c
index b8a6ffffb451..5ed2109211da 100644
--- a/arch/x86/mm/mmap.c
+++ b/arch/x86/mm/mmap.c
@@ -84,7 +84,6 @@ static unsigned long mmap_base(unsigned long rnd, unsigned long task_size,
 {
 	unsigned long gap = rlim_stack->rlim_cur;
 	unsigned long pad = stack_maxrandom_size(task_size) + stack_guard_gap;
-	unsigned long gap_min, gap_max;
 
 	/* Values close to RLIM_INFINITY can overflow. */
 	if (gap + pad > gap)
@@ -94,13 +93,7 @@ static unsigned long mmap_base(unsigned long rnd, unsigned long task_size,
 	 * Top of mmap area (just below the process stack).
 	 * Leave an at least ~128 MB hole with possible stack randomization.
 	 */
-	gap_min = SIZE_128M;
-	gap_max = (task_size / 6) * 5;
-
-	if (gap < gap_min)
-		gap = gap_min;
-	else if (gap > gap_max)
-		gap = gap_max;
+	gap = clamp(gap, SIZE_128M, (task_size / 6) * 5);
 
 	return PAGE_ALIGN(task_size - gap - rnd);
 }
-- 
2.39.5

