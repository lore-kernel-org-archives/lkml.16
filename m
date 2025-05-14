Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799C1DE4EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228235; cv=none; b=tkNW739Qbr9ec3PcmqtQJZ+Y9j0qiMEfRODx3AH37EzlOccA7SaqzrdIlqUfvmD9b3t3jj3+tX98wZEQ1LpIXZ1Iv4mvc0AEXYG1LOUPhcSqWLZwM1hJJIahM4npWFf7dyGnOMDbhuGYorXHMTfchzvOaW1DIx6kE/2HAShdkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228235; c=relaxed/simple;
	bh=e7lkSKaWLQNRaXhkexSkV3ZcKPIqKbiU2wPt9WSmx2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iDU+8g4ntUb70IZDqVbVEEztGFuO9uOnbOoO1b23X8cJqLVLbPKnUI+Wx1nKxf+eg+KCuAxoU31hlRQC2ncC9vsMbL/RK4Xq0lFnCsCuD80GWH0EBrQRaheQSgZZN86+XUY9akcr9vV5U4hXLIWB3C2EVO9BrkxZnN7GPHOoAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ro1LgMwi; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ro1LgMwi"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7423df563d6so5454840b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747228233; x=1747833033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1ZoujKyf/xs0p2/ZO20aTN1m2Ug45V4Ok3TehMEsAM=;
        b=Ro1LgMwiwP9F3elYPqY8PmL52P0YL+2p6p19wDb+t/6r3qY2QzYBcHjK4MiPv0GSkY
         UPLc7QyIaiFrEA9+7SdMoV9ygJOuY7Gl+vxgYkxP6IPtQINldh7U5luFHPx9JQIMHaaG
         CFeuhqRVyOih5KQKylc7/rkFulQaczDI5FQ41NpBZRSK+Bj8Wu5OvlomgGpSB0XeXDUz
         9000mdg7XHGFw2Dhb7AJJrWYooP9apPHv/ov9Ke1lmaGT+V3jaKDkXvBnd7754ZEZugQ
         LrIUUdXRf17vMUpYjCcMsJNgB/nY/7fG//wWik046Pglt1PYGdfKOFXj5p+ZMUs4Or5d
         z/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228233; x=1747833033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1ZoujKyf/xs0p2/ZO20aTN1m2Ug45V4Ok3TehMEsAM=;
        b=tjFxBWT9B3aNO7Kg9jtTZBq1e7i0wAdT2YWBF+/XgxYwM4CTeYc+KPi4QyiIaKTXiL
         i3Ob7lC33A1m3eeLC7JKfKmi2s0w1gDNiNWdLoBGadedRQCwTlZv66gb1tYnEr7wUUzy
         ZRH3eseHV2ex6agm9SbUgjst4CDl9xyBNbI4muAu8apWOSniQcOjFNlNeOmqMOM9n5aQ
         Txlh154mzOIpMF1WpFAuCUpQBzFo6RJg/giqkZCPYOZPUE9EypPQuPB/bfzNX/9xdDuH
         +hMA8qM8Q5hDHtv8ZzFDhX4hyCdraZ+6oT43wdIt1/K60waETVDDFIWOLlkHYvDtswzi
         h2Bw==
X-Gm-Message-State: AOJu0YyP16twv+G9I+fAt7zLBpwMTR7tOcfF3VPIFU8e1aJ00ZSReDyL
	bGLt2DWeG1HZai1COxqSKgqRaZtGrfIPTACtF97xG/EhncsCfjVs
X-Gm-Gg: ASbGncurwOHEj2eyIhn4D1GK3oiOPSzxg+yNoHPkySnMXAJkBHnukNGIYxUGj1Ito3c
	4QhgY98bSQ9f9k+3LGo8JkSwvXDbkiujmAoCkGtYJmO2i0AdtFYinxEhOIOnSIP5zPJDanBxv7Y
	PFfRQpFsMaF8DNs2fDFzJ1yDe1gCVHiMs32jNdL7KzCBNfjQ+GBCHhFQ24salCGaJzYbegCTZS2
	cMg17mw/ZeDtli8aBkKRTk9Nfns/7tbVAACsVXCym/2Urw95Oi4G47C6sgJZcoD3VgRFJgghL6m
	KlJdWcoA5zMqN4cc4zcjJeQzMURyI97FtByIn2GTfwnq7j6OqGE3zOwm6evELcvEv6Rs70gg9A=
	=
X-Google-Smtp-Source: AGHT+IGXVnS+rXqpgzc98CG8m4fOygo7OvZMqoNi1QvrS6Xbz1WdKjwg7eG8AdaA7EDpphVO41eySA==
X-Received: by 2002:a05:6a00:ccc:b0:732:2923:b70f with SMTP id d2e1a72fcca58-742892b871amr4873111b3a.11.1747228233360;
        Wed, 14 May 2025 06:10:33 -0700 (PDT)
Received: from localhost.localdomain ([115.21.83.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237761f23sm9531022b3a.77.2025.05.14.06.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:10:33 -0700 (PDT)
From: JaeYoon Lee <lblbjy@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	JaeYoon Lee <lblbjy@gmail.com>
Subject: [PATCH] sched/loadavg: fix comment for avenrun calculation
Date: Wed, 14 May 2025 22:10:17 +0900
Message-Id: <20250514131017.77576-1-lblbjy@gmail.com>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment in loadavg.c incorrectly states that each avenrun[n] value is
calculated based on avenrun[0], but the code updates each avenrun[n]
independently. This patch fixes the comment to reflect the actual logic.

Signed-off-by: JaeYoon Lee <lblbjy@gmail.com>
---
 kernel/sched/loadavg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/loadavg.c b/kernel/sched/loadavg.c
index c48900b856a2..060b0948c78d 100644
--- a/kernel/sched/loadavg.c
+++ b/kernel/sched/loadavg.c
@@ -22,7 +22,7 @@
  *   for_each_possible_cpu(cpu)
  *	nr_active += cpu_of(cpu)->nr_running + cpu_of(cpu)->nr_uninterruptible;
  *
- *   avenrun[n] = avenrun[0] * exp_n + nr_active * (1 - exp_n)
+ *   avenrun[n] = avenrun[n] * exp_n + nr_active * (1 - exp_n)
  *
  * Due to a number of reasons the above turns in the mess below:
  *
-- 
2.29.2
