Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D622528E0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774881; cv=none; b=S8qRXfYSj7zkixAjkpnCPent+x+ZykBlAXBKtPC0zYRPpvp/Tj9QLBZj3HNfnbrozHL1oWHVkBy8ZtSiMMPucrZ0K9LwLt+lpNxfZGJBIMkHuISKr7acd14prJKS1QGlF+kWcDEtZlKIgNgzwfEoSozlw0BAgzyGM63nFuDFc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774881; c=relaxed/simple;
	bh=hFJhOZb2KYc99TdUu5lHL7z+CYiP5EKAGEds0BI0i+g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kptnd/On6shwY7nYF4vrB9v1hby6pNGLHIZ1H0//54WCbqVw3EQFrq7C1WGrTSBgmb3lP+w7wYnOs8DI9ejZG3DSB/5Yi+/UsErZc19tQcF6kUNIAuZj7vcz8r4jaf9pOHtogW3K4yBvwfHPDrKmKBVkPXMmwfHOeyVD10/5mGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZfjPm/J5; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZfjPm/J5"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2cca475546fso3419716fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747774877; x=1748379677; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQLjZcAnXXaS5ho2DdOLPHVtQHkOQ3Gsnqmc9n9fclM=;
        b=ZfjPm/J5jnFRDs6BM27vzshhg/37uLsj9lGq9SA0QS/e0PfudXpVN1Jk/89S4fEKU7
         AtUBxyIPcXUV/zZsD5PxXYAyRGH5vVZfVJN6ncr7LomZtAw6zsrmavlEDoug5mUQcOVX
         9N2anUp10F539+T32cC5TQ5dZGSr/NHOTUgseY72MAOcG8UaCbjwObFx6ayvNWk+aGUA
         42AbaAzZuzeKmEyfpCG9dh3FmlbLl8K+sxs9Yn0261VtUgZ4+4TrluiAQqQ56vAQl+UK
         d4MN7LACdWEEL8chhtR9AHbtHc8WydoJMgLnT7dqE7JdmsVcQNqk5MgbuDuwslKddkDS
         hS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774877; x=1748379677;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQLjZcAnXXaS5ho2DdOLPHVtQHkOQ3Gsnqmc9n9fclM=;
        b=bWiPgQaJ2P27MnPjK1tSS8WSnqLl0VyCNDDBIQSnBe7UoymQ4HF3n87vtPdXye9+bK
         brpcKO+tyaRTgI4bx1Nh+7I59pUIZPpatpTFCLUiVVQxcMLoer6VdfrBHnYOBbRqWuu7
         3dmXMHH2vpImCARIv+Icw/vWY1N7CPSoSOPWVqUPlhZb7kX5xyYMRESRz4PRwjwNwtW+
         IkrGkJu0iHNAWslxB55sFx1Q5xzoUFC8cZMUymBOjGoiDeRIduOTXMEVaJ0YG5LPbNAK
         vN5RrUOMVpnNlx8fVD3HU367NiB0WeUlrJuJkJ/v/270S3zdqP9/26K0JnWXe03KGuI4
         ysCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEyCGs7uJ4eMVRBWlFJogEpqJLUERpBtztHOUd0qbDrYKiFYLH5bmteplGWgHDWYoajU3uYB3IcE1W4XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJIoHkJQxsPeC7lC+M/Kgoa4duvhBTD23mLE1gorWT3ZOoTaM
	F8mEHoU5+Zrlfv23+b7vLB5b2qrqA1FVAHJq/O8nX/j96avhalB98B+Vwnuoh+P5j/o=
