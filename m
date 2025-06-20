Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29A293B42
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430351; cv=none; b=BQVfGiyZ2XbAwqC/LpNx63XNwrux3vHhB/zTHVBSC2Qlmt1KQ65gQ5LIhg81z95J7QS55XWCGTM/YResd3GAQx8TN515zU9K4Z27rcWHMGpr/utDskrv4ASpoH//Knkhramua+Ive4poCRC/u24yAdOdc9ZTHCrfciswFwlGBy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430351; c=relaxed/simple;
	bh=9u/UMVsbOfvdlKqQkHWv5U8ETyNtq+tbaBw59i8gUmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGihRiYU3DNeXUVIjzF8+hrZjyW/yiZUgMZkcRvmglBIETGpQssPM/kD82pHUN8gXIgtu2LxC6Is0o5sR/hNwfCZKWrPHabgyvzddja59Kj25auRegc2KKQuirJSR2vYNp+249vO0sTKwD3aiuZtUrmy7MpYpKpQYqh3FIBUHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g2oy9MDM; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g2oy9MDM"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553644b8f56so1963492e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750430348; x=1751035148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q9jPK46zsApDPOL6C1LivQIOx9eji9C57xl6gLXKoI=;
        b=g2oy9MDMdwlIDSWJAB+obLA89NKRH36+WzefQSTB/H6XBp+I/h4ivjsS4Qwt49bhHE
         ANTuXdAzl/T3pQ4OkL7NL2U7+5dFFhOK+NI2Nmh6IpMiViEqaAydxdHqZLm1QYWXNBm5
         gVnsbSO+VsB3nzZ4w+FnPBOVfRTepa8oSt0bF3WLUdgJgnkLn93EFaC5wuOSCctDpYCO
         pC4MBXNN5hs7QL8SH7rEqrVeGUDdlGV9JBvu5gDVhVYDn90KbCyWvZaMv1R1C4JLB5RQ
         YKIaHyuzRYw/zo8ScQe9q/rXK1ij2ArRGzpTDcNzoG15okb4bNeu6rme2Q2aEju4mAz+
         SuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430348; x=1751035148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8q9jPK46zsApDPOL6C1LivQIOx9eji9C57xl6gLXKoI=;
        b=OxSMACerauATBio6tH8agwDpLLHl9ENCx5CTr2KoMh2Ui05boBnH6shjO9AxooPn/P
         5v1wRLHP49neT9AywtnzSrYpAQbe4gVZlHS8xThnZexzQvNDj761TkJzn4G+Ey3ck6qH
         AT2PFFmy1Efaal+ai6dm2s/8sedyL5V4mwDSEMObpJ/NXw7NHHFv1MI02vp+2CrGEkZa
         GA/Nhts4fyr60rHkDcrZovFW3xLy6Uj3yanPKFDdrwB8dXMjwlShp0B/X84MH661N/Kw
         Mz2b7wh2drK2tbiOX4eSxf3RaGeODeGuBYFu9Nw8egxIAyAFG/os/vQe92idSr8a1nq2
         QVYA==
X-Forwarded-Encrypted: i=1; AJvYcCXfiG95CqGbtzgCZrSa8k2B/olQ/eoNvs43gr0u2w3wKZzulJ8/2uDCIxG1587hzctd22mwlcNUDOWZD80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxncTwvDPZ2lvQhxj7Kq5L4FQdUlLM5kVeAdTaXE/m3W/v/NUS4
	UpmfpprJcWS+LMm5RY8NzbVNr1AURACDxAfh6IiHnHkkG+lzGiijqobZ1oTPOc4HZeBFl+m5ltL
	Sj4prvDil9l/QfVWwKVdIUE5m8pPE1+2aOPUWbaHgXg==
X-Gm-Gg: ASbGncvR5sQY4EL0mIAE9aFkKnjflCHj/Ntzh4PHHmGTZCa7jfzgHgebiVV8iv2TPM/
	746d5srcG2OX4vHOXwcvTwYMoqI/eGn7jo/tc9/BnpPBz/0/KbmbWygPqPAHJsNTNNlAp2S+zio
	cFESJAHZWk7U79+Rqacb3JKTi8zuqGnpcO9KoDf8/MsKIKrdicS2PO3OP1DCcTE47ByhTX4fbFV
	P0=
X-Google-Smtp-Source: AGHT+IGjkgwvxLakGNgWVvM7O0xCSzMb0/KOdOUYDjcrFuGeTYUFULoeqZ3P82uB5n31lfl8yIBpzNsOJDI6YzmRriU=
X-Received: by 2002:a05:6512:12c8:b0:553:2868:6357 with SMTP id
 2adb3069b0e04-553e3d0b13emr1195210e87.50.1750430347854; Fri, 20 Jun 2025
 07:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620130814.2580678-1-arnd@kernel.org> <CAMRc=Mep0SNj6anWcmaNh4v8Z=J7eomujU69Gz_exuG2Wsd=8A@mail.gmail.com>
 <d05578a6-eedc-4c2e-94e3-e00fa293e4bb@app.fastmail.com>
In-Reply-To: <d05578a6-eedc-4c2e-94e3-e00fa293e4bb@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Jun 2025 16:38:57 +0200
X-Gm-Features: AX0GCFtvUEeaX9wqytjxNnYHkYskGpO6_dyNTKYjcEvttmf-q8EDtdSXs8QVaiI
Message-ID: <CAMRc=Menh3dPXbA7dJCRLRXu=FtQ19gwWLsDaWfjw=+nn2Bweg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: zynq: add CONFIG_OF dependency
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Pratap Nirujogi <pratap.nirujogi@amd.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:46=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Jun 20, 2025, at 15:36, Bartosz Golaszewski wrote:
> > On Fri, Jun 20, 2025 at 3:08=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>
> >> --- a/drivers/pinctrl/Kconfig
> >> +++ b/drivers/pinctrl/Kconfig
> >> @@ -603,6 +603,7 @@ config PINCTRL_TH1520
> >>  config PINCTRL_ZYNQ
> >>         bool "Pinctrl driver for Xilinx Zynq"
> >>         depends on ARCH_ZYNQ || COMPILE_TEST
> >> +       depends on OF
> >>         select PINMUX
>
> >
> > I don't think this is the actual problem. I can build (and link)
> > pinctrl-zynq with COMPILE_OF disabled alright. Can you paste the
> > entire offending .config somewhere?
>
> This is from a randconfig build: https://pastebin.com/ism57RPe
>
>      Arnd

Right. I don't have the time to look into untangling it but in general
all OF interfaces have relevant stubs so `depends on OF` should not be
needed. But it's more complex here in pinctrl so I'm fine with this
for now.

Bartosz
