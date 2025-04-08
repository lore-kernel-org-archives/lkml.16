Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD45724C08F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096802; cv=none; b=cIHx0T9ZKYoPrjdct9JkKH6bXUDbgJKuiReR0ZsaBviDczHkLTDch4rKZLE+Q4RmemJUNw4hv87SGbaBfAw6+VP5Uu4MfANTNCIBvwS85EHwgZqvUbwI1FZmkuDJqZFJUTm3Ezjg8L+fbA5zbxNbVDQ8RHsDNIsldbUsckzJKTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096802; c=relaxed/simple;
	bh=sShqp1OG6UzQmWXPboB+sq77y980YHZYBmhVvusKcpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4e4+kqrvdwRFyK71tdk9EdofWgWj8tM8b1GxW0uIbsGtoXw3RnXumRpJqu+LzAlWnq+NH/rsAhd4XbsK+LgO9FakIzCe8vDyksVla2+TlDWshc4YNfWyQE5f36Mmrkveg2lEYdMj54GJM8pRzuieZFg71l6LIsriFQkt3h+Aec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x4JwsQuf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x4JwsQuf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3177741f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096799; x=1744701599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUcRoGUFSmoPY+d/cL7WrlmVp5gIPvEUp8G2THBFhMk=;
        b=x4JwsQufZe0nbQ6tzkAU0SU67UjxIC1dO7/k+pdErWeDO8+/iOxOO63bno3j45NrCf
         EWG49PWYXFMrTUJJ2r1HGBnvGpPONnDPK64x8/a7SlX3NreSRfJpncyzX/wV6mFRQpN/
         ybmJBydIKruBO8FYEpxQ4vmnBieXq7C8BdRO2TzW3f1dytpuVxXbDO8IHx3nsKJNExAF
         B4MtjHT9ZF7tBna+wYmau9qgNmp3WCn7fJfX7Bx6lV+vK6i3z2s09PmcEuO6W3SF8lGQ
         tLpjBccZLoKJ0Kx1MzuX2UmfNrcX+KgExsYcumwTKZVfuPVbjl01n7yTx/jeAFnkUHOe
         yxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096799; x=1744701599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUcRoGUFSmoPY+d/cL7WrlmVp5gIPvEUp8G2THBFhMk=;
        b=EgQh8m5L80PC0UaiusupttA8Z7y7R26dH1UWf+feNwrk49kgqZHWNcOhrqawOUVvhT
         PEI/ctINwyoE5/FcL4e97OH8pCjoMTg2Wfa7r2ZBdDCDJoT2Z+ENh0praijcI8rdu6ud
         3SQhu5M6xYLVd0wbvWVIhaVOP7W33MHxc6eQBRB4jGpXZzQWjEX0gw6Ztj59SwibxMGt
         5LZa5893+MuXzkyRxYR3UrkRiIftVkImkDE1Eb6nhAz4Yy5XTFihmz2hHr4dVzo6+MDO
         3ljnaqIXfBQESG9+a2gK48A16irnn5BiK3e2ODwoaKk+w2+JqCy58yBB4nzFDzGQ+NAG
         G2NA==
X-Forwarded-Encrypted: i=1; AJvYcCUiXZOvQLKnSTBF0Cd5inHXJQkWOtMvOJZ78JdWmTeJ+vC/AfIiI7VyqDBmtoBRyETLXbm2l8Q3PEDtom8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgwKUIOfIEP5by7uqhW5SnKA1GZwLCM1RMqFaiZ3SknbifZR4
	Olzoo5wo2LKN/+BmU9mltq/fFw+m22NqrCVoYujSdxwOW5rMMOvpECwE3H64SdMBHXygEjzRW8s
	pFHs=
X-Gm-Gg: ASbGncvg7WDGFQaIjWna6M1B+RAmLNkQBT153r5v9y16UYeV+OUSCcHErrANeFIHkms
	T5LPc8LCE3cpj7UvktFfeL1HX13lCcpOFysO4wCUc4xLFwFufwIY8+9UkTO+sT1/1IlMMFOFuvD
	ov658NKYQYl+ZjdWngr3VigU9B4ypUPUOEPHnrkQ7mf0oiiK2l7jX6lr0EUu5q8jzeTwM5Nqwy5
	Vdr+PvFvK6qhbYGgiWWUYOR8wIzTTq8ah1Cgck0j3ChViTDa9/aLkZZ6MaKZpTjqWt8P0NVDn8Y
	tXnbXJfZNa3G6bVUwOSzaRgRckTPIdm86ZzYZw==
