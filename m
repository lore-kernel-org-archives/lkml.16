Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3100299933;
	Fri, 23 May 2025 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027201; cv=none; b=Mge/YufTxV0iqjku7mOp16fjxbo41h4JX/K9GlHNp3JQMmYjUGsX7n2XyYJJ+uSuzpAZE9E+6RSyWqGybWJN8+mKxKnCpOobyHN4s4GQsOxAbtLoLriGSocNJGJgjhsBYL74rm6pFXmBzFFawPkusHZ0867NBzEFSybj8XEYj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027201; c=relaxed/simple;
	bh=XbQh1rno9v252j+9q8IevNN++8cYBYE8SzPCIaQepM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZZm4Nv8stNvi6K2kCLTgnxrt9jB1jAsEISl5V19m9TGDjooeeEIkz204tMmwmy3HtAaR4hJLKjg9fALqx9RYvwUkbuJVk1J9lfaxmVY+syi0fIzsjfKbxRpb4As8UdjWXyKRFTHRu2pBImsVQgsE51/TmDlpqPewwrjW5EwXCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igrrvLJE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igrrvLJE"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-551fb4d153dso186490e87.3;
        Fri, 23 May 2025 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748027198; x=1748631998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS0A7f4cZPS7BRx076fCSjrBX3EzmckOUBCVUWvGfQY=;
        b=igrrvLJEwtNaWdN8YTHR2ryC5x3W0zh4m6oxpZJeMcpM5+7eS+OrxTtTqDm4GQXaCO
         qgEe7CJun+vyA0pJiOwDb9HJrPR5f3kkVFvn/xtjxb8NyWL1UK1jaAxmVxlF1cPRBpeS
         y1puNpukdZRwpAC0F9/logn5xCBLJruN3E65ppqLroSKDM8AUdxkS8qhMpI9g1a48+Ck
         5jRFpSS8Is2UcRwrHA1pMBjjzhsbPbH57RemmjEGyKKrJRkaJzGOqAs2ZsWEQ/mBDLPo
         +3Ixz4cNVrj11lPXJP25yPGnAheZHyH6cMqovg7/U/sLM90T2XD/aMAFA0cmrqIbPrLT
         bjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027198; x=1748631998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS0A7f4cZPS7BRx076fCSjrBX3EzmckOUBCVUWvGfQY=;
        b=TBYAzrXshG+QRNmCyiadi9clTrmiYw8Wz1AVk3X6VwupNh1NTEax5OPznlTGD9idFW
         DcFyZvr420faifTXIdpgF17ihvA8G+magn2tMTB7MgCBK/ZrhKot8jL5J/W96tjcOdte
         35KkvUoA7AB2jiJIvalWn8ZE4Ey9fd1PYt9iOxaeP7ecguhPULzYczIIdWJ2+4Zcm95m
         qceF7X+lTb/Z9qTf1u9wC7Y9MBiy1cMFvToJZXz+Axk5nG59e98+glnqrxKDab+KawwA
         ozKqaEh/+cu8ME+qCJqdKFQPCjayCukEaIa9YeT2OmyEgUXO5AsNwIETpwvZzPfdEFNu
         7dVw==
X-Forwarded-Encrypted: i=1; AJvYcCVcaSPSymJC4+2F8Wrh0DQXKMYQRPEKM+ycYMITrVf4n1Tq3DcSm13Qob5YPYBplW+0WjCZ6qHOclE3Pvsl@vger.kernel.org, AJvYcCWF7M1qUra9DQhS4phkyCA9DnMY26rSkTykewJcMKRhYblbeUJgaateQZZko8Ex7xT+SYE9cL7vyKlE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoo7P499wi/n932DzRqdp+NCk2fF1j379ldQR1iWzgPHYAdmoL
	VaT/RmPGvGpXjvwVvPdXN5Dxw5M+fvsNFi8v+o3v8gkN7B6XZufjPLfGJlZrx+vbEHLtrHqdi/0
	gb4DM4t3fEhy6YeGdULeAWhFng9l58ax2Ug==
X-Gm-Gg: ASbGncuL6fH2116uUI3HrhZUQkCVX7vi89ywTio3p4eUevB+h4MjOg4S3wLG/OKK8PR
	A+pe8Ltq/Qvcm3pvDMeUprrMFOzaQOR2e6yxsK1/M6zsM2hAqPDBa+5zSQXuQrKFEzJTlaCer3V
	QJOvsh4d5deug64LocrVWM6tsLt2mMyH7Y7ktD30eSQixffD8dL8ZROBvNVmj8eLg/06TeZPn1t
	g8=
X-Google-Smtp-Source: AGHT+IETmeJkocuRxzffEQVOPnq+Mvm4DCm90i9IzQsKc/gpILBub7RZRta81dz6khIpq2Bq9LX8qd/CQIQnEMrf0do=
X-Received: by 2002:a05:6512:3e07:b0:552:1c32:9ce7 with SMTP id
 2adb3069b0e04-5521cba96f8mr174230e87.35.1748027197619; Fri, 23 May 2025
 12:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de> <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 May 2025 16:06:24 -0300
X-Gm-Features: AX0GCFsnj4NlCC9trwiG2lT4T5M7HQnFlcG-GgfTv8N9bFCYaGXgR6BHfTt3N-k
Message-ID: <CAOMZO5AP_ySh70S6sAKwKAqPypT07AdJdnkCZ55xPPRwY9nY-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabian,

For arm64 dts files, the Subject should have the following format:

arm64: dts: xxxxx

On Fri, May 23, 2025 at 3:17=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:

> +       reg_vdd_12v: regulator-vdd-12v {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "reg_vdd_12v";
> +               regulator-min-microvolt =3D <12000000>;
> +               regulator-max-microvolt =3D <12000000>;
> +               gpio =3D <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;

There is no consumer of this regulator.

> +
> +                       buck4: BUCK4{

Missing space before {

> +                       buck5: BUCK5{

Ditto.

> +&usdhc2 {
> +       pinctrl-names =3D "default", "state_100mhz", "state_200mhz", "sle=
ep";
> +       pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +       pinctrl-3 =3D <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_slee=
p>;
> +       cd-gpios =3D <&gpio3 00 GPIO_ACTIVE_LOW>;
> +       vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +       no-sdio;
> +       no-mmc;

What do you think about adding aliases for the usdhc and rtc nodes?
