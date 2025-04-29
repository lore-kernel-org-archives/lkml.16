Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93AE2528FC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959617; cv=none; b=JE8gu/n5EcRksfYdheh2YKuZ3pGL8DZtDWAH4hQ3ccOd5XffMYCY2zE56hyxFgA+rEebkXZ04yRuMzn3oNetqxf6m30A55NbI1tMALP64zTtbEzgnCcKlESbogy0D/SDLo3tmWhMHQG8JE3daFO1mCKC7QEFLb6y/4L3AIPCx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959617; c=relaxed/simple;
	bh=D/9Y5YifH1074wJb/GS4vtYd+k1QQYAwDd3xbHbVoJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OreTnjrnTWMEQNU9qp3596C7wKWyHomwGyLGxkRR3HrgCQ2w1QiBpuOzOlqOv2X+zhXLl3M844b4uZtsCw8tXS6pEeQfzNw+Erg9vwIYLJX7DXCGBqHIC/lRR2mSxrGaPpWvr/wjGLQ3mf7Hhk70cs16Bmb6nCw4d8p2hwE6QFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XQQZ67x3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XQQZ67x3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe574976so45539545e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745959613; x=1746564413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZJ8j8Oe72qFBaNxqjkDCbDD8XAvsg/lPShitQQ2048=;
        b=XQQZ67x3sPK3FBhXBNJPT15x8eb/HfFmjOKB3VNN3UWQRaAIhFahpAW/1LpPWUQFlu
         qlZ1cTf06rzXsooNIQF2TsU0tIBaechMrDiGt4b4hoeoujBUlgUH5ugB3l0p+tBjbgIl
         7i9WsDR0Ib2kBwCTtnEeD12eE0xzrQZh6u7/xm7xVCrNmIk072axrKDQvoUPHjkK9+aR
         +tR+dkPwvwgbZdQdUssw9/PzjABwZbeKEdZdAf2oOhNGz1ILaB+I+12IzFfczLgeux4d
         BDbiCSvljvXJk2l5VT7I/fpwgbrXo4VksucOZUq10fkiWx+h4LTV7vI7HcEgfSymq2tq
         SWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745959613; x=1746564413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZJ8j8Oe72qFBaNxqjkDCbDD8XAvsg/lPShitQQ2048=;
        b=gzP61A5/yw+Surxwegb9MtUE2tFZTtOvcVZYVRNqOLluMzLQtQrtde2fnmgI7p8biB
         /2BbziJHXdeww01C2NiGYYk9+rs5f1xVD+csgyoxia/efjk/LeyllGUmEEkQYLmnD3xH
         kybetCC7TpXZp0zDGz0YJty08gWgbPRG78xXgHGgjFg27B0AgJkDuvZnwc/spv6naES6
         IugjTPs3FsG8aGxRHd9oM8KG+1GYN4ryTYTxkpOW/m4GL9Lv1wbWi2HFuxObWNAsFByP
         jKefoSmgCTNxJ3NaQurkwlOR/cqfEfOo/fS/kHwmz+pZQY0x37gl0Ok4eRxSBoUJVWMS
         JZpg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Fn+K9I26f/VGxA2EesFwVxCM660xeuihX06dvVHDokaoPqLt7nsT2remrdtfNPNDsATYU7HZ/ai2lHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlRSyNxyJd73DsHClr/bot1Mo4gHXkvuXRMCwU3a5iTQ1hvMXE
	TsDe+bzsmdkO5ZhKLKsS4uC/PyyxqCfzt06VBjAuDegj8h8iupmM4tY2w+MnDuE=
X-Gm-Gg: ASbGncvvnCLZ5rQ6L7UTwu0FWHjQm93wzBO6HYURcOVDVVZMwlMlO10tnBKzVhMiWZD
	LhRVbRlP1qiuirDGEE5r1HxhFvV4YUc4A+lutBEHbtiw5uVXsCZu6QIKpF+dt6+9a/LZV+HQE9r
	7yGwCukRQBtRuAbYj2/R5T/QQTXPVq/DRCPqgG0P6nGGoNqicFFW0vfqjicjC905Y83LPtXRdXe
	3FTfm9h37/igqtizQWwaVq5f2nVZOQOjaWvFsgGN660U/2+u/s8QQ3026jtDRE/aAZ+zwOiDpIC
	00GYZ/nS+9eYCAur2MY/CypwJ1+l6gDdMKOPks1aG9Y03edvr3wvrnagD/FwF6Em1Fnbjtlw3Tv
	LpKqcyJY=
X-Google-Smtp-Source: AGHT+IF9bv2cflSgAvGwtlEqK/Tpat8aDUtOYB8YNh//4MAjWZJ7TTuhWab4KG2FTzCSpSxKDA3ETQ==
X-Received: by 2002:a05:6000:4014:b0:3a0:7a5d:96f8 with SMTP id ffacd0b85a97d-3a08f7a2755mr614243f8f.31.1745959613249;
        Tue, 29 Apr 2025 13:46:53 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2afc6b3sm80455e9.31.2025.04.29.13.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:46:52 -0700 (PDT)
Date: Tue, 29 Apr 2025 22:45:39 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
Message-ID: <uyreqaazupbt23vmf3pwxsaneimtahsuinlfmc77aaavt4nyl6@yofmvw3rndtx>
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
 <20250429-wip-bl-ad7606-calibration-v1-4-eb4d4821b172@baylibre.com>
 <d13e3671-9330-419c-acf6-97f33060116c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d13e3671-9330-419c-acf6-97f33060116c@baylibre.com>

On 29.04.2025 10:26, David Lechner wrote:
> On 4/29/25 8:06 AM, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add gain calibration support by a per-channel resistor value.
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> > index 29f12d650442b8ff2eb455306ce59a0e87867ddd..df30545fb52c89a814257443183303775a06a7f2 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> > @@ -204,6 +204,15 @@ patternProperties:
> >            considered a bipolar differential channel. Otherwise it is bipolar
> >            single-ended.
> >  
> > +      adi,rfilter-ohms:
> > +        description:
> > +          For ADCs that supports gain calibration, this property must be set to
> > +          the value of the external RFilter resistor. Proper gain error
> > +          correction is applied based on this value.
> > +        default: 0
> > +        minimum: 0
> > +        maximum: 65536
> > +
> >      required:
> >        - reg
> >        - bipolar
> > @@ -271,6 +280,10 @@ allOf:
> >      then:
> >        properties:
> >          adi,sw-mode: false
> > +      patternProperties:
> > +        "^channel@[0-9a-f]+$":
> > +          properties:
> > +            adi,rfilter-ohms: false
> 
> I think this is in the wrong place. It would allow this property on ad7616, but
> ad7616 does not have this feature.
>

Looks like it cannot work on ad7616 due to

  - if:
      not:
        properties:
          compatible:
            enum:
              - adi,ad7606c-16
              - adi,ad7606c-18
    then:
      patternProperties:
        "^channel@[1-8]$": false


But maybe an additional patch should be added to add also adi,ad7606b
to the above enum.

Regards,
angelo


 
> 
> >      else:
> >        properties:
> >          pwms:
> > @@ -398,6 +411,7 @@ examples:
> >                  reg = <8>;
> >                  diff-channels = <8 8>;
> >                  bipolar;
> > +                adi,rfilter-ohms = <2048>;
> >              };
> >  
> >          };
> > 
> 
