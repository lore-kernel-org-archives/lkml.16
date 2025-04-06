Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAB1487F6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972058; cv=none; b=M0hSQIOvsRMS0rD4dVt/wQjDZSBgoXCVGItcJeMj0wXC7xhUW6Zx7bHf8GlabQWW6//tHkAGtGPKEjs06q3LjyOahqgXpmWTPSzBcRO0oU9uj5ig5LN6wrH08BIXEMFA4oTCr5PlOo+JbhT0S5BkAiyRm8Ar5JrUVHZR7IKDo0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972058; c=relaxed/simple;
	bh=uPYcgZ3omwIzurOp+2cX3SXPc6HbP09vKi4vWgSXMaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KxyuBQqgCD5ljrOmMkd64umDPNWqUkWQqY4UipIVLcGnXru7JUgAy2Jk2qy/pI/b1sFowYqTfVaLbrmsZ11CAcaiwUX7KgcLiaD2gyzD0H7fZ1d/HHt3qmdl8RbxgZfdbXgVX9XDQaBKXpyQbQ2zz10a9f1DYCEL3DbQeGpJNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CLkNsWgZ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CLkNsWgZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912a28e629so586020f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743972055; x=1744576855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3QgOOpj7+iSDBUkQvomYjpZ7VjRT58FtT28ljc6yyM=;
        b=CLkNsWgZaGfSz2fFWVeXF8lMCJGT9u6LRDHAi4Z0Grsq6YLmpqCtk/hgIvxJ4pAC63
         p4NZBrXPr2hyMtmeyOghTqsjw2XSRrfNotmFMUEivXxen+fiB9qq0iNxWBlWlOVVi8zc
         yenwWTlEPLpsKqfBQWm53Uc4LbU37GmPAVP59mkjYOAWliEp9H3Jpy71Afua1YAuKbgT
         IlBkpgyp0FPLRB5yJy96N98Qd7X42dIJqbNMW8bWWGhu5UoH78bmxWjN+rARLFJdeccy
         NqHPpWbcAHD1FUoF7KqJGFUB35KJxm4oVtXA4batMqC0RaLRHl/YMobHimk/yUfDzMZw
         Qgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743972055; x=1744576855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3QgOOpj7+iSDBUkQvomYjpZ7VjRT58FtT28ljc6yyM=;
        b=cIy9c+L6/NHeT2Jcdwy5HhajXiNwEt8Ofib8TvCPElJzeMNqrESMVlTJazGTJWbidj
         vnb6XD4odchx7gYNTCLMpPP3VmusVsF+RwxMOezWkpkzBMEW2dDid9Ft6DZi2EwnN0r0
         OegaCbxFh9MFHwIV1Ip9bTdzEyBhe/RmPEak7RpsvTMvsvR8jo5m+StnrYqOui1Jyx7t
         VRsnx01o9B/AG/JD5qP8IC8SNxAS4qpN/mOA0oTq9mpz5rnlxHLc3g3vW5j2A/JRXKk2
         Kc5WgcxYUXK51GN442hNF8d+W4wbDmV5N1lUsfB2h5VIMIXJnZnOFtkWE26oN0/p4li3
         tjFA==
X-Forwarded-Encrypted: i=1; AJvYcCWjGj9IqxzteDmxKDY2XQ0Mu3oLd0q6RESCyF6zX31xBDSSKcde8IRWhxLHDe+QnhNzAKe/llg6VaOfPeA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx7VehncwcBbWHIUP6FfIpp0NNSOAosU6JltoJxjA69SRnuDZN
	+2KGPpvUO8YVWM2SHiLjgXPy18B3pkT059vYXte1O6RGLvX5vs9EbJbfFzXpJ/ubOepiHB2AOju
	5
X-Gm-Gg: ASbGnctkS4E6ShSlumNpdVYWDTTGGpFpu8INaQQB8ke6rHUgZrj5tsUqypvpDyeBbVF
	ZZbctZ+l+yww87MHNT+20qRpqbeLyM0tC83vWXLPI35sGdmij269Oe50msML7of12981vLlXjxa
	NdAdAwk4PkLu2+eCt3UOwSJnDefOG8mKgtqSCHQvU8H4RMuzLjjAJuZjQ9WX2cdnrN7WUPyRHoh
	oE9hmF5iw2bjBCg9ucJdTEpyJRPQiFpXp3xI52wKd98IDfcrpZPlrJ+Ay8p/LNToZbuJhpgCMYQ
	qBztpEtcQLdl/7T5WKiOUJOMsaKWvwoILpJ4R0DJYwXHTzKw1MbHFA==
X-Google-Smtp-Source: AGHT+IFchdRno11RgL9CU1ownDwZEuJHgz79IyNA8LtlWkkc0l/WAoB/U9KiTsDOjehHkL0ncSktpg==
X-Received: by 2002:a05:6000:2505:b0:39b:f12c:3862 with SMTP id ffacd0b85a97d-39cb35ac4camr2855921f8f.2.1743972054936;
        Sun, 06 Apr 2025 13:40:54 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm113167335e9.33.2025.04.06.13.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:40:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] usb: typec: tcpci: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:40:50 +0200
Message-ID: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index fd1b80593367..29a4aa89d1a1 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -536,7 +536,10 @@ static int max_tcpci_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, ret,
 				     "IRQ initialization failed\n");
 
-	device_init_wakeup(chip->dev, true);
+	ret = devm_device_init_wakeup(chip->dev);
+	if (ret)
+		return dev_err_probe(chip->dev, ret, "Failed to init wakeup\n");
+
 	return 0;
 }
 
-- 
2.45.2

