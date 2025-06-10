Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F45234987
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566326; cv=none; b=HXYcMhhuopJ5tHgpbtUdteV+CrJ0v9c2qnFm9IUkqTGScZ5nvmC7rk67xtQBqTeNVyWJqmj8qahXjLYjZUZxo54SlfcObLpRMc05xfdWqr83OLTPBznAx2686A8UnYv1Q3PgAs3/Id0wJAXUysPGYl2vlJrMirVXlb0iBGXqPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566326; c=relaxed/simple;
	bh=n/8Q3QJmovEcO99W9nilHTg0Ks126Kz/UiSEWmyIYZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWwmxvzxJ1PQ6mCqNLiNONFZX3olV8gTsiWlINqw4PPdNkIVO7XnNICDq/y/5F+7n9OQTztIFsrvm94x5BDSSRPiOFyvKHI0hxhh6UuW2x9qpCNxV3Adn7uh+32NF03LTneK63n4hfpidnA5kvs3KTU1SctgI7twLk1Wvik5CEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ekiq1JCv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ekiq1JCv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so30046805e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566323; x=1750171123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLj7DWR3g91ZC5MBjrvyVrHQMhHkaM2qnHIpKV16L3g=;
        b=Ekiq1JCvHvswu8hozMOOM//VX0g5EPJfeODi2ICyIXpdkxeyPDphdJAdFSVsfly/Gy
         KvZSPgSmoPOuYlwRB+8BFcWPkXpAEN+VhRiC+ydU/INWOhMG3OH5sqaBju2EvX3bilnD
         eFJeQbyd/x5J4eGMaCIH9uzk3PMTPftGDOz6VUCy6vyAUqhxQYIagFWif7Ps2ohh2nDV
         /hFM11+FocBju2hzPiRIWHazGjh6TYIUSRI13pGQOGvyuzNkN2rH1A+0rEEkUAGXfBYw
         nox7aSpwF/nRh4uwhgrJi7gntYs3SzIWejeIhJdrLhCt+wC8dfmuvstRXHf8c2QNBVo6
         lfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566323; x=1750171123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLj7DWR3g91ZC5MBjrvyVrHQMhHkaM2qnHIpKV16L3g=;
        b=OrcUSav+bn8hb2/z326Ll4yjZE2aiKD/8aP5KL2fwq+lthp3kcEPAN/PBMtQCd78Ui
         vOXdQtT0uC+AKOlqGFy83w+MSiYnrAuRcf6OIRMTojbfwbl/jQd+tIcGPbsLDFdzQo9/
         hIySa4spm1eWClDqW/UQ/w2JezXT1UaoDRqHqkLkC16C2/2MOuipqPDtpk8Uvvu1vlWf
         Y7rr5i045BruNO2FrbCtlgEpu0qv5SyHkd24RDuMf7KWlvtL/Y7t1Km10nFr6I59LUOd
         eEOABJt8KDPkJxSMOQHSUZruDl2m4JMdhGgKOAtNSZSZbLWf7Vdi4hwehcGBvrSBaFix
         poZg==
X-Forwarded-Encrypted: i=1; AJvYcCVR7llQzNBBTGAIwt1kJi5XoPPjQ2cickbtWGrGHxGcWHIuYb0odCLywdSbmqk87kDQIw0u1z6viOPTzE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPC8s1gL+ShizXA0cTuDKJ0oISvCBsM8oyU5l2wLN7hcvuOslp
	yL9B44Cwf8UFe974Y4U8ClOax63oWJ1CG2QqYkg13A6mBLuwpaQ0DmvGdXEl7uP4wt8=
