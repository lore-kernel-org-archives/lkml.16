Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C11D1D8A0D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743860745; cv=none; b=d/utx1qTHRZCeADTJ0L178aPt2phhhMe4qjqURz4ZAb3lZJ0hPWDL27FFoRBoimWMg26A6mMXiKoE3DScm9ch5CJcN9OYY2iGoJm2mjJ+5T+/dqYFrREXPNV+cT4eRtPsZ1IaUhlIb2KPVTW8/TLqfPqoUN3t1LGQ+HqanRCJ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743860745; c=relaxed/simple;
	bh=EsTBeulLpNgdTBepVvvBFd58E6zfqSCfffzBCv2HDaM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WFNar7zMMv7E9+6xFOaN6831m+KuamK1qhOkIWJQisiMOrwBaXssaIF2TFJYwOZJo+4ABRphNWnlQVt54JoFEGJW3avPFjHku2335hnO1DqICNyu71ooPlA0SjnCYBAJ+/Z9Go7LzKh7g+5cV4MmujxTjrhnZoyn2C+5iE7Yln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3YKwXA3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3YKwXA3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so2326093f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743860740; x=1744465540; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LL3Fsx5eUxzUjpXw1rSTcpeo7oV1xwNF/0+QoaOG4Ac=;
        b=q3YKwXA3tlVtUZYN4H/pUMFarbIA8SQ8VpyWzdqucSVn2DuFZZIHKFibfmubD7/w+I
         9XFne3N3ZuPsCRE8oxpBQId3bbnU3ndXQxCXEOw1P5xcrvyAh4wudAs3pZlBr85yinId
         +Bw0bVFRq11DjiBkEvMwNPyQ9o5uapuH0cktyGJvm9B/w0XqPV6NFDgLXiUb3JgcpbM9
         07oEEk2yq5VL+OAZojTS103lZpXpEb4Wx0bfhpaj801Nq8icRMp0ERh51DpLky5GAGoB
         0JsfvUJO+YPOtIrudO3Iu7F3wnJ/6maMS8sME9kj5taXUKp/BXW//npb1Hf+UGQW6wP1
         LRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743860740; x=1744465540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LL3Fsx5eUxzUjpXw1rSTcpeo7oV1xwNF/0+QoaOG4Ac=;
        b=jrCkRuDfj28CJBxUdicmtYWjMQN322lm7BiBAArzP14rotWTCb/5IRKU5lLnxIdIE7
         xjiBOQYsEFAOUoZiabtC+9d1bvt7ifYoUuPBXlpQqW6RStqr33N2k6d1T/tWdVGucKwV
         DN4KwB/SnfXQ/u3om71AF4bOsgNojNNTRI2BoYsO5PwA5bWLZlacFAU0TS5LRB6siP1D
         fTKpAqNtzAmwcLigZgFvIv5nhK7VHO4GeUxwL0XBs6ujAELKLtvn3NZmPv7A4ADTIpZZ
         uzbIEbz0GxiYXm7bpiy0+21icTD3RYpZs94+hz362wgT9q9i3wIeWsRnxt3m0O5As6m1
         DRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXslMe/EDd9VWQkq6cESqDxWgJIlJ1cgDXFuVn1XPEKSh99JXQH/wN2BjYxHuPXeAj5sMtk++0Phn5ETrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBq2tEgA6obfdjLw+y/SAu6Lrh1w3bDhQf+3TtjqkFxs3KnS3
	9NNoqU++bETfmtudyPVyHhF5X6iMoQ6MWl048QLV+/IpOk9yDu9DSWykPBdqNgA=
X-Gm-Gg: ASbGncvYt/+OOqPFOmRTa7U2R7RDznO2130hS4U03tLRUbjkotdWoJ1ekWmWaHoeTHK
	Z2+f3j1dxyKWFADLWjn/ADy/6F9rYq+Sb4rkmCJL5bb/BykrMDT5kUO8DEU0grOxodZQv9EpygD
	e05YN+P7LghzXeDHJBs3LuhZrMKZeqJF7uU6ypDiHqP+Ixm+ZYweLdPpNlGSuEeCDMDYgwq+Etg
	eTSwMh3w4sNWZpoP32MRUjiXEPyi6dkmjBTdiwZV8WfN+dTku0ECAzw7cAlbqLdM2f7U0OsaPET
	NU4QFtUAIDVYkHb3KlhFKNNICUGBo9gIiTmw1lRZsEsxdZkX
