Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212C2036ED
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747986178; cv=none; b=ECM2ZcNbyqxFZrfGZCUI311wYH748QbROvYdX6izNyva4FsTko09tvGpZ0Zi4NHDCyWcIc1J4PIaEyaRX813qD5VpbC6qc/JRxZYQxEchuZ2emOUK1M2WQVwn5vbLLmM6vngBn+d/no2y3TEHatXT2xnQHU6c7vKlOEHRmK6jng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747986178; c=relaxed/simple;
	bh=o8Z9F+s3H5s+WHRu8VrEBEw3xQJt57LQ6mx6MD0qMFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EfrQOPM6h44YXyACaDTdJzbxqhHjETUOlEfo6wbKVRk3nz3i5g5kqrc0EXZc3sWv845jvQ1qChvCZ6M2eWCJz8wUCjaDIJhjlp/knBYgRsmUa9UR7i2gXxqfS0qPTHpXIN7+Z5gwiOktKaqIMni2s33ELgR3QPTLWJUXYdEiG+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=PTptsFHZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="PTptsFHZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso87749505e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1747986173; x=1748590973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sf5oVq0p4V1KNu2SAoViuAhUyDDrJF+OTYRvlB2marA=;
        b=PTptsFHZm8IP5q2doJKqNchdsqFNMVl5fv90piuiMgkSYyHvPjPS2/KHSrk8UWwRQf
         7VBWlsoFp+i1XMCFiNtRd7Hm05CPNYhgom23q0/yYraUPHwZdc9ZZ2B3R/wvcR4tKfnL
         YwyQ/mfq6Hr2euJhGOblWiDP37vP23GN9PG4cC9eHHijXXETCay4vDQHaNe7q3Jm5jpO
         1HtiK4mcS/iPH77Q5nalfwAeRQB7R30NhzyQ6Jg2vYwTbHd/4UmMkdDf5FnWH+RwQP81
         x1fUzrrHiulzc/Ung4lsY+/1cnycCWgz1lQUqrg4WzsW41RmbAxMwiwLo6ycj7KyiN1G
         ZyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747986173; x=1748590973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf5oVq0p4V1KNu2SAoViuAhUyDDrJF+OTYRvlB2marA=;
        b=AdYmkolHCoSzszLg2pxuymcYPUoFPhNZBN3gPPEQLMSuhTl/JlPN3vu7ZQzgGtcUe0
         0zdJoouI7CkgJt1QCLMHz0pw7Wew5rRL7K3N7i/bImRlwhWBLKs5iBF5QnYhU23F+ZV/
         cetLF5c8tJwwFb1UTsI7ALLRfDu+4REouOAbI70EpgVfdtBH7ehnWJ45VTIDaHoVxUsj
         x8odUjyuYArLKtYJtm3oeBQXAtwGhV3C1sxA9pzTQ1S4cqYYNgpr/GqiWv7U7xu6wrLz
         KLoF+zpH61FP/nN4v3vx/Ik1LbT1RNMsEf+tyGF+AHSwA4UCsVAodi7Ik7zaZRBtcbXm
         qPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj6ndu/fv/sOBDhLyTNEAQkezOq1VY8+LxbFE9enoIxqOmnOjst0aS1b1729yyTk+smy+OS9q/iSMXN5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcbk7W4nam7ALAemRWTkMakicxaWggvxXSwA01E++4MOT87qmY
	sF3mccdK7IzmpkvDkMDonS/ptFhQDvCsYB7Rp48h7fYCbOdYJ/uMPMgKdh1CbtMw7sw=
X-Gm-Gg: ASbGncupDgYnTrY1tZVgCKyef3oy1myYGkzVNPeqJLGdh5fhBamasSLw9QpC7f8X2de
	1wnvxBtVuQlPH4unCDTY2eLiA5n9Izo9hIhlmNDQhgdPIRzL7ZytbKWmAZWyMRzEPvDVj7ER/YV
	qkKw90pWU0bNZoPTY2R8ZyeDBtHehdRsv9BJOMsFbGeTCywlC+7ZNCL0GjyY6UKSuLWPKxurROo
	dRNsFwxgq+wxbFkDN7KWdVT20BnunXAXamuJ4oIMmmxWH6MFi5Chh8VtQ2mMyAtc8Dcy2mFlH8t
	qrSh5JacEZQCruJhDJ9+qyrQ5Ser7I2O2SHLsz0V0HW+re7DF48DQcu1tY3BZUpT6uCZrCwXVJA
	b4wM=
X-Google-Smtp-Source: AGHT+IGZ+zW9xJjdx7/pyHegoY0b4cvGq/St5kfIPDWd2+jyQJwKX8XOdYUArgxgNbWKJ8peo6soWg==
X-Received: by 2002:a05:600c:34d5:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-442fefd77eamr257454705e9.5.1747986173415;
        Fri, 23 May 2025 00:42:53 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:aeb5:4cbf:e382:76a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfd54sm137616955e9.17.2025.05.23.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:42:53 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: shuah@kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] selftests: filesystems: fix "memebers" typo in mount-notify
Date: Fri, 23 May 2025 09:42:32 +0200
Message-ID: <20250523074232.15274-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects a spelling mistake "memebers" instead of "members" in 
tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c 

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes since v1:
Improved commit message to be consistent with other commit messages.

 .../selftests/filesystems/mount-notify/mount-notify_test.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
index 59a71f22fb11..af2b61224a61 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
@@ -230,7 +230,7 @@ static void verify_mount_ids(struct __test_metadata *const _metadata,
 			}
 		}
 	}
-	// Check that all list1 memebers can be found in list2. Together with
+	// Check that all list1 members can be found in list2. Together with
 	// the above it means that the list1 and list2 represent the same sets.
 	for (i = 0; i < num; i++) {
 		for (j = 0; j < num; j++) {
-- 
2.43.0

