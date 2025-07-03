Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B52E6D0F;
	Thu,  3 Jul 2025 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546716; cv=none; b=T/s57QpIlF3kgiov54inGdUIe6cI2FhNjjygIVt/H7JpAGhFQgnniv6/6UBnZGu0mdejW4wicSWZGaRrGEzM0ri00rRFYodQJw1ACkgL67HLmPz6sAASJsB45Phtzk4iDnxk2NqThe7qv90W/KlA1Y2SNrlCAeIFy3prZDsfV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546716; c=relaxed/simple;
	bh=rO0njdpGJRmQLICI1iSZlhb7/WOcHhA769ZS+UhR/0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIj1CpzLmpN0ZfEl3kvGDT4qZo3n/NTfPfg/qoTyjBInA/mTBgDsKRH9OWcGhpv+UOzvgCCtxQChu8Z4QzyQKLP26C7M+dbE4CT/2gmLVF6PiVuB1WoaMdmgKSJWcgb+HEt6QxCpNEgk6+GpgkMUJd50rGNLjgMY5pVOcMIuXd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1Y+GbwO; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1Y+GbwO"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553dceb342fso7392780e87.0;
        Thu, 03 Jul 2025 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751546713; x=1752151513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z5MFiFDbTCnPC8v5WpW94S0pfqFUuXgHt9s4lpS3Bw=;
        b=N1Y+GbwOzNie4nIiQ67mTk7FXf75qFeFYqu23zNerMjuMqGgRtL29VfNtluFLKkX2X
         puTGza2zQTAEfVYWEpQnAxOcA7nWa8COOyXm+UVC5RZIqMN+TvZA5ulVmVV0Vm/ssTDx
         w24UW2VWqj7NvIYOW6R2La3YD+L/82jqKRddTd52LoKgDtHBju6XixTj0bx7Cn9/rtaK
         aXMiPRWDZyC4+FOqpkZyZe7Js8CYYay0vkf+LK6pAaAAQSVHZYaDVHTOz4xELRW99Rtv
         JJf+fjrGYl0YJRApWKoOvk8Z4iKVA1g6wsjoKISmXYsXh6w2C/6OoCK0v0jkP3Mj+LVJ
         F+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546713; x=1752151513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8z5MFiFDbTCnPC8v5WpW94S0pfqFUuXgHt9s4lpS3Bw=;
        b=LW78J8/VEe6w6zyXurNk3Kl2/jNaWxlwZ+IA7Y5QEHsyr4R8VoQ9wOcF5eU3Re8rKp
         6wa6JBMGLiw/gpSCdUxLPJ4A5QHjqz0Lb2B3t7wl2p9OReWAjvFu/GfBk/8GzEbLqpps
         ZZXs/Di2EQvkTiZlDkcN+E+5+PVIa2PfF5bmRQgPqDiaq1zgG6Cn+ODjP+rc5V6XvQ15
         7VThiuAsBqQ8cfMYcfGm1FWSSo7MJCnVgxJ85LBe7nAfmBJtwnhlRFVOzeArf9SS5Pxz
         Z1Okc15pSY1wNZH41P8KQDV7QD0ZW5pCuY44A1GxPuK9owfPML+y/XD5T04/Seui6Fbb
         KryQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO7ugrZr48O+gUopXx6VIO5My2/KR2syLJ2VZJAGofjERXXmRL4AejFXfqtga0/th2mmPHPpsARlX9@vger.kernel.org, AJvYcCX9hq1sU2vLVPI64dkpQ5GAVG762i9ienmIKdiFGJL3bOm1JxiWmYZa3OuttpwFUFyDKoy5oGFmXtiaDWIU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl1jGrsT4B3yPEfJGm+3F5mxXjJ57UGxeZd4k33hqrd2p9Tvl4
	rWMtbJYhd1i9fn57jCuUP4wJG/mK9rI5yBwDpY0Eux3b2fgav/Pgoj82RR85467Bl8Kq8XokLmG
	3XpeaKHrmCoCgN0iOluavY+fem3+6m2M=
X-Gm-Gg: ASbGncvu8/KU3qwO+yTXjhq6YQoWss40TXKHcZr7jrPA832MgpYq2Dn8s0OyHRvloLm
	xxlPocWf1G0h1QpXOjH4OGxpAxdJ+N1pwDD7qm4SjJGTtJrLC4rpedHSPCvfjqcDOZ42OQCIgBJ
	SV16q5fjIlf0pQtTHSvRJIq/i4yiUvar111gv4OEAIadJHFPGj6CfrjTueSOmq290ti/WGwVIb/
	YE=
X-Google-Smtp-Source: AGHT+IGBw3CxY2v8MLX/NDdGlfF8dyBndDt1tavZLG0gZzxse3LqUUJJxO/JX2QX8e47qkWrZL/3+lhdGSA9IhX3VqY=
X-Received: by 2002:a05:6512:1307:b0:553:354f:1fe2 with SMTP id
 2adb3069b0e04-5562836564cmr2772958e87.51.1751546712637; Thu, 03 Jul 2025
 05:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <20250620213447.56392-2-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-2-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Jul 2025 09:45:00 -0300
X-Gm-Features: Ac12FXwocCCVqSmjiOxSD4g8dn9narHxqeilAf-O-E6b2FW2Q8eELtrk0gCMDmA
Message-ID: <CAOMZO5BpbVg+sV0DXNSeJmsKjrZzjVy2Dr6W2Axd5tGT-U9tEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 6:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MN states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
