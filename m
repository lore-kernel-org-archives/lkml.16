Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183D0245032;
	Wed,  2 Jul 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448369; cv=none; b=RvlAyxt3XWyjRgcHsbfU/76wMEACO+om4z8UKfD8UzPNHquxsPwsksuWH5osVCtEDaDhBJIRbHfxeVgFYstpFrpcb7nS9+LhvCBT8EW0dLFt+rhkbJcA+KGBg+0MpeRkUpU9qVqX2UB5bvTcMUcU5z9HI+Eivj61fsOzQjXqhIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448369; c=relaxed/simple;
	bh=bdap8No3+hAEFEUzbP1Pd//m/9aj4ASrR7MCs2OFXRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dbr5kREwrP+GitLXzh/iwXN17V5eXdqRkUUwQAvxf9t3qdQByiWqm21tm570E3Jt1gNcp9pg7lMd+nd5v/mIzsaiS+RB4yjbyhJrsZA6jQoP/cB8vRUOW0lYVxVucLHrspAN+FFBsqTDm8c7/8OsfVlc3qJXxHh2A1BLkaKu1tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQ0c2XHO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQ0c2XHO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4530921461aso43438845e9.0;
        Wed, 02 Jul 2025 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751448366; x=1752053166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2NUWZQo4rEi0elBJOEbc1HR3dKemWrO4/Vi3XFgMFE=;
        b=EQ0c2XHOhv3BntP9jBG34zJKBIUkKQzz8JI6K+vYTtI1pvLff63aystUWvSTm9TaLJ
         /ykiRBnMi+fu8tOTRVwapcHWS99Pab41Y81ITv+PfRfRx/W+w1X4Muv0CUyp70JlH1o9
         ygjQzZAAAiHPv/uPXBStoTFYU9GgNQCGIj/bahpExZcnRL89qoa3BIQAID0W3aovVopv
         5Ah+55HcvhZRlXhNPqUQkWnQSO4/sfPEnVm+2vyZcJRw9ovH37H37NQLjUnbkXOBzPIs
         7ACS6jnxZJK8WmD1K2Cil6fE55BrAhNy84q6xkkcP+Sgiqj/Voq4KhblSSxeE5UJB2AK
         eGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448366; x=1752053166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2NUWZQo4rEi0elBJOEbc1HR3dKemWrO4/Vi3XFgMFE=;
        b=dLZi/39ZuvyL3GUYKx8aP8CLE0g+M9WNXc8O/nNdagK2yyxmpPP+rfyrPdeZosLgvl
         qd1FT6x06k97G+4XJ+Rbkgs16w8ahC594OV/+FPFuSD37q9xOs970xZqIqJw0BIOhQgv
         GOy/nXbfG9M8y24B2GbvJ8vsBJp4EA7b4WatkoIQQufTAWmQ0bWC4rrd4PVyUFhQ973S
         4mJqhAtB3PhWA863o0cz3/4XnpmzvhQXIesXM5sY0cTtvckWkCyBNyANkp0yei/HajaK
         Df2xu3DVs4+PreHQOtxg8Bs7OA77O0mKaKMOArwgMK7aBGf6arJIJkxiYnepAnaK3tVA
         CH0A==
X-Forwarded-Encrypted: i=1; AJvYcCWYnEMK5JgFKwtX2ybbL0V/REiYRl/RX/oncT4ZYqTiKPgCCsq5pmaODWRycfuQ5g3aprrKMr0pyWmpzoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP0am1Q98m1q8DXpaj1d1yDjtX9nc5fRbe9BAuh/27c5XrMHEb
	KgPTF6yl9nsqYj8s4quV2w+6NOhwQdT7ffq+w2nsBvKyAxAxkHuZsT9C
X-Gm-Gg: ASbGncu+AXoGN1sPVm5gQzi3YOHWAmLU+CA/xfYDMHjbKpF8lkssb6N/9Va98kVgZP7
	FJ9VnrJwaioZUtQP/eNpgv8Y8CWwutvMiBGlnCr+HNcHWcGB8RRWEFwGOUoJCre/VHAocDfqLtR
	kgUjkSzK4tYZjOLXzVYuX0Va7hIjcv/pOPhv7sdqL+KT5q27Mc9TaSANbCUK5pOMNSeC9874d7o
	O50V53GM6ib8mrFPUCFJnmLiemDWNnimlh/C5xbcwa6eBTbgXbMDZnOLcUGcsmptv2YIG4gv649
	qKO9wJMMtbVXD8qoNOohCODdXPy534hAUZMjfTx7Afif5IMl/OUhcZVmcKRSVHOoCb/HB4E=
X-Google-Smtp-Source: AGHT+IG07cQ+CwOEqMsx1VHMq868M5t6QnC5WQEr47cn1qXuSoJcWBD6jVc9AGetWcgUNe/GbL8M+w==
X-Received: by 2002:a05:600c:538e:b0:453:697:6f08 with SMTP id 5b1f17b1804b1-454a3728b85mr20537325e9.26.1751448366227;
        Wed, 02 Jul 2025 02:26:06 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538234b1b9sm218566675e9.11.2025.07.02.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:26:05 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/ttm: remove redundant ternaray operation on ret
Date: Wed,  2 Jul 2025 10:25:41 +0100
Message-ID: <20250702092541.968932-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently the only exit path to the end of the function
__ttm_bo_lru_cursor_next is when pointer res is NULL. The
ternary operation at the end of the function that checks on
the value of res is redundant as res can never be non-null
and hence the expression referencing pointer bo is never
executed. Clean up the code by replacing the ternary operator
with just a simple return of NULL

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index cdee664d2e8b..fb8bef50c744 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -1016,7 +1016,7 @@ __ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
 	}
 
 	spin_unlock(lru_lock);
-	return res ? bo : NULL;
+	return NULL;
 }
 
 /**
-- 
2.50.0

