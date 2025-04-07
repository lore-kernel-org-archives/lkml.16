Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A55614B950
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744008434; cv=none; b=RroYWVvPHDtGYCYqqfIGiCybzaRS8uRuQ2sMdMwsG9sKz1iQVfAbTyVG6eb4f6er7mh44GiWwKsBzvt4VcZbuzNQ+cGN5RlHjwBs4t4c2vPeeTZp5cHlwsf80c8R+TceUPtgLtmKfW6IzdNp+iByNIvU3JJufO946rzT/4dNJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744008434; c=relaxed/simple;
	bh=ccZN2lS+M3ZhqMKO3KcrCSac4MB9XtO/AGqThFv4LUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HRAOolHmliIEnr6GBP9aK4jXHo473epy9+UFR0/10yINyLqlNqGAWUlAU4f/t/ooRrupj1UwfoJqfsFLwLswvIDEwpMoU+/mav5adcEhgo/SA2+drMEEpfBi9rk/Ibz42N1h8Lktr0IlWOVk1fiGO4ewXw+ImK6v+yczijuqHf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+KmUO58; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+KmUO58"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913290f754so492392f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 23:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744008431; x=1744613231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XX4Jkq7F2MHTZ19HnSyenZ2sT8C/TpJOx93V1M+Do4Q=;
        b=O+KmUO58yXANYtVlLfT/O/5cm9BgiujVsWaloSWbri6pMeQWzQIzkWQFxUD8dpEtBV
         MQj3QrGB5np90FZQ8aSPEjgtH9nJA23kZdw9LboI75QI1aik2IqS9RCvOoyUeidqsw8g
         vU8ZiTEyryqwg9xseoSXApOUBhUaCNvFTsrarNE1JfLwoSWRjowQQNr3p7RiQCIvbcje
         /8/Fh5MdVa7c3f5VpgJWJ6gmWcEqRvAQ5gGQF0vj8vehmyvOvqvdhfu1/QvrpqzwS6qW
         Eu5nYaCykjdJOhRe2Sl88nqk/f3XXP8YuPppdEbX1cI0dk+xlo0ACLalqhRhpjqVnJD/
         ZP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744008431; x=1744613231;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XX4Jkq7F2MHTZ19HnSyenZ2sT8C/TpJOx93V1M+Do4Q=;
        b=GeEBF1QM0eWKeBUEbvVkC0nAKlXZoh4m+KW4/qCia5wLztpYocGWMIF1DKzyrbL06e
         1OA3BQKYWzNEKdzsv0xfYFDY2KnSZ2GzcduvV3qDskG2VBLUdWGQZk8EMVMsCSdFXfU+
         fZz/NVr9EZBbzF3Qs1e3TyVh5SIxObkL76sB+FLI3dUmXQOLebUsYT3HiCSAFz74Luhn
         5cLoo4qX9P48AaslX3wWzPSKAP5KhJpFULJKQ0BmLrTmaVh6hWn+ABY2obXF5MSgrcYL
         LMYRCqU42eov+IQBiEdIv/uFQcDQDXL9AZ1EmuJJHfRaqvBWm8KX1jCoWiXWcW4xBXH1
         JwyA==
X-Forwarded-Encrypted: i=1; AJvYcCXIz/Iaw69xwTtnrSUWxwOSsMbP1BWp8mWj2SRpzvzKpBG3zddO3WpxyuPD3IU7JFCvj/OegHsKiQX9+Dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxCMMeF/jiwo3JFK0pQB9OXqOKSb9R3btRUSdzp9bV81pNfEs
	ypbwPmBRFi+hg3KQ+VmbwEoDDl0y+xSdaHVX+h+WuvTvBZcbzHznv/CkUBASUSA=
X-Gm-Gg: ASbGncs9SiXXS9dpBA/gKhMq/9s8lVgVt+tizaOsPEepG1baswFHaEf8IT0rVO67vvo
	REybqtnIeX8dZGiXP7cGxAJjAwTJBasjVR+ScQEwlII1at08AqFmZeOoe8y5MJ9Lqt1sh+nyMzS
	ducKmjNmNPaGdltVSRDYaGweJ5PRtBI04z8xKXsS/wJibe7jYhx4BLpBgd3qnchj2ca4XfhYDYw
	V0sWM6NGVStHbddi2a3nJ/hW1GNccLUk9RhDNNKoW/NJYl+ufiYVGnuWoEnHLFhsj3PK8jaoKWo
	aQkoqUMGvWeW+OUgKBtK7dJRABZraOB+KjaNZ5gHga65SGqfC2Z1P0Vo0jYqzM0=
X-Google-Smtp-Source: AGHT+IFPlo+ogc8IoUpTutl/PEc1yBD2j3zf2hRxADVMO+meHMTOAqAONXCBpw+hbR5fT9xhQjl9zw==
X-Received: by 2002:a05:6000:2511:b0:391:320d:95de with SMTP id ffacd0b85a97d-39cb359e2b0mr3957525f8f.4.1744008431518;
        Sun, 06 Apr 2025 23:47:11 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a67a1sm11024855f8f.24.2025.04.06.23.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:47:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
References: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
Subject: Re: [PATCH v3 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Message-Id: <174400843030.38277.2924199101043205009.b4-ty@linaro.org>
Date: Mon, 07 Apr 2025 08:47:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 25 Mar 2025 09:46:06 +0000, André Draszik wrote:
> One user of this ACPM driver is a PMIC driver that needs to communicate
> with the PMIC during late system shutdown [1] and at that time we are
> not allowed to sleep anymore.
> 
> This series address this by switching the code to using udelay() in the
> specific case of system shutdown. This approach was inspired by I2C's
> i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
> case.
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: use ktime APIs for timeout detection
      https://git.kernel.org/krzk/linux/c/d2098981eb7b7d20edd294a8431908f8a0d2f9c0
[2/2] firmware: exynos-acpm: allow use during system shutdown
      https://git.kernel.org/krzk/linux/c/2d14c680e92f09d18b984cd1a8fae437f9ebc2ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

