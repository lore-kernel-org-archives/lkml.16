Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9174C21ABCF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015738; cv=none; b=SxCaNv4zwbIufK/cWAQS8dUpDxvHzOG/z1k9YKHDwFLEcHWQSwwP5YBR5WS97ydGhPNGDNzy8mWq3cNGp/bcVah1MZVAxrFSPuTD20W7FZSNG0hRaSDUDsjjviWG3uhmYBRISCLkIQDug7lOE3giboRV8/ani/mT2NLv5wRHQ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015738; c=relaxed/simple;
	bh=KF6n2xzpAcKNPZgVLGNgsLKA4nfTZ74Ai1RZpgXWEGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sVKvfDW1oKCw2p7uqpS2FyNWyEeIABicqeYnlM4CjRPefPU2QliZ7FHZUTIFE1k9sohytX+wj5N9KpQ9GTwQusHqVY7a1nKVVR/d8BYOToKLKToo0iylJ+SusT9NLcEHo1wCO+A7pswdI8oYAVQyWWoVf7Ci51pfpU+I2FJMetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCWzx72O; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCWzx72O"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so270389f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751015735; x=1751620535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFxJtxrx1zJ0OI4OryDjNU8Y2lTkbxgsYsKEQP0KmBE=;
        b=rCWzx72O6a/UN6xar7UXEPSkFrL+qgRlrB+2IGTlHvzJn5GpRQz8FRgymq747EUEEN
         fk3joCMFqCFxUxhit/KbPfIddebAYmbytvoyisYBS9fK+jh6oVWewkfdX72CHptOC5ap
         Ilcz7GmcYqaWQJcnmIgnlrzCbQALsLSyRlhTOZR2kqBGKuChvjmliFFV3XUxcHkuUk3z
         OF8T9/o+ONoCaFf43Q1K3MvK4E/qmBM4d98dsbJq9v/PrLGPyG0e8ZYcjXWAjlHP8hwR
         aSg0SiybOrvUex5IuMX72CYMOE7bFXHf9IhfH3Ed4AWZNQAVM8e80SLmHA4OJYxKtQHx
         tzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015735; x=1751620535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFxJtxrx1zJ0OI4OryDjNU8Y2lTkbxgsYsKEQP0KmBE=;
        b=DkdHQwRlfTbn8bguSdRQku0kcKymMgRdSItmgwJagX2d3dYoGQW19i6Gw2wUXgQJTC
         HdBTHzpF2xRodceXy8yEmiKLT+q9TDhQqtri4VaNBcfVmmz9kbuqFm2dIThZ5IvzPzso
         389iLwi1WHqfQxmSfAipOfUzbFiR5dJBnRyFTI9uoRIweHWIjBw5vbf5pP/36ITMho9j
         oj3NQ3Wce3sCukyFn1Ogv+4rZagjUyJdjmq5Vxh0T+3E8F6JzkdwIr5pu6LYxyvw0aq8
         djsD0skXBwY4ZmLh0HzmDQK/uhKdxaY7UglyLUJv5fkk87rL6ICtmuZq1bUPCyrj73Q7
         NcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU81Iswuo0tCW2AEoGNqTSeibLOOduP/lwpw3ARZOg8Vcv/9VIAt04c4td/bHojHK6bJX+AD//4SWz/4Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qtujEhb8DsyfZQ5oe4Buzdx/6yLraeAH8ZDC71sWy7Sdcwl5
	x6VAnxjcsqAG+pFu5FYaJHRVYeO8eKM6IXf9QhVYJjJU3lFMPeoAoLeItOCV1Zmwxhg=
