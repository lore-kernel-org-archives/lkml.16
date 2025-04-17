Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8BD22371B;
	Thu, 17 Apr 2025 16:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907264; cv=none; b=KIIko/007wfyv5QcFrcKD6lCwYH3I61qWM7WGgqp6eQDHPRrFrMg6OtZ8U5RjwjpNLXFjkrzXMDlK+veKV+wEmR5CtBVUnlO4Jyd3lEPWNW3P+kNSWm6o9KF6209gFkBYKgXd322a26tXhjfzr22/EBQ9SlSB7LxPOc/ONcWwHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907264; c=relaxed/simple;
	bh=VN9Xsu/Q4qY+JmNXDhLgN+otxt8DTOVl/6iGymlAKe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WQZvlMuKAa05WyfY5dXXkrmkM//zWCDDlXQX79BYVtup767s/10/cS/3qJ5tPNcYLnmUyAT/HUrQw1Mz4oLuVp5yrAL081AmgGIoqkz1tFGX1OHVoODESwPmo9LDhcWb9jeiOfQcbVw+ThfeeggNggdkpJDy9KbpwHk0qXmJLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l96O6Y3C; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l96O6Y3C"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-440685d6afcso5179885e9.0;
        Thu, 17 Apr 2025 09:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744907261; x=1745512061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GB37kMZvs0FEg/9iCSh3Qd53ghVH6b/CUXF0k0JMkaA=;
        b=l96O6Y3C1Y4iyGqbj/KkXPryKOxLLQQZ9S4pzvgnGcAuqal6LJm23IruZ0u91jvdCP
         jH+oV7D7Hcc3PvX98fPF0tWKcARBOPHRHTpzp9zicZKhGyaPCVsjErYubhDnAD2Kd4Pg
         hdMo+/O7GACW8Jb9wexZDtDDHBsMkCWhUgo1bu67S49bfZ50letpjhmDlGwWwQdqnfIe
         O/1ML9mQq/0JQBvmgVNRaDbZjbrhQnLeyNSGsJgR3+zSUwuYv/TY6pJuFXtrkVqe3n+c
         aACJtNHqqy2aYlQU7L5ml7Gkk8GVD0R8ESLuYSISxKdz9Tl6+uX+YOnFbYMr8r7b874T
         tUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907261; x=1745512061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GB37kMZvs0FEg/9iCSh3Qd53ghVH6b/CUXF0k0JMkaA=;
        b=hU77XOnn1/dddxhU7RCw9NZCQVJYDDyOpzw5Jl1giNTBacN+3CabiGfdhQfyV3S9KU
         monV2qLc94FwLEwT4nNHoCCdrgRtMRbAmMYCnS5PQE+F/zi0Jr8irSUSbI0V0G0vcaOY
         1g0p/q5k5lzoHyq5fRKxVG+C+BWBV/hQrfUyVQ3M/2M09SH2OCY5rEK+bZj/S9sQXVrJ
         Sc0mREv74Ircb2OQelLtQJhRzfUz/svxfKpP4AE76/UGlqk8gfZ1UrVM5zx8jdOjEhe6
         qER8Hnfk0p5uMVUadw9KMx6ngkozNXMArsxgsqhrdh5WnXgZDvUdKP6yqaRSEKyoDPNT
         tfBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX/xEDVc37vHtScAy1ld8QiPIxJco7yh1qCAPiWCU54fGFBS1B+eypwIzkxFpwFgmYzDpsxW8ct/TvbOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxRaZpcWvY5lMTo3jjJ94WP2No4MDhO+hudGLbVYLLcqKr1aLg
	i7sWKvhiC7s+IGcuXnImeyiu1RAA2El24Ab2DtLuxFU0Y5JUwc76
X-Gm-Gg: ASbGncugi6PjdRzQPcTCmeTGfTRnp8jGT0SCy2ieR8KFRCYiMnRscR5fauuts0KdKN5
	L0dljBLLAl+vHpvUKBpCw6gHoBllURcxXjGZN/yqOeW77cTpwDKq7daHl6Dwq3y2Z0tNfEs2U9M
	G5ZWhXBLlyguubU8y1QjxHEOtpT2pLpUlrMYKkTtIkr7AAa7MgxmEnnlh3A1qvRs012uIkAFWTj
	/B33MGzDk5LCiezGrW/pViVBTYLSlOUfX5C2Zh9RT9ueCKs0u7m1D1P1LFIpyWEhS3dFLzt3May
	yQ+GWjf4BhvWKN6A7RzlG6Hrt9UbfQj7wdSizeGOQQ==
X-Google-Smtp-Source: AGHT+IFXDNqqMl/zdyI+OeigjGP6jJlH4r0B2W1NnUiEK0FX6Olo5gOL6oxt3A2JU/Srkharlg+nDw==
X-Received: by 2002:a05:600c:46c6:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-4405d616abfmr65284125e9.9.1744907260862;
        Thu, 17 Apr 2025 09:27:40 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b4d127fsm61901965e9.12.2025.04.17.09.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:27:40 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ofir Bitton <obitton@habana.ai>,
	Tomer Tayar <ttayar@habana.ai>,
	Ohad Sharabi <osharabi@habana.ai>,
	Farah Kassabri <fkassabri@habana.ai>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] accel/habanalabs: Make the read-only array edma_queues_id static const
Date: Thu, 17 Apr 2025 17:27:34 +0100
Message-ID: <20250417162734.491148-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array edma_queues_id on the stack at run
time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a38b88baadf2..1e401f42eef7 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10304,10 +10304,12 @@ static int gaudi2_memset_memory_chunk_using_edma_qm(struct hl_device *hdev,
 
 static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 size, u64 val)
 {
-	u32 edma_queues_id[] = {GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0};
+	static const u32 edma_queues_id[] = {
+		GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0
+	};
 	u32 chunk_size, dcore, edma_idx, sob_offset, sob_addr, comp_val,
 		old_mmubp, mmubp, num_of_pkts, busy, pkt_size, cb_len;
 	u64 comp_addr, cur_addr = addr, end_addr = addr + size;
-- 
2.49.0