X-Gm-Gg: ASbGncv7jakbUQ/eifss5no3zStNUhE8XpA0qNjU8gzbTbGzj2PjYOpbZjNCjSfrYfF
	O4mssE2BLb3UM8JeZ0+tidI20z8xJsW4b9sE8h8OM2mopj1xv5oAkh4flzlwSPSKVFdssfK2QLm
	RcD8euNcrOW5+H1552ve36nMnoVRjMRmYg3cHK8vofIbyXmq8ev9uBTH5WaYHlFslTs930vl8Bp
	NvkBi82RMJCn8eg7J9Z6X4ouFyG1W5QfK5BC+GKF/W05NAtyF0LzFIiR36wRXQ+z5gZ8dM0fV7o
	8JQWtqZYaPciKBcPp0OjZCdonglDlkMYLR6h3kCuDa4l8nonYm1m
X-Google-Smtp-Source: AGHT+IEywg6w59g2mx8KQEA5DxZqFCbrLHoGShus610IZqWOu2oBuwgUJ83xT3nNW0Y+lQlOhQKrdQ==
X-Received: by 2002:a05:600c:6388:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-4531d6fdab8mr32062795e9.5.1749566323035;
        Tue, 10 Jun 2025 07:38:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:30 +0200
Subject: [PATCH RFC/RFT 15/15] gpio: TODO: remove the task for the sysfs
 rework
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-15-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FrDvVu23TJm5ghXSfiA8hCOI1OUNHhCK1w5KAsAVwJY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENi73tPISvj0xD+HMTPCvZKJvIUOegaNu5uO
 y3wtnEYSI+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYgAKCRARpy6gFHHX
 cvdTD/41qLITo5HP3W1/ezMXOITtIMegRdx3dV4RXRA0XYNgVnGdtIv+GtlOwW8GgkylTyZnOP5
 Wfsrj/Up9MFtr7QGsC5a27m0Htw7fkUn/UVqRr7MeoQ8DvvfAk32r76O8EK8mjvPRTTUFVReoi3
 uAf60JE6IClr1FoTU36dCKeB5xl49K1D0D+HsMd9uIrrqxlgSC15xIp0y56R8f4l1AnTR3WIedz
 YZL+mTTw2XSxnoUjO6wb2cwYRMKWurtH8qp3lS0fQEPKw3xT6OsfqfzOQLuDrvXX8LnJhQU4VT7
 PIS05fVZHGPBQVv5wug/7MbgFAm58VZv6uYBK37niJVecMiKPda75xXiASpcQuxvhgB+QoqKUKz
 A7W3Lp0hqOJduExEimuvWx5A8A5DdhJXo5DrzKwUl1yCxYno1XOGe5G1VCoz4tl/85yUznOngXV
 A0dMBBp4KKarcZvL79wRTHRPYHEBnZOXmJ43W8+qdDT7mPPVDyDz3DQu3Nl36JXSyT7W7qoP1XI
 4oWV9IpKkGBDrM3kDz4wIuTQ3pnN6NCOSAsTR+lY2bFJJYGMXwtTwBxODx4AEpGx160o1Tvb35O
 QrbS9vKZg9HXhdd8zpigNSaxAfBJWw53Koph20N01/y857F1eQEnkFPHXR8ife46VIAfPyoQAzI
 k+HcSd9LFpI0Whw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Remove the completed task tracking the rework of the sysfs interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 4a8b349f2483a91883c74b07a43efb1462dbd377..97024925f14ab92b311741b0b7944acbddcf5c4b 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -183,19 +183,6 @@ remove the old ones and finally rename the new ones back to the old names.
 
 -------------------------------------------------------------------------------
 
-Extend the sysfs ABI to allow exporting lines by their HW offsets
-
-The need to support the sysfs GPIO class is one of the main obstacles to
-removing the global GPIO numberspace from the kernel. In order to wean users
-off using global numbers from user-space, extend the existing interface with
-new per-gpiochip export/unexport attributes that allow to refer to GPIOs using
-their hardware offsets within the chip.
-
-Encourage users to switch to using them and eventually remove the existing
-global export/unexport attribues.
-
--------------------------------------------------------------------------------
-
 Remove GPIOD_FLAGS_BIT_NONEXCLUSIVE
 
 GPIOs in the linux kernel are meant to be an exclusive resource. This means

-- 
2.48.1

