Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781671D6194
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745158835; cv=none; b=CfCnUjykZO122h3wJ6lCsMuoYSdF7nXNaS1S2HxpZCR+LyX+jvHT+f9wqAW+O5/nSNSJSK3tiZW16rq7tXngdxDoRGEJDRpm/e3khAL5R5Qn5IkI1YLieftnkTyvHXPtTNYqfQYFkrR2w6CwDXFHptGp1BakISP0FKnt8quKCZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745158835; c=relaxed/simple;
	bh=5Q5i7KC4tbs7p5pMGOP2kc91ew9TX1lZ59n9t6QhCis=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SzVjcBXgYI0CTUt8NMza1yuGWopkxy7tkHTz4Jhi9T+ac2NSkH2PMYhLxI8FFyTZ+LPGXHhik3nYaUd43liFyfh73hV5l88f3y9w1uRS4Hb2WzQXXOLhvm0qhJUYFjHhVshXx43mMhPrFnPI95iAa4kSsgjgfO2GutK501uEH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHQKnEbY; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHQKnEbY"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54addb5a139so3529345e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745158831; x=1745763631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6NewQPC+NPAN0p4UbtSvMkN5v6iYP/vCMH0ZciTUOM=;
        b=nHQKnEbY3sueKunyUg9HmgHLPQge2lMv7EO1aidyIRGQFVHMZsKlvPHwul7XnIi4et
         jeUddNtXt9nwcTHiTYgEo4UzFmPj71ZfAm4+IvWZMn6necrkOZ1QoyCqivatFQbND0em
         ytzLHJFzD1/1U23/7tGxKQtuW9rlFkNAWougcO1UKUZltwft6r810zEoirE7vdXyDyMe
         Das6s93qkySkgXst/cIWGcT19Ekbax5qGJEoYMETdbyVZ1qBfcwink0s9fdDc3kYTDKC
         h9WkoEH9sKOWlT9FXjz2ykCQqerp0EWBMQBfCkROwuQC/XszYnd5EDvkhsNGvXra6QaG
         v3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745158831; x=1745763631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6NewQPC+NPAN0p4UbtSvMkN5v6iYP/vCMH0ZciTUOM=;
        b=sRCjtGg4DBuk6vEIzEy1ZowMJTdiHZabbSDUg6aSDU/1DspH8PZ+0j2aleBcsjwxbb
         UE2Vfe9piwrq4WLdZF4tiW0mAP0XniUlgvc0Ft3FigJw2tk4qRgsqVKyrv2C+QNzSO33
         W6G3f6+M4/vOW3ALszOOZ5V1pCm8MBI7SlDhTblErIKRuvfUfQz7hH/daYnSv4Vwq+aG
         ptGehuygtFihntmSFCbTbv0GBuCnpZVFulngh7q2qtyr/6PuU5uO3llONX+jAXYfGABn
         Qi7BmZiov+Ttm4Q+/DJeI8i8yauAxKRL4Fgpf5NSFSUhItwADfb7WEOHhoBpd97HzFxI
         QY2g==
X-Forwarded-Encrypted: i=1; AJvYcCU5V+6lI9wOBwYu2QOnA57XIVg+5xjQdkM0rs9pqct9tatQvf8GHqO6FsvL6aZ7yNGMLzgb7AOAPtkL5SQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKE/ygnBJ5i2ZqTes/Ao76hwcuQG4/+PWS/lfDtHAbTLWnjrn
	c0ypm/TBsEHm2EvjfSK83qJdSmoK71rJfHIiZX7xuHKa4bMkxvg7
X-Gm-Gg: ASbGncvcDceV2E/ch0+WhXdOb7jBGkmazokrHoB6xEKGUye+mQhGMeOvMHpHZjF0gOI
	SjM18a5/MQPFNftp2KUAd/MlzooVavLZ6Uuu4KOUWF5Spsf2+xjGAPTcJfw3P4E+5Ox+JcHSUNm
	I7A5yrzeAJ8RZFP/VV2LCq/CojlFtnBCC+u2T28lCc+f4BAwhA/V2DH6HMkTj36ktA3t4Y8/G9K
	BQ748S663wbk+DofaWzK/J4dkkBc3Umlqin7NSwQtaQqrGYI17r3ccTIe2Gitf56m0snGeS3iha
	3iHz30GW3HrILQPOV5NVdj9BVhTl+FvIwKry
X-Google-Smtp-Source: AGHT+IHE68XspiUjqpUHibkxiCU9kulIe4oZ0gY3J2Wa8Tfz6uswLV8842logMrkr836fRSPJUni7g==
X-Received: by 2002:a05:6512:124e:b0:549:4a13:3a82 with SMTP id 2adb3069b0e04-54d6e627866mr2265440e87.21.1745158831198;
        Sun, 20 Apr 2025 07:20:31 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e548dsm708711e87.193.2025.04.20.07.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 07:20:30 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] lib/test_vmalloc.c: Fix compile error with CONFIG_TINY_RCU
Date: Sun, 20 Apr 2025 16:20:29 +0200
Message-Id: <20250420142029.103169-1-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the kernel is built with CONFIG_TINY_RCU, compiling the
test_vmalloc.c fails, due to conflicting definitions like
"struct srcu_usage", etc. between "srcutiny.h" and "srcutree.h".

It happens because of direct including the "srcutree.h" bypassing
the automatic selection mechanism. A correct approach is to include
a generic <linux/srcu.h> which properly select SRCU implementation
based on a kernel configuration.

Fix it by replacing the "srcutree.h" include with "srcu.h".

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504190717.tJHs381f-lkp@intel.com/
Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 lib/test_vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 6d65ef725d42c..1b0b59549aaf1 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -15,7 +15,7 @@
 #include <linux/delay.h>
 #include <linux/mm.h>
 #include <linux/rcupdate.h>
-#include <linux/srcutree.h>
+#include <linux/srcu.h>
 #include <linux/slab.h>
 
 #define __param(type, name, init, msg)		\
-- 
2.39.5

