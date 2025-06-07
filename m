Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F11C831A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749278499; cv=none; b=pDuHyXnOwqKdgtOt+iuPXqpTNAfmXW0p4RF59S5N6yJGNewbtZZoQr55x7Y1H+kYb0e3AbzdFY2ZRSzsRE9l7qvXybSeJndZlYopjQHrpi47E0XEyU8HVrz6G6roMffM+81ZcfhIj0IKzhkbzueJZKNyQzv08VGsh4BsfedrOhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749278499; c=relaxed/simple;
	bh=h691Qt/j2VKm8+F6vzU9oPMoNphVtEOkg/rLHQKR9vE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlnWMDWstYxINodsW/H429PKR4/w9CQJZ5JrY2EDOUrOyX+vK051RC+tszrCPjazONyLyEow87z1j8vr1VAnmXFxOM8evtLgGb7HQf5eLo57Gl4gIOSW0kansArO8rjTRwlw+D+lTZhOEmozqKF2XUgQerHGRjzT5pnpb8LtWvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7BnZW05; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7BnZW05"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1628320a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 23:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749278497; x=1749883297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxVWbtZN8gePoNauFqZ4180bYkI0rNzmnFEMncYejJU=;
        b=S7BnZW053VTuLY5k5gNPAul3gerrQVRihw2IsPPtgk20zY8LFyCP2dqtt29ByS2FcF
         E0kKCMyaE9areXMgogKArmAMvg0zvOOTCqv44oF2NyWnDslDIVg5f53d98i2ElLbaS7J
         KgbKzRhNLg7eUncL+0NW6hT6Wq9KTmZR7w1uFqm5fK+qn26s9ccFlBUSuoD5uc+CYkIf
         JHSxsWd1fR2KsJotH1A1PGYNHQFdNr8xdUjQW9kBBXyPYxiTCf5cFfaakJPVQhxbWvY0
         vvAF3CoIGJ8ImVAsuPTRhrwQayDL1/2rDPtO0vI3O7IhrkOSH1Cssk7g+v37v/9lLPqW
         Hicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749278497; x=1749883297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxVWbtZN8gePoNauFqZ4180bYkI0rNzmnFEMncYejJU=;
        b=aNwhq0xx08gy4eQnsBHbA9qaLK2IM4Bkx9wb49o5txotOMsneVeTFKx1YFBJsE+udv
         cjtaw5j8YZWlRWsjTnE9qo2zitIQDsqeoFBvhIf9aOYZFj68pS3JmOdUwVDniFjuCBIA
         Y3cE52SsgO99BKfIw+Kb+3bh1QEE4djILcSqUWNbWlyxeets2nuXFk05JW1bD+LvhzLi
         Bf9xrIiY4bpiBiJ5f4y7ERuK57bWp78dRGeDDLkMoG6UT6j8LedHo8FtSyoM5dZd2A+i
         jWMlHW9sLjITLHMfecOu6OrA8U9x6jAZKRQp+lpz4dZZ4cMcYUpTCxW2zcAo25QfkXYV
         Rgzg==
X-Forwarded-Encrypted: i=1; AJvYcCUhK5uN5JVUuX5uTbRDWfpI/q7LtBvzGlvM6vInB9SS6rlWHldwmQYGngVrA5lSVzHrcEyL9KGS0WroJvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznftK1aQmamwGlYigZdnvnAJyjF+YEA7xwbEC6pZyQ7pb9xEav
	V8SrI+7n+Kyrm+/Q6XeGkuv2lWiev4QhVGXL98vmlZ1oxumZ+jMTov38JMv3Ew==
X-Gm-Gg: ASbGncvWpKUdL5YQxrfgliS0NeREfJPgXHhN41FWECvtrwbqfRb/2i7OWZVBDANOMHP
	6MmadT8dKbTGRMXpCJC8WQuTB8V28xiDtFuFW62FvleTtbvY5s1foiYQ/FznAEPITt9OljA27X/
	wuUJOyAWlNuOwxJ8bttYZFKn1R48aVKiE0Zbk9WXtLF/s2d7DWsvCJ5A9HXnPldXXGCQupanunb
	gyv+U3dMAU32JsqiqX2o72puL8ahFMQnAz9h2bSPcE70g0x0HL1EFDIjlaRVH9ZpSOUHm/KcXCB
	IFb9wShDSaz0nQYOzTh1P8EIdPY+fzh1ujNtzQSjIEFlV4ogvZquGfqMGg==
X-Google-Smtp-Source: AGHT+IGuGPffEQKdqaSPm55b1wP7pImzY+C+2AhhN6B1O18fxmwjop+wDZWuoMxkaRmomuASKfiK2Q==
X-Received: by 2002:a17:902:e88a:b0:235:779:edea with SMTP id d9443c01a7336-23601ec3841mr96019215ad.38.1749278497555;
        Fri, 06 Jun 2025 23:41:37 -0700 (PDT)
Received: from PC.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405f30sm21762255ad.177.2025.06.06.23.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 23:41:37 -0700 (PDT)
From: Sheng Yong <shengyong2021@gmail.com>
X-Google-Original-From: Sheng Yong <shengyong1@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	shengyong2021@gmail.com,
	Sheng Yong <shengyong1@xiaomi.com>
Subject: [PATCH] f2fs: fix bio memleak when committing super block
Date: Sat,  7 Jun 2025 14:41:16 +0800
Message-ID: <20250607064116.2993239-1-shengyong1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng Yong <shengyong1@xiaomi.com>

When committing new super block, bio is allocated but not freed, and
kmemleak complains:

  unreferenced object 0xffff88801d185600 (size 192):
    comm "kworker/3:2", pid 128, jiffies 4298624992
    hex dump (first 32 bytes):
      00 00 00 00 00 00 00 00 80 67 c3 00 81 88 ff ff  .........g......
      01 08 06 00 00 00 00 00 00 00 00 00 01 00 00 00  ................
    backtrace (crc 650ecdb1):
      kmem_cache_alloc_noprof+0x3a9/0x460
      mempool_alloc_noprof+0x12f/0x310
      bio_alloc_bioset+0x1e2/0x7e0
      __f2fs_commit_super+0xe0/0x370
      f2fs_commit_super+0x4ed/0x8c0
      f2fs_record_error_work+0xc7/0x190
      process_one_work+0x7db/0x1970
      worker_thread+0x518/0xea0
      kthread+0x359/0x690
      ret_from_fork+0x34/0x70
      ret_from_fork_asm+0x1a/0x30

The issue can be reproduced by:

  mount /dev/vda /mnt
  i=0
  while :; do
      echo '[h]abc' > /sys/fs/f2fs/vda/extension_list
      echo '[h]!abc' > /sys/fs/f2fs/vda/extension_list
      echo scan > /sys/kernel/debug/kmemleak
      dmesg | grep "new suspected memory leaks"
      [ $? -eq 0 ] && break
      i=$((i + 1))
      echo "$i"
  done
  umount /mnt

Fixes: 5bcde4557862 ("f2fs: get rid of buffer_head use")
Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ebda6834ac2c..57adeff5ef25 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3701,6 +3701,7 @@ static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
 		f2fs_bug_on(sbi, 1);
 
 	ret = submit_bio_wait(bio);
+	bio_put(bio);
 	folio_end_writeback(folio);
 
 	return ret;
-- 
2.43.0

