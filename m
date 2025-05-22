Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1F1A3177
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938294; cv=none; b=lUpsYWldkQS3zM60JCzu7W2nN8XWyQK4tbkUOpH6+Skhgk/huTwcp/TaoqHGQ9tw1T6LumWw5IDl+tIOVLiQKZ9ozsnbZZCZSYS06gAqyTkZUeKvNU4l18rR1YiBB3kkVhc9nw/0h9RGLGaZtie1sEpYPEjetRmIXVYoVPgVZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938294; c=relaxed/simple;
	bh=PeBz6GC5GUztCqCoa5SWAAmFBb8rNEq3LO8gy5M5ZYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fpig+p72ngCuiQnCpuI4vUpu9l+dx+oyuPC71vY4MizqvB0Udksd7JBEVzEM5uZZIo3rTUbPpGWAiW2bfs4ayxoFPCl1nGVpyUVVzbfcKUjk17EltF0fcA6n9n0WA/Hhs9udJsRX+wTDT3TG36UdqldXdAXgGrHFASm8hXn/J+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKMM9U/7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKMM9U/7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742caef5896so4572467b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747938292; x=1748543092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Gv5UL/mbvczA/AXhPs3M/C8hC0hgs1z+7M1Do9NPzY=;
        b=ZKMM9U/79HnYmMGT07Y9Nu8J75fKnGfqXvDB1w8K9PZBnAbDzDNsT3hS0Mbu3slgTp
         ufTVmO55xzMqQblTxWbrB1klL+GVPpxjlzIxpsDJhpH8OxXlfmNqD6Ww05xatcMGL/2g
         8FmAsDD84PAscs84kdgDTj21fmcK1xRndhvKgRAYf0K9i8Ie8fRjzm7vHuLG1iUtBFRo
         nqiAYEGN2aHTktoARqjgtm9p+VHuwvAAzX9WE6tcey4DVrPVi7joXNmk0rVNEKqIWQm5
         DXSIQvjkJyuAzOVz4ZpyC7w9kkC/S0nmfjcrsFImboPsQohWVI6FNEqeEK7GnM8ghlwg
         NJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938292; x=1748543092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Gv5UL/mbvczA/AXhPs3M/C8hC0hgs1z+7M1Do9NPzY=;
        b=tynWR1iktFc6lwQdyd87bE6NQ5Yt0b/FvwRtJ86+vq60pairM6fZd2ylE03bsnLeya
         pbgNPJwxJDG0EDVBOv4Zudq6UFYzDDJLaAxvR5uZIe04/sHRAJhups2mdT7cYHyu5LZl
         j6Inhqm4UN65w5JhayDTqB6W1ZZiYEUfnzcG0pYRFLGB/17jrJwZFnYWCS9IVfu8febO
         wa9yETnRRvpW5ZaZ71/t1V4weGMU2FnIqMcmohhd9hoU0k4O8s/0a96TJiq/tC39hR41
         DDQ/DyqOjBnB2LcfHzJNmZ8VqsRhOymfoVXs1oJgULufdKjORZeoRVKzzrnzPE7KZ8VY
         1pIQ==
X-Gm-Message-State: AOJu0YyBUUh2KdLi+NxQkr+UxELsU5pA6jva/bDGXyQ4qGs/4kdDD/Ia
	Ki7JiU9EPUjo2Y46Qf9D+NKDZYArDc6mOhPLZyex1lJZqC2WrArgakVj2auaIA==
X-Gm-Gg: ASbGncs+cZkx3QCTs0y/1raYUUjgs/v33lWR/2zeHfKe2cU3d6sZAzp+8UvaZS/1CJb
	z974t0dLPxPEpmSA8OqqRSV2gC5Cebv4zv31ScA4oWye42PEedRbSv31SrLhPPNEqugBmKtgtmI
	hB1OQr2aiqtpzy/EqzHD+/8Ho9jLV5JsRYm8xF9eFpq5Z5Q6bBUv5XLW758QvUg7tCmz2fzR7Im
	XE6cqP7mA/0GsTdrHPXbR/u7dxxTpUfgpBOg6idh/VWFPRJccW9J+U92fFEwwTuQarZFe/qOh2+
	DyLb7azr7ifSd1uFXMH46H+xmPprahptO3446DQUGF5eMKVW1kqq2Dk8sRsbXTT1hTWUPHLDyxU
	ni3N8aF1dAM+nTuB3KhZXPjpaj3bqZFf//mgZ3CTynJo=
X-Google-Smtp-Source: AGHT+IFvRdwBSifmAKqQ8TmXZ1JkfWoJi0ru8I5kEIWTXq/3P88sy9AQ+SfOw8VDwlqMIxj4sugp7g==
X-Received: by 2002:a05:6a00:398f:b0:741:b3e2:635b with SMTP id d2e1a72fcca58-742a98de416mr40902566b3a.24.1747938292113;
        Thu, 22 May 2025 11:24:52 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:8127:b563:a3a1:d465])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c8a8sm11950732b3a.60.2025.05.22.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:24:51 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] mkfs.f2fs: ensure zone size is equal or bigger than segment size
Date: Thu, 22 May 2025 11:24:45 -0700
Message-ID: <20250522182445.2175742-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Otherwise, it doesn't work with a crash.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 lib/libf2fs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d2579d7..396e22c 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1346,6 +1346,11 @@ int f2fs_get_f2fs_info(void)
 				return -1;
 			}
 			c.zone_blocks = c.devices[i].zone_blocks;
+			if (c.zone_blocks < DEFAULT_BLOCKS_PER_SEGMENT) {
+				MSG(0, "\tError: zone size should not be less "
+					"than segment size\n");
+				return -1;
+			}
 		}
 
 		/*
-- 
2.49.0.1151.ga128411c76-goog

