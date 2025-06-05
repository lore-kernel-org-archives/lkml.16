Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EA1AF0C1;
	Thu,  5 Jun 2025 01:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088280; cv=none; b=chSjhOdgu8LnO9IxAiqHPGip6QiqmkR4KmpErpKxhEliXZZ2SH+eRU3ovGHpE3xwpZVikSFDiX8iKK3Cv1PyS2raRfDUyz3hPs3O9nWr3p36+H+zUDufnSgLJq7JZZ8sBNGZ6ynOuqEICYsFHlF7DonlUNyptKotBxyalL4Ul7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088280; c=relaxed/simple;
	bh=/x4DxIxH0BWpIRnk/qPEJtSiycWgqptgoe9uavKpWAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRcuCmMJZQXRqGV1CVgZMW40SE8ElC+tmIqSHhnykcUXDApTYwvaG96DmVWP1QW/FONnnxT7C0D0xlYQz9nqEC+UrLvR5geUtW980y2OjuLDNo10Tpt4a9f2ZtmPXBxaEeLJu7RVtjfMEKZhy4wMOyJfQrjVStlOZjRAlqOVJN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCgDCqRH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCgDCqRH"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551efd86048so455580e87.3;
        Wed, 04 Jun 2025 18:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749088276; x=1749693076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mlWn7On6mtDyUyW8xiNB9TSuIFhA67fSgyfU5pNabg=;
        b=iCgDCqRH15atGfTJLCuLLzdf5KK5p/iHM0ZCthrnHIc4hH0nyjQ3jn+KavF2er5tIF
         GdY73z6u0UZvCwWt8kHfS3b3DS91VJhkCJggGr2L49S4bxZ1YT6aGTfFHjM1pyO/XlWq
         s6nmX95qviPeqrnltjPprTlLEySJH6IvGc+0bFnyRUK9aVYUQ6lJcSNQZ3Oqvo+LgDSF
         ce6YxHsO1r2z3MVtSPgplf692NG+gv15Mr3+zeFnufgMZ/QKO6rwKqOnd3m9d//VBykC
         EBjgZRggncHO7DwjnJ40yI1XoPx6cqDqJrhMIoH7Fcqfn8cXCmW7Y83hBodHITjwsTu1
         jo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749088276; x=1749693076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mlWn7On6mtDyUyW8xiNB9TSuIFhA67fSgyfU5pNabg=;
        b=qvUAJEarR0W2lzWkjsgd++lZ3CVDXCWmG04snAEmrK+FEd3IFWbcQCLK9CidBLh5aa
         BVu/ZO4Xt/ijG+NzBE7sv9ofKn06Z4jL12xEs+kxFllfmAER4TeBcm7lu0aSIRq1ygmZ
         RRaTKK+f+i0jCKi0l47OQAF7xJgszyy00CAB+H892mRM80+RET4oONB8UKo5mhvzCHAl
         1nezOryymf8YUQ2FFjcFlqgdDcEQdcS8NNpgm7FYVHOn7P2EnpDywHZ0Gv8z/qABCiYt
         hzeKuDY82HCjFIaRmMawK7qImVgB4o+4BQB4ixlo9ymag5J2VpU13pJEMAfPM/EEADUi
         XLBg==
X-Forwarded-Encrypted: i=1; AJvYcCUXBZ7NT54RxXo54W8v6id4xwUjWmC0e1bhMOvm/1ElNjbRfRaV0wurj86FdArmvSnbeiaJZhry6Xkp5eZ1@vger.kernel.org, AJvYcCUZNDoaoSXYxZQTX8KefR+Iem4HnP2TUVbBTYmooLFq6RTwSm9pt/RLx1INMaqnsvR278s5BmCAooCN@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+Mcb61aiIN4HXiL7C1q/AN5+Y3lm2fnw1ZE4YEY38PwKr4Hk
	UdydNULGen/fPAOOGeZVC52a6/XTjaj+ztbXOWCpy1e02BEPXeclyyAtEemhvTbFDB4F1TcZx7G
	E737FgQIO8+h7noQj1/OkudgVu3u5Lsk=
X-Gm-Gg: ASbGncvOlm23KKU23eiXLk+9qLD435LEq1PohoRpVz8dx6Z+4DK6M7hOEbkIMGCDPJ9
	VvTDevPvJIF6rxZi2Y93UN+c7tcdqSHPgntpMJoACkrYRMI7yXagzfrsHgLGmZs/jFpQTGJ77JD
	SJQOv6DYstZTAeu37HAvDWkSUoPFRxxmQCOBYtqd8Fo2YVqElZxqNhKCbMAK0lxX+KtsSS1psSA
	MDjmXxhoaHY6g==
X-Google-Smtp-Source: AGHT+IEk5Zzw6tHETC9Olgqf21/GWZkYciJCw0USM5fgKHPvApi5DG0a0gN6WZoczUuRV0vhQDc7Mouv0C1rm4TpyHg=
X-Received: by 2002:a05:6512:e9e:b0:553:302b:85ce with SMTP id
 2adb3069b0e04-55356ae0fb3mr1520607e87.7.1749088276083; Wed, 04 Jun 2025
 18:51:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604200301.1192096-1-Frank.Li@nxp.com>
In-Reply-To: <20250604200301.1192096-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Jun 2025 22:51:04 -0300
X-Gm-Features: AX0GCFvVFxob8EVb6NLsa3nj-286Crhe1GjgNqXQ3KjHN84Y-NY38GeprMrasXw
Message-ID: <CAOMZO5B4QQmZ3evum871m8AF36UTckbaPCwVyKF8QVN4-Z5=iw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2]
 i2c[2,3] uart5 spi3 and tpm3
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:03=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +       spidev0: spi@0 {
> +               reg =3D <0>;
> +               compatible =3D "lwn,bk4-spi";

This is wrong.

I'm pretty sure there is no "Liebherr's BK4 external SPI controller"
on this board.
