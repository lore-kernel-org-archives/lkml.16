Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081231A8F84;
	Thu, 26 Jun 2025 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750900703; cv=none; b=fkRos1UB22HP8rCHIaIbpuze2Kr5QYxUpe17mJBZyCLmaMxcLUP9rGYeJ2sfyfDjeMaYas/Baq2g2NRByV5nChASG9/G39E/WgVICbZKecvTyjcQU6KCNN8NhsqFPRX0V0QY/HJSQXVVdyWwMgVpcHBKrayuOgFrB9LJZPImFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750900703; c=relaxed/simple;
	bh=NId6dVIRM82oZqoe/djI3x5LrQqmZEFk9eESRjH1XbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gwh6hTfPcezhHD1+EXAK07oy8wxzloXNjeh7FHlZSU1LCtSH51qQrbcGKnR0nBlQuOomQ4kreD2MYiFb7qrFwG1EPtFwBpfTA03EsuU7aQHFP+FFlHoqQAgTUVFmBopE4+G98ihgC8yxVZe31bBUjnYcenqpG5uctc8HXT/R/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTH+VM9i; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTH+VM9i"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235ea292956so5549375ad.1;
        Wed, 25 Jun 2025 18:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750900701; x=1751505501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUH60rkmaYOcZLjFXwllzQMjUnApXp6M8TjXxDz/90o=;
        b=dTH+VM9iLSIGtLsc4gpliY6vEyZfmkCUaOp8CCzW1xxBWzPpbM++m0HYfyRgsienj/
         YaDSC+dbgdwcJSx8877LQ+myugP18vJW6ETwT0P+vv1sZg9pY1xWP9WFFvJguLyFrxMz
         ab9/dBI4JPYF8wB+4cXZuamAu8N2AhbNcE50YwCiACgx9T21qaKJ2gMiBCc47QbmcVNe
         DnQrRnMPoZKnDXmChGblKrcw6LAcO5HyiyChUBumOVhQgL3BgE15EdpM/1TuleOMJt/m
         dpfpvw/8tI/p2uoiTFRWfD+lntzLPFCAg4eY97zZ577uQGsypTthulXwpC001TkvWi7f
         PGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750900701; x=1751505501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUH60rkmaYOcZLjFXwllzQMjUnApXp6M8TjXxDz/90o=;
        b=Txs0fKQPS/seI8qVSs0wiAq1KrOU+42muMYpsfA6nu4FkOh3APuUo/N7wj3X7G9Rfz
         UCw42B0p04MLRIyuTVywFmwgIQd5cweHNp7P84WpucOnEARaD7CG4psVfS663nPK63Cu
         x0pNrQv7NIDTNIt/1oNJ51oAZiT6u6hyfwChL7hQuAiouA+DSZL82FC/vs+M7Ul3X/fg
         cwx9YdSCoy1OWIUz0RDComN9DfQ/8YbONgkfZtvGnDV++DtGGayINxzWqUB8smedWbjo
         EBCFDtnUQ4J/QuUbWXh5IqW6sN8OQQTxT3mku4xVkdRmW3Fh8uvoPREAbx4bMIVjCKId
         A+og==
X-Forwarded-Encrypted: i=1; AJvYcCU8a5LETYXnbf9P/Cg9ycUbVCNornX6t0LUxO8TdGeu6xx3wOsFgeS+YiT4ugTSqaUDubnt7FE0bEyDh24=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1nqbhw6C7ykRiDKT1e9xxjsNpWmAVENrkikKcqL0UYjrnekw
	RU8HNkbXK9kQIfE26Uls+GLn/5HZnk4j9wRhdGXTObvV+C8MrvRJ5PN8
X-Gm-Gg: ASbGncucVSqW4xf2wsXdBiOY/8rMa2M99lxC7HQziSGu8mc/37qtUWCMGGNXQlieKII
	ALwZb9zVgIIhX5+3AuLJvpEFOGwU/n/IzqrO/kS1Sn247P05iuPPyH59j4BkHvLze5yT4z/PPeH
	KyxzdtpZN5lsVtGvHl6bz+yIK2vmR6CQrnKpufqCG8WYEiW6DIzS2tyOg84KKG6vscBhpJWIPTK
	QWQTfC+/yR9miT+JqyOlaRgzqpei0Q00egoZEFrVVDbLt5UwCRIVWVTefKulanEYdQ6WPirLeP+
	sNcTnWnRpS5Ry7KK83pHE9qwzsXEgvrtYbghhJifGjDHk7k4ubgmsK2247YRKA==
X-Google-Smtp-Source: AGHT+IHG4Nr8+zs+gy4ZXyJCScP+aECQxrOdMQjGdXTeEDnCFd748e6PydeLLNA5lNjHk/muMZiYIA==
X-Received: by 2002:a17:902:dad0:b0:234:d399:f948 with SMTP id d9443c01a7336-23824044836mr84127815ad.33.1750900701305;
        Wed, 25 Jun 2025 18:18:21 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d871f10fsm142710025ad.233.2025.06.25.18.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:18:20 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 25 Jun 2025 22:17:35 -0300
Subject: [PATCH 1/3] platform/x86: hp-bioscfg: Fix class device
 unregistration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-dest-fix-v1-1-3a0f342312bb@gmail.com>
References: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
In-Reply-To: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=NId6dVIRM82oZqoe/djI3x5LrQqmZEFk9eESRjH1XbA=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkx869eCVs3W3zupvB21blnFWa3/nqXYeE6Mbaz6gf3L
 LYV2cGPOkpZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAixxwZ/krr7GJT2XVGcMn/
 mp8tsUvubP8+w0Vv/akX2Q+XMIi3q+kyMqznlp9+qiz5eqk2986pKnvbPZU33XstMi3v6N+31r+
 WcfIBAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Devices under the firmware_attributes_class do not have unique a dev_t.
Therefore, device_unregister() should be used instead of
device_destroy(), since the latter may match any device with a given
dev_t.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 13237890fc92002e7e730b1c235ddf068a6737cd..5bfa7159f5bcd57385a20fe9ac646597b320a378 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -1034,7 +1034,7 @@ static int __init hp_init(void)
 	release_attributes_data();
 
 err_destroy_classdev:
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_unregister(bioscfg_drv.class_dev);
 
 err_unregister_class:
 	hp_exit_attr_set_interface();
@@ -1045,7 +1045,7 @@ static int __init hp_init(void)
 static void __exit hp_exit(void)
 {
 	release_attributes_data();
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_unregister(bioscfg_drv.class_dev);
 
 	hp_exit_attr_set_interface();
 }

-- 
2.50.0

