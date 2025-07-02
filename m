Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE5C1D63F0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444880; cv=none; b=GfJ9klEaGqhb1s7grGz2alUjYoZuQQ1XIo+GtgqfYPAU2lEQ0JOIKSE79y+Km0BO0mcXnVaaFwAFy/g+I2KaRfCZEHdc1lkuMdy0VFA/NPv84FX90OZkomc3zrnxgv/a4VnC+KpOxNEjtt8CvSpEyiOsiodDSiEUfNgHgrV1p0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444880; c=relaxed/simple;
	bh=CXikqOqjhdX1XMQZLRYkXb9lW/8vfMc+0VDqlz8C/4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zxken3KyRbDwt95UmchwEANTclqVy+jOncgJlfGoxfm9T8t/d6xXF3cGfnowlXYgLrz8iQ1uMf1GcJ0dNTNoj6Ci/4DPJ+Ur7FOmXPbwLmWb7TJlvq5iy5bF0Y0j6MeecNbSvbAyOeJANrPZM+lWcCfRQQaqzEnSlLdrWgSmaIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKOoFjHR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKOoFjHR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235a3dd4f0dso40819265ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751444878; x=1752049678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ioRIU3WapFoxwuxZYt5nbAQZ+2QUezh0cT9N9+g95PE=;
        b=IKOoFjHRakokPMWwSSuIZkxdIYSMdXoR1vbrTox5Tk7zCzX3QNL6eYwndpGasa97Tu
         Iz0eusWSYMyJDElzrnVw9A1yG/E+Fqh7Rk5JHpjpjDXTtqL5x/QMqVPM8oTDvwJHmj79
         owqmbpxe8QyLQLp7f+rJhYkxQc0ApffUk8296mzvhkXYIM+RLY1AWOSXqiyXuBiBhekg
         mzF303BiaM+O2U8Ez3gWQN7SKEZMxSLRXlpNRZFP1JKmIHvFxDOTekzmooTUHXuf0tBA
         ZyMlCp8OPzRdfD/KefpIlfA+T3zGTavQgYn4b8KpxeL/S3VEvK33d28dMxuAiGY+13cT
         NBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751444878; x=1752049678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioRIU3WapFoxwuxZYt5nbAQZ+2QUezh0cT9N9+g95PE=;
        b=d5bYk9jO0J1H9zcalRaKOMKY/BxvmoZfZAdlqvUQN8RB5EEvxOIbKUwM5n7Helg0eq
         7uXjP9G5KirUFAg1fs2ol3AUOmeik1gGi8mZQp+/Qp7t6rVaBI9a1iCCV9zR45jSwAwN
         E/XoLCWe67F03NMEqpNvPqkVengRYAyW4cXfBQWS/SLkMmlEs0wYZ2RQ1cHGwDCZTM/M
         YpWlVUBInIjzp++qPz9sEbxzpdRZJCvEdiaZS31CI9eO8SxHWZLqmwHVKE0lYrnpPyCo
         psxHFl7jze/ya9SXRxqpyI96sV2VXh9fOWlyXPfAEWl/MriuI4rA50sJCBxpOEv6YZdC
         8aNA==
X-Forwarded-Encrypted: i=1; AJvYcCUhV8aoZ8EcqoR30IVPSfa4cBqe6sw3RgMPjH6x3fs+HGLjIvM6L7LeNq1QDgGHo4f9QuVQ4G6RWCewcII=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyV6LdhSiFfOexeOqyxwcxl0abZfu/u4lmsHQBWfzYsPIJZbn
	GjM8SieGMt4exNJ/AfBHGrP7lQB6VVgV3IZzNFUbGngYIzr9obIrwNvx
X-Gm-Gg: ASbGncurpB45E9ZQ5iGy+5/CSHdqjmesunrhKzYe5lDWrdI3Yo+G/K5YxwOoOQEUs43
	UoFXOLrAqsPx8QW934EsaaYiKDlr57VguOyd46/tj1a02IB3Dbi4nlnFTjjZSjd1ra2uBc5Xg+W
	CULI6nPM3J3wX+1X2m/eDbCTetqYr9krmkoBIgUk/Ehlu5mIP22ozrzIw8bzHPGdJrEyKhdDiQx
	SXDKHxpk5rwdnXm2YZEVv2y+9jE2Vb30Zb6/0xXwQaIofvBsC/bjkWKWdzjUKsSoeeddFogQoq+
	HipgZmBTxxD2vAalegBGKPTemXAGYrd7jqcAA66kkh79/i+2WwoGZWlYg9yFMvEFfCZVLJFVotk
	XfMGAqxZr
X-Google-Smtp-Source: AGHT+IG1sXv7QQvEJf7OXRcaTMnghQ5ypFwjnUoOL1kYYbdKeKZtxVLOC2YGzQ0ssgPn5EOwpjXxIg==
X-Received: by 2002:a17:90b:57c5:b0:312:daf3:bac9 with SMTP id 98e67ed59e1d1-31a90c64e3fmr2648958a91.34.1751444878040;
        Wed, 02 Jul 2025 01:27:58 -0700 (PDT)
Received: from localhost.localdomain ([118.46.108.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54379f7sm18077928a91.34.2025.07.02.01.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:27:57 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org
Cc: akpm@linux-foundation.org,
	vbabka@suse.cz,
	rientjes@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] mm/percpu: prevent concurrency problem for pcpu_nr_populated read with spin lock
Date: Wed,  2 Jul 2025 17:27:49 +0900
Message-ID: <20250702082749.141616-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read/Write to pcpu_nr_populated should be performed while protected
by pcpu_lock. However, pcpu_nr_pages() reads pcpu_nr_populated without any
protection, which causes a data race between read/write.

Therefore, when reading pcpu_nr_populated in pcpu_nr_pages(), it should be
modified to be protected by pcpu_lock.

Reported-by: syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Fixes: 7e8a6304d541 ("/proc/meminfo: add percpu populated pages count")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 mm/percpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/percpu.c b/mm/percpu.c
index b35494c8ede2..0f98b857fb36 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
  */
 unsigned long pcpu_nr_pages(void)
 {
-	return pcpu_nr_populated * pcpu_nr_units;
+	unsigned long flags, ret;
+
+	spin_lock_irqsave(&pcpu_lock, flags);
+	ret = pcpu_nr_populated * pcpu_nr_units;
+	spin_unlock_irqrestore(&pcpu_lock, flags);
+
+	return ret;
 }
 
 /*
--
