Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E121E08D;
	Tue, 15 Apr 2025 18:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743387; cv=none; b=hCNdPDLmtx2YTbb1GoiFlWIILLi0ofmeE26n5CQT3kMYdG6dS7UoTcENdkUnYtjCcoYdFot/42v/pPnyy7JQlJpb9xwyOKZSwhUFtKZ4U1WxGKrIi9/OB0OMj/i92Ci9eTIkquu+M2f9PWRFgYvLk7XFPcAR9VcW6Vi0F/JwB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743387; c=relaxed/simple;
	bh=4Hgh7CGJxXIEv2IFwzCoT4epykvsdR8/qSVJxPJ9L7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C06lqCn6yeOyzHza4DbC+bb4KMPmTMqQVgantfh88J7jMd4asKhvmiyDd4i1VVhUdoqe88mQLV2vfghGzcsrrRmuEw+bHY/RaB6XVGARWKOYXd7WDZyC61U0rDobW0SfFpxbM54W49T4mtdDQYH3Wq4FxSt9gNdCEOEXmFmqPYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYmzhns2; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYmzhns2"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10956398so6880147e87.0;
        Tue, 15 Apr 2025 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744743384; x=1745348184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo5coXE62H2fouB9VXeUvOT/gACYQbPEWDtxaDqxcmA=;
        b=fYmzhns2J2I78cUlq6GeclX4RcHYUqOsKe3RxbUEjkbbaRZEB/afhyQt3DKKEt7Nbu
         qpncaTPQ3pmyCAxJ5Rqy1ayFZO40gRi65v7tbpw1lIbEETGYfXC4Ottq0equl+A83uka
         mEW9ptjPGQ3uUgxueqN9YOPyatfT5dMqx9LanGgAn+W4ovmJd2Gju7BNqCO0lY4b1dhl
         fJIHQ0FZNy2/lzyn7jcdZRDZ84T6W00nsr/+GPS/D+Y6iaBU4pc8FBMYNcywUufSh/7V
         R6tKOpaxvDKfel9FahczWdn0cKiaOY+Jcn8NW5W0RKPIi+3G6Til8rvt9x+UxroEaMij
         eA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744743384; x=1745348184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lo5coXE62H2fouB9VXeUvOT/gACYQbPEWDtxaDqxcmA=;
        b=jQLNA/uDZeavrJOS1Y10HDVboybBl+dQOKK9kBzfpseZU+tAVIdA35AC0UJgyKWcV9
         x5DcyH/AZQ6QZkI/6XB0VuaiGb+EMErqJ1kAVAt6Xi9cVdXyLeXIroTbLItR5vYfJRPE
         5Klg4fMXvdxTWtOsOJw6vMw4JBOmaLFhFUVMb/JY8Q5Vwwjf+/GePl9akt8FLegXuBUG
         aafIHx21O3YcUO04WGmm3PqQ3EivFz98zAlsC2j8T9on+gcCn+37Mqwpi7BMRiOWZyLn
         lKmNW35q9jz4mrN4qVNq7Nx9QdWxuTjDd5vzXm2gIJt31Mx2WXZwtPTKCshfujoJAtSb
         F/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqv4/sLRrWXNRvXnYCnBFLbQsNJXrKmqeULQgMPw5UMfDQpBbGCwTmQ16QJEJyl+FqyoEizigahwPlwVYK@vger.kernel.org, AJvYcCVycJxuAiee50qz1Ps8d68Yb5xTanBJGai5+q4tPJzaFglN27TeUk4k1GBcnL1JJlwQ2VDWrPJEniER@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfh1OH9/vK7nsfzAmakKSkgT6vkLGW2gXMQq6ieeMWQQf3JmMR
	+tM0Wr3HNCUJ12Uln5n5B/rt23sgPeXnYAIV+IwYvMYd7YVYqBKy3j24ZWqxupi30FxtypD6ueG
	lCOa8GNT60/sdwj+fOtsJTwnEnLw=
X-Gm-Gg: ASbGncsGXDD7li66GA6NvmzASZxROSLqlbkq6C4Ul8EfuuDfc4LfQrJwrPkh9ErV6OT
	vgraQXvCdavn1q8CF3eqy2iMPZIiLrhBjMmsNOJwzfXBGhvQmN9hjkyN/vaK/IJxJpGjKNv/kKQ
	C3g986eZDtyVer4LZsb13ydob9ETqUjorgiaiESm+f22cQQBuMbV3QZw==
X-Google-Smtp-Source: AGHT+IFNxa6DPHsE83s7VHoRFcwZshVZ41bCnYbQKpm89CbfRxgsUxs8fFz0skmgp05sI9qKmAv98Zh90yZk49Tor58=
X-Received: by 2002:a05:6512:32d1:b0:54b:e70:4122 with SMTP id
 2adb3069b0e04-54d59697e61mr1955095e87.21.1744743383630; Tue, 15 Apr 2025
 11:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-5-f309f8d71499@gocontroll.com> <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
In-Reply-To: <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 15 Apr 2025 15:56:10 -0300
X-Gm-Features: ATxdqUETMW1I9nEhZzbzObdwy0X6emkJSQXXceuVqIn2uB-H8JgZsWUwIheR5sg
Message-ID: <CAOMZO5BdFm-Yj+ZCApND+A7n3m5QQ7F1q2eS-eUrdGXgkTZRpA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 3:53=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Apr 15, 2025 at 08:54:28AM +0200, Maud Spierings via B4 Relay wro=
te:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It ha=
s
> > 2 GB or ram and 8 GB of eMMC storage on board.
>
> "or" ram?  I think it should be "2GB ram"

Please trim your replies.

I think he meant "2GB of RAM".
