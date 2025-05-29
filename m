Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56271D63D8
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748554682; cv=none; b=OIOOf4kHiIEhpjV19lafT3AmCRgSLeGSRBiwQLyBHxWao87d7LZwzHVzkkrTqKNacJxJb3gFKRYyssZFg5pb2hrpOc+F1tCGNMLQMmMgiiy4avgjp+NiuuhDnaXDTInQjJtTNwQKr9KM04O90CZSE3qlJ1rEZJMajhUYk8PsJ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748554682; c=relaxed/simple;
	bh=LXReZw2aLb2mQwYq1+eiv4FUfrhxU5/HnRkofd1TRJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zh3CrjgLrae3Vom8R82hpTyZO3SSblmJILv8q/XwFSoUuKfsz3sdtDI4vBLgLql+JQMtW3L2rjJ80DhmU1pZ8dNKnmsEpf+o/6nIJEiOzgkAspCuDmHUFIVYd4LMopeKkwa6RQXG8IxEZYuntcQHN3GPlj+GYgu2tVkgB1r7ml0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtoRbvod; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtoRbvod"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso1277501b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748554680; x=1749159480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mqP4wvVgm10JM+a8NwlgAMzllqIFrJqqgUfwCFf2lHo=;
        b=AtoRbvodc3WuHJSJMckxzBg5w3OqSRhcjRXPIWdyNWEeTXEzj9vHKCPX8oBXidv08l
         xROFXmdyo4hYDnUMA0yMSc13CT2RkuvCs+Yh8mitCuuj8z1l5554d6yPul+wva0pnnWA
         2CsoOdDlolhZ83sy9dt1YwUGBSkcNXNZMBLhLUlr0Zs0SFDMkokvVGNvT+5nr4tSxvhI
         ZDUjxQRleqfxhi0WCztzzuDKtKNo5DReYjzfBgrHtUxACXIRq0hK24tFaYGZGl3IBbUQ
         He3zwXbDU3CBxgd+0Tuy+CUULb0Tx1EXWp7MnHkzbErlFGgBY3lTYCOVHJZEecNjYI8x
         WJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748554680; x=1749159480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqP4wvVgm10JM+a8NwlgAMzllqIFrJqqgUfwCFf2lHo=;
        b=aRodXaqnGGqBa9aaVi16cazrRXj7fUEm9k24oNj2jfUl7wby/rdEOe7ngjkhmstrRJ
         z/Z4tdEqqzTNctb0wc+zBpMiqN3axvVP4gG3xXC367imBwgcQDFOTn1Pw2cRBw1imhHr
         oKTJXkJLq5bJAzoynceKVLdSaK8nfbuxBBtih+Jsjy9Vu7/3jRKZwFfRzyQ3eKzvik+6
         ZHezk1sqmjuYPPssaRWlt8uRkhj72qTqq/LyKkG4Gk5tYIbMT3hvmu2usC27RHEVSTlr
         +HucqCacSyCaabT8EZ8xPM9tMJJ2MyHQkAQtDkFpDtBfyzR+xC83B/X8fGZftV7I3XeC
         mWhA==
X-Gm-Message-State: AOJu0YxjyGubWmRwaFjfnlBhq+mZW5sCwN1s2LMWHNhuU/I5SAThC5r2
	hjbpQd8FVRYEciAiP6ulRfx/UOF8mlVHRK62LFCV/ea4NGhXB2nG56Sx/Mwt3Q==
X-Gm-Gg: ASbGncv6j9QxsOEMgVSTSStzJKtRWgtbfOJQiy5SbLaT1bF+SvW/q6u1Ifc2aDuLgqr
	OhXpodp/DCm6A99hphut6NgMp7qXHgIJSmXNzH6MT6bO61u6aA/entVx9siBIq+NNkLgDK21DNB
	9YboImQ2OrnBf2W39ufqKgXnOjaZjaI1OLGkcM/pJ4DKnsHM9SLnFU9dJ/+oOCBKSM79mxXg1w0
	RDcAIkPfUh4Nm6FYEt9EvSmb0ijRojH+1SKBy0YhndVYRApsl0xtLIKSn6cPWe4T49J46DrgVrV
	/Us1mcI1t40XyGwTqUMyak+UgcR1cn5EcNALKW3MeyyzP2QoQMZOrKwu+ainSyOW8jC+0YlID1n
	flOH51q55CsP4eJ8aAi7nDT5QY06O00nj1niXDZpGfbI=
X-Google-Smtp-Source: AGHT+IFBuv+g34bmQWuVCb/OtmzFX0rA5tHGeOEftBT0F3jfs/WCM3yCBJpA+mSpwz6fYCAqQIkacA==
X-Received: by 2002:a05:6a20:728c:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-21adb11c2d7mr1423707637.6.1748554679780;
        Thu, 29 May 2025 14:37:59 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:a46d:d724:4557:2a3e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab109sm1778187b3a.40.2025.05.29.14.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 14:37:59 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: turn off one_time when forcibly set to foreground GC
Date: Thu, 29 May 2025 14:37:50 -0700
Message-ID: <20250529213750.1068920-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

one_time mode is only for background GC. So, we need to set it back to
false when foreground GC is enforced.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..f752dec71e45 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	/* Let's run FG_GC, if we don't have enough space. */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
+		gc_control->one_time = false;
 
 		/*
 		 * For example, if there are many prefree_segments below given
-- 
2.49.0.1204.g71687c7c1d-goog

