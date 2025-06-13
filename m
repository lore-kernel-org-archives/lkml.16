Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA72231837
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840972; cv=none; b=avUl+xYvBc0lZaJc33b4jiG1hXqS7yLwdVxj7OME3vNlkoMLSdFdX2RU8SYQRsntI5tfeMvDYf5IQgmWw2AQhTVr3xNpKxnpGGaWNYLZ5avZXrl/mqTh/2IYJPJ+P3lzEAp49L3KYKZlgkRzxViRTnq8DYe0Vfj/JYUixRO5Stc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840972; c=relaxed/simple;
	bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=smftcAvjX3ntCgrBFOMbVR3TKTbVPmgA+zrytrPaTHg6wXJeDNcG3z34MaCYpZDXxXHfrPWiNnVKODwYakBYrk6W1SwTk6v/zOq8nmiVbg4YW3J5QMUcxxBPzqo4tFpz213H3X8U0YNNOYaE6+pBhyc2UOt6NQ/cBwOekW3oJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3GUuqvCX; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3GUuqvCX"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-605ff8aa9d2so649379eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840970; x=1750445770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=3GUuqvCXzOER9gYjAw8DH8d3ptDrU+pCP05Q0Kk9aknw1wHzyoHwN6TxZ2Q9oQD2Mp
         prmwDcRjfltiw7pDEUQKaVBSFXXw5GoNdCwrhDOFsxR1ugsUDrrkOhjdcuALL2z47On6
         HtxmiiUeYlL33XsU66obZMDy2ETHHJ5y+PAukUkpSZwDgpjPpCOZf51ZBB8za8eBLE0W
         dYhYrilzP/N5j7fh3INzcbtoBsdzKOgAnla2t4VJIR6snoeK8wRqg9AFTT1tFaiMaN0c
         DHO5w0IxR26Su77E0eCXuGgWhxjjXkOm91M+3S8vuD6r5I3Ab+QWynrSqmWzo6CxEOE9
         JNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840970; x=1750445770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAgdP5/7nbSCpei3bdgHz+Kvp3J/VbeQ+Dc9cWuRxQY=;
        b=cHFfBHR3BG5ngIhemTPvqAPx9SMDCAWzzN6U7NCp0WbT2DbPPzkf5CZ7rtdvqCr6IJ
         ojUrDJ0qKFS6VdjXtbanbhMvFdPWezxUA56NxUiBxtj8ZTw7h4tayySc7cuqoGxKP0Ng
         o08ysMyjbOSQF4oFV+CoFGvFhPF8VeieyIpXKfPbcZFpngSP0gSJPyq9v6QEEMMgWAfT
         ywnvAFKOL7b76+fb6IrcdmDnBSDZsVjY1w3aWMq9lLOOdC6jJlu5BuTGO92iTuS4jDyd
         3ma+vmB2mf2UXeQn51+gKO7c6VKeyf0i5lVDolaVtdk8cNVisaQ9Ia4kAsUN4NxUYUdw
         yo2g==
X-Forwarded-Encrypted: i=1; AJvYcCXMGm8WV2ka8nFOFL56qPt1BUjS7Tw6hR7tURwXLc8wmuGNtI4DM56aJv8+oRmDrLynVOmjrFy9ydi3oTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6KLtsRL/cTYpjOyl9FVCc0UJmbKMgZMQN25A+3bseNhQ2XBCw
	v5Kxz6g7JnI5C6CZTQORvWkbTAP3T0Jz+CxfRcmj/3vjsgx8XV66NqXLlBXmyH0UnfA=
X-Gm-Gg: ASbGncvdiMSqjWR6nbciD0U5kjk2/7+t+PeFm6I1NwQQVaFKprM//LOPjBDlf3yXOe2
	BBIJskPCH2d8XSZ8h605LmE+pn3XB9bsDTvlteQbEwzr0KApv7BF4HFAMvJER6e3bX4QBcpwpiX
	U1e1wQAr8dFPzBrc4Xx9Q3L2OFCUXjEfE5Y/yI8Yt0b65AMbIVI16aE5NQPBgtHzpo+6/FiJgvV
	lwqLRSGTIGLoo76tMRzlslgBf5tUrrY8/PFHpbeLBioIaLEdFr2seybFzKHLJf4aXl7oJbRCzbI
	pVvBlpb0PLORWCWaY1fZwgDJnkzzNeHlaECsABrtJrgvILA9uE59lYQ1G+Nx27FX1Fo=
X-Google-Smtp-Source: AGHT+IEc8pztUfxk7EvjJ4ca8xkYjBhnyFgil/uaxtXzmvi6qgA+H+IzcVrvfK0nGCVD5jHUwQ2P9w==
X-Received: by 2002:a05:6820:60d:b0:610:dff3:425a with SMTP id 006d021491bc7-61110f0e204mr421428eaf.4.1749840970240;
        Fri, 13 Jun 2025 11:56:10 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:08 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:29 -0500
Subject: [PATCH v5 2/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-2-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=K5V5TnWu+110nnHuULWw1Pwd0QiBFgzUapmy9BeC2p8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQ157bdDa74GvX+bG28rLClC1BSRU3wN/Yeg
 GfP5Zo1E3qJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0NQAKCRDCzCAB/wGP
 wAa9CACBPCfBNH+pO03QhAZu48GDH9Pe8785qJwwmYJ8uxbrfK5oNLibo2TDWLSwOA9dhdzlRzK
 UZm3UcyjpEdTCIi+jkzqdhNv4tt/GFRl5mcEx7/G7llmupPdbCHGBxp+pNpfNc4hEkastfYG4oT
 VhVmlesVVRo2sTlipN1chPDsRTi15Timt+SDFDzJle5Bx86/1sHVoVDAP9/xPBvu5CMRk4NxIu1
 6/vA9C3Z/QoZi7Z7NTV3V3Boo2v96y4xxIJpCs37+AmjypU+lyJU0pLMBJvyVE5oeN2JYtxvUEn
 nZz5ep3mokRJK3TjorCi6b7p64tgzyIwpbsnC+RID9iN8bSB
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

ts_nbus->data->ndescs is validated to be 8 during probe, so will have
the same value as the hard-coded 8 that is removed by this change.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/bus/ts-nbus.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index d3ee102a13893c83c50e41f7298821f4d7ae3487..b4c9308caf0647a3261071d9527fffce77784af2 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -109,8 +109,7 @@ static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 
 	values[0] = 0;
 
-	gpiod_set_array_value_cansleep(8, ts_nbus->data->desc,
-				       ts_nbus->data->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
 	gpiod_set_value_cansleep(ts_nbus->strobe, 0);
 	gpiod_set_value_cansleep(ts_nbus->ale, 0);
@@ -150,12 +149,11 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	struct gpio_descs *gpios = ts_nbus->data;
 	DECLARE_BITMAP(values, 8);
 
 	values[0] = byte;
 
-	gpiod_set_array_value_cansleep(8, gpios->desc, gpios->info, values);
+	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }
 
 /*

-- 
2.43.0

