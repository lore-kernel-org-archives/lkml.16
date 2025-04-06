Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF09218EBF
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969038; cv=none; b=ZRuLcx/sM/gP5lDvoF7JJEnlmk3bTlEr94HJb6gTxV6+ZYwhZZzrAJojMUt3oHbzJtLEmNnszPzzJvLHc3rTk8Lwx0WYjYr1pQpqs0S0/fjYXn3wFrBF8HkU8NSOClEuaTIuCYFeOM24Weqsp72ybbYRdMIR2igar7VRoZsmsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969038; c=relaxed/simple;
	bh=38gA1wmDJiq2MveQQz3Y0vrR4PLJuhZIhh5UC/GMSyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GYZfjw1/9cLPW/qe5vAmioJ0PdLYQu1GZZDS0H9Gq/e5l80kCrqjB6z6CwQdfLYchugi/trs+SA2jx8nHdZY87JXxknikXKb8fEHmDHl5+3jP/cVl4mGt+q8oJ/XOXyMMWqwbiuA14ljyNmuT1Jap1/Ibtgil+gH8KEdW/6mC78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Db/uOpcY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Db/uOpcY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-391295490c8so467153f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969035; x=1744573835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtUvKVwGlfNDMMI8xmsqOHk11vgUZVIptVfUJSQ2KJU=;
        b=Db/uOpcYo6cEGPEzh783amsVXacfv1zsnGpJlK9D+RwMb5C0knwG6vfoRUdoSfpKO7
         I9GoG7Qvde5z1aSgfGsI/sZLbN0qDu5+43LDwoaAqzAo4XGMjqYY1I/JG7l+iBEG1fZp
         /fM+XuNVAI87DAlJUaukJ0Q7h/gniu+9Jw+a+tERnXZO20hTe9PSpf70X8UxrU8fl6bW
         ZozrDx9f8SG6wiZCETDVEIG1wKx1LapKR6EEEeaCdAItTFSial4Lw0jjxoFa+bF+YdX2
         DqZtMEYygCJiCtjfAERHBOItAfaNgmU32dAkwHYLJlaNcQ4fs9jTrmpkeLvqLn3FVmyw
         PjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969035; x=1744573835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtUvKVwGlfNDMMI8xmsqOHk11vgUZVIptVfUJSQ2KJU=;
        b=Z5putUslLNwh+Qku2laD32aWX989KoFHD+uTB83XeKpjOWxTDWtJksdjFIYJoOKbDK
         cdK8BtKlRS0ZUgkJhWIx8cQ6MNIP+9NIRP2oTlQMGWDjcbNjrTt5SvZXA5vU/JFz0M0k
         7rj71MB5/vNqT9JO6BcZ8N3WwgeIRe6aR83csm3SU1NxjGyPq+quSTgVj2OoEUHl5Zlk
         JP3P5cf0zo5KlQgSr90Fiu0tPdsaFp9EXdCwuJNmC4vjgZIQEM/jvnlD8lc9L8F2cYWj
         1l6iW8VlrF+iUoLsE78f98cvOpYE0RefbwjF7vPsMnNDt8FYRu+HvulhaQKQ2RjEjYyA
         vM0Q==
X-Gm-Message-State: AOJu0YykU92mhl7wedKcrord0d521deKRC3HP3E+GJRlmqer4AsMhmWN
	U7HPYltbTHNk0L2r3F9Xg5keNymDmgyVooJJg+YtPYHDetFaPKH8CRyPwFvxapU=
X-Gm-Gg: ASbGncv8xa8TggeLcnkvhKPV2/TGAVGyi9xAdwmLoT2RJfSD23l0O2RmhRuAypelCMf
	mA5Xk73gWYN9xnpu1V3BdnEdeejQpQLfjigHoZPvoBKtkSkgFYxWYDn3KKdFR1DqQIK1ZPkLxIv
	jh6Gi8fqJ+Pyyt06ua56gyPrISljJqNooPwh7L9tivKffDbzV1ZWC/0wXYIXrEgEaQhaylXiM/y
	xFvzqlGn2EONP8sUtx4t2fL0xtG6Om39FtjT3BgSO1sy/CNXW+sEIT0XHIP/2h+A+yQaUHe8dc7
	ZA0hYTrLplX0yKlZegASOue5LsU6m6zbrm1JXVIRoGCk7JTs5bs0h4pnxI2vucQ=
X-Google-Smtp-Source: AGHT+IEnX2F1PQ7D2a3X+bMNU6jbxchHfi7I1dMv42d5su9NoaQH7MxGFAlEKmja0QRxfr5R/PRY0g==
X-Received: by 2002:a5d:588b:0:b0:39c:12ce:1046 with SMTP id ffacd0b85a97d-39cb35a2333mr3395305f8f.6.1743969035003;
        Sun, 06 Apr 2025 12:50:35 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:14 +0200
Subject: [PATCH 6/8] mfd: max8925: Fix wakeup source leaks on device unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-6-318e14bdba0a@linaro.org>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=38gA1wmDJiq2MveQQz3Y0vrR4PLJuhZIhh5UC/GMSyU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr6cHIk3YuQVDxcuznmbRzkZvhsaSrDwxx0h
 sKUjJTVZyaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La+gAKCRDBN2bmhouD
 1zx5D/9WCjoI9qKUcLn6EJ3lpeu4rIeBJuhcrLRFNpURy7uC+zLyLGdFx5c6syawcY93sjxpmSc
 DnKHWKqGMRUe+6oHoraEIgLU03jv7cmXDhIITl43eISPLiChpr/MuRqf9WrujU2coOsow28aJOW
 rkYdLTxiLrxXd7gY0mWmAz0Y6yqEoz5lxUiHF9SQp82uxIHMLPuwEPFspyO3nA4iD4fPkyyr2B9
 tz3g6b8UcOadPpaJQPWNmiWAH+Suld7Jp2Z0NHwk59qhAnqw8paSdk3JilFWeJFn73U4Ineya7Z
 6E7rO68AksKoIYoC/wuFhxBDFJSwpvgKn0eIDANkz5uPKpePxooW4xS9q/74k2/WqQRE6VZtcwf
 2E7IkVAkGRQnpvnMlSLCZKdVG0yRD/GzOx9KM3i/p+NVd8XyP/8M3ck3uxpnTDiIuZgdscW1m5y
 0Lds1wj1vSD68lSs/ZPNQ1CtnG03cqPjpL8dGp/CKYwNqndrFRmLagrbkVRGZEEf6JoVJrd4aXl
 qlIXPFHSn8Gl26vsYCzw3fArOyq0qzXKomGFWVCvDOQRFub9ILV5QCWasLsVEBxnvcICdnuO5f/
 JEmq+D9N6jiZkgJHTOyqwvh7TWaIQUuq+v3JVT0403TaUJoGnlBzCEfLNfK+RWeS2mXULTXd1nc
 RGKZeArmLsMb43w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/max8925-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
index 556aea7ec0a0473edc9291cae0c82fe9b4ecb346..ab19ff0c786732be53e58a0162d2658650d88f47 100644
--- a/drivers/mfd/max8925-i2c.c
+++ b/drivers/mfd/max8925-i2c.c
@@ -201,6 +201,7 @@ static void max8925_remove(struct i2c_client *client)
 	struct max8925_chip *chip = i2c_get_clientdata(client);
 
 	max8925_device_exit(chip);
+	device_init_wakeup(&client->dev, false);
 	i2c_unregister_device(chip->adc);
 	i2c_unregister_device(chip->rtc);
 }

-- 
2.45.2

