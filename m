Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC723CE
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746259937; cv=none; b=dBldwK7xxYETeyUB2x9veAdViX7k87F4ZY6iKBStbFTN2q7+gwehU5TBQW7T5iORDxSuENUyuQA0r9g1/Qur5eGbb59LJGyxImxw9tMNU04az/muqZq5BDp0zR7x/7Kvvl0Eyo6/J9iDWQl1myS4SXSYNcJ/C7wbzLX7WyfTw7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746259937; c=relaxed/simple;
	bh=Yf1ZOTuQY0x/OBkJ6OJ16R3LJBsrKcLba761LCLe9VE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gqCH6z01X/bp722B6rZk51XmaWSMoaGgG2RRCoRzR2xyTwLolk5By/O+bYldcI8N9FhNtbAhizNK7Xgh7QYuxOIGuG4ZZOnVDDgL1t4Ih8999fz18QD0ypLUM+7O0+gt0AEdb7Yh5O9KbmuilOuAc+K8fcBevemHJ4BHw6cetP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tku.edu.tw; spf=pass smtp.mailfrom=gms.tku.edu.tw; dkim=pass (2048-bit key) header.d=gms-tku-edu-tw.20230601.gappssmtp.com header.i=@gms-tku-edu-tw.20230601.gappssmtp.com header.b=ZVjvYS+7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gms-tku-edu-tw.20230601.gappssmtp.com header.i=@gms-tku-edu-tw.20230601.gappssmtp.com header.b="ZVjvYS+7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736b0c68092so2679522b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gms-tku-edu-tw.20230601.gappssmtp.com; s=20230601; t=1746259934; x=1746864734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45TWR44KR1pPyLsCCDqKLor0QPzQcQEOC0Mgar0HlRE=;
        b=ZVjvYS+7AvCBFL8hMPv3OvoWj+LybKCNbOvYR8hGZR2ok1G26K/6vd+hnL7g7BhdoL
         s29HVCbtqnRa4cwv4roZYeb5LzUr3Lgl5vBF7sp6uxDfYaYSsgBVsnzd8WQteTFDlT+H
         fECwpijqR/fj0fWBDvp6sz5AkYwrlKLZuo74dBS6Lm26SXeraFMw1CAcJGHZt8geKvWO
         7JTywJlvDhBp9zWeEz/MSQnu7lijjiIRqMwNq19UsxBwX8Ak+2xBguKd8bEcMli+1eof
         Jd2SkvgMG6rb1HYz414U2FdBHnQTS0n/ADU0anip34DXYW3Q88UTIkzXM/nB9Mqip0Na
         rhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746259934; x=1746864734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45TWR44KR1pPyLsCCDqKLor0QPzQcQEOC0Mgar0HlRE=;
        b=kEhfk/EpRRmMwYyOTwfT68nIZC4ItW5wliHhHxRAjpdZ4kx8fy99dQikpywL/ghEAX
         1qmHoAF+89Stx9PE2f+gQEe/QgPoJ9ElpSesq6TRSgMgn/eboS+cdDri3IOtnOLZVkOZ
         5//VBwZuUpLKI4mBQfXklcv6jkfZ86UVac7P6tBec9VREDeu3TLlSg54qYbpuu1fc96+
         DcA0wK/6PDuOHjALEEWLsTZ4EI18tj9usCCjjNJ6524hoJQsFrixiTChFTPYCs+2NXYg
         k365DmfalkYWjqGfMGW4f70traSb/O6OyIdGpXkL3igT5zAypqFhMIA7QEDfPPyGYEw8
         D/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXa/7ks/u/zIKWIYSTiJkhS1t9hwUnDONivwf2QBNyfLZ080BrJ71Q9NjpesYHFvEJMT07Spb7SZVNXw78=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZUDArvUXi55j+5bwlBbP0u3IKggnHtOU8ZRhSz/Vz78UK3pbZ
	Ql0SVy4hRPWTQIxVJnQSvvJjikhL7v6dVLNUEcII5Qbta4bujgBf/1KEPgfv7iRk1jsKT53WJ73
	J
X-Gm-Gg: ASbGncvnqfu9BsbliKwag1hyh35gE8snknno50dQ5wQ0Mr/2X85RKqna6XqCcsWxyvG
	u42oiM2P+qYxcDA9YTKv8bmTfG7plfK9sMqDketrhvFqaWCur+BWDR2tJeUx+aA7Cg7vwLppdmV
	gzPgG1ImTp+K9OdBUwV0v6CY85XRegw9O/EnJbKlPOIihF25zivCr13FmlO4DzBI4aSn4kfMlSu
	Da3t+3t1gOzs3VjHugtZoNGGlFujQEVUY8Q4kigmpGXc5r3k4ocXCn7oJvuOpcabU8z+2vGD/Wg
	HUzoZd5F/qKMkzy2SIIJXXeuJGtpKhTIOxzgDh6GilJT9G4HwwXpugD/2OG3d3htNw==
X-Google-Smtp-Source: AGHT+IGj9sRAAYn41BD9QGRmnvInulQjkI9AAOiHj5KuJykDTvNqBP63JwOAfkB7Zwn4PkxUKhZXcw==
X-Received: by 2002:a05:6a00:4c0e:b0:736:a82a:58ad with SMTP id d2e1a72fcca58-74058ae6a03mr8040244b3a.15.1746259933877;
        Sat, 03 May 2025 01:12:13 -0700 (PDT)
Received: from wu-Pro-E500-G6-WS720T.. ([2001:288:7001:2703:edb2:c04e:a7f5:9f7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405902109dsm2936997b3a.106.2025.05.03.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 01:12:13 -0700 (PDT)
From: "Guan-Chun.Wu" <409411716@gms.tku.edu.tw>
To: tj@kernel.org
Cc: jiangshanlai@gmail.com,
	linux-kernel@vger.kernel.org,
	"Guan-Chun Wu" <409411716@gms.tku.edu.tw>
Subject: [PATCH] workqueue: fix typo in comment
Date: Sat,  3 May 2025 16:12:03 +0800
Message-Id: <20250503081203.38463-1-409411716@gms.tku.edu.tw>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Guan-Chun Wu" <409411716@gms.tku.edu.tw>

Fix a duplicated word "that that" in the comment describing the
@max_active behavior for unbound workqueues.

Signed-off-by: Guan-Chun Wu <409411716@gms.tku.edu.tw>
---
 include/linux/workqueue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index b0dc957c3..a6dacc0eb 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -480,7 +480,7 @@ void workqueue_softirq_dead(unsigned int cpu);
  * executing at most one work item for the workqueue.
  *
  * For unbound workqueues, @max_active limits the number of in-flight work items
- * for the whole system. e.g. @max_active of 16 indicates that that there can be
+ * for the whole system. e.g. @max_active of 16 indicates that there can be
  * at most 16 work items executing for the workqueue in the whole system.
  *
  * As sharing the same active counter for an unbound workqueue across multiple
-- 
2.34.1

