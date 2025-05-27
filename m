Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040D1BEF7E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332075; cv=none; b=ZAV772zlBXERrh7kA/1SnaxKym/oFTq2iVytdBBwFuyFYSxqlW67HxB18LuG+u+LaNqAaFzDkoc8Oht/tCeO0yBWaJ+gSAG9lEIEInJNM0/wZa0EcT0bftUPo+91b80KvvFTdRbsExAsk+3k0VGLCOsWKsaY3y8dXGBrg8CtYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332075; c=relaxed/simple;
	bh=8inumT2GzLnLF6ATSYii0P0+BsCxZazCz1tzjBacIdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkJlrxYuodHkUieMNAPYvXmrjLh+mjcKbpwheZiMev66ArJQXQuOBcs7thoPW1KGJA56D6HFoeZ/KuR2FA+1Oyr9ZnVQj8P55HEg1rNl8UwCsz5kGb0hnJ8RjbPoXOHFcR48FLEB+rzdJQjhfccDgZZ/zXumyvP5MHQxzRRsOaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IGdmhQuU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IGdmhQuU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4d33f971aso1585981f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748332072; x=1748936872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRignQG26Y8syh2NX5Cw/ROaM7UDkzL0aqEqvQ0ZPb4=;
        b=IGdmhQuUqWtqr8aJZUEWGsmzNHT9qC1OPRehOW9dHxHGGppc+/J+5TxIsDj6tdf19o
         7WhMFIfa3iLLoP2DHgRdnu/y1x5PveV6c5p/r6aUSVJ4kaX1JqsQQBRCRkG/5nc068SS
         7B36Xt6Qcz+xUQDgQSH5ghfeO4l4RnlDwHYDkiDmg6hehX3iAwlK8Qpq65uTmcNbv+rj
         dro/UOwpHcVRm5iFU1qHnHyhGZZFOpvId58DUR10ypkNkZ339JEWYN5hXsCxUYiElm/g
         gbFFvDAPVdT3y1RHFql2O94XKMdwnI5dMykCWlvMxn2H4k3DlAEPHDDOFBYERRtisO0d
         VBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332072; x=1748936872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRignQG26Y8syh2NX5Cw/ROaM7UDkzL0aqEqvQ0ZPb4=;
        b=Z10bfL1c5R4uds1+637YVpPkzyrwvLqk2/e9fiN10K7y/WACcHdEXQ7nn61lCsynyA
         hdfONUQExSE3VbuzF/FzKJrgHJQ4bquWG37xkaL+XVZLtMvxICpIyYPYHDKEuo9k2Pq2
         /NZAUN91bFmt6jo1g0HeDo0neZ3ru7XdjnohBStB6gJ3wxhOCMDvDQCU6/Nm9Sk3TjdO
         AjEOAm7lRT1u3B9TrkLQermseRzcJWzpeTQgkoHv/LfZBPJWJZQWdCk5RHrWRM0h+9CT
         K6XFchlKC1zxPSD0CUyrFr9mfPswxSM1o5Ez5cDF+S68pnayXEwp3tw3gk3XxzNRu8eu
         01Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXAfn/IiVnb4K+spvpkfoASEd2J/1BXvb7YZmR5B3q6SDg4JnOBRwpTdvbQNY1c8jwP+smlXpFyzmMQRwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxla1qvXh2bm2K3OfPxjvXf06jKVippNYAMdaegambPtgkc+T1F
	xc5VYYkhrHtf/bwlwVI5R+ffX2B7Jcmx0Jwgy26dKyq5K+QpRYTfBRiHcOsXs5ZAJf8=
X-Gm-Gg: ASbGncsMJcAMYxefTYpBKfEEm7Yh8h8uoZ0253AVVsytR+ZEzeOSDvZ8FG4UwMJjNth
	PvJc0ZEoMq/XvGLEtFgkU1t0Ph9ukTOtIilj8xvga4E8G+SjPkmYS4PPNrqTP9KfIlZzzEZKg6s
	RQxPnr8DS1vqT3sy4OoJqCh8+HwPFppLsc9gBF7SF5exe56Vhx4U58XaV05VTWloWjYpqWwVZ5J
	csv2nPEFGHW3BfF4jfmOprTIbbUev7pe4eZUQwnFJWQblwMNOJWfbZd2OSdaEku4aNnnNAsN516
	GDePdpEut2fl6sEKm1zPYGeJBTTXQbYIGRJIxlt9j5UFpV5adiQ=
X-Google-Smtp-Source: AGHT+IGsoZw2nAtnHF/LZfbLWN76/RtG8pfqU0DqC0oaErakHj1u3x87Kp6fGEtqLxyX4EMwo4KKWw==
X-Received: by 2002:a05:6000:188f:b0:3a3:6f1a:b8f9 with SMTP id ffacd0b85a97d-3a4cb443a5bmr8364347f8f.15.1748332071512;
        Tue, 27 May 2025 00:47:51 -0700 (PDT)
Received: from brgl-build.home ([2a01:cb1d:dc:7e00:a230:a0af:b6be:8a46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3ce483bsm257422165e9.33.2025.05.27.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:47:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hsin-chen Chuang <chharry@google.com>,
	Balakrishna Godavarthi <bgodavar@qti.qualcomm.com>,
	Jiating Wang <jiatingw@qti.qualcomm.com>,
	Vincent Chuang <vincentch@google.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_qca: move the SoC type check to the right place
Date: Tue, 27 May 2025 09:47:37 +0200
Message-ID: <20250527074737.21641-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Commit 3d05fc82237a ("Bluetooth: qca: set power_ctrl_enabled on NULL
returned by gpiod_get_optional()") accidentally changed the prevous
behavior where power control would be disabled without the BT_EN GPIO
only on QCA_WCN6750 and QCA_WCN6855 while also getting the error check
wrong. We should treat every IS_ERR() return value from
devm_gpiod_get_optional() as a reason to bail-out while we should only
set power_ctrl_enabled to false on the two models mentioned above. While
at it: use dev_err_probe() to save a LOC.

Cc: stable@vger.kernel.org
Fixes: 3d05fc82237a ("Bluetooth: qca: set power_ctrl_enabled on NULL returned by gpiod_get_optional()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e00590ba24fdb..a2dc39c005f4f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2415,14 +2415,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
-		if (IS_ERR(qcadev->bt_en) &&
-		    (data->soc_type == QCA_WCN6750 ||
-		     data->soc_type == QCA_WCN6855)) {
-			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
-			return PTR_ERR(qcadev->bt_en);
-		}
+		if (IS_ERR(qcadev->bt_en))
+			return dev_err_probe(&serdev->dev,
+					     PTR_ERR(qcadev->bt_en),
+					     "failed to acquire BT_EN gpio\n");
 
-		if (!qcadev->bt_en)
+		if (!qcadev->bt_en &&
+		    (data->soc_type == QCA_WCN6750 ||
+		     data->soc_type == QCA_WCN6855))
 			power_ctrl_enabled = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
-- 
2.48.1