X-Google-Smtp-Source: AGHT+IFcB4gkAeFTfcCzb/N2afVDgfBGxr70AKsKJJ8DDnRef5DxEbrBcldQtcrZ4UJzZfAJRHX5wA==
X-Received: by 2002:a5d:648a:0:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39cba9332b0mr12081546f8f.37.1744096798842;
        Tue, 08 Apr 2025 00:19:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6608sm13882872f8f.23.2025.04.08.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:19:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:19:55 +0200
Subject: [PATCH 3/3] platform/x86: silicom: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-platform-x86-v1-3-6f67e76a722c@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zGzPAe1FrCR6IAcgaEbtX/r63pSis90sCeIpOahYRzI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M4btWQhTbuIhjAMDruf4EOKZZYOjT+a4D7MB
 UwHgbNHUGSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOGwAKCRARpy6gFHHX
 crvwD/49t3tuCwiX8O3tRgTSTCK2a9xFiYLZ3C6/gcWXhMKuyPr3YytOWsKYqVE6s2d9XnNgcUK
 qIEuMJRsjFTzs36EKi7WVXNjbOU6GgE3evVJ2LUksfomsSaXY7jmfo10lhVZyj0ynyHIMKRbYaN
 SZF5AYIpcTPL5y9DMgDRx2T9U47ieLN6+x/+deywknXw4wpnURRAy0iCLhvVOiVXnfCTCEp1mdg
 3ZsIoSXyEn/HWl+zGGtiYKpwsqRygQhDBEmX06f6SYqElu8SKWLTYPLPXBENVRqye8sNQHxUo5K
 4MDoFeA6bgvbLSWUSnNvImNTCW2nASW17FgXqhmlRAjKE6JBDkSqZkr82jX9LWxKMUNcL2U/GSm
 UNKrSXn/ExP2CfnCnIz642iK+kfSzuTyAOaC4/Wu5MPxOJ1UiT/MWhO/aBPXi7zh3DNe5VQABOH
 EWDxa4at3ym9xhwk7Zkur59BQVtpoSDVKR1VhaMem+ODpQh5XKux23mdf4oPzBmJJG8LCkebjHc
 mNXd28+FhhlJ48ZH8Kg5NWtP7nemVeBMWrMd6dbrVsk9VWr4JrCGlDnv3/1VSa2z6ywZwiMxIBv
 Lq5hYQgf73NTRlOBr7V+WI1GaELL+9HjFKYKfntHiqTpFa9FX9EC3Ggm8nbdv6ns0TMzBcp0sTD
 WC/GqiKu2H4w3NQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/silicom-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
index c0910af16a3a..021f3fed197a 100644
--- a/drivers/platform/x86/silicom-platform.c
+++ b/drivers/platform/x86/silicom-platform.c
@@ -245,18 +245,19 @@ static int silicom_gpio_direction_input(struct gpio_chip *gc,
 	return direction == GPIO_LINE_DIRECTION_IN ? 0 : -EINVAL;
 }
 
-static void silicom_gpio_set(struct gpio_chip *gc,
-			     unsigned int offset,
-			     int value)
+static int silicom_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	int direction = silicom_gpio_get_direction(gc, offset);
 	u8 *channels = gpiochip_get_data(gc);
 	int channel = channels[offset];
 
 	if (direction == GPIO_LINE_DIRECTION_IN)
-		return;
+		return -EPERM;
 
 	silicom_mec_port_set(channel, !value);
+
+	return 0;
 }
 
 static int silicom_gpio_direction_output(struct gpio_chip *gc,
@@ -469,7 +470,7 @@ static struct gpio_chip silicom_gpio_chip = {
 	.direction_input = silicom_gpio_direction_input,
 	.direction_output = silicom_gpio_direction_output,
 	.get = silicom_gpio_get,
-	.set = silicom_gpio_set,
+	.set_rv = silicom_gpio_set,
 	.base = -1,
 	.ngpio = ARRAY_SIZE(plat_0222_gpio_channels),
 	.names = plat_0222_gpio_names,

-- 
2.45.2

