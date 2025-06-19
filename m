Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57B225DAF9
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322726; cv=none; b=Vp3xaE1kW8DzJeD2oAU4kh1FmXjlPusCgwKI637qFEtRTtVoST1r2QCj/nP5h7moS2prhdonaVQeGyOq8WuqSfW0xJnqsOecIfNqrvNc1DJUxw6jYqs2KbgHoPES/yp/J7oZyirL0nJuRf2m8e3xif6ZNUQSmEQH0Zw3kFIXUDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322726; c=relaxed/simple;
	bh=pj6ooHPpY02Xgn4aouAqvWLkf/SUqxgBJpi5NWn2MK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l675Z7uBFj9/wv4qSceMA2dE1nYZ2RcnaW53laoRRzjg9RjOU1ULAJmv5xpGH9LH4yEL2PCkhu7Lpnx9jlYdanrmj3d/vCok3Zq/pyfTCvAcgq/zOrfNSwMcfxI3mUV1fLH8hfh6yc5epMrZcE7Nh5PFLMURoSdbBIYycy9s0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcIfA1pc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcIfA1pc"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so936458a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322723; x=1750927523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q39zMSY2QXSvAessIFBztZZAf+LCItDf8l0+pCWd8Wg=;
        b=KcIfA1pcEFKKaZuqUyb1b1V8nRsEDe/YNDoJZKQAedKhmDubVTn+MMIoP/E03dEg19
         Zu+gOvUm8sTRQHPRt3O7xDaFdq876CTr0ASH7tBxa5wz8qtx7BFUnUKdkik8eP0RHNH/
         1VyngeOfEC+lYHrV8EAp3Rffaj6rjI9k8HNMXJpl2Cn9Gd1w/c5eU7tHnCk3/6lmy2sz
         FveQUsyknYeDDPWUiLtP3Ypg6dJ3JSchFO7uvFcwJFFUM8y8YCldf837OCWHJ+QJHyJG
         QDTjyaA38WRQwKPc5CLMl00Cvn3iFxxK1ZmjU9WwuS23cj09UTNZ+X3WN55qufd0R7Ia
         ++mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322723; x=1750927523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q39zMSY2QXSvAessIFBztZZAf+LCItDf8l0+pCWd8Wg=;
        b=u1hyHrNqkO5SohEjCbXvYZR3DlQgFLebO9fRkp38Tj7cg/Oft633149SvyRgHfkuuI
         3Q9eh6p24isr04CtisxDN123dwv9TIq4XbECW3znW8Cb8LvjUQdMG3FEGZR4EYHTM/qR
         fIxySNwMiWFZBkIZOKZcxyNbFbPnmqZjxxRfS8l+Yp6NGDhu8t9GihP7p9D7v9Uv7QKi
         Mhik7OPnHq5PhWCZDiSni3hpTfGm1CizbSOM4mVTPOK6tlttTC+xhdNZTg1LR7P/9IA4
         xxizo3sW9QI0phc9Ziflpw8jDXyMnyCYNRLYm4L+CGm6zltet5ztOR4FdSgAkDE8BZha
         NFkw==
X-Gm-Message-State: AOJu0Yzl3OBEo35Etw/V9C0LswvmyICM4DFZeNBZ2fn/hQfh8yn9rnw3
	K5d2APH5HE14lK1tmDvc20RxAPNLOb/Kx1doT+VcRDujyVRkv/NwZUAf
X-Gm-Gg: ASbGncuhdiQ4Grnufk2dA+Nr7lu2ioOaiUUWghLDmjLFUqmcGvj6QEuEuuNpIZlqiPx
	kzVw0a4wtKrzQn5PzeGFaUbpoiq8Zk0GB9SmK2C9NtVTE0On0xQqkpfvIozwkgbValWRqch1sdK
	gRWZHPpeVqXZKRZ7xrKmtpjHMsJLZos5Amjb19843+yFtyi1vQwOweBEhhEcqUlRdjPdsrjdqoN
	EMb0z4uOMHk+4UX03UJquMAe1J24ePBxdb93j/3c5bmAGzetNVknFxeamu/Pkm13huCepoOUiZo
	ei8IT0xPoT/blf6kcAiIlLqT7pK4S/FhMGBXMXUyte0JmLloN95K4bq4svHLgoswue/kht1Qw0j
	2CHPwgQ==
X-Google-Smtp-Source: AGHT+IEtgbXlUI0CffNxw+nr/zbns5q7H2q+wq2PNORA4Hn5YeiYyblJ9ZadfIi/qu91qFv+IJUZhQ==
X-Received: by 2002:a05:6402:3592:b0:607:19b6:8cec with SMTP id 4fb4d7f45d1cf-608d099f344mr18743835a12.33.1750322723202;
        Thu, 19 Jun 2025 01:45:23 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:23 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 2/4 V2] Staging: media: atomisp: i2c: removed redundand debug message
Date: Thu, 19 Jun 2025 10:44:20 +0200
Message-Id: <20250619084420.146151-2-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix: deleted `dev_dbg()` printing the name of the function.
                ftrace can be used instead.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 857d7175942c..6fc39ab95e46 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -779,8 +779,6 @@ static void gc2235_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
-	dev_dbg(&client->dev, "gc2235_remove...\n");
-
 	dev->platform_data->csi_cfg(sd, 0);
 
 	v4l2_device_unregister_subdev(sd);
-- 
2.34.1

