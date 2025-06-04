Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA582101BD;
	Wed,  4 Jun 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057878; cv=none; b=nE4r3uk0etbV42nDQy+kBu1ZqjPmMNVUMDH+FR6Loz70Wf6UVRbx93gxG4O+UuATjAIP4rCn4y08QfO6odQXZq/TitJUeanko8FYAYvRhUI3GusSp7YTl5Y9idHwj96+r7mEckRp3ZhnHMY4vxEsZIJiJbtHigiKHpeBmnU75f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057878; c=relaxed/simple;
	bh=4T2Xhltii2sdundiNV4DDC+vFusCJPHnJZUONFyp2cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKNx9b2WqmJVhYcvyrnVexAJsSm/pKrFmAHTsmqDWJICis7RZa2rnuzTgQy9HNG6lLjYwWkD2vMoo0XU0CjyTogKNvYjsI/ISRnEf9rQk7ZI1KGb7Gz7g942Vth7nvr6gL+I6o6RsiPfvZbGWQb+qHRLxYF83pdKYG3Xm88NbB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUFIWL7V; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUFIWL7V"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e694601f624so100596276.1;
        Wed, 04 Jun 2025 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057876; x=1749662676; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nANItJ3n9rHzK0lPnEVgoGoN0BgH3bisoRcHmb6FsOY=;
        b=eUFIWL7VVISZ6R7uCEEOLa9aRFBEnhPFweoMJKr/1lJiQn+lnJ2QGT9gX1Xoo3OWs3
         DMLb80GUOhRftXRDCUZPEnBwDNC1P/NDxYM4jQnuNySYjRKEzQlOZm0hMRYBBeBY+d42
         6qkA4RaHntvBGzeytjx22AFqSyGVJMnioIus4xeyWI+YPUSbPGxMw3AvlQalcr3neiBD
         68+cGJ74Ql/sZUnrNGHQ67d3qsy6YFuIxdUfDbY8jRblgjclAH/djAUCzm+28GNrGLb2
         kxCltpDzfGt1xk1tOYBgvvEJG4F+X6chRTwpZlioGxX9vttqdl2k9PjroBvp+lqKeeM1
         4hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057876; x=1749662676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nANItJ3n9rHzK0lPnEVgoGoN0BgH3bisoRcHmb6FsOY=;
        b=TZCGhrxrrTebN22Yes4ncgZyP0Ci2p7qqPJAQtRM54SCcEupiyNy3CVt+Lflw/a6j7
         M8ubcrnY7EeIIVTUk0oR5R6ud18W3sYtQCzhzYJIk4Bz8Mx/E+6HhuMi+urvwPJWTLqc
         YKwAue2uPEn5y/SczPFDP+2i/EtT+azcX9UKqqEjYegsVooiSdLQ2wCUmtb5jWKNmGst
         qn/HzTkRKB1A+HAlkV5rXlGXKENYHKHSL0Sdwtcn3IJmYE4Ooep4ANsyYha25bVZzZ5n
         tIVmZ3BUhol1shbG7A4fRXNl2wpadbFstsRrxRj1dn8eLBjeOZW1UzWhV3O1rs7it4gV
         NFRg==
X-Forwarded-Encrypted: i=1; AJvYcCWfhHSBoDo0zKtKczpfzj9/aCTGCFPm+0rLbIE3aXZGnO8VlUi/eIdFPzTEco3NBx346jTfBiaIWtZqzpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKg8rVJICLsbeLrZ/6a9/9ulH74a0fU5N2ihqmEpAASDNcD2Uv
	nDU3m/dTLlYdHV+wRz7RcSi0oOnbjudzWgsurkIzwltP3oVTtOZUMLOQ9TZxeEW+7oc4OOTqHxC
	WirFgdVpvquaifIZR8s4DfeofGqSA6KY=
X-Gm-Gg: ASbGncuWCjtoQJKYvN3YSZo2VzRsjtftyEj0YGMAOy7nWHbeU3Os8ZrhWHvasSMmAYz
	YT1JMQtVVwNXZr2T+VXUKfszDORCLgqIU3CXMXb94/tYd9AevFPB4+/BeKA6yU+9EDzgil3pU/4
	Q7OGc5Gj41QnZNcMxmoisat2WU0Dvq7jGwcbVLN1KB5w==
X-Google-Smtp-Source: AGHT+IFqkrIQksf+ZagsLNKprT5D9Gkx/ZIPUPXWNL3tQVC5N49QOKwKG+17ubQNHdTkJZuEZwnE8mYB9j3MltCsOrE=
X-Received: by 2002:a05:690c:4988:b0:70f:87c5:5270 with SMTP id
 00721157ae682-710d9afc82cmr54862237b3.19.1749057875817; Wed, 04 Jun 2025
 10:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com> <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
In-Reply-To: <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 19:24:19 +0200
X-Gm-Features: AX0GCFsi-0DPQCLx4D-kw5G9NJPOyVhmZhQWfWIPFkfSiLFQtS5JLkD2hBDD0uQ
Message-ID: <CAK+owogo4+R+DM9rM_-ZqKRPX1wV6Vhdjrh6KWM71pqjQpYNuQ@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Thank you Andrew,

would it be ok to add your Reviewed-by tag in v3 after applying also
the corrections suggested by Fabio Estevam?

Best,
Stefano

Il giorno mer 4 giu 2025 alle ore 19:16 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> >  &eqos {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_eqos>;
> > +     /*
> > +      * The required RGMII TX and RX 2ns delays are implemented directly
> > +      * in hardware via passive delay elements on the SOM PCB.
> > +      * No delay configuration is needed in software via PHY driver.
> > +      */
> >       phy-mode = "rgmii";
>
> For this part only:
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew
