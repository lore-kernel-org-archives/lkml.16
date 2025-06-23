Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86C4238C1D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669226; cv=none; b=tYwbMOJm50spRBJ6CLaAVNQD+zxpwe8T+hvrxp6WqtZkjfJb3Mpyw9sxcmz0XpNyjpsiZiEKhpUkqdrcqGQlmZLi7a34PJB9DNb56LOj0eQmh9r5MqpkpwARBUodoPK2x7EDCLIacDTBQpcdH8Qio6pcn/wylDaj/CN3F36cHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669226; c=relaxed/simple;
	bh=qKH/Xx/gFP86G5ibgMZ3u7lxWPymmr9dQIqXb3a5NY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4jduIG0ssWtC4aCz4i7FeI4zSLWXSG0vj9KHirVep9AKE3vwv5DbEAbgeJM0fZuUDlxiAtWa+UteYaA5xZ0pCqnLBbajPx0GRMOEsEGxTTHRmqD60GV7/WPMzsd4XSP1xK+ZBck++ZWvSTJZMj5ueQ+7fuG1sXGwVb5ECl+lug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oYzRPtHO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oYzRPtHO"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so3629504f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669223; x=1751274023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tm+AP9yf/4s1zahGdn4RMNsFWWCbX0hdSX+OspH82js=;
        b=oYzRPtHOP0GNN0/+iFQFvgTjRtzxPhJ25MixrjAo3ZYiQmy/f8KamSmRdePAwEGVxu
         BpCW/G4M2Zpysy8sisbLHPHXPw1+2HWwu8SEnx+bU3b1y5jIzaxP8K4KyavdJLzxPQSz
         Upo90h/dnQ9itqNtS3/5xSYkFMeOacR9BHNtr2eU4INH3JxoXuSVvC8zZxUksY7uu7kd
         AQXffQ9bcwhjdbK+6BRSZyl0cLJ/Lp90pGLm5DJICiVy+t0BD/IKbm5c8dKm4IG28MOf
         mI04rJYf89Fxfq5nbmsNp0JJ4NkZejd3iOqvKvGErbaNKOa62O/TWRWhDZzp+YS8fbIt
         6UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669223; x=1751274023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tm+AP9yf/4s1zahGdn4RMNsFWWCbX0hdSX+OspH82js=;
        b=MkgECNp2yRb/qZcsZBJmISaiziJIdZoCdU6wfU3SRbdFgx58a7VsElQiI2dc0tmazi
         KpU+kCstPMbinq8Xbwr9Ef6QHgAILmmyPGtpnnnKjlVUpYDlr8hp2T2hzMYjEnab5RGJ
         gqD+zBtLPlQvS1Imdo/XE/lzd42IfuvEGZSmOPYja4voHkXZ2nPUXxvRbBXw8ve/6vou
         /izPEdv1cqhRFcYUHy1FfKtkGe5N4H80sl8WITnF+ItzzRcYUmrhGbj6MwDYdJTGcnZ3
         gbt2UmIOIoiSJMC05+A4Isc8SRWPYjfAfARtQyzldmRKTpx4bC10uHlnqmjjXc18mecw
         ioPw==
X-Forwarded-Encrypted: i=1; AJvYcCVL2xBiirBdS3j7nxfDhfSvz32o81fC68Asb2imqLq+s3oj5jLRoVIbgiAA2EaXdQqPEP2CMkB15HnZ3UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK55GEYgp4TdPMQ5m/SaV1xZwF1fKe7v5rjF6MzRD9SJeJPGHk
	ybgo17K+YyppHG+2X8Y18MixtiOQ2y2RVJEOajhgNcS8yTDzpg4Cx/mbLOVZt8XpR/Y=
X-Gm-Gg: ASbGnctGEjPhQMHA6DRuCbaOJLYRTnk4hpzI4kBeaSY0+qFSg1+itfyNsPtrUJV4ijj
	2w3V3bFOb+WloXHyNF7xKIBjkSUfsYgUxR93iyzSl4t6yHi3n5LQwHv2bu4NSChzgmC/UPbpIsu
	PeEVR0k7bIkexkhecnIHk0To/EteBnqr0CD9Qc5SOYWjQ7BNzinVv5DT4FVylcRtII//0/P4JqI
	FabAvCUjS7+y5T0i8b1bZ31hiAmDj9IiFbBSaMzuuyD9yRc1/4Vd/1pccnx7Za7KVsPGeUoAur1
	3d4nceOi5m7swTMEk+iyz6v+BFyewQ3xMg7xZu4dW3Bt7eigWAMht/A=
X-Google-Smtp-Source: AGHT+IFQs5Yfhw83+HikYGOQ48jqo93pTaMwpZUvn+UrY8WSWjGSBl22f3vTVXUW+HttqgtB0pFQ2A==
X-Received: by 2002:a5d:5889:0:b0:3a4:ea9a:1656 with SMTP id ffacd0b85a97d-3a6d12bb683mr9713348f8f.10.1750669222866;
        Mon, 23 Jun 2025 02:00:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 23 Jun 2025 10:59:57 +0200
Subject: [PATCH v2 9/9] gpio: TODO: remove the task for the sysfs rework
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-gpio-sysfs-chip-export-v2-9-d592793f8964@linaro.org>
References: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
In-Reply-To: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
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
 bh=F4uLYTcDjYHCQKRyv318429+cTJ5TfubDfqP7y0o1W8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWRebRY4drdXLUUaLUJNYoNFfebNHn7p87dJem
 0w44f91D0GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmwAKCRARpy6gFHHX
 cgxQD/9nqgrvD0r7rdK5BR9HWIVnYmIbGcJyK10Nd5pP9Xa+u4quKpeNsIIHQBAGB9odogjdT1N
 bMAmGIkxu211TVb/3AQHab7DIoWghICGLhWFDIBoNoTSSeo3es1iq3Ms3/LRDIg6OW8V6vcZw8J
 SIX7iu+t1oftJTLbfr9bU7I09Hil3tYODfeye9fhpYOm8nOlUb2FkTry7PwKbf6iOZDifB7HD+X
 YuovD0nNDfs6WSXxrmflUjobgmpc4d4sQNmvTsPOqz5C8onnmkwgsD4FG+745G01HEuZDSgjieZ
 72sWcb0N7DvnjCTjHFcG7Y5ZWDclh9hV7c4B+3BTADyzL4jjTsSGcakVXf0Sjp1nVbXryTa7sW0
 bZKoQi81Q2l2hAUXKbLvB4usQA1yLaSS4IXYGjCjdEKPLLvqtEOPyWxfvEtmq2uVpvBOhwfpnar
 yLcOEp3mZ+I4vkF1X7KtGRwAV4ClkRg/AeHJhU3hnCx+qGpo7l3yKWZvSJdhyIBLFyeOfITKm0+
 pY7xjSFvRM1U5GXWJtu282Ozw8hnKJONPczECYU+vAaS7BJjkcIwKgyimwGowIeCyI5JcgjjPd5
 zsTouzTDGgR6lpfUWWXpCTCq24GuOnAE0yqEvJ67c4yQ8fevu0uy4hGG1n6V8xQ4F8+ayt7ZnTa
 RZ8ODzGe4mTofqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Remove the completed task tracking the rework of the sysfs interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index ef53892cb44d7c01d100f10f1b805c0aca561b46..a6380e51699cc5704aebefbda906762fa60cfef3 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -188,19 +188,6 @@ remove the old ones and finally rename the new ones back to the old names.
 
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