X-Google-Smtp-Source: AGHT+IFIrE80vYu3YH4Ih/F6/gPGXeytXrp/n0l7rEzhE9ST0HxKzD27qJymP07gALKPmymTgWitJQ==
X-Received: by 2002:a05:6000:2410:b0:391:2e7:67ff with SMTP id ffacd0b85a97d-39cb36b2972mr5950841f8f.10.1743860740427;
        Sat, 05 Apr 2025 06:45:40 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ed7sm6770756f8f.8.2025.04.05.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:45:40 -0700 (PDT)
Message-ID: <932d245b63abbcb96611715e8b234138087d84db.camel@linaro.org>
Subject: Re: [PATCH v3 10/32] mfd: sec: merge separate core and irq modules
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 05 Apr 2025 14:45:40 +0100
In-Reply-To: <20250404092131.GB43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
	 <20250403-s2mpg10-v3-10-b542b3505e68@linaro.org>
	 <20250404092131.GB43241@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-04-04 at 10:21 +0100, Lee Jones wrote:
> On Thu, 03 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > There is no reason to have these two kernel modules separate. Having
> > them merged into one kernel module also slightly reduces memory
> > consumption and module load times a little.
> >=20
> > mapped size (lsmod):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 before:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 after:
> > =C2=A0=C2=A0=C2=A0 sec_core=C2=A0=C2=A0 20480=C2=A0=C2=A0=C2=A0 sec_cor=
e=C2=A0=C2=A0 24576
> > =C2=A0=C2=A0=C2=A0 sec_irq=C2=A0=C2=A0=C2=A0 16384
> > =C2=A0=C2=A0=C2=A0 ----------------
> > =C2=A0=C2=A0=C2=A0 total=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36864
> >=20
> > Section sizes (size -A):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 before:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 after:
> > =C2=A0=C2=A0=C2=A0 sec_core=C2=A0=C2=A0=C2=A0 6780=C2=A0=C2=A0=C2=A0 se=
c_core=C2=A0=C2=A0 13239
> > =C2=A0=C2=A0=C2=A0 sec_irq=C2=A0=C2=A0=C2=A0=C2=A0 8046
> > =C2=A0=C2=A0=C2=A0 ----------------
> > =C2=A0=C2=A0=C2=A0 Total=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14826
> >=20
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > Checkpatch suggests to update MAINTAINERS, but the new file is covered
> > already due to using a wildcard.
> > ---
> > =C2=A0drivers/mfd/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 3 ++-
> > =C2=A0drivers/mfd/{sec-core.c =3D> sec-common.c} | 2 ++
>=20
> Okay, but why the name change?

Because I wanted to keep sec-core.ko. But with kbuild, you can't generate
sec-core.ko from sec-core.c and additional files. Either just one file,
sec-core.c, or multiple files none of which may be called sec-core.c

>=20
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
9 ---------
> > =C2=A03 files changed, 4 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index b617782eca436e34084a9cd24c309801c5680390..8f315298b32a2a9ee114ed5=
e49e760bd8f930aee 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -228,7 +228,8 @@ obj-$(CONFIG_MFD_RK8XX)		+=3D rk8xx-core.o
> > =C2=A0obj-$(CONFIG_MFD_RK8XX_I2C)	+=3D rk8xx-i2c.o
> > =C2=A0obj-$(CONFIG_MFD_RK8XX_SPI)	+=3D rk8xx-spi.o
> > =C2=A0obj-$(CONFIG_MFD_RN5T618)	+=3D rn5t618.o
> > -obj-$(CONFIG_MFD_SEC_CORE)	+=3D sec-core.o sec-irq.o
> > +sec-core-objs			:=3D sec-common.o sec-irq.o
> > +obj-$(CONFIG_MFD_SEC_CORE)	+=3D sec-core.o

Unless I'm missing some trick.

Cheers,
Andre'

