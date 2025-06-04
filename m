Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D61DFDBB;
	Wed,  4 Jun 2025 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749055477; cv=none; b=Jm8IFMltM5RFbgKfAuOx1eXHxOsbLxam+PbJqV6wD6Kdy9nhEPC1zU0qjZrMoXjgJD/5VaxyFaHYDLoPLjRHib/uH5y8yIKWYiGhqhpyrxY+Zai6tqHoXt0v9lvIUzjvlX3mZJTdpt+6+35A1zO7U65d9/U07myLWNY8RwpqF6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749055477; c=relaxed/simple;
	bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szGbH43v4PUnG4/Rus8/InPJpxV4DNA6i/Tla9U9vUEgBs/cQYzElMscIdOKoIUEWu1txEC4LGYBa2SeiqIPROdi0QHQ6yQjxp1HHG/++XQAqVzYona05X+fFVyJXk2UrYLSSiE/14KNvvg73HHLXvFcxfIfDptTttnpyscWwoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7tMonCT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7tMonCT"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5533302b49bso8654028e87.2;
        Wed, 04 Jun 2025 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749055474; x=1749660274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
        b=C7tMonCTwoD0eOI8Yd1pSJVvuRXz0eGiyC1b2idGozB/7yvgfcO9WW05YUWXk5RIxa
         bKfyvARQ/ZobkF1HZYSmm/EWe5kvj7csArrn5pYaT4Y1tKxI6JUGcMBGKn3Ux1VSBja2
         N+WBJ1O/x9E7QOX5enDecFFcAb7g83RJTxC5/I7szEGj3zr1K6aL6qp7HTtY7pf60wTR
         vHr5tHj4xAVE+UQUo/jyaGbd7LvOb1MwNaKp0/jaACMXmG1bCWsaVBtzUQpRTqCjTVLH
         EmNFwAUDqi6XUM4ElJKTvFDd+nZRtV7/5cwUZyZrF6pyyhgeTjrLeppC///vEq8NVkKt
         a5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749055474; x=1749660274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
        b=iRtaRGaKkk28OMgJgtaQbSSqdWgnMlJiOSGDJ9FrwDjF8uTm1M2nQNN2szxpzx3RpE
         VvyyZ7LhrPfID7NJ8q5hrx5p4yWvAv+lUWHyNFl9PV6fU5fs8QfE9cH/YpjqbRiAxohg
         BZ921uuUoIaHm3gxQl0QRXLkkajD4q0xGdkwVMx/7bC8txWNdQRPDC5ktfHf9DgIZ7N2
         wVAi70fBrzTRqKyKlJWUh1S2rFjHbhR3X1UO5jA7RG7wajVwqJvuIp85SP05t+x+Soge
         naysqQbb2GRAAoPEMijLy7cfAPIDVUAxb8bf27FhFghHcNI/1MFPjh+LVLKpvoiIzwwF
         3R6g==
X-Forwarded-Encrypted: i=1; AJvYcCUEgOBow22FWOVYgZzZyRzR2WMrRmTkPY43YbAw7fNIcYtXjlETAAeZwpQQw8/dEl9OT87OJE4HSZ1QPuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YycElDVqG/I6sjjfBz2xk9eb9WsLPHFfMA21g/Ud9A4jai0Gt2i
	SAaLAY1vb5/PmrN8o4lT3CSUP28lbmhkcNlp5AbPiz+FgX1wjVqEI00iI4/VNi6nanF+R3DHeYt
	CHKF0dzeM9qY+8fx0QkNQvr9yu8A7GinflEl3
X-Gm-Gg: ASbGncvef4yL5JTuajuuC7J1ku3jum5OkWVlfYarx1Lk2LUwEqPPi3FfDVQ//fXmevZ
	S5XKaizZTeCDhHqPOELfkLSSXvy0VljU70SnWMtl9ve2J2XBT/Obi9L3p8adB1Uyq0YHyvmWGhF
	zbuRTc90k1l74BnR9jXaXbYFRfthA3DOYmrvjWplUhWculeWQ5EeGVhxDDo+ObVpGVdudUt5xxx
	vSfFNqtuKXONA==
X-Google-Smtp-Source: AGHT+IF/YsIUFahxFoeFKA3DR2RVxvuZILJjjOA/b6Zn6AHVPsWFoSWcKKxSdkTyVWeKMDIAuj3FRHVXkASKTjwKFFY=
X-Received: by 2002:a05:6512:b86:b0:553:25b2:357d with SMTP id
 2adb3069b0e04-55357bd6f7fmr943933e87.52.1749055473351; Wed, 04 Jun 2025
 09:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
In-Reply-To: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Jun 2025 13:44:22 -0300
X-Gm-Features: AX0GCFtSAkrZTNsALuZF7FxrEF2hbsck5XT79hM6Y37nNbT0k-G0Qzh3cVE1Gmw
Message-ID: <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

Nitpik: The subject line of your path should be:

Subject: [PATCH v2] arm64: dts: ....

and not only

Subject: [v2] rm64: dts: ....

On Wed, Jun 4, 2025 at 12:36=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
> Murata CYW43353 to the MaxLinear MXL86110, as documented in the

Murata CYW43353 is a Wifi chip, not an Ethernet PHY.

I think you meant:

"from the ADIN1300BCPZ to the MaxLinear MXL86110"
