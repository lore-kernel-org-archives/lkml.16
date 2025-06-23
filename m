Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B6299A90
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706769; cv=none; b=RMHB4dSyxpWsbGKAP7FE1NdadTa8qITFOfxhaaeF6Iob82vx05eDUKUEuo2Cn24oMVLqJAniZ5Kn+B4/4CKBzElrIMuWVosgThKIdVcIoKXvURdkJY8DEoG/KwkKFTO1gyraxp/OcyMQ0MkfIkzKkUgWH61DB8OvfTYjTKooxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706769; c=relaxed/simple;
	bh=2do0m4eS04pLS6E+t981rBqNdOJ9dK+R9dX2h3pPpl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NX5wkR7gVRdCfeiAaxIpyK3Vu9LFKxLO5GZfQkSKGRm17Ozbe75o2iyZ7G6sBCK2VyN7sdGNG3loFYrt9UI+i5dYGQpfzYLnOBDXv9vR6J6n86kz76oY10vV1oh0RXrwOjcvQ9LBTw1Uo3pRCCQ2GEuLPSTm4Y0QbY5bvUlhupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m0VJRRi6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m0VJRRi6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso7032950a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750706765; x=1751311565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pXeWDiz3VTsRPC4fd9L/dNZnY19/uuc2gPQ4wcO2zw=;
        b=m0VJRRi6/oistSQOEwsJL8hiMRE1EOUi+ku7x0o2JQIFciWqaioalc5ARh4Z6AmyIB
         5ITIfRSwgfcHugyqtHFgsP2H18bX2wdmlPTuyxNCnn0y7e/XzqzJWbSwEc29L89aQAVz
         AYR83n8i/6WQoq7/zonR5BH4O/3aTwIdV2ZjetXThOSf53f7NCgAzOV9a6z/+Xrm+iyC
         uZN9dUGXD784yMUjp2X2KnmKL2oaEtjUklSEwxE77k+ZXO4Yz2yx8ou65ye/9jhMFLmo
         9yB5oMXDuMD90+iibj84k1QcB0WCaAjoiUPNp7xefjLmv47KLlpYYjaVxXIWimkRTI04
         ETxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706765; x=1751311565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pXeWDiz3VTsRPC4fd9L/dNZnY19/uuc2gPQ4wcO2zw=;
        b=Jy/Qm/jqvnQpc+dEKUvZUdo0D6+swgoci5i+KBx7zJutNnXxfAxgMk7S4fQ8zj/OsA
         vuFxIrj61LpLVlYSFnxc3hgAb9aCKf54ZXMdowalYE9kPJA5x2iqo+USXEWlttXmBpHf
         E8pqwe5Uwqtk1DI1xJPZXrGef8rBQzeNumOrKj4LqQalX+9CK3hTycc+BwIFpEDDCWpC
         mlrCxIleO59lQ72D858mA0WQaBJPXCv4Yh3FCuCB+yVrHnSAon8CnC57UZdpXkGppCLP
         XkzEohwealPQQXDtpix2xQXozfzmSyp015zS9MSsfjlDfo/AAM4Jo0rfqzbDELlPLqq3
         ktng==
X-Forwarded-Encrypted: i=1; AJvYcCXU2GGI45htO+bvNWAN0S8aEVciwhWGEKEHTNGZwnLJfzkzDb47IPPkm6Mh0E5HHggFGGxvVWxZkIMcvXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+1KW3ibmtlF26XVHt5vQCUqJHGIBDrlBLnS/mshlSas9BTKio
	LMse7QkfGB0AVV/fEZ+FikfW/2cEU51Racp+fzlPmO51fxI8Ex9ju8MMLvSDtAPStDDQsF/ZiOn
	Oo3g/
X-Gm-Gg: ASbGncvuHVDsltoLeBAAGwsOPhkAVKFTt8hZU3g0aHIZKoFDMGzRwVU3W3caylerkgM
	s8Q9PHqtwEfNL7UEw4aMIRu59Y6MU0xge6jr4eLr1mFUN8BG84EWScijupBWVvqGG5H1RqOvhjl
	hPy1TGdm1uUvsQc3cs774ZKTLIHYqt+/M9l96l0F+iKh0iwU1vNB+GV0agJoRnr5VRjrqezIvUJ
	nUUtRaWciKkQtsQ5BxHH4GOgFJlMGfzPtsu49TiY/7tq/sYsVC5Pvjl7tmvdmgReybKx0YmPr3v
	va2dlx79rVYIU0E23saWMlyYCSrPP2Qg9ZhiXv40xZ6s55RJW6LbAdXDOvk=
X-Google-Smtp-Source: AGHT+IGvW8Bcivz7RdQbWRva/Bh2ZYAw7JSA749WpYWFkoUVql55UY9RAPWXcGRRSH8pPoN9cJ2ctQ==
X-Received: by 2002:a17:907:3e0f:b0:ae0:1883:78ce with SMTP id a640c23a62f3a-ae057f21663mr1282338066b.47.1750706764886;
        Mon, 23 Jun 2025 12:26:04 -0700 (PDT)
Received: from localhost ([2001:4090:a244:83c4:9fe4:a128:a20c:8b84])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae054082d25sm743685066b.88.2025.06.23.12.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:26:04 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 23 Jun 2025 21:24:28 +0200
Subject: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Fix property name in
 comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topic-ti-dm-clkevt-v6-16-v1-1-b00086761ee1@baylibre.com>
References: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
In-Reply-To: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=msp@baylibre.com;
 h=from:subject:message-id; bh=2do0m4eS04pLS6E+t981rBqNdOJ9dK+R9dX2h3pPpl0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozIVVYyuv+deRKtquWm7YyodPVmrPRtOpe2v7PBUafvI
 cuM42c7SlkYxLgYZMUUWToTQ9P+y+88lrxo2WaYOaxMIEMYuDgFYCLq1owM57/6vc/zZzOw1zod
 qLrH88jx7ADlOzfLPRftnFDV5sXEzMjwg0k4Z1ug/71Z31zXn8s8N4Xjw8KAudXRX/5c+XaKv2c
 GJwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

ti,always-on property doesn't exist. ti,timer-alwon is meant here. Fix
this minor bug in the comment.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/clocksource/timer-ti-dm-systimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-ti-dm-systimer.c b/drivers/clocksource/timer-ti-dm-systimer.c
index 985a6d08512b42f499b3e243eb69cc9674bc8e53..fb0a3cc23b5a35e2906a253d36ccef2baccca50a 100644
--- a/drivers/clocksource/timer-ti-dm-systimer.c
+++ b/drivers/clocksource/timer-ti-dm-systimer.c
@@ -226,7 +226,7 @@ static bool __init dmtimer_is_preferred(struct device_node *np)
  * Some omap3 boards with unreliable oscillator must not use the counter_32k
  * or dmtimer1 with 32 KiHz source. Additionally, the boards with unreliable
  * oscillator should really set counter_32k as disabled, and delete dmtimer1
- * ti,always-on property, but let's not count on it. For these quirky cases,
+ * ti,timer-alwon property, but let's not count on it. For these quirky cases,
  * we prefer using the always-on secure dmtimer12 with the internal 32 KiHz
  * clock as the clocksource, and any available dmtimer as clockevent.
  *

-- 
2.49.0

