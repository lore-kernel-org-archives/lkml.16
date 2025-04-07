Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C571BBBD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018501; cv=none; b=aaZBIJS4IdqD35ILr1SeQbpvJ+NiiLgCx+vImi5j24frJa+/NIZt8WSzHhVspEiLJzJZ0+/eThbv/9/lL/nOsddqLDG18YUg2IvmJPzhXok7Ggb+Y6/x1w/WVxH79Pd91jEeHkvAK0xBxTVw4gs8njwZN3Ao21zhuFTZVxsYP/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018501; c=relaxed/simple;
	bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E452JpbAwIOEYgXNVUNK3s+Dd9pvEfA/CHMbVzRCdacdU6kK3DGTOffQlDMqoy8mCdfvlpE+9C5TFonMMcC9q26vxODXNccVWhANQsWP0deCKVS/0onDHYUb5+iH35vNP8+zGJpgI2jUOHDEs+E5wYzU9V2P8orNTP+p5Rb7uLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTZvzowo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTZvzowo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ac56756f6so3505513f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744018497; x=1744623297; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=uTZvzowoocuBhurdncvrklh8cm6VOJJcEIQSRLbT+JGtoypeC6dMvlfj0mc8wZU7I5
         GyrRjkKf2AE/n8NApqIRK5yf5sUDv6SkkdUQk5Y1v3JAdo4/vUs0MpVkdQOaBEbrCvno
         9xwcYUmjMDtS3xRbrMK3s6cOK03cLKKW5aK+EpFFk/Ds5xsPLUCQc98cH9poXIQMrzz5
         BZFhHInzrACnCEhR68cMq5z8Jf8kDYV333FTnQUjigevbuBS3JARVdAfD2WSx+2AF+89
         Vid59EjqbCNvhYtEByIRuyLU9p/dim9hoQjOWRXYIjifXG19IKdXNvRHa4+t4k7QRloZ
         Apdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018497; x=1744623297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sY8de/adKxVx84s/9OXx6B8gB3VJnbWZllFUS1NDxPo=;
        b=Wifzcl76x6i2T059d16zqmyVWpesDdtOW9i464qAg5KCrZ1hp5w4PxkACjCx2hnE6P
         hjviXpisg1jdt6CVhC3owEtTl7bkgm9sW9Ziyp10Ovbt3/8ugoOJRyl0vEQwRlT0KnFX
         cRXoQDqUsC3FqH4DDk8jM+ssn+zSgEPFNyHibrfBTn0V6kEw2gqZVR6RA9U+2tzMjHoM
         Jlu915xsW4jSNhIK3bGsB97XgSSraHFdHNLLsJv79DHFTVp9A8mFy6fHBsjvQY25lVjn
         nrkg4y2M2VrdzUrn0vrSA35JKExN/vVB4/0kUuJ8t6JFnil/bPaxyiGQdbkWjmubrlBb
         M+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJTZJLsjWZOL0E4jXcGZmf+OIXElqAoECwQRT2Hvb3FjcXXEBN4CR1dvcrYnwfBAkGRp2557EP2EMjMlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMyKnHUacIK7MmPHuz/rt8iwcwkr4SbF5BlZxA/M1VRlNBr+OI
	7/+bOePSpmBMFA8YmBP6ybU7iJI+5F7v5cLDrrsmsyTF59cmPxbxell7dllJdpc=
X-Gm-Gg: ASbGncvn151X/syV4J8ivAvFTHHkuQ7eOK2OdNM+ZPxbZ6fLw2yD7G2+KRjJIBr5e9n
	WuBzGkyQFvRgX9XgAbj5vOuNc8h0PWQQFZ3kb3zHJYpuKBSnf/rkie7ko5hJ6m7uiQCDww+drJq
	UhaayUK4ePiVOCoDWdy4u4evd8EkrJkhm7VrgI9tsemDC3IEWKL82Lw1QCn64DmP4MNTHid//qL
	ZRwyBlxt9zKPE0fw7BgndwQcSYJM1FWjcR8VstEOz3IBpg8EgRAXGPmN95TCUBUma3Y2CtlznJx
	U/9zp5fzlPq3IwrtHQxZETnpCU7or3f0kO8iUxVesFWwrDjd
X-Google-Smtp-Source: AGHT+IEK2ylsj8A3zv5KP41r85GTG06Mj0FN2K9Pnsar54qT+bII0+ur9gb54xnBI0cqR8Dv4CuOpw==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr9835262f8f.29.1744018497031;
        Mon, 07 Apr 2025 02:34:57 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eda4662a0sm85615765e9.36.2025.04.07.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:34:56 -0700 (PDT)
Message-ID: <305582d4a9c0fc8f34f997a697081409dd2df273.camel@linaro.org>
Subject: Re: [PATCH v3 27/32] rtc: s5m: add support for S2MPG10 RTC
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 07 Apr 2025 10:34:51 +0100
In-Reply-To: <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-27-b542b3505e68@linaro.org>
	 <5e91005a-28b0-4508-b576-5406f3e048e0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-04-06 at 20:33 +0200, Krzysztof Kozlowski wrote:
> You just sorted the MFD headers in other patch, but here you break the
> sorting.
>=20
> For me patches resorting the addresses (as a separate patch) is churn,
> but sure. If you do this however, it means you really believe that it is
> worth to sort them, so you must keep that standard for all your further
> patches in that series.

Definitely. Not sure how that happened :-(

>=20
> Rest is fine, so with this fixed:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof!

Cheers,
Andre'

