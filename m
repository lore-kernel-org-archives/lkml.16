Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73CF253F16
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308985; cv=none; b=haW6WLd4eeSvwRYHK/ncTAwRA1sfG8wyeU4lvO7I/hWp5a6YMCIJzwio8VajTgnSrOSspWvmLkQGG6EApa0Pz0tsons7qArCgpf0YTAQWn/2C8LXerqm0zJU2M+eq/mHwGfwih9CD0/98TwE0B/nKaalEnlX9Ksa6cmOu9ZhheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308985; c=relaxed/simple;
	bh=OEA9CHqkYBMoeGzaFZ9WJIDikxvYbquOXzaHyeG6RS8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HS7fM9aMXeKU5Vu8seO4pMflq82wUnS3YpmCQZWIgIm58ezsLME6/7rhxfQMkoKsEajMzdofOpU1cOGHP4u/aeGh299AqUBAYRWbeDbPlHZ8hkQvTCf5gKzls03fG9oJ+tX08AC6ezk/Q0dLj8cAZ237ClOzZghSatESN2dvbuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlSS6s7p; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlSS6s7p"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so1448401a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745308981; x=1745913781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm6ce7FCfnEHxhlUwpit5ul9aj6xgc9Jgba3jLGI3iA=;
        b=OlSS6s7pHWtyPb+t5aDqxT99ufcU3W9ftOc1pgMvQ59+nRIbrSMAqSe5YxK76VvzVU
         Zum/nKYIqZZvB1EI/nxNfgIL0PIBGOuxdD/kL3dCB1grXjiIX1ijpPqjgbyZvDMyltG5
         udkd92gC4AzCQRvkc0W/GCsTB4Q7wPInwFIa5H1lJep91RoO5R3PKICTx7ShcDOPqBRg
         729PbiU6F8KcJR1Zww3SFy7Osn7RdoFWgWSMiTukvI7MaWLMUbBkZw1f3bg889b0D9VH
         j8UITJiw99tQeGD6zDtrTOYMEjljqZTonnuNXSMuSwL+j/R5RxfrMG5Le7T/ZroJzQRH
         vvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308981; x=1745913781;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm6ce7FCfnEHxhlUwpit5ul9aj6xgc9Jgba3jLGI3iA=;
        b=q/QgQkkXU27RfzxMGN/nbSKrnRfDRy7deubPYz1ppqbRJoRY7JMNSks2zPXyFceDrg
         SIo/yJJ7Vjv8UUMb/GhHHUbZ4GLsqIfwNE4oJ5i5bpJasqwlAVmjsa0umBNtL9XqvXbz
         s3ZGwuLlFIQ2xICJN6Nz/bj0hZQ4HBC+bCnNyS+GMABO5b8q6xdLQDUayBH0cF6xh+o+
         BmOKdflLdE4AvQLoumaC+jJrzG6dMH0An4Gz8Tj+rO9KWJm+hJbbAImomBP7vC2RaM31
         KpzTKT6qrEuf6/HpDziSaqc2NTpw9iQb1EiPp26ux21LUkE7lb0CvNzkGYtMGR8rdVIf
         P4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXTQA0/m9+Ja2UQdo+qd6uxvZtzcP9kEefag/eaA5XGjkpT+iTIDuX1s5nyVduJVGa+hNv2GGqucVuh5EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKm22G/DLbzTOYSmsj41iFNM3kP9mY94bqVU/RBp5vjrfF0bg4
	KJHlp2JpclFGDo6ecYOnLxeuTIPIhClWUK2jLxpsDWMl1cYQSA8tsn6Y9F1PHwvsgHlmm2VZAK/
	GTKU=
X-Gm-Gg: ASbGncsTfnxYZSRF1X/V9LWMuLBaZodpb/PJXmoulo7URhPpvCqNmolM1lwLzs/tPQ/
	YA9oKLMC0sDuDFDVTpfNvHQUjMlw/cYb8Y8IHBqta4eMMOnxc2jPXKylaydVUE/gDQXsJ8uvlf/
	rMVp5MWFm2vk2QaY/HZFbe0nuNcN2bjsvtvgm4cN6J/oSjO4MG5PS4iqY7PcbM/RkiLTaz1F7BZ
	nVkqPlhX92xpoXHtXJKmKC4LCLSmursX/l2dlrq3HBqkDrfCzFW339wNcIUR4qlNVway1alAApa
	74V4+PpK4h17iySkiVl4WT0Qp3YpjHP/esutDeIEof+8oU0D7Ni8U7Gq53E=
X-Google-Smtp-Source: AGHT+IEj9zYGHMUVy+ByRdrUePKsN+UNEN7rQuSwVrU8g1hXbVY98bZH5MP1B4l378YIYlw97Pfaow==
X-Received: by 2002:a05:6402:524d:b0:5e0:36fa:ac1e with SMTP id 4fb4d7f45d1cf-5f6285e560cmr4530395a12.6.1745308981069;
        Tue, 22 Apr 2025 01:03:01 -0700 (PDT)
Received: from [192.168.70.232] ([88.154.3.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm5532352a12.37.2025.04.22.01.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
References: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
Subject: Re: [PATCH v2 0/2] firmware: exynos-acpm: read fix & reduce log
 verbosity
Message-Id: <174530897813.9276.2456248075934997064.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 10:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Wed, 19 Mar 2025 05:38:22 +0000, André Draszik wrote:
> While trying to use the ACPM driver, I stubmbled across two issues:
> 
>     * acpm_pmic_bulk_read() doesn't return the correct register values
>     * superfluous log messages during boot
> 
> The patches attached are the result and hopefully self-explanatory.
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: fix reading longer results
      https://git.kernel.org/krzk/linux/c/67af3cd813695fd3e6432b0849c453250c4685aa
[2/2] firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      https://git.kernel.org/krzk/linux/c/53734383a73888e6d765aa07f4523802fdf1ee10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

