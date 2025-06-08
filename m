Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8433881E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749412305; cv=none; b=ESKfqg3TBhgTzlGwoJrLka9mCvyrdgcvmwSyo5SvbASdm4zdxQ/UOH98eVxTUhfFtPsy0u696GW77HpCuJbn61DhqAmlwIdZW770fUyho3mjFnYd6Qy/cVCm1CRIuWqWJwUfy7tjQYI9zVcuCBrBvpd+DEnGGunlukwq1MYEX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749412305; c=relaxed/simple;
	bh=s9mp59SqflPWtnt6+O62T+c4ZK0qqvkd2xUxnMiiRtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nh1QHTTWWPFWfRsBungjLyZEkai/8F4fvwwjfWoCgQXfcYFnIGamIsZgUVKpHJxYcQgVbsQxywEtybU7/NSrxaW19ZXABcWtYR2cGbpzqzC086fUVsndQVPl1MogtKdJUd0P/s94DuvGaSq5HINBziidW49cENa+KIbgER6rvq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgcVgAcX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgcVgAcX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f71831abso3541007f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749412302; x=1750017102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3buj1uGk7nA1sbnFPGaNKPyBQQZpEjYya4Iym7PNjUc=;
        b=mgcVgAcXjT7GuzbrFBUU8smccWe6oRXN0UAeHDKvfmqc99o7XIRk/aDX118UWik0mj
         a3sfR/GerXq3FpBKivv36grvuPutcTpqllBM9dvS0I3sJLTvr2ZmqHPknpKKFMIRCSPc
         AGkjs+J8LiSDka0Mhh/1ZoKt3/gEQbjf6OGJ1y3Ome9B+vchaez86D7lLc/40tlXHXx8
         SCb2StFjPgvOTjR0ZUZyBt6GraRU1hLzLNafcHc3/piIBhLDkHqFQuNUGS/0PvXXlJYp
         MH8UCR64NjP5P0K8DHjiJY9/tECUvszz9+Cl5x3mulx82sm8cBp9Bi2v6SgsRB5c8KYl
         OSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749412302; x=1750017102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3buj1uGk7nA1sbnFPGaNKPyBQQZpEjYya4Iym7PNjUc=;
        b=R/4fs8XQqd/5pfq3liNOv2YHDARmBgQNkaa3eiB+BqwMNTrxCIqCTzewJM7bSaWGiq
         lY9FJGLBamkBPEDbswchhAmRf7hcRwlVsh6PearRObAbCyrGvvbaWln9dFzo02lXQ30B
         cuHaZLviC3QI4k+NpkQYN5Sl9Q1+t/WZGuRyTqWlJqWTiu77XG5wiL5d1hTke5p4dQog
         DoSSuGqTk9f3DBeK3yKs7Y/ckRO8dh/CYu/fW40KFdckDrAjSTpgtja2W9rdgeMoge1Y
         cv26EJI8WmWCsP6C5kGSPdeJ5L5Np9Ep6uKaPfY5mM8FvZnaIbSiaf5prjKPRfL6SqeT
         DCtg==
X-Gm-Message-State: AOJu0YwOV2bWtKhkYVBOHC8Vp3eMzVpuypltyFBwIQkGrxlJwKDqvORS
	kJHraOA+YitFg4QVPvmp+W+O5cugbQljLi0WAA6aaJFi2zxN4T8rBEi/
X-Gm-Gg: ASbGncsEEyoTYqwMEzS0/FTWPqRcFUveaDOAxvankonKUIX5TQMFSSKHVC+2PReau3w
	wwRqB4CLReILW8xJsSrV1RJPoJtvElKFJF3DkKVc4ViKbXp/rbFyVAKX49XyK718JuqWBlXbJfh
	92v674AA3Wvhl8rvSWy6O+aoTlOQyPPAh7jQBQvIm30jbtKKwuT5SZSBoixDW17NCUcj2/B26Rk
	uLHSl+1iRynW+0Lj1qCSQt1wAT9rjQvFdGL6HzpsQPRF+uLwV0jV1z2Qx0JOaOW9RxS7cFhYfPH
	14eBGBzeWY7gkhmxPX5EAni/fSUB1TEj+pB4MRDPT1cHZw8DKRolhey2e/sdwlBI9g==
X-Google-Smtp-Source: AGHT+IHL/eEjyR7e2in9gBG9vqLEx1HNJ7KANIMdSu7i1O10ca+Q81dsnnIu79iU2uuYZV94YGbd2A==
X-Received: by 2002:a05:6000:2dc7:b0:3a5:2465:c0a4 with SMTP id ffacd0b85a97d-3a53188dca5mr8284789f8f.20.1749412301713;
        Sun, 08 Jun 2025 12:51:41 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532468360sm7746034f8f.100.2025.06.08.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:51:41 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] include/linux: Fix outdated comment on entry-common.h
Date: Sun,  8 Jun 2025 19:48:28 +0000
Message-ID: <20250608195043.4953-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalid Ali <khaliidcaliy@gmail.com>

On most calls to this function, syscall_enter_from_user_mode_prepare()
never get called as the comment indicates.

Privious kernel version i used to see things happen as the function documentation
indicated (syscall_enter_from_user_mode_prepare() called before
syscall_enter_from_user_mode_work), however it seems now some things
have changed which makes that point irrevelant. Most preparations that
function does is handled manually by enter_from_user_mode() and
some other places. So this makes it misleading.

The point is remove strict function call indication on documentation as might be outdated
one day in the future. There multiple places currently called
syscall_enter_from_user_mode_work() without
syscall_enter_from_user_mode_prepare() get called so that will make it
condition not met.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 include/linux/entry-common.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index f94f3fdf15fc..8b52551600cf 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -146,8 +146,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
  * @syscall:	The syscall number
  *
  * Invoked from architecture specific syscall entry code with interrupts
- * enabled after invoking syscall_enter_from_user_mode_prepare() and extra
- * architecture specific work.
+ * enabled and extra architecture specific work.
  *
  * Returns: The original or a modified syscall number
  *
-- 
2.49.0

