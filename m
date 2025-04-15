Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4335A27991F;
	Tue, 15 Apr 2025 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700180; cv=none; b=VhPrv9RQbvteTfcPPUC089IOMbeltHcio4ebgOh1DMYmNtvfi87d6u3UaZwWOYRl/R5G4wFWMZG0HuS1Kid0crn3pRf8Zt7LqL8ewPPy9fwTeSHnGHttB/Wp77/FalFH01BGlDixAoMaqWWWpJDDIlNjwTBOPjGyAXb/ryOuSog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700180; c=relaxed/simple;
	bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3DTxE1zqRi3hdWSzKnDls6bWOuozEWq/EeI2iF1OgRHa1eEuUfFyrLyK9Fo+eoty+A451bpkp/fjpMfB75zHwWyIMoS6XfF/+FaF37f3yROd2LjC9cOuwmy8b/nu3C1YsYGnR8MdqGoONh0izXf0LmtWFANO0j94IZPt9P1nIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIvNmK+a; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIvNmK+a"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af52a624283so4220916a12.0;
        Mon, 14 Apr 2025 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700178; x=1745304978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
        b=iIvNmK+amHP8X2BWEdsHyloSvaXVDHTB9qMz+unekO2ZGXoe4LxAkgwJjn7APsnHKc
         Y9V5XBlMEn7nYnRgXiERl+JKAfOKxw4WvexUUQwEME5+N+pzFadMC/PmNkK2UN400wro
         Ly2ChiCRP8jLgK7w538NU/C/rsWvL/huaEMoueJZWkQo3+5zQFk/30fdN+yuFqjFwEIV
         ncs6egLf8q59v1IzlaHHyVvaJ2SPB7bQl/DA+zMeXAXc8izdTK3e8K/Sb8qgF7TQHKrJ
         VgS/ySAfv1sVs2J6DHm6lmK4vOrGIUgcEB19wxup9sIFLgO0PFfGGYbZEkB3sLUo36G9
         fKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700178; x=1745304978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
        b=Z6UmKoUyZi46QKwRmr4ECaoFcR9UxJK6QiWJnhuYT5isLglzi6CDAOTUnnKoZCvrAZ
         arSdSRJjE03bjomaRAbGu2GWoaj4f5lFgapiePSZHghKwzrCF59pFI5zpg06Euj0Bgxx
         9dsGsVwvoF1qqK1zLDJDfj/ldHDvKAlq8IrQM8HJwUkXAVDKRAMZUJ38P8XWMUmqc2T5
         71qWnJ+WKGo2SfWLeztZ513dB4WUpF3lO5UaI9KtareqTMsgZ2/Y90vUqMgHatXiuw2E
         l+VqBlOiZhZLzKy00awEj3wSJUukViH9SXeQJYzzubYynE7SrRb/v9rK+zdIu77Dl/N8
         aFOg==
X-Forwarded-Encrypted: i=1; AJvYcCU55qWE51Q9qoBkQFX1jKLZLRey61FGV47pPkkCvsL2FyUuzst+8c5Nc1wI+gMcSznWBUGFbRWFYY16@vger.kernel.org, AJvYcCWKpK09Hw3EsJIYi2aEUhXL47bGiP1c9CUfChmI1PlF5eyOIQLvxf+7zktS5L6IHgaBchQ2WpSWfoydaTVT@vger.kernel.org
X-Gm-Message-State: AOJu0YzmmvtJ/L4xfQdlZ1TGETOI6lcBDhF9UpsX8M1tjK7f+FXHwdoA
	iHYotU+MIJ+eoYPEDqh9XdcNMtDq0ktjXXgZYHsH7ysP4SQ2f162Fa7gnFiEkRWjgww8G1bBK1p
	ORkgA2lffpv3n9H7khg60aIAVpOi4bwR/qcNcOQ==
X-Gm-Gg: ASbGncvR3qzkoOB4ohkPHWotAc6Iq7kHggdxSebjm48ZJevkJmADBsgy38/7wf32YOg
	WQiaHVD9D1JnG9wOACwx+efDRBAasChuF8BFpqPZwkgAqVoOGI92nQ2kLoDsp2HrrJK2hxjDf3A
	2iAJp/31ij1KbKZsOIaQ==
X-Google-Smtp-Source: AGHT+IG6NnOFJlKScP+Wamh79XovR7K0CPgG97m4Wp+PToKHbCYOR7nSiLCr5HD0lc3ekUswv3GSc/IBDvySxyjSaD4=
X-Received: by 2002:a17:90b:58c5:b0:2fc:aaf:74d3 with SMTP id
 98e67ed59e1d1-3084f2fbb88mr3226588a91.4.1744700178357; Mon, 14 Apr 2025
 23:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415043311.3385835-1-primoz.fiser@norik.com> <20250415043311.3385835-14-primoz.fiser@norik.com>
In-Reply-To: <20250415043311.3385835-14-primoz.fiser@norik.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 09:58:04 +0300
X-Gm-Features: ATxdqUFzmx2uRpXUocIpbqqLeApK-nJ7IdkiHEJrpoo6ZYi5WSR7a6jQ2PJwfmo
Message-ID: <CAEnQRZDtHWTEHMkhd6BqtqYXCkOcAEj1eNYDdkQ2FV3a4QDbvg@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] arm64: dts: freescale: imx93-phyboard-segin: Add
 I2S audio
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 7:37=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.co=
m> wrote:
>
> Add support for I2S audio found on phyBOARD-Segin-i.MX93. Audio codec
> TLV320AIC3007 is connected to SAI1 interface as a DAI master. MCLK is
> provided from the SAI's internal audio PLL (19.2 MHz).
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
