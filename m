Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0511ACED1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518135; cv=none; b=ojv3iSgrHlRzD7k+3BfophmGvQkyh/032OTxx8nhYvKRdJrdYgEr841qIxh5/2a85N877KSom/gs9rti5D9ov/24ebriUCfC4wmLQndDj3wexrtFcRik4KFdNtDVry6X5VUuHrUSHYJzT6nFv6Zs7qZKmTzsb7BQ14pP01tqoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518135; c=relaxed/simple;
	bh=LfylgwBhk6V7+u8CK4F4KYKTKh+JdpgBkzpYisiy34g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g2ekEqNhs6qCUWkCZ5hYZ2A7cJoPi6kkmXLr5TRNt/LmmCjWkOAfcTj8FdApHojuBrmoldL+YCAU/etSkQenVjUUeza2wCtlogHWLHmFAYX+Xj992UeS9Td6Z88m/+TWF5CDHoc3oAVkSadnwkcDHWsvXB4nzn7IF+FrlFBETwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJFT0ieM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJFT0ieM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-399744f74e9so3676473f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743518132; x=1744122932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZyefUB9KxdHlktsqY/xqs14rudVRci25F3JTS7wlgs=;
        b=mJFT0ieM7bV+n4gBIgLMLs6XLftyrZYtC3Q/xzJkqFLLld5zIrx77onP3WHl8AZ/tP
         zq3kV1ZQmdN/gsmfvP6egByANS+R42E3NtOge3yR/IJmPN+b8o2hEwpru/O6vQtlPwwV
         1mq1NXP9iaHZfRSevZiyjea2uGW4Nj5oJ8JWpSIbyeHObScA8ncxs7D0luJDw6RjehUr
         aRmKxeCW2pzHVtwN8Mt7jyI6Htuy/FiaC+Ta6MQomHMhRtbFGr9Xs+4KGNnX+ExZP2yw
         mToINO0KwJg4U1PZ0a2ix8H4d9FY08jn8eaumJRrhBMtZsAe+3+/qiq9eMJcaLKGDEPp
         e8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518132; x=1744122932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZyefUB9KxdHlktsqY/xqs14rudVRci25F3JTS7wlgs=;
        b=dU8bQ81EbaFqsMR6GC/4x9kwttlWZYo7LMMlCbJijit9bsEcUURMy5f7MHvgrhEnq4
         +MXjmOAlJce3MT7GkH7MwV43bkL0h6mlfRq9xa+OrTYG8sC5dXPjjRZE4O/fgVi0jeJp
         cKu3U/ZqB0SaXUBf+hAmSrvuDnGbXdfWvIO4O6HItjzDBpxuGCTuwJnjk9tDS17hfUC/
         w2DmbdOa6wy88Ngw60zem602EEBRGjnoP9LEhQZ1w5V2mCzURWbljEorRemxMmfzIQfm
         gPjw2IIh5GHQS3fcibBIG3TRAVC8U3xF+Q5OPlGo96g19K2+KjCtv1upLpZ9l/yyR3oa
         cPcg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Z+7xMfMh0EjWh8yg+onOsbLgBHtLOgvDrT4OXe1C+xyH59QGW1oRewPt4XFVq2Y8maKXOEjQJThZneA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGRg5UDd05wRp5bN6U5xgLrKU9/A9m/W5YZOmqUlXCb+xS4jWo
	E+pjPcnDnwEyxbw/mByNt97tr2Ndj5Gro5pZMzeSIGT6IdytpkYn7HtcRg==
X-Gm-Gg: ASbGncs9p+uiQLo46GNU6FDiLB0VbJNAd+QzpFCkUTOUiewH4sVp62yJKL789/6lUrU
	sA8LO/jVVWYMqgkQCIR13T/e+U/apI4pZnhtSrGUU6UcEpcuBCJy/pElwQOwz10p9mN2BuSgqoj
	PN0KlqcZpymWPhAVwvhxfg82m76oaCrDTA6vbxgcpTwmnppyGKxgueTzwln20PzTR/DmwTZz1Gj
	PqHR7iJFjXW7vH8s8Kd0IHX0umxzryAz2hp9F7qG7rX/4KKAICKcJCRz41lxK7feXlxSMqShZRT
	f/vAcGRkFM2rAkwC8qseBWDwGe+CfSnMR/yxC6FDwqafwtgYoR7KQW05uStt
X-Google-Smtp-Source: AGHT+IHhBDh1ohT1evya9ki0/u7U88oAEymPVw6ey8QRvgZWUTKQYWRrpJZRb7KTrGDiRVJVhiiiYQ==
X-Received: by 2002:a05:6000:144e:b0:391:47d8:de3d with SMTP id ffacd0b85a97d-39c120db49bmr10278754f8f.16.1743518131768;
        Tue, 01 Apr 2025 07:35:31 -0700 (PDT)
Received: from f.. (cst-prg-92-82.cust.vodafone.cz. [46.135.92.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba4b4fsm161194865e9.1.2025.04.01.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:35:30 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: dave.hansen@linux.intel.com
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH] x86/mm: stop prefetching the mmap semaphore on page faults
Date: Tue,  1 Apr 2025 16:35:20 +0200
Message-ID: <20250401143520.1113572-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prefetchw dates back decades and the fundamental notion of doing
something like this on a lock is shady.

Moreover, for few years now in the fast path faults are handled with RCU
+ per-vma locking, hopefully not even looking at the lock to begin with.

As such just remove it.

I did not see a point benchmarking this. Given that it is not expected
to be looked at by default justifies not doing the prefetch.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 arch/x86/mm/fault.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 296d294142c8..697432f63c59 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -13,7 +13,6 @@
 #include <linux/mmiotrace.h>		/* kmmio_handler, ...		*/
 #include <linux/perf_event.h>		/* perf_sw_event		*/
 #include <linux/hugetlb.h>		/* hstate_index_to_shift	*/
-#include <linux/prefetch.h>		/* prefetchw			*/
 #include <linux/context_tracking.h>	/* exception_enter(), ...	*/
 #include <linux/uaccess.h>		/* faulthandler_disabled()	*/
 #include <linux/efi.h>			/* efi_crash_gracefully_on_page_fault()*/
@@ -1496,8 +1495,6 @@ DEFINE_IDTENTRY_RAW_ERRORCODE(exc_page_fault)
 
 	address = cpu_feature_enabled(X86_FEATURE_FRED) ? fred_event_data(regs) : read_cr2();
 
-	prefetchw(&current->mm->mmap_lock);
-
 	/*
 	 * KVM uses #PF vector to deliver 'page not present' events to guests
 	 * (asynchronous page fault mechanism). The event happens when a
-- 
2.43.0

