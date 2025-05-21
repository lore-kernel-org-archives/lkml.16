Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995250276
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856469; cv=none; b=hR6iIKXyb5UBF6OGOBhq+G2ZQg04xk1hriocSTpRdhkCur8I/3rv6msR7VB0Px0ROnlDhPZt5KHFztD2WP06UZ5NYcZFVgF5TuoLXBoBqYCPXCabDiRar5avbP2qXaGuAIVeuQw/ZoO74o0MVF5aGDmDzX4x7735p091lVawMoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856469; c=relaxed/simple;
	bh=dTz8Pl6rNpP6x+a81PzMdYafrwNbKhlcB/XNCRDHoX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CITgrnkMP5KJL4+Sidpv2OOt5ReqxhbokrAjZl/HqYfFNGHwDTYkEWneC3WHEpwi5CTunUHNTOchpGpgTF1BNHu/z6XCICdm+g7dP1mWzPdMYI524Ji480BbfSu86OzTTqPKWjvvGL29KWhbRJTNgwNMoMZ5/6VfBeiGphv8ofw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNBSDqnV; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNBSDqnV"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c277331eso7123823b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747856467; x=1748461267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xoEcX9Glc+doxMDVDNuceQpM6MovW7t4DTCzMcR2Xs=;
        b=HNBSDqnVkE7blsClsWmgaZaDcpzbHl8fXu+zZYH7O0V+2mkz3rg9gigKr4cU7QcVrr
         Xl6rMKoUIqc0pwf024VTsYllOSv3xqpiJJEACWXyPm5lp6wB54y2IvA6zZUWv5dGJMxf
         TxN2FL+llKlCmTD0OIzD1iVL2AzZEy+/ne79DT5SUCjjHVm4a1v/Yc6fDyo0+3APsbeE
         F0DBixGrOkmJPqQkQuOQgGn3wkeFySuVu35bqojiiJnGaGJIbYwURuBQY0QiQ+J0Uj1r
         9e7b2L4BOCPLw8erIDJ1B0HH5KrTH8Tq+HIjoVlUqObk8S9SU0CyDAl2Uu78EX91tV7U
         6sJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747856467; x=1748461267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xoEcX9Glc+doxMDVDNuceQpM6MovW7t4DTCzMcR2Xs=;
        b=dqgSv9es+3cerSzkxs+lPxtA3FwP5I9WjpO5iUmgiN0wBEsFqVFwEZKpm45TsptOFa
         a9GDpxXDOo7/iMjbBIsajd01py2vniNjyUufvFTgBZJ8Fjj1HNwfIvzJoI6UGW+6S5kS
         q0MiHwKaUkp9YSNObe68etykZBwipqtjBMnrzjvQ10KDOd0SxNBr9bsEzrgqDG1QMInA
         EyV85ew6MBXA7f7epzWRF9z5dU6g/CVTGytC1vUU5J+qSGMKprZdys56ItKvHJ1PBSA+
         ihZ9aDKRCGhpfw9Gv1yV2kLdVBxrfSLSd/+fLvM7QYwAsetQeg5dwhPSR81cmlwFAznH
         CRZw==
X-Gm-Message-State: AOJu0YyyrtuDkMGPaClPT3QP8e4ZCH4FGcGbhOUOMnQQzuwhCVgE+k9U
	YwGDs4bVLziN3LA31lnD1mjUpaS7uZqHgxbFonkqpFpcef3qw1liQELKQbjsXQ==
X-Gm-Gg: ASbGncvJ2lk+4olijxrqXkCXUcPH00ab2UJupPNsnjaYzOcmaf2MwO8FlBtJ+o6gZEU
	BtVbNTUzz+pk4XNl26feCiM+jancvSJpOCVCUvZrznZiAI4CWXsl0KNlsIy4P8hKtVd13YOvyAm
	Zazg2OisK93E2osoulOwBOPIPuhK73NqRyIzPO8Us2Zm6OJr4qUpUlHg6myHuFeo0zFhxjJwxB8
	e/ZVuPqZ6z0e5eOBjt6mKHCkKn/UYI55l69ygMrBZUk7OBL9Rnci1+uSSdR0Rc4DlWKJlPz40rI
	Xw/rJ30Jy2sP6iM5Vff1fDzOmVFtEkIr7bbstyce0gJS7fH0r49yix65xg4up/YHe6eLUjbWbxC
	gLs8bAtnHtOI2hPpj8PIT/OnojOlSIMY3Ym+nJJOVo/o=
X-Google-Smtp-Source: AGHT+IFhMRxZV8JlSsA11qtEApD30y4j3LsC1f3X7v7BlDfnc7+l1GBtGmlbSKVghVRBzOcQBIaQ7Q==
X-Received: by 2002:a05:6a21:168c:b0:1f0:e6db:b382 with SMTP id adf61e73a8af0-2160d5f2f0dmr38020648637.8.1747856467169;
        Wed, 21 May 2025 12:41:07 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:a588:8662:c254:867b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb084650sm9977857a12.61.2025.05.21.12.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 12:41:06 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] fsck.f2fs: fix null buffer error with dev_fill
Date: Wed, 21 May 2025 12:41:00 -0700
Message-ID: <20250521194100.1407220-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Make fsck use dev_fill_block() with zeroed buffer instead of dev_fill().

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 893eea7..4d05e1b 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3526,15 +3526,22 @@ static int chk_and_fix_wp_with_sit(int UNUSED(i), void *blkzone, void *opaque)
 
 	ret = f2fs_finish_zone(wpd->dev_index, blkz);
 	if (ret) {
+		u8 buffer[F2FS_BLKSIZE] = {};
+		u64 blk_addr = wp_block;
 		u64 fill_sects = blk_zone_length(blkz) -
 			(blk_zone_wp_sector(blkz) - blk_zone_sector(blkz));
+		size_t len = fill_sects >> log_sectors_per_block;
 		struct seg_entry *se = get_seg_entry(sbi, wp_segno);
+		enum rw_hint whint = f2fs_io_type_to_rw_hint(se->type);
+
 		printf("[FSCK] Finishing zone failed: %s\n", dev->path);
-		ret = dev_fill(NULL, wp_block * F2FS_BLKSIZE,
-			(fill_sects >> log_sectors_per_block) * F2FS_BLKSIZE,
-			f2fs_io_type_to_rw_hint(se->type));
-		if (ret)
-			printf("[FSCK] Fill up zone failed: %s\n", dev->path);
+		while (len--) {
+			ret = dev_fill_block(buffer, blk_addr++, whint);
+			if (ret) {
+				printf("[FSCK] Fill up zone failed: %s\n", dev->path);
+				break;
+			}
+		}
 	}
 
 	if (!ret)
-- 
2.49.0.1143.g0be31eac6b-goog

