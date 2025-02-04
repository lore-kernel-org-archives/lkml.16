Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0685207A37
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659062; cv=none; b=Z4W6xr8DyDDhE3Eqrtm4FlMUcDqb970UG5iN0ulNDYN85PpO2N5XDDgUdZ38Ze60+lzxj1um1WNgX0g/LLgPPh905YICbF048UbipLv879IwoDLpvrgcu7EfyX/vYOCjnoQT/C50HFaLcACipWpaAR1r8rJmPWsNOB7Uao7x36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659062; c=relaxed/simple;
	bh=YPt7gKipaMwkPE8abX4wqOxhxvYT2FdS5FceQVgzPek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KgmYNcdnelHUz7aQGbwZ7pGNpmkpbf1pTs+MP4/wdJEGNDznFPJQHI3iX+Int+KSGMhTAGqGuX72VKssEirFLavNvBN44c2XI8FANt/4F1K2+zl+ubMd8Dk4JDOoJ6vq5ZC1tJITDgGjlw9SeHiXwAX3vIoR8meh6xJ0JXELD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIFosrYo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIFosrYo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862e570832so322203f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 00:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659058; x=1739263858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=FIFosrYoqaZw9A8jE3nW7g1JYOdhLSC6NHKF0mksHZ1h1PWUuI9pIhCMJ8pb/WEtZR
         DakFB1M/QOPcpwhVfCi2ukcqrBHUNDHlbMLR1s0/4bkToPFgqTmVkJj1Doz7DndoiKC+
         hskeiS3dgLm1vh+FRPwoLyZ9XRW+dXYgjB//Rbuw7d4zrNgYkc8iDXCJEJ3F8ssJbUhu
         W5sbSbI7C5+qC+xvgWgs3/f1Z//EbOikA51rqjtm1MYZacBKDbQaVK/lIL0gpNfjv7r5
         81f0+4AXmkYzkkzbvgIj1gvE+G/oU/3fWTjcJQhiXIbUcxpO9Y+ozSGj4NnT9wj7kdAl
         LqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659058; x=1739263858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHI4ANQ0svBkpULL9bY+LYyIFtREYaSz2osAbuLLKME=;
        b=K259yXl+H8nUVkd7/jcO2419LcPRafqkLiKscoq9NycBGxynKl8smPdCIiLg4oS6he
         wU9KLzHMkTH8n6lJ2o3ExdBYjZCl/T62WKO5e1hbBYCcoxJGKCO8Wq1Ui2Ba9KAqZNiI
         AmlaCDBWcc8H58YP5tFbjWy9SIownA7sOmWxX2t9HIrNvTwWp7ql5IJVjsW6GW7sHDSI
         NgleEXoub/i9ZrZuXY12UpGKfPE57IWDoHKIrwtyCMR+KDhf8gdwmlIvYCzyNI9WdLNz
         PPzjkWCfe+pRYqPA03qLAtPAFXHBdqkIzEUU+Pxo8FPutIChdvFsx7i0hTEIEeu4EXnQ
         6J0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUzdbfNLqF28QEFllV+duubkOqnEoh29ClbqNYoa8qIOiKqVHBhD7EF/b4c3TryZ6S72/IsbGuaCVRclU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3ygWx9zzSM7VAO2MaHL/2ZyBI9aj7dxrh/JNbDnENY2L7Oox
	NDMzXwLjwfLglK9rr+jVctOlpDRBxp/9a1bADUQCpfPeyKws6Z85dTaxoCWriig=
X-Gm-Gg: ASbGncuBYvvi/f4S4AS3wA/UYAWvfG6tP6KmB7b5UBLb8sHUlMxZN8Wz6jJF0IG63bU
	Njv5SWfIpabHvFq0Wh0HwL0/VnssSySZcPK10s3Ipe8Eg+NTNc9OXU6ja4O4StS2CZbBPGQVmNd
	A+2c4Hmaiu/S2yNc/hFuzIEJTdCU2gICxB3wwahtJhKz9JX8X6KzWw8bvEhBDRWt5Vs/cRjf5+s
	9XyBOYH5r6esggEOqTbYOdQ+S5Ed4HxAehnQTu4L6HvqXmhEYzMS1XIhz20aRxt1r+rtdlpo2Vf
	8TkLubozjWMc4CY23AbNMYuqkSv7MN8=
X-Google-Smtp-Source: AGHT+IGO43N3gDtliqfjaHSeEORXODUkak0lfjeeQYTFjCKfZJOWJrPYG7CBCu9P6KNQnJ4ls7UBSw==
X-Received: by 2002:a05:6000:1f88:b0:385:e374:bee with SMTP id ffacd0b85a97d-38da4e0276emr723050f8f.4.1738659057514;
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250202220425.199146-1-colin.i.king@gmail.com>
References: <20250202220425.199146-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: samsung: Fix spelling mistake
 "stablization" -> "stabilization"
Message-Id: <173865905644.26600.17565544065003058616.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 02 Feb 2025 22:04:25 +0000, Colin Ian King wrote:
> There is a spelling mistake in a pr_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] clk: samsung: Fix spelling mistake "stablization" -> "stabilization"
      https://git.kernel.org/krzk/linux/c/480b1825d3806d744c589064df4af2bdbe2c7c2a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

