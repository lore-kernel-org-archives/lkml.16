Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F21219A91
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746122180; cv=none; b=j2hRX41GrwM8e/7qiGndPEOc8EEKEkInS5R8j3f7XGVthyEs9PqNvGs/kMu3fsb5jktISYBlubTrHuexs2iwJtMWkshxONkLCk3F9iLciqk9eb32KpmN6rkVCsn+1zh9zf/N9fRy4CTbrX9qHX68EEgDFl5ChORLoqO3dNiHveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746122180; c=relaxed/simple;
	bh=yMNtWprp9hGVcmDsXUvrQ4wzAa1/Y+GrxX6h6G76LuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=orJFH/E9hnxbpn6snZzZfKaj/a8jZgjgYJDjk1TG22qNhnr5fn3q4PySUKDcn107aMwpg2YWXuzyS1i6U6NKyXCdbNAEOoL3ksxDC+pk79dK5Jt/gCwguKVoiqgNehyE9XIdnTBa0Cy/9k6NZmLEgwr9ND6MAPiAkh5uQrjSFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzACQD+H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzACQD+H"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1616565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746122176; x=1746726976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoY9YtyHRjchtqVRr9C/bcavvPmvU4ek7LzLP2eq300=;
        b=pzACQD+HGOZqyStibT4TpiAiPT1fq+kJ6J6O4gE0gLwXiMa1SXK3OBFDHABjz7t8qU
         9ruDZlM55bRa+EIsRS2BWGjJs0CwCe7OeAYsONm+jQ5wIn0Hkqt7b/Q20nDdPaa9z6WC
         kK/Tfu2TubhPe/v9zJlGVareDlbgKRXVZ/sGaTSP7WA0mqrb3Oqts/7l+QEnA2Ft4Ju5
         CpRoKgK3GgLaTaKwryrJGge3mAyJA6HAWNa7F3OpHYISeK10XzOz0yHqoXN2eAiZ9MKJ
         W5lWQNXX85xbTFlWzayeBby3+1+DdLeuI1xzfRmQfhQwAMD4XZo3CQJT0SU4mitssTKr
         LwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746122176; x=1746726976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoY9YtyHRjchtqVRr9C/bcavvPmvU4ek7LzLP2eq300=;
        b=MRKQ7hbw7rdhH5cx8VudVewWhDWXquu3YFh9dpxyMMtHu5cUQo4N9wAeInA6u5iqV8
         xXZ1FMhG/M9fyG0FS/v4lZOtl33IWZzkb7BA5olIG5qLZ+A9TqBTGj2IAblHGXMQLl1U
         TRqJLfji/rJu1db2OxbNL8fxkMCZXL3MCg9+O9m2PE9dZfPGEJLHz8j6RZeCspHHRboc
         PAU1DkhklJBoh5HPN16yB6RqKmEiyyX+ne+7U4/Fob9j6JT6ZIXm2jFzBD3qEn0Tzxfq
         F9+BvFtMov9OBuPLIaQudXxdgHpBX5A6z5Drq+iYG5zEPUnBbzmq7YY/gW2LogkKhLD0
         nrcA==
X-Forwarded-Encrypted: i=1; AJvYcCU0tGdGrvYxngxx4j1Ve6IA20hOwxsKYvG5mcbcAFGzL1AtNTt4H/6cHW4mU4Apc5BSp44aWabKC/DXkD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4obpUHxCYsyqPUV7DccYmwPp1rk20zJ54VXxBWjtMEmcmawyw
	DytzHbfKGgQTonhGlmlHmiVlLeKZ9KLO3S/027kgwkFKTbOb0A+pT+pQq3x2P1o=
