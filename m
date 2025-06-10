Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320672820D8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543813; cv=none; b=Q8l8V2RRYhd+HzOzXp+8lSfroahDyqiND2bCDK4H3NZWVuTmAsaS93SVjovoE3ojZEUGqGiSPujr9nR9KxMJ3sYHVqgYUvmTH/p8g22VwTP4QwS1+EW5Z0NXUJ21ZVVQ3/yHf8h7yBMa+OrSblbknTHcYSBFW1m9a2U+B9jfM50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543813; c=relaxed/simple;
	bh=H19D9alPOg4NvlOytAas0lPWL6dMGimVnVrY1ezdkqk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KlFcUGhfuy0+2e9il3htTHmMPDDlOMmLJ8l+4xMPUjricamL3Ip+14llTxG9zKUCOvz+CE8t1agcCvOOP735+M0XqiUjZx8LMdQnh7QfOlb3A9IUYJrvSsMfhafQUXzBZC7qtOgNJ1Yjcc2niwWjTYCobBNnmTX22jfONbHHYOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEG99JlF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEG99JlF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450828af36aso2335665e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543810; x=1750148610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbFRS50PxBtzhNgDQ/26OkD0E53SIgINiCNYBdMhaMs=;
        b=HEG99JlFqRa873UNl0KrVfMXotXUufNlYzhOme6WzUe8eIayU5/1SN996xKlT3EewX
         x4ik682y7RIA6tMZS5IkEDYfv3iFPOg5JEKVf3a5RCw4VoYOKzXYcRk6u5U9Jv3Euuse
         h4jsqnksjBVSCgV5sjyzwOOEitTILXsbdnuW9hetP30l2eSCipcHhbbwvLDV7WwvygyS
         xVKQVp+fC7IpSc4aEasnOle1RQF1Wyjne4ygq+JqS/3w/ZE+IgaSiccZQv1vXt4GDUyP
         emST3W18HNv1iF6EKaOqT8eyvPCfIAJ+0k/cpwTgJnYpfXJpUlT5gcADdDpt4xqC2JjY
         Gwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543810; x=1750148610;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbFRS50PxBtzhNgDQ/26OkD0E53SIgINiCNYBdMhaMs=;
        b=mX46Ds7cwaivN/McflYh3OHUrp+NgA/lsYe0prOCJcJnkp1lAenLmbdjWOV9O22vwB
         X+UE97UgdmOBB1j7RBLXYOMd2DEdazydYwLE2pYjTSbJsqyAH4gZJm5oHYbk0UpeOYo/
         jrI6zmRa5LqwXN1bMC3ZOt0BsREN2/DvmsThCqbidM4BHviJDQUyf1cs0EkkavWgYM7m
         rnwUHY0zpeuATNMGth0sAgjeMDhhTnep1rJfz4/FSidGwoV7lBKWTNA6/5YRr5rmNvjO
         OJe4JckRELgmls4Y0aMvjNy5gm/alTPIarq6YlF2miGYO7RtTlxxQl47/946uGv1C1Ir
         5jxg==
X-Forwarded-Encrypted: i=1; AJvYcCWNeK8jlwMiQ+kO/CIBSZZxpcgL0bEcdBsohglnZDdfvKE5BH6Hetoe8z0CpQL3twKUeDdLmRdv3vX8WMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/lKC3bgJUb861LXNvJRMXXyDwpArX3ITB15Sa2125KiwIDoX
	A0lO8zZhW4BXUgi/gn6GfuJbUzsSM3aK97ptJ7Lwd1HbngfbknD/Jwz3fOLP0mbhTiM=
X-Gm-Gg: ASbGncvUyrPTmNZFuNMfVSGZ90eOx6JJH+WsnQ/pWB1mAmRc0K6KcXpaBOLjbkahwq8
	D2YFkvi+4t3DXyAQv908XRAkpQVbm1jmgGW+Ei8fE2zr8qWURTmov8LmJivqCbDqVu+JvI8xAxd
	dSI82jIMHuZs+YmlYY++GmM+HCFti7vW0NmbLLNtxP80P2UyfnNhTSwl3fkO90dhDdA6twph39X
	qsSPnfBuriMYSUIg9x1xzohFysO4kn2X50s0mpsEoonU3jlMgvbMJLKY8LkBBj56KlmxHKofhRr
	jXvtAib9JTsm1YU4XS0JTrO5YaCJbAY6uH8lMQjSpdXKmpKWtnD9nfVxGVRsAHsipCorpOWPq0F
	oiujLvw==
X-Google-Smtp-Source: AGHT+IGuYXZh60MnbA75lkN4+EYNXF7PNeMVfx0sLkMy+S89GOUa8ZzBhu0Y6PM8zBmmRjjQtSKupg==
X-Received: by 2002:a05:600c:c491:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-452014b3fdfmr47660345e9.4.1749543810522;
        Tue, 10 Jun 2025 01:23:30 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm131726125e9.10.2025.06.10.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
References: <20250525191300.50873-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: stm32_omm: Use
 syscon_regmap_lookup_by_phandle_args
Message-Id: <174954380836.117761.16870623685676642048.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 25 May 2025 21:13:00 +0200, Krzysztof Kozlowski wrote:
> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
> syscon_regmap_lookup_by_phandle() combined with getting the syscon
> argument.  Except simpler code this annotates within one line that given
> phandle has arguments, so grepping for code would be easier.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Use syscon_regmap_lookup_by_phandle_args
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6d8b18ae647bb456d2a2dac9771d007f243537cf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

