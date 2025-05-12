Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5781625522D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747031921; cv=none; b=CduL+RtWhni3z7BEGwvY1hzzuLjF6EAhTxqgrBKbRjC6MwzOfMxf8qJrhevE3fifoNSkQnWqG7ZrJWJm+BtVg/7d2bRHXvkaxJ0mZQ7EgaPH6lzRdXgUXyhoxAwraNTVv8ZEZZuYsHzc+YfWfD0abB5wHvf90M2slF6JpyhRV3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747031921; c=relaxed/simple;
	bh=2tzQHpDO71ESsKIR1q5UmgJ6eEXFCFbdUtWQnFs6aTo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UZg3Of+YqzTIpqvKm6dSP0a1pFBwrmLMajrhZlNRRvrVahOx42WRvyBM/BhiC/qW7cgH1EW5u63idqszCpqmHRI7mR8LlR6NtYL68z8RR7P+4y/LG5wUUw/Vg/GOcS1zhTzuI0W0DCQPY3rOKNKVyWxfHI++pthMKEgQSAtwPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTBms/b3; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTBms/b3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso593978a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 23:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747031917; x=1747636717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vkhL0nOODbXgDR4wi4Zsc+hIMhl6G/kmLyU640sopY=;
        b=lTBms/b39YiPFqpFB061TTbvSQ5rU7FG3cd6FTR+dyzfiEM1JHh5Zhm7sIyt30tOf3
         gtDNVQ0DQFIXlR/C/8VQkiXOKCH1riE6VFYnr2/np0L2fcaNPxu5tlCIaY7Vdm5lbaud
         CVVPbTcSq+DgJXBVe+M058GCdSQ/cDrawtpAFfE826lgG1i9lTMicf+lbrhJ7lwVc5d4
         6uNahbM1pSVirNam8UgsWevf0J1hUguQIxrdi/DUsqmFGghxQcnkWsZYbl56N3QFkz9d
         xYdas667YOBOj5fw2bazdQEjKJ979Thnu1hjH2sWHp3+Fk0MFNCfcMmujc9SyVvlBwkH
         9/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747031917; x=1747636717;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vkhL0nOODbXgDR4wi4Zsc+hIMhl6G/kmLyU640sopY=;
        b=q5mcZswKoxtQYXCjotf6mseKZCm9FpXVXoDHuamfC0eclP4k6c6dy90DbIn64CedOq
         rcdoV76qyQUDyzwG4abOE8Ir3aYOlTeBgXOmYWQUaqHnsW4xaEazCBDdpkn5i6b5rYyf
         GviKAbYboR7vyZ1L5Qw4n7ifika8x8bLnOYsECauuHrPxwYR5c/8iWJc1H12iDH2j7qv
         zdc8uuAthEm8EvLFuilYXR+vvGDniArUvYqshBqaZDCtzDmDUfcUxt4xpOjZ1r2QygRU
         oqKWKhYGz/Tr9jfQu5hrJnm/oqt0PPUfREH9Ntmxb8gRBDwxPjuZxCTu/aGLqppEndhX
         vTvA==
X-Forwarded-Encrypted: i=1; AJvYcCUb3a3lFdsbg5ZhOn8/XGhCLO3Qafo6/r7DJIxR/NNvDIXRKp5MA3xOKhkwBYpsMiQ27IzZgbbPU4YrC3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG9DUN9vFbCD/Yj3m7zewKic9m9loRejZMrTz6e8gobhHOqOrE
	E3NAzv7utxRcjJz3wZxxAtz5SXN69vGLoznrxFBhghd4xp1DgY7IbT9Z38zXJmc=
X-Gm-Gg: ASbGncvL/NPaizx11yjV5pnJHc90O6vbJUxs83gq4bl91se/nvCIJ1Y6I9DnIOC1EOQ
	CPsq2CCE3XP4Iqdu1ycfs5MXeTISmPTF2m5u95hkPqCNGt/lKTdYN3HJpfKQ8hwIuLOqU3Azdqg
	YN7bT7NRJpRHBSZyWvIkdjJS1byRYo7yqaHiWAef+CKBNITv/7n1xJUS/zaElXj43J/5GAGeV0E
	N+PrZQkXPPimKbWNmWR4zW11RMqGEPlKC/QgN+WfZvO4KNvMs1/lENLl2hLHQ8hH6G2U/uEJ1W/
	eDB4VSjcHUrwz6zs91/p6woHLKWG77JIyWYoW1RW5aRPSaDD4uFQxgxwiGDUFOzZe/9fL24=
X-Google-Smtp-Source: AGHT+IFiYR8aqbHYam+4dCJWIuEBLrMR51O5qEO8DmYKMA5elm1tOP7pc2ZsyT0EJd9dssnjv/KG+A==
X-Received: by 2002:a05:6402:4309:b0:5f8:e24b:c8c1 with SMTP id 4fb4d7f45d1cf-5fca10e40bbmr4214805a12.9.1747031917576;
        Sun, 11 May 2025 23:38:37 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700e92sm5210075a12.55.2025.05.11.23.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 23:38:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250509104459.28167-1-colin.i.king@gmail.com>
References: <20250509104459.28167-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] memory: stm32: Fix spelling mistake "resset" ->
 "reset"
Message-Id: <174703191639.30920.15410579051169981008.b4-ty@linaro.org>
Date: Mon, 12 May 2025 08:38:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 09 May 2025 11:44:58 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> 

Applied, thanks!

[1/1] memory: stm32: Fix spelling mistake "resset" -> "reset"
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9c03507fcd6feae37a94eff376a1aa79700dd54a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

