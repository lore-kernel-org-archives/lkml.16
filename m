Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0941463CB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744562; cv=none; b=a2g6eVxEso0yAvA3wtPi5tiVRniz6ElLNJez9O9cWJKHxOp7BUi7QTlMeWGPiZVRTXsWOuHVHWPAD5ICfOGlCABvFkEsoTSh5kvMZ2iiFrTqXuEEHBQ8HbRr0Ld+HgvPnhWHIptoonbYmCze2JvBnDMPWANejvPynu+iP44v4UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744562; c=relaxed/simple;
	bh=673XBPRyzebnsJJ6ivPQwMAs0N/F83vVBY0oWEkZ3nI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFH+ldwpb3QqCPOnnOvjiP+8DrF3r5IA5152wbkAndS8zBEWxyDbUOxMCulGA63FMGYJGNWsfl/nYa0MUbhocwu048QpZTFYNB0ZEObNhy8DhSvCw5RV3N9wRxRxMExeTlDtB/Re6f1CHOZkDPHnuF7LBdDeVULTvD6Yp/Agfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KFPXYsLY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KFPXYsLY"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30e93626065so3321496a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747744560; x=1748349360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFqkyuEgS2DYkSpYETdQW6012El1Bu2/BFMTj3Lxalc=;
        b=KFPXYsLYrodHMp/5DgMiSf9ZpiOSba8JSBxJEP+oP/fBh1NHbPIBS9bv2kc34CyCji
         u2ZyFyy/W7EyLsw1OALMeM5y7wPNikqQ8tHrghL0bIuygGkqTkWpOeAvZsqT/OFiAHsU
         RxjIc53fmBqp+qV3D2v8Ogk30CYF2ceGHNEso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744560; x=1748349360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFqkyuEgS2DYkSpYETdQW6012El1Bu2/BFMTj3Lxalc=;
        b=Oo/XTvLue4yZCMaKE2wa2L0o4lx25X6KwNAT983xyonTYCVeTIK1LkNKgwek1eB42S
         ZSQB8ZA/qxXNyuXL+73+KFTETV+WWz10RetMBWJxa8uBzZGYiUcYWIziqt74d+L/Hf8D
         BGNYqmK0vPATv9DyIUu3ZZak8HalCliuvC1YQ/64tZs92NC9ygMJsreMxLzZSN5T6Ylf
         oUUHotDzZgOD2sXuN8eSmC5xd2WQikcCNvX+h0mBLsA6uJHv+5WbQA7aURShJjz9av6o
         GxIpGb1hqPTohk6cnj8JCxYOJLFMsVGQAcmCqxsZFH8x/YlF8QOSil7P3aOP7Pb7MP1s
         y4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXINeRZDo7dvgAJ3jUOBfWZtwDbH3iV3g0wK1eThIAEX698lt32WFy0+fLQkoJARWu1m2t89Fdj5NljPbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaTeg3/gxheOdqx7U4NISeSrCSdkMn1qtVLg9geUE1/ztqWlVc
	ggpe9usDtx4FdjTA3+o1cCrumwfB72+HOCQgdkIrYEj2jZDCTznuwpnTRwb3qAk3EQ==
X-Gm-Gg: ASbGncsl/ZWL9UwCBg+eY3OisQMwxsMqCOs02Gq/fhcB35UKkRgJH6FhtCO8IzQu/nH
	amMSUdaLpoihchnuFEWz+rTVFRuo74ZKl8yi5d0UNH5D49LkNzSU4xss4n46BRvjJeh6wh3sc4Q
	A04a58tc8Okz+psW6CKxksDHq6AkPgzx7jqlsMxm78l8VvV9B8ekJAmp07/poEGak3k5gduGzmh
	AmCvE/8u2rcCkZ91dOYbRw/t+O2+C+DZn0KQ91a56Myl81xV4pUQKslzn7d+zSrdwbOBQ3OG5eZ
	bfUyH61yqmSxGpjt//aL3PZOGS67MQNKtCP3QobaeGAqrvZHza/yqfoO4Wdm/ZoocTrnAB7EZzl
	tlQ==
X-Google-Smtp-Source: AGHT+IGpncCXk5KCz55zccTXitwVoPNGD+eQUN+YfywndV0MF1z25HxMj+U4Tr7S90HyyHj9gOFxpw==
X-Received: by 2002:a17:90b:2b45:b0:308:7a70:489a with SMTP id 98e67ed59e1d1-30e83228dcfmr23999528a91.30.1747744560161;
        Tue, 20 May 2025 05:36:00 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cdd3:ba65:b6f2:d55e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d6f95sm1573989a91.30.2025.05.20.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:35:59 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>,
	Amir Goldstein <amir73il@gmail.com>,
	Matthew Bobrowski <repnop@google.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC PATCH] fanotify: wake-up all waiters on release
Date: Tue, 20 May 2025 21:35:12 +0900
Message-ID: <20250520123544.4087208-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
References: <3p5hvygkgdhrpbhphtjm55vnvprrgguk46gic547jlwdhjonw3@nz54h4fjnjkm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once reply response is set for all outstanding requests
wake_up_all() of the ->access_waitq waiters so that they
can finish user-wait.  Otherwise fsnotify_destroy_group()
can wait forever for ->user_waits to reach 0 (which it
never will.)

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 fs/notify/fanotify/fanotify_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index 87f861e9004f..95a3b843cbbf 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -1046,8 +1046,8 @@ static int fanotify_release(struct inode *ignored, struct file *file)
 	}
 	spin_unlock(&group->notification_lock);
 
-	/* Response for all permission events it set, wakeup waiters */
-	wake_up(&group->fanotify_data.access_waitq);
+	/* Response for all permission events is set, wakeup waiters */
+	wake_up_all(&group->fanotify_data.access_waitq);
 
 	/* matches the fanotify_init->fsnotify_alloc_group */
 	fsnotify_destroy_group(group);
-- 
2.49.0.1101.gccaa498523-goog

