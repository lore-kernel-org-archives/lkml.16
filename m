Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6118321C187
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746122181; cv=none; b=f2DsBayMJpB89rsxaOzFSYQ5E4jtPfDVEDL85cA01IkZT6LcAn2R13sLU7FAOqGpEb+mfLm3xvkt4DdaGCXJx0cNYvyC1G0w+EjgN8rq9HynFzxhkqMdL4d14iKdJsJ91XPhSTWQfQ1q9DBFtrylOYA3IAdfqvSFXRsQXiq/DYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746122181; c=relaxed/simple;
	bh=9TF4fOngdZ4nD3KhV5cWqzs4V3LHmuW8VqRIzOsqbUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B94bPOs5PgW9maPm4o45HCJ04vKF5koXJD9OVGTJkOmLnepKIDsSb1CcXmAeAPOEqFS/bPalzv9rYq1yDzK928zXRLJDxE687fjHmxPl+0o76gzXuqgsK7NkHm1cQwk5vn7Xi4Fq6fUMP+aSaEiBu2UprDwfCeRD8YblYMNb5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tHgjPi3N; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tHgjPi3N"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so1330845e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746122177; x=1746726977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+pQOVEr66Ph2QK2Y17YM4oQxPEXN3qmIEpxrXXVYac=;
        b=tHgjPi3NwjtZulvpgLqx13QHP39IDby8I0L6OH/CCtGnYGD89n2zCvLmjxY0Kj2iqo
         0gufW8LkJPc5G87e/Qqueh4TceE8SEbyPxJ3YY6vOxrw2SR/c7kmNKd5contxoze+PkM
         oHnOrgt8OpOxARlB5ZX7QZWYjybn6DS3SufZ2OckVuCdt9f6yVrkb3SM4eykDhBIRRvn
         L6jXU/3P/FiZkI/PJE9g2O4cXvja3z0B8aegGbRHJvDdEqjYz93Q+4ze9tD7dID1mrNr
         oUQIbVOSxBZ6iKBf7jreLuTlrqefPInRWqVa7NJS3LX7ZO/519XTMMAieoBg8z6sYXUp
         DuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746122177; x=1746726977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+pQOVEr66Ph2QK2Y17YM4oQxPEXN3qmIEpxrXXVYac=;
        b=LUI7tNhrK9yVbV3GS7s42i0HOwmfnnYvTcQ+TIkxINPT0hC8q/84dJ2ckvpjkMgj3W
         WGYo5NSRIsbf3CSs6ysL6AAv2kNFusL+YkWeG/0D6RHPlbppJqbCdg5QBaQS5mC5erqf
         yTfWuX26u/U/w+IwcOhw4NbZLQonOVB5dAnwCCCuiaFpgqC1zjiDVNpEBTP+vDF3JMRo
         Btn0FeK5N6q+vcE0nQytA3Pt+UmESAHukoaJKuRqB/To1HYDhZgtLQDWeN40riGpABsq
         HKX9rkJlI10W+AR3LP+gvOKqBediA3K2NtmEwCFurmN31blA9RLkYM1S9ctY6mUF3sGV
         OMdg==
X-Forwarded-Encrypted: i=1; AJvYcCWWk9rHaXZR4NleCEpEU6uTTBVPeeKNzmjLOe4KodZCsPFsr5MNwPQYcKmHoVWVU15H+pi8WMyyhCqdAd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaXFGeM+8p8r+iIkLQ32OH3n3KbihaDIPt94F+NL/ZyoyCQ7S3
	kJbWFevmVopsOEUEOTjEwTRaptTA9GrLezGHy4ie33cBtSEolYmcXyZnOPK2W2pk4SU7MKKvUWJ
	b