X-Gm-Gg: ASbGncskVhBTT84oNITnawhsL0Gl8AdL+LYU01RUPcrAvq4adcZqCuL7wLUHJEjqAZI
	wRO4c13Wha3cf5GJPH2OPcjn8ajUtADi10WfewBWH1YzLTst3AMleTLQI01ju/BduuJPd8KQSoy
	Og4HW7ZlVMrDtGp7CsBhz3/Wnat/EhhRORc9TjbG7cTwhEpG/PatdyFwdVsj2kLjlz63ZkqdqZh
	vuysEoNPLL74gXTY0rjEc7BmGstef/fhZ9FTpniZmtY1siNOTHtdZ7Rj/BD3xFWY9ElCJ4X4jnm
	Xrfpq/gKPewejTdIFRKqs8F3GkbiDsGTgERXYi9EeY5Yoej0At/ldPsVsyH2fp4wR2MqW/UZ97g
	=
X-Google-Smtp-Source: AGHT+IGWTiIfvGXjfRcFo7hTK1VN2IN646R55E8op7VekqX3OMHO9SkNO3nMyu6TsKKBy55gxvIINA==
X-Received: by 2002:a05:6000:2006:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3a90bf8150amr784917f8f.3.1751015734716;
        Fri, 27 Jun 2025 02:15:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fadf3sm2198944f8f.34.2025.06.27.02.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:15:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] gs101 max77759 enablement (DT)
Date: Fri, 27 Jun 2025 11:15:26 +0200
Message-ID: <175101571353.155376.11773851551126179623.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=HwVHLSrS6bPiT1g1q5mvO6HejZP4ul/od1tNGw/4tBg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXmEuSw70uHfGqcj+KJv188+R1vGosyjk5ow7X
 7tToll+rqOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5hLgAKCRDBN2bmhouD
 13QdD/9FH/OMCHHDQIpn1WzRj0sINjRlca9kK43MUnomL4QbpCJActb725g1LBV6JfBQIjdBbsk
 GfDrisMdgcktargu0V9bHbzNjRtsMpjicOzcWdoXiIxugvEPmM3LPjRaL8JgDawfnZL5v/78eRE
 AES834Bn34+FhC+dG1INlADikvKndrNaOb22sks6eEuJQM9z7sfxeQOY5ADdQZ2WeOCANOR6U7J
 M+f56kzcMqm+M3CUmFfO3pUgNTkc6PFkIlY0ODiL2ZtSlc4hJ6RpYaMnY/Xo+xA6qoo/bmafSFb
 LUn9nUD9Upjx1L7eb3TR3kZbj4XfcRR03D/DehsWG6U6NVfcsbHdaU+6VAjOZtg9v0tWiumWaq+
 RBYE/uZECEEXl4In9WcZPfE3MdaXsbNPSYwLSkjfeIUk11eeiiXND1e67vVH9n7ck7ubXQYDiF5
 ITbujp2FjOIHudJLXa3VyJt8nsJveF38yjjdX8scg/Fra3pOfPHxKwF3MYQj65BjhIthzlN5xEP
 JOOgAMYcS2MLCTu/fH/xqPIFRyhjZ53jqPxsUl1X7d+CJkNkzObQPREHo9w7n40poQ5l6SRsuA9
 2x0BHKCfq3SDG4THWCU6e7WRP+di1kGMyAVx6YB9HArbK7w9RLPsHRKWZH6yt+vc2ShpnPlTmGa mTCOFQWPsl8KrCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Sat, 24 May 2025 06:21:27 +0100, André Draszik wrote:
> This series enables the recently merged Maxim max77759 driver and
> updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
> accordingly.
> 
> This gives us some extra GPIOs, and enables NVMEM which is used to
> communicate the requested boot mode to the bootloader when doing a cold
> reset.
> 
> [...]

Applied, thanks!

[1/4] arm64: defconfig: enable Maxim max77759 driver
      https://git.kernel.org/krzk/linux/c/ffdf3c776914f89dfb452e2a572e5bb7e89ccad8
[2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      https://git.kernel.org/krzk/linux/c/8deaddf13538d68f4d7bd14a65dcd511ec0aba4e
[3/4] arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      https://git.kernel.org/krzk/linux/c/4292d18257c4a296f4b9e56a83ae22fecb63e727
[4/4] arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode
      https://git.kernel.org/krzk/linux/c/17a3657e09a326b3417a46ae0044163f2c9c03ed

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
