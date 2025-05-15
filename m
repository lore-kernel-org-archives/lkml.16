Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D166B1DDA0C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319048; cv=none; b=TtZx0TxpdbrYAnLIXnWZ03eJ99w2Hq1YyqNlQ0CFhclL5KIFzfpC9FUZLQQfbGX3uOpzmTCh5AcYmou/0uyIKGeki86vmUju1DrVKxm79XCBp/viSo7CTY/TsLJ1frfiWse4j0NXNN03iEgsWOHlxDuTPL9eBVApBw3Ujrdw5nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319048; c=relaxed/simple;
	bh=VZtLi41nrdrlH0WLSGh9zP7FBrQwt7KlH8yLUw1Qss4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9B9adJpIV718EjSon57vOkZZ8o/5X6zvf44/qFfAhvCuZx1dU9ETkxD9QmBFbo5tNdV1lTx0+8D91mpreOCpbRNrNKdilf9iJHv2wNjDJWGa9sYdzpHyNo7fPlrP5jw1D2XYmIolaw9BsUsOWaIy8g0QPrVJlIautNtLuq7sFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=VS+BT1qk; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="VS+BT1qk"
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AD7473F51A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747319044;
	bh=xlwQ+aA+muSzpaYiE0SvHYS1AnyEjU4h0g/olbACMZ4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=VS+BT1qklvjmbZoYginr9JGhwH1v/JeFE+etjPy+OxXOPZP3To8fi7MOaCIkt6iEp
	 tKqEH1COkpFtt0lzGVEmp873IbAsUQN9ISgNZS6J1r6EerFg7kW1LqdVxVfwXiTK3R
	 lD2mlK00A2jKSkdOVh8H82wVIwYq51pxP6CkyVVxXxk7CKF9VYsEqI/QntkUDu5TZv
	 obmpTFtTIfllYui+qw4ZE3bC0QXaNQuqERd+cSIxLvGcNG4GXQnXgSyVI9PJG2fq2p
	 pa7iP6kXjNmjDiFeYFVRpPhjwKboqIIrxZ9YS2PYqWI4Ne7tLdzd4f9EcTfL3OSwkm
	 /B8Frl8EUs2dw==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6064d0103f8so1822086eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747319042; x=1747923842;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlwQ+aA+muSzpaYiE0SvHYS1AnyEjU4h0g/olbACMZ4=;
        b=ZNsbdbGQR7KkxlAfuUeod6KWqTnYOD6nDFLnft+WE5qaA9/n+gt7lw+NJJ/sN5+rfL
         +48dCYWyNxINSdbkcvKGgyG/uxojoObfO8vEZp+A3zZ6y0Np9QeiRS1+MZkeDecHU05s
         QfqeimWbfoN52chF2o8ytrbW0eulkpBuNVoEQE0wcRs3jqYYOk1GbuYmyWz9Hq8bizC1
         GDOE6gkHbgGvElr+kReSdvZ/RIyLF8CNhznMzuozmZ2gLUZUr5xV0PFau5QboJFY2EwU
         sZw9E7OB06BbKA0CPqwkLW/6ft3DNnw3qWjgs6KwyKmFB3EJ6cRSFBeCZ6xHp3UKNgB4
         yNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHnuMGTVokNDgAXctmScbv2tmZSd59PO2XxBUJdXANa8amIcIlXrReoWwPhJUO0zMW4L/A/ym3WMLWg7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Dg/qPcMWWebYgRrEvgT6OWe9NbByTxK0xLJzH2wDJWkTqEGZ
	nJtUIDkJA+3Po+cXINK8BheCD4VZZcWPTYKM/wZprs6Rr0FVI9WvSRF717tRvsWntrntl7IL4T5
	hbFlR83Bf8+ggodKw3F9M4fMMj9bNp1dDJ0TSCq2UvcXRWD1l8iFzeieJ2HzMjo+/vo6oE08K73
	ydtk7bN57QwU5gQJSyc3lMUumztPpTJ1PbENM/N9iaSaLWki85kyOk
X-Gm-Gg: ASbGncsU1gN0g5Tms1F0+ILqFXVIroA7MOmvNVo5lBvNDT0SjYUWFSPw3lVHcBNQEex
	6yFw5BS2L2Tt37+mBfB0qXFnKmMq3EbR/+Y3ZvpzzDDWKPyoZeuIXtv9+jUN7nNnsogmDxg==
X-Received: by 2002:a05:6870:e994:b0:2d6:246:dbe0 with SMTP id 586e51a60fabf-2e32b05a78bmr4002226fac.1.1747319042101;
        Thu, 15 May 2025 07:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH68dbr1tbLB515+jsbfah2xc7Zu3SzKVdWkjm3J29LlL6eUYcwXlX8tIrhIm/6dFYUiLHb9w4URfADfddYLgE=
X-Received: by 2002:a05:6870:e994:b0:2d6:246:dbe0 with SMTP id
 586e51a60fabf-2e32b05a78bmr4002200fac.1.1747319041629; Thu, 15 May 2025
 07:24:01 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 07:24:00 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 07:24:00 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250409-pulsate-buccaneer-ae996b6ff98e@spud>
References: <20250324020958.2235802-1-sandie.cao@deepcomputing.io> <20250409-pulsate-buccaneer-ae996b6ff98e@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 15 May 2025 07:24:00 -0700
X-Gm-Features: AX0GCFsniAbL8_iKhnPgXtKsmiLymV-zKuO-sYpzDWWvy82kMaCJo5ZnWZlRl1A
Message-ID: <CAJM55Z8J49VBr0WWcwBJvDnxnfX2UjGcC5egqjNu-oqqAjHcnA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] riscv: dts: starfive: fml13v01: enable USB 3.0 port
To: Conor Dooley <conor@kernel.org>, Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>
Content-Type: text/plain; charset="UTF-8"

Conor Dooley wrote:
> On Mon, Mar 24, 2025 at 10:09:58AM +0800, Sandie Cao wrote:
> > Add usb_cdns3 and usb0_pins configuration to support super speed USB
> > device on the FML13V01 board.
> >
> > Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
> > Tested-by: Maud Spierings <maud_spierings@hotmail.com>
>
> Emil, can I grab this one?

Yes, please do.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> > ---
> >
> > Changes in v2:
> > - Remove space to pass checkpatch.pl.
> > - Add usb0_pins and pass test on board.
> >
> >  .../jh7110-deepcomputing-fml13v01.dts         | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > index 8d9ce8b69a71..f2857d021d68 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> > @@ -43,9 +43,28 @@ GPOEN_DISABLE,
> >  			slew-rate = <0>;
> >  		};
> >  	};
> > +
> > +	usb0_pins: usb0-0 {
> > +		vbus-pins {
> > +			pinmux = <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
> > +					       GPOEN_ENABLE,
> > +					       GPI_NONE)>;
> > +			bias-disable;
> > +			input-disable;
> > +			input-schmitt-disable;
> > +			slew-rate = <0>;
> > +		};
> > +	};
> >  };
> >
> >  &usb0 {
> >  	dr_mode = "host";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&usb0_pins>;
> >  	status = "okay";
> >  };
> > +
> > +&usb_cdns3 {
> > +	phys = <&usbphy0>, <&pciephy0>;
> > +	phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy";
> > +};
> >
> > base-commit: 38818f7c9c179351334b1faffc4d40bd28cc9c72
> > --
> > 2.34.1