X-Gm-Gg: ASbGncvUZXNBBk40DpHagKTpNRk6g6tCmEqhwVM5VGsoyIaFyD7XVtB3o2FJxThI+bx
	3dP9x7o5+02HIoqhCNraVOFUsQiwTSsaD5NApeSz1jx7hoTiGoQVPr6NdJHlF3mFaeWTzAJMY7L
	cJoHupeTSA7orH1R3xmMfbqCWhEHKB79gJCEcUaWkj+0VDY5gnDxcFhs0scBmsHbqNROFBL4hMM
	6jwdBTRy3K+8WbPpH0LJqXSyDQHUaJvn+noOi3JnhmQd71Pw7cbuBl1jxUeV7dbvKAb0Ona5jby
	Pl4L3m00q7wdMqmo1bdnahVCErBxdS7nKWSkr0kWBHXJ9DVwIJ5wvNMY
X-Google-Smtp-Source: AGHT+IHCaNRz8jgNzTe7X02HLlceq96ofFY+QEcp3cSOZO+Ea2N9Ngvuwc4vEBlOvjNHpM35FTfYgQ==
X-Received: by 2002:a05:6871:8081:b0:2db:f81e:db98 with SMTP id 586e51a60fabf-2e3c1e9281fmr11839606fac.30.1747774877028;
        Tue, 20 May 2025 14:01:17 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c0b2e1a7sm2348470fac.48.2025.05.20.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:01:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/3] pwm: axi-pwmgen: add external clock
Date: Tue, 20 May 2025 16:00:43 -0500
Message-Id: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHztLGgC/x2NQQ6DIBAAv2L23E3AilG/0vSAsOhGRANNJTH+v
 dTTZC4zJySKTAmG6oRIX068hSLyUYGZdZgI2RaHWtRKKKlwP1bUmf+cKKC2Fil/KAbt0fjNLCi
 ebeNG6zrRj1A6eyTH+X683tf1AyQkdZRzAAAA
X-Change-ID: 20250515-pwm-axi-pwmgen-add-external-clock-0364fbdf809b
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=hFJhOZb2KYc99TdUu5lHL7z+CYiP5EKAGEds0BI0i+g=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoLO1+HR1LfRmxZyAO7NhveFiE4LPjQiKuNkNUd
 vRwQOVK+WKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaCztfgAKCRDCzCAB/wGP
 wNTLB/4qE9N1BaGQSqUtXIzXos9hC8s+6tTa8iABPktn3wJygFb8c/spuZCi5MqJl8OwsbNjpcL
 f1NBd9v3FZ7ic40Bhj5Ys39/lW4jZEwzB8L9Dou9qKkgFcGq8kVui2c4v3olTZjjc5MnArHsOLe
 LigOu1fw5Z6Le2EzSqsCrm3mnsgrAUMMNfgSYWNcZlwOhzfFt310MjPPFNJTiNGa7D6ME+XkHbF
 pwK3ZEdMHuUjo18SbRFBtO14U2EfOnuFBgSgx4cDN8HgMzNK7nZ5lPJofQb3mSiuc3sNFpu9I7x
 Fd9ttx+7gIH0CuE3eSJz6Bb+hxx66EV63IFceqS9vnmSqH2X
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

When we created the driver for the AXI PWMGEN IP block, we overlooked
the fact that it can optionally be configured to use an external clock
in addition to the AXI bus clock. This is easy to miss in testing
because the bus clock is always on because it is driving other
peripherals as well.

Up to now, users were specifying the external clock if there was one and
the AXI bus clock otherwise. But the proper way to do this is to would
be to always specify the bus clock and only specify the external clock
if the IP block has been configured to use it.

To support this, we extend the bindings to allow 1 or 2 clocks and
modify the driver to handle both cases.

---
David Lechner (3):
      dt-bindings: pwm: adi,axi-pwmgen: update documentation link
      dt-bindings: pwm: adi,axi-pwmgen: add external clock
      pwm: axi-pwmgen: add support for external clock

 .../devicetree/bindings/pwm/adi,axi-pwmgen.yaml    | 28 ++++++++++++++++++----
 drivers/pwm/pwm-axi-pwmgen.c                       | 23 +++++++++++++++---
 2 files changed, 43 insertions(+), 8 deletions(-)
---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250515-pwm-axi-pwmgen-add-external-clock-0364fbdf809b

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