X-Gm-Gg: ASbGncvE9J0T4WVfRgyiAMUiHmhla8gxuHwzHSqt6Y+RjfZPWrA4DTX3zPo2CPcw+gr
	tHoIk6NeHfXgMrB6DuuloX2Xo88/FjP4igxgBmf2Fiy33tsGEDiUv/xYXF+bCgAS6V/SBhwLP5C
	Vc72Z0gViO7BjbdTBkydLDJS0M3KDmSFOlv1OxQUIBIVUCRvVYcZQ49jPcAYeuikzjiyA32evze
	tHUu1AAw97EZexe3DNVP4jrNO9zdx/3fcumxzWcG2Cyt5T9HJuZ8xfK5rfdT40KkbrUCXcIPDkc
	3CHlmkYptcf4eS02avEYFpNljh2ZhS4cmo80xn3EL0oq4JiXuQ==
X-Google-Smtp-Source: AGHT+IGDet3METYvky82Pz3U/aCuEQfWvHFuzffPmDQt7mMO1jqOcOj+FXoAP8XA/yJpJ6iyzo3anQ==
X-Received: by 2002:a05:6000:40e1:b0:39c:30d9:48 with SMTP id ffacd0b85a97d-3a08ff6efbamr2458058f8f.6.1746122176026;
        Thu, 01 May 2025 10:56:16 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88313sm1382939f8f.75.2025.05.01.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:56:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 04/10] [RESEND] mux: adg792a: remove incorrect of_match_ptr annotation
Date: Thu,  1 May 2025 19:56:04 +0200
Message-ID: <174612212104.144653.10192272362437782315.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409122314.2848028-4-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org> <20250409122314.2848028-1-arnd@kernel.org> <20250409122314.2848028-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=531; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=nIvM2hleaF9lQA6lg2YgnZmXJZhzlMkP+Hx0DtvZa3w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7W1CTSgwbr1fAv8Ri0WrIuIk18KdW0yTZM3t
 ELbULNaQt+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBO1tQAKCRDBN2bmhouD
 1+7aD/46U1t7Jv/szEczI1uyWpMa13SJk4IIQYXxy4xf4tVmcZo82aDmCpxMEMfiqJc0r5p09T5
 BldIfeiBjFvNJwPrx7BhkeKXuBNEscVnRsdRJushFlE5ca09OOxiq+n8Hfm8l/3MA0aS/uJojIx
 B5kS1vXsm+eGGjVeRzwrYmH1TcfPjDiQ0U6gDiHOq9Hny7TTNpd0yrsLfYW8ZrkVfeofqrTUt5Z
 m/Ph5Q5H0pAKKyRPTfstjAcpn5gNziDqi5+Sdb1oT2uN+4IVnKozXH9GH8CJa0y6iVMM+QnrLoZ
 lxKsARHamYk2eQNyTSJqpanfFvkpFIIAuyfoz+CO3ZIPm9SNzR4Hp+UUXj3+kg2oqIEad0+mzVu
 +c2FkJAal2HVhfXHI6e9E0fe+echcxZjzQ1F+OXxHxYiN1vgZNj9sgGmTroSKqmIDXgVlO1fydP
 Q5JFdxFmI9mLn9GDUbVqutDIqIJuPjdCnqsCPVFuXNe1PZ/vjROtuuFYWVIvP5HmK5NF/dn7yGw
 UgWsvce/WXjT0Ftz7/MCFpVmSdutcXmTgzabrTVGG6Am4CMk7Gdn6xxop5fAeBfQW4aWsUYGd8H
 PHvU3V5hydB8siZdxWZxuKY8E8Rx65uYzc1nyI+/mIo3vuq6vWQYlyVsH7CIX/Y8bd5hkuOPCiC ai4Md0GS7jyw+Dg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Wed, 09 Apr 2025 14:22:56 +0200, Arnd Bergmann wrote:
> Building with W=1 shows a warning about adg792a_of_match being unused
> when CONFIG_OF is disabled:
> 
> drivers/mux/adg792a.c:134:34: error: unused variable 'adg792a_of_match' [-Werror,-Wunused-const-variable]
> 
> 

Applied, thanks!

[04/10] mux: adg792a: remove incorrect of_match_ptr annotation
        https://git.kernel.org/krzk/linux/c/7ea3876af994e4fd8065af0314bce6619e73667a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
