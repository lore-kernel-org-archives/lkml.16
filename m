Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7116F29ACED
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750872350; cv=none; b=NI8IROd3DBlXb6ASz/5ysqpCxD/Gqq/Oz8DurvmPu2WaT6uWxNLlwU4S0E7d5V426a0xM2KFTdReuekDxgiIdMU8eA+ux0mv8EW/ryV/2ZNoEiJiT4L9BuKu/HGi2fdGFZsTHMpgZMQTBxDriFDfr3OPfruSWUKetNUVnedt9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750872350; c=relaxed/simple;
	bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nUJ51IbsZusm4jbEtDe+P96aQhtpAwbn5TDGkLduhwiWrb397tM2Zg149IZi8Hq1PvRrz9ayUkggnLjR3Ld0Fqsq/fs/3YCOxZRQUH30BDKztAIbcnr0ktQr3pr/rKjZOhT5ExWJQzKl/6Fvh3hsQTJSEriJTeWT4O+cVr6aW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jE67b83Q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jE67b83Q"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso58492f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750872347; x=1751477147; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
        b=jE67b83QgwZcy6pHW8GumX2NRNDq0snQKw5l8LoV39RDzm998i1h2inlkvN5yiEyFy
         gfEuT+a/azn6tvE37Y01vL5tzWboOreQuuWlOjKLbeUDdrc6T+T93smKTBWNuGwJBkEf
         n9j8nHRZ6QDtb4ynm3Ydz0J898zvRpnA/Thk2bWOuRFxBIqq77SZYYqmX3DEF7HD7+Ce
         h2i5gC9e16aNeAKjiU9xUs9bDTh2Gk8mtG55XR3VEBiLsjdpoofek7riMheJRp30r88f
         DUm5mmvAT3lEbbq0w1Rym6B74AJfoWxOr3dplJ3AFELv42OHmCpyuDrjHr/sjHB/sVfy
         U7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750872347; x=1751477147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6O7A/YC5TjvPF+nYhT2LrlK3lJoYuXaotH9sOdtaJq4=;
        b=mydPzXa985V+xbzjoagdaeqdyiHkM2JT/psBfombB8dtAG6bNBbNaCSrTgLzRBeR66
         oiXWDxLeU9c9lDzNzTPJBGO4E54EaADO6rxLYdY9lbHZnrduG2BcEmQdYK/C7qvs3WY/
         EoruvsiMnuAIYUsIcoEEqPCU8x5dfjWKgLUJl9JEjeuRrobqfH+aEBnQlncdonJzt/ZK
         X1mqRXbLaNRYUv8gnm7qCwPmMHMkPCPhyUT6VZo7TCZkcv/NYim5yO03EZzKxcdnIO7I
         YQVObn0XkHWUW3PU9NDZGI80aoCov1TcwZ9/wDh/Lc0G++V5Ke6+f6Px3NMFgmjeo9bh
         MzXA==
X-Forwarded-Encrypted: i=1; AJvYcCUJFG2tYeJ+aibZLCX8cFJnAvrLapK55xiGHVcXOb9NJfvy3oAeBosWAI8nyIVIph+jQb+Jby/O6gEtr6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznzik6gfPYXEagDVUNvbJHGbsEwagWDuxLMQdK60zk1RjqGIhv
	UdYb7b/KRPaj+2j2jQ1byJ+15A6Qq7B7MpcaysdF1uPyKh6b8K0f4zJJw8LYPgVdvs0=
X-Gm-Gg: ASbGncvWG+Lzl6w72BgtxqHqNXMw8jIWg7OTvSobGKauqXU130cxtjGe7XTTmGvkOxY
	uLfa+w8MeHvVaNhKJSsne3SOf8ntFD7c1S/5ZqYgbfkssLVqe1PLfZ86UJrp9IEps2ZHk+cq55j
	35X3pswc8QMAQVl/1TSxAIbbTl9Qb9IeZit2VDwYIwJrxRXdZ5QGQOSapsKy3zo8kjcTNr7W0Aq
	1+YP/AnvVN6DwUn+jFpRw4rj+uHWb1sQv5sQP8hNTkdsTFYuCh43JfhMylPNIa1tbkBl20JWpZZ
	dbUrmzOS5kOI8W6JDIDtM5vWvXCfwozVaFYLzLpeCZVSgvZ1ac3aJ4HiHmOYPIZMtzE2Vhqg5Bn
	g
X-Google-Smtp-Source: AGHT+IEWqQYs8mY+5uoMYCKPajkMpm7F+LqZUiSbpYVGFaDjaB+825h/sM7EDs5jZzTatPcapcPi/g==
X-Received: by 2002:a05:6000:4186:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a6ed64bdb6mr2932119f8f.48.1750872346775;
        Wed, 25 Jun 2025 10:25:46 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6e9esm26240185e9.28.2025.06.25.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:25:46 -0700 (PDT)
Message-ID: <5113e57e0475a62f2f50006a7178377c508f9403.camel@linaro.org>
Subject: Re: [PATCH v2 0/4] gs101 max77759 enablement (DT)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Date: Wed, 25 Jun 2025 18:25:45 +0100
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-05-24 at 06:21 +0100, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> This series enables the recently merged Maxim max77759 driver and
> updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
> accordingly.
>=20
> This gives us some extra GPIOs, and enables NVMEM which is used to
> communicate the requested boot mode to the bootloader when doing a cold
> reset.

Friendly ping.

Cheers,
Andre'
