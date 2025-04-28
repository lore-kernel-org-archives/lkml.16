Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CCD2036E2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834659; cv=none; b=GXQECKlXX6DeS786j7JuiPVaqQ+u1bOIjPvbuYLGsfr8WVdbxkJuSwi+wx7oKLU+c1l1SEnoHhNnxG0+uB3KIRyZ7mJavgeIotRFwUAMeBt1Fi0qOnanxb7GoLqCPUzMym5knWiWnIFfPl6qa/wlJeMRGkuJ20Ih7KjABBP7Z30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834659; c=relaxed/simple;
	bh=7fEi7r0yARLjuil18ZtvROfpnOhugcWbqFxzNrQ7poA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EY5HkecQpBigHbyT0EWhoZe7w3OY7wa6saKRbQ8e2E8WXFK94krhtjz0SEECi5Xvv3zYyHsVwPD2O7QsCJ1sX5S+vmM/1gVy0sQb/xM2HKxOwpJfgMhYev5+c0707B1iAaS/0yyKP+aKlNt/gpfJzRU1BDek3b90o1AWSJ2pOlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XuDAen29; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XuDAen29"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ff1e375a47so47018767b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745834656; x=1746439456; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ucZUAd/InboFfZClRnamk8ZirwH9aq8qtdNhcPq2zyw=;
        b=XuDAen29ddH33YH+K6Bzi31F76xCI9G395V361MsYx+HnpruYe+JR6/IadUAKIkbWi
         7nIdnGbgVzMP3ijtTnU2f5+YY5KEbgFxoqFaRi1n9SqrztbA5nvmIpBmm8MVbe2ebs8J
         0Mj9sfYerMOU1U4ZwGncImyE5wOTMKGDW7WZWCvz9Q3e0PiC9KBJbPbS9ohQlH2j2bT2
         qIsE0kUnf1ITEahJYNT6DKHpnf2RUitQe4r4BU6NQ+bW6Ul4J+9vuKm0WGYAX12GDpjN
         EOkGBuu0rfK4oMhPgq87DhhGmi0ZF7koc5cN0kAU/kn1D8qKCu7eyRdD9r0GAFHSBenK
         mMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834656; x=1746439456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucZUAd/InboFfZClRnamk8ZirwH9aq8qtdNhcPq2zyw=;
        b=rN/UMSmgUg/dnuTmg1avVFqk8MfMMImfv5jRLisJG8+EyoaUaKQ1wlfr9qI1SArjMr
         mWPGd2fklQ931N9QoposV9FhLnJAz1p2yFzy15q/7seu9p34sANQYzrNr6hEB4fIHMNb
         XEcQaUp4D7xW4FyzMk5QnnlXDSm76+Ivuz/e4BcwNPzjBY8LAr6OBBS0QIV7YrBAUDm/
         wz90VxZbIcVsodUpPphERg1uHUap1q1Rt3+XJqn0XrWaXLkqPOzVbfnknf4j0dingazx
         Ebm3ukapgH+xWh7N7qNgf26zdeRJz4OeKn9C+NUhTOgdHwWl9v/IEnW3I7HRlnZN486z
         CDNw==
X-Forwarded-Encrypted: i=1; AJvYcCV2fbarjL9KcfstFxWKaf7sgHCXu1Icq4p+fzj4Lx7XAsMpw4qmB2byA1vDJoEOQqo3Khq4CVaPswXPYAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSJTzzb0yi0hE89bVwBUjnn+MARdYTMka70NcGu3IWgvKF0lH
	BxBBXeqMCyAIQF4tszWYnJeTVg2p5aJEEyH1aBbw/awQ9AJnyhqYyzz0ctKZZkBW5EkA6o4aj55
	ADs7+t8bPIfHJbL/+5v2luleTJ1cQLlzSgWWRBg==
X-Gm-Gg: ASbGncvPmyteBlJkvwNFiZqtM0z4akbGS7SCP6N9jx1b6RA8bwet7hyeGgulF9vMZgJ
	RVfPOVO3ROocTnv9+7Fg01YLgGMEtg8MtPKMhUwv6SzkFUWvIYroFOb7+iRsPusTYSyIHJUDSjN
	wLddUp1jmBPbAEFZVIarBO+w==
X-Google-Smtp-Source: AGHT+IHLAwgs2jvyhndbI9eeTcAvfYwmKCKu2Wwt19IFmNuoMlsiM2VhTNy+bvMEOC6zz520PPUY1yZ92SlmTgkYlVM=
X-Received: by 2002:a05:690c:7084:b0:702:4eb0:6af with SMTP id
 00721157ae682-7085f252950mr116417097b3.31.1745834655665; Mon, 28 Apr 2025
 03:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com> <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
In-Reply-To: <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 11:03:57 +0100
X-Gm-Features: ATxdqUGx5uUk2kPmuSg5gFgBWEs3E2SY1xjorpWkszYXuV-kigFS84yL46qfHpo
Message-ID: <CAPY8ntCWzp9cRKwLg44G20jG17q2KhavZa_8qpodhGUGS2Bc7Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof

On Fri, 25 Apr 2025 at 08:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> > Adds a binding for the HEVC decoder found on th +maintainers:
> > +  - John Cox <john.cox@raspberrypi.com>
> > +  - Dom Cobley <dom@raspberrypi.com>
> > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
>
> Drop, no mailing lists in bindings maintainers. These must be people.

Ack

> > +
> > +description:
> > +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> > +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> > +  boards respectively.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - brcm,bcm2711-hevc-dec
> > +          - brcm,bcm2712-hevc-dec
> > +      - const: raspberrypi,hevc-dec
>
> Not what Rob asked. You should use specific SoC compatible as fallback.

In which case I don't understand what Rob was asking for.
I asked for clarification in [1], but got no reply. Sending a new
version has at least got an answer, but I'm none the wiser.

Staring at this trying to work out your meaning, you want the generic
first, and SoC specific second? ie
+  compatible:
+    items:
+      - const: raspberrypi,hevc-dec
+      - enum:
+          - brcm,bcm2711-hevc-dec
+          - brcm,bcm2712-hevc-dec

> You referred to file "raspberrypi,pisbe.yaml" before, but there is no
> such file in the next.

Typo.
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/raspberrypi%2Cpispbe.yaml
Reviewed by Rob only just over a year ago [2]

> Before you reply that there is a binding using different rules: well,
> there is always poor code. Above two comments are repeated, especially
> this about specific compatible - all the time, so these are not new
> rules. These are given in reviews since some years.

My Google-foo is totally failing with the only directly relevant
mention of "fallback compatible" I find is [3], which just says to use
them.

You're effectively saying I can't take anything in the kernel tree as
being a valid example as it could be poor code, and a layman such as
myself has no way of telling.
Could you please point me at documentation and examples I can rely on,
or educate me with what is wanted in this situation to avoid me having
to guess?

A further mailing list search has brought up [4] which is a thread
with yourself from 2 years ago which looks to be a very similar
situation. Other than missing the const on the SoC strings (although
that isn't in the merged version of cnm,wave521c.yaml), and two SoC
specific strings, I'm not seeing an obvious difference between there
and here either.

Many thanks
  Dave

> Best regards,
> Krzysztof

[1] https://lore.kernel.org/linux-media/CAPY8ntD3Frq5HzV06OrS1051QfjJFzvqs9H4mUkVnd4QKqiMhg@mail.gmail.com/
[2] https://www.spinics.net/lists/linux-media/msg250095.html
[3] https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html#properties
[4] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230929-wave5_v13_media_master-v13-6-5ac60ccbf2ce@collabora.com/#25567148
