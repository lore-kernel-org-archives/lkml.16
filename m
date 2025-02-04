Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DAD3D76
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680843; cv=none; b=fQ3cGmKy3aT9pPkMTHkmEGIpSP/FlI8IiGS4p0NqLHhA+Q/afefUcjE8nUgnSqjSkuDrDUWr0QLTG7PKjRVeok65XpIEikzky2YmtHc6T7/cRnaJBhUhMC0une3aTozh473F1z75ZbG31dOF8bIru+r5Bp1lJuR5qVxm3y0ls/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680843; c=relaxed/simple;
	bh=Hc+ILt2Npkxq8laV+GDHVaBUwhxi5hYxpdhenLabHA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nAAl+KfV+seHHQ/na1eiSTSJhH3N2GNpEg/a/WfenkUt0xmZgzDQ+OqNiWe8S2hjczY9rbXAT6yrewepJ+Vtd0E9ehzzIYE9MBm4UIkS3zqH8X/FhGgfKK0rKeEEogoprmQ4agD8UEx2UFDDYYWEfwNbUmyQ6l0MuQmjmIVhCcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRMBqWGc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRMBqWGc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2164b1f05caso97766195ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738680841; x=1739285641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8ttmp0NvexMeU8QQSg6ArXANMDaNCsP5ZfjLcy1EPU=;
        b=XRMBqWGcXJpGpKioMHAs2fVB5Kjwf0u0IZvn4bPcB2bM564GavCByu901AvZi7mGGb
         4Zxb5imLDnMUBQVleDzm2vLpgBfdaYBknR39Yayr4zGdgKG4VUBpWGlxIMXsm4ZDfGzc
         RLjBgUmrsCAZsaT7ApCTrEvpEeHLDHeupqrNQfo8lMxw8qpLwmjYhTPD15nl3ge2TYHa
         aGS1FrloDnal6NBZDj/xBo4qdz7vXCXwNy3TtaBBczTwkuQWLnYSoDLdQhRDl1PiuqSa
         MvG7WIVt5zahd81MTdlDvG0kvqjx97/PpUbzRkDYJ5Y04Qjblr9Mq80sHVaN8J4PYBF8
         pyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680841; x=1739285641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8ttmp0NvexMeU8QQSg6ArXANMDaNCsP5ZfjLcy1EPU=;
        b=hq7sA75cn/wl6+koMbY7q0Z597fccAxLLwBF3r0dcWcxTfRB4GrU3c0Iv9TuQMdl02
         A/R+W/hOZSGrRQeyzLQjVwmqdyf2lrkGcsUWJeT1xlCz9tMK/4NPe6iloZ2z/FWYhvme
         FKvb29v7Dr0TS3GFqv1Tmgc1/Ul+46XYNn/PGkLNt2cbdCyPzD+kh1aA4Fs3LhThdt3j
         TjPzNzFnwPIQu9M5ILt6oYAQHeP3qGcmM/FJUrleAWx/M9qu6lNhBookhCJD8ap+Li1R
         aD184937Go6CxRbzse2x9/ZBGtkFwyC9w1N2uAwvz7INhMMKoIBRQiayHVk92DROjnYG
         o3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVv4QNZZZcuUuSRa+YU9l/jStIhgWHKj6KbZJQyvkeg84Ra15+dUFCUdyRVeR9OyY/boz132D6vBaLhMyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUOTqddApENcerexP3IeZLe1bw73Ji8z/Pq5ltEOAcT0wZsAPw
	m64/Wuvte5W33kgUnrFFGVxmda4kTXGpDdakOjPDUK/tmEA+IiOC
X-Gm-Gg: ASbGncuxhfrpPBfgIA4ebikLC/ZrJ+Q9QMBwP+U5Q0ev9iO4zQmK8BW7hsBf5PwPd5E
	JZrUb5u2q2ZDuMQBV3ZlMP16CnfLTEYo+aKWSenBsE5nxaMAn3G87kVLo1MSQ+GJsIficrhw3IZ
	AaQAdM5CIx53wvEp+ftmhCfcnUomfFgGaQAHSves7RQixuW46urn/D3KoZTTlmeJWZvHv2DkdFy
	HlDQt6oM5vcNnSVo4F1XVAQBhtM+TrqHrfpjjUa9XWhclxJE4D5/60ppJadK/GWwyiihiMPr3Dw
	wK2y5gLW/MFzfSZEULHah6v1BSVsdwAZUjl5+zvEzQvA
X-Google-Smtp-Source: AGHT+IG2lapVMZgZQ9LQSouXdyvk895bbON6DUrnazK4M8yCav3CZgmsqTf4nTF06tw9i5dalZ5VbQ==
X-Received: by 2002:a17:902:d549:b0:215:8847:435c with SMTP id d9443c01a7336-21dd7c55d18mr427267965ad.12.1738680841006;
        Tue, 04 Feb 2025 06:54:01 -0800 (PST)
Received: from DESKTOP-B5TBVBT.localdomain ([175.117.51.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm97257315ad.99.2025.02.04.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:54:00 -0800 (PST)
From: Yohan Joung <jyh429@gmail.com>
X-Google-Original-From: Yohan Joung <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Yohan Joung <yohan.joung@sk.com>
Subject: [PATCH v1] f2fs: fix to ensure queued discard commands are properly issued
Date: Tue,  4 Feb 2025 23:53:53 +0900
Message-Id: <20250204145353.165-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS zone storage requires discard and reset zone for each conventional,
zoned device.
In the current configuration, Discard granularity is set to the zone
size but queuing is inserted into the pend list with a maximum size of the
segment size As a result queued commands cannot be issued.
so we are restorting discard granularity to its original state

Signed-off-by: Yohan Joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c282e8a0a2ec..938bf5144ae8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2320,10 +2320,6 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	dcc->discard_io_aware = DPOLICY_IO_AWARE_ENABLE;
-	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
-		dcc->discard_granularity = BLKS_PER_SEG(sbi);
-	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
-		dcc->discard_granularity = BLKS_PER_SEC(sbi);
 
 	INIT_LIST_HEAD(&dcc->entry_list);
 	for (i = 0; i < MAX_PLIST_NUM; i++)
-- 
2.25.1

