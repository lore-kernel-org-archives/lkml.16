Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F795143748;
	Wed,  4 Jun 2025 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050474; cv=none; b=c9CIeTWMWWHgags5OlereXzWr/job+CFHy7rGpIl32A9/pfRCefQSVOTQTl7sghrcNT56N6D8Og66zUeumgc4+ukwCJ1P/DnCFPoo94A18l81Vux0dzN9vo9xWST8SMYKUZB9FwzbIRSLrOIurpzhMHEc2HR9Fj6yCb3tHGSR0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050474; c=relaxed/simple;
	bh=owjnO9VvFJBs4z0MLcAItFN+hb71KXnPMbLj2c7IwHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9gDpiYAHnTa2IduRWgTbVfRvZ3QLirl5F6fg7v9KmV8zNaN1NtkooyB1ehddGDwcWH6zyKKPtDpIWRd7v729SthEESo/LefR6p4NGvLpOUK0QURmfZ0yDWuS5b6hSHN4Yh9ULvKERjMwDv/vbijQ61hC3FxSF3ViEJVg3CWTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drLspXgF; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drLspXgF"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e8175f45e26so1492066276.1;
        Wed, 04 Jun 2025 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749050472; x=1749655272; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wC7mKSrr4kiaf3UIcJvhXmaBddWPavsd+lLtVOh+oBA=;
        b=drLspXgFdBpM2cbRuMGBPGKelh4KKepWJKqGw/HZDIqGhYx/miz5qXQI6hPaP1WcLs
         GvDuGO677YmbZ0a8LfvmVNjjyvR76C0KcCSIwpJFum/47f+nen8XVUbB6eHIqyYyQIxm
         hqbhHbvySQpC3YgkVMAHmQr3XgQvSRWuFhK4kHmeJ0EhHM5VyGZp7Dp0lS0mwWZ07+2y
         Q9UzWYYdTR1r8Joxulym5teTmFcyZOhNEHR74dkhKp0zMfzjHS6ZItaM7tKRJhgBelF4
         SWShyBbVbY+CCnuNYiuQbOurYk7EL9PFLQQfnRH/4LyFYXs6tdUt7IuJSGMGVwx7D1pv
         oFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050472; x=1749655272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wC7mKSrr4kiaf3UIcJvhXmaBddWPavsd+lLtVOh+oBA=;
        b=kp2BtT1PWSwivtMRitdxN7Cq2GP67/bDf4MAs4LocHHs0/pr43bjwLE1sQ+q5qbOPW
         Rtut+vl8IibGTKYjogY6auFyONScLCsIDueylDWr0P6vndVzVljL6YUNLt7LqHk/3CTR
         MwM2rPGEkDwFZGJnW/BIOFcQBDq66i6reZdIVnfwSFk6tGKuOUdQkLvd+UcINCNdpBN3
         4s6xc0OjHYgpcG2ssysUHbxPF3p4xQCNtDJbBnChtqsHNsMRBZHC/mk8XIQ+mGaINBzx
         IluDGBCZGJrtzZtMNK3TahukDfTuo9qc9efXHqLC7KlXNaZBg8LvhojLiTJpnlWbUf0A
         xucA==
X-Forwarded-Encrypted: i=1; AJvYcCUMBscKlhwnaQCMwR6QtICRtXwEXL5xqbLarhgtrMj5pGLrLxkHrOzAc+nVQ9QBP/7Etdyhkk4PDGoph3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1E+xVHN+fAE/MZ//teKPRhq2lUaMYSvSwdmV9zwPyB6IlM6Uf
	X5faKxfIV8m5OFQvU6alGDSqMbTPPwqSGn7Teg73UltSmcoFYr8o0EXov3HD1TcEgoqlwESM9GY
	TFkbOWrrV2hqbnQNMZswzFfZPfpueD/y0vytSvB4=
X-Gm-Gg: ASbGncvazsVKFh6jWHytG/iMsKrG92bK70M5vJAbftgaY1qLOeg7Shci4yVOjU9wQo2
	FB2WT1INUhpsTM0jhOfwx4IsDHGSuq0k53GuPbzN2jSnS4nZ8AM6YTGqaN/1vJVn1tF+hRsd2Tb
	0LdY2mwWb2D0dmRD7X6yEfTmRiciz6Kgw=
X-Google-Smtp-Source: AGHT+IGREyE12fbHjJBCwDCkpDdLrlnY34Qx31wboQATvSL9xppWlFT+MzuRD7abZcfpqgHcsVZXAPbDl5OG9kjk1cs=
X-Received: by 2002:a05:6902:2102:b0:e7d:6d7c:c33e with SMTP id
 3f1490d57ef6-e8179da11c7mr3933634276.44.1749050472139; Wed, 04 Jun 2025
 08:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch> <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch> <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
 <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
In-Reply-To: <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 17:20:56 +0200
X-Gm-Features: AX0GCFssVbXWXo-ClT4FiYIScIddnBW-kBko0Lugw34l6NVIDWlAS9mHkPVmzfg
Message-ID: <CAK+owog-Mipq2Oc0=gd8+LziHmVUrC5R7HidYYZWu9_AWu02TA@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Absolutely, thanks again for pointing this out! I'm actually glad you asked,
because it pushed me to double-check internally with our hardware team
and confirm the exact implementation details.

I'll make sure to include a proper comment in the device tree right above the
'phy-mode = "rgmii";' line in v2, clearly stating that the RGMII delays are
handled via fixed passive components on the SOM's PCB itself, with no
software or strap-based configuration involved.

Thanks again,
Stefano

Il giorno mer 4 giu 2025 alle ore 17:13 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> On Wed, Jun 04, 2025 at 03:08:09PM +0200, Stefano Radaelli wrote:
> > Hi Andrew,
> >
> > To clarify more precisely: hw team told me that the required 2 ns
> > RGMII delays are
> > implemented directly in hardware inside the SOM itself, through passive delay
> > elements (filters) placed on the RX and TX lines. There is no reliance on PHY
> > strap settings or any kind of delay configuration via registers.
> >
> > This means:
> > - The delays are fixed and cannot be changed via software.
> > - From the point of view of any carrier board, the interface is
> > already timing-compliant.
>
> Great. Please add a comment in the DT explaining this. 99% of the time
> 'rgmii' is wrong, but this is the 1%. We should make it clear this is
> not just another cut/paste error, but very intentional and correct
> because of the PCB design.
>
> There is a patch to checkpatch.pl i want to introduce in the next
> development cycle which will look for 'rgmii', and if found, look on
> the line before for a comment including the word 'PCB'. If it finds
> 'rgmii' without such a comment it will issue a warning. So it would be
> nice to avoid that in your correct case.
>
>      Andrew