X-Gm-Gg: ASbGnct+uTn9hnLjRZAuLgXUT4Qfvm/aSZe+XqLzFFxOTkE05n0sE3YQ23scbNHyoPG
	6I3tWsD5RAlqpDtbOkzBmQC+Xs/naO8+E1cElMVO9405ebInnE2PERtF7ItArrITFJZ6qI5dBFa
	2Y4/dza9KRhFBwrIBpJvBJ7bZnSq3o2nexjXfLabM50qTu9zenZ/pcxf9SZBcJP+Rk7BQ6VTLdt
	fjOv4yT9p6peJao5NznF9zwK6zf7e5LXe5OSFSkY6afNfE0xC5n/nW31D7FFWigZmMjpkEdFMR5
	e1xCpGq7uaOGXg9t8VKMnO6Pq8j4Qt0kKVhlQtvax2mScHVvAw==
X-Google-Smtp-Source: AGHT+IG629SgcFydcCH8whY+Imhpwc4Xe1isSzfsgLv1tpKlvEdRauHEYOQvsslUEzzmwrXV5ikonA==
X-Received: by 2002:a5d:5f4e:0:b0:39f:69d:a869 with SMTP id ffacd0b85a97d-3a09404cac5mr969449f8f.5.1746122177594;
        Thu, 01 May 2025 10:56:17 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88313sm1382939f8f.75.2025.05.01.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:56:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mircea Caprioru <mircea.caprioru@analog.com>,
	Peter Rosin <peda@axentia.se>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mux: adgs1408: simplify with spi_get_device_match_data()
Date: Thu,  1 May 2025 19:56:05 +0200
Message-ID: <174612212103.144653.11184246576456354516.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606142443.130517-1-krzysztof.kozlowski@linaro.org>
References: <20240606142443.130517-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=390; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=7t/uscr+ZxLlD6y4IcUpfmlLzkhcF5i7O6LyEwuJ8BI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7W2kRLzYOtIIqYaqN73wXshwlgy2JXeI59rR
 u+pMalini+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBO1tgAKCRDBN2bmhouD
 1xcCD/0QjaZGHw3qAUfnjarJJ59zlsWYQYtMFD6iiodYwLupyfFaFDtG5p5s6ZHIKJiPtGmcHGk
 Oxb2ukTYrxXmSC+QIg/zF10xMW6c+bAssPCFOSMGCptvhVdUAh/6MNArsSvPnexMROgOF7LfOKp
 wBDXjJ+sTqnHrMaj5VE2kRYnNS4TNZ8OxNNEVXp7RJe21akRw9r0OmN+4LpMjCj3CS4y8P/6GMe
 DTe3bfSQlQSowNNYui4gKAt/gpL0Mu6A3QK6IvdcU6vGzgIIxYKV2Zq0+TashlCfNL09FChO74l
 ViTjlpsP5ciJ/OLv6quntHHKroX6KiQf0biB3LdGVdYeEkbtamwhsMXFVDKGq/cz5YGhREshApU
 Dj35kywG9Ro9ZER0W3XVj/Rk5uDy01u7QCqFEeFNhAdU6cLbnXwSW/dGujm3wUJPOJgjo85pRGZ
 LHF/xXKI3JP4vYdcCkLQmqtEMDYPgvZI7V/FQ1JJtC2av6IQ1Tp7PlpNZRBpFhWOC8aq0zMrdmY
 2ZvKNM5jL2uxXIx4zsEAa5bVogu4pUnUHjgFBS4bABsH5u5xvhRsU+q7+L/R+RQr8QIkG/vfnNX
 5xoVM8JmQy3hUVEmMJVMa6V5dweQNb9T8nD8JBWhBh18/E+drHeSuZshd9SYRYuaCHFLP8Dyl5u niX3/Y6/r1BOWRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 16:24:43 +0200, Krzysztof Kozlowski wrote:
> Use spi_get_device_match_data() helper to simplify a bit the driver.
> 
> 

Applied, thanks!

[1/1] mux: adgs1408: simplify with spi_get_device_match_data()
      https://git.kernel.org/krzk/linux/c/702a09507d808a8cc844ac35a8cf00b4d652dab0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
