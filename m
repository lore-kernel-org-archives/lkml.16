Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312BE23DEB6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334159; cv=none; b=ASjcDlUjzKt5hgJZBp9MRekUVKlkUry8SLpdJSwaGlekWEtiniXmUERcstZckcZ3uM4graTR/Mq674I9YWatjqCpG75HGGZ+3nEjezkzq548NAzX1+YcurADZ6ffkw+mex4to3zC/0nTpcdm4C2a4GAU7mg/tOHeJ/+s4bkXS3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334159; c=relaxed/simple;
	bh=b+MGXsE80mn6k512t7VEU/4kdLuz/YLTq/FCgsOrKAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Now8Ixxt/jxkXF2nTkIchkdDNlzryIciWdbp7eByv9n7c/+GutDar7xBB2F3+C86K4ZUnvIbJxMhkx/2JEmC7IWwEC2nLNx2eZziG2iG36dpnvFy1nE/VLytXszQRGM/rVWjEu80SC6nMMhslkYUPRAKOUUJb7rR2L1Q+eO9FEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc; spf=pass smtp.mailfrom=hsyco.com; dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b=fFN6T3j4; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsyco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b="fFN6T3j4"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87dfde2aea2so578970241.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sferalabs.cc; s=google; t=1748334156; x=1748938956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DeBB8nUWQnN2Xyu+ZYx+6TiOtJfpeTIaD+yvdQIb+w=;
        b=fFN6T3j4cD/CHjN+5N3FhYEaVTgtLCpM2M3RqkNnJ4iWYH2Arrd3y0xQ3ATd9p3MNL
         k4kT0lroQy+3YqsPIFMDiodSxBuK0P5alLsqw9sCtyYJOZP8fYMmkWj8LzpXOljJiYsF
         YPCEwy3kVcnVdSBn90x1aqGrzwJFheUEev2Z6wrcTU0lb/+vROpX9xeRnHLfULxmb+wU
         RWrNSQrAPCaYw+jwKNqlFS7DREDX2HxvO1poS/lxz+pb1THI1uNQc9rA9HHb41HdqZPM
         GEHThD6PiJb/b9xOJx1C7Mmazk3H556Wcp+FsGzyyw0VcBkxYySorKMo3Wh/83Y0ueJn
         V0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748334156; x=1748938956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DeBB8nUWQnN2Xyu+ZYx+6TiOtJfpeTIaD+yvdQIb+w=;
        b=gxkwW4xHtLCWTQH2rd6isf1I91a75GTEGsrGcsNVYmD7wbVC3ruyi8+4g1EwMiX0R/
         aQv1JNcu192BRqkrvFNAHch2SFZN3XrY0S2/xu+enc99xtP6YVouA9GlwxS99YO+yjiR
         SdHepImUP1IDS4zGX4w2HXRtkallz2kIPcorSWqsr7bnMjwGFjxcQVseAYr8r+mMtRi3
         dNiJT8cNAeG0NdrWUxn0T3iH99hiF0ztbQQvA+ACMRGeFQSmW70xzJOX27Mvm4yqXHrQ
         n5UXbCuikKUuw1p+txWs/ixu7VqvJDM1MKlYKICQ19VHKIWirDy2hFv63c5WkhPKcAF9
         eaEA==
X-Forwarded-Encrypted: i=1; AJvYcCWA/cxRk46u8K1CVN6G3M2ZqO/WTA2VQ4XDgVDq3zLNay/aF8yDAR9D7x8kUdrp5pBJR6fL863O6RtARYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcTVyAJTD4J/9kGzbJ4r7n3Za6M8BfPUj7BZ8yOeP51QZGVLR
	lm2aCpcKT8cXiFhhW1Bu+7UktL8NfKNMgTDSVx9JsI3C93YYy0hmS0CiI+OV2B8/JfaFbds3Gyt
	veWp8loJCdO3hxKhq4Xnt3T63sIai3iALIc1KVahN4ORs0SeID4MU1xc=
X-Gm-Gg: ASbGncsmukX8Ho+NW4VNlEl4a5zmI1t6q7ELYWKNGMZkF96G/4pawba+CHnwwTzTDn0
	bv9iye+rb1pSc1HTzGpdoCikTNhMrJHo9KfaNg6rjcCOaIkSWpVS/zAX/q4mwNLyWhRQVvyvzde
	7ySOGx945tLEB1wCp8rNttVYZPRaU=
X-Google-Smtp-Source: AGHT+IFWq7h/oWKb9eocZ0AC10ijBvnESKpIqtSFz0scdSEPEmJlTFX9vKntc/vtXzbnHpERR+6K40is+k2z/a3rRHg=
X-Received: by 2002:a05:6102:d8c:b0:4e5:59ce:470f with SMTP id
 ada2fe7eead31-4e559ce47d0mr2750168137.21.1748334155947; Tue, 27 May 2025
 01:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526161234.13236-1-giampiero@sferalabs.cc> <20250526193958617d18ab@mail.local>
In-Reply-To: <20250526193958617d18ab@mail.local>
From: Giampiero Baggiani <giampiero@sferalabs.cc>
Date: Tue, 27 May 2025 10:22:23 +0200
X-Gm-Features: AX0GCFsE59a3ApGO9wt86mNgNDMP2qHuYQ-txa9lSiNFZ9pemutyQTh9WNku_Zo
Message-ID: <CA+gFNtY0q2kyj2kjDbUSdrhkZkcjnwHCau=0Om-akpm-imkYFw@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf2127: align power management configuration
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the prompt feedback Alexandre.

On Mon, May 26, 2025 at 9:39=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 26/05/2025 18:12:34+0200, Giampiero Baggiani wrote:
> > The PCF2131 comes with the following default settings:
> > - battery switch-over function is disabled;
> > - battery low detection function is disabled.
> > These defaults differ from those of other models supported by this driv=
er.
> >
> > This commit aligns the behavior across all supported models, configurin=
g
> > them to the settings typically expected from an RTC.
>
> We can't do that as this is going to break existing users as they may rel=
y on
> the current behaviour and the configuration is persistent across reboots.

Would it be ok to use a "backup-switchover-mode" device property?
I guess a "battery-low-detection" property will be needed too, which
would also fix the current issue of BLD config lost when switching
between BSMs.
Thank you.

>
> >
> > Signed-off-by: Giampiero Baggiani <giampiero@sferalabs.cc>
> > ---
> >  drivers/rtc/rtc-pcf2127.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> > index 31c7dca8f469..cbdf7f23e6a6 100644
> > --- a/drivers/rtc/rtc-pcf2127.c
> > +++ b/drivers/rtc/rtc-pcf2127.c
> > @@ -1312,8 +1312,15 @@ static int pcf2127_probe(struct device *dev, str=
uct regmap *regmap,
> >        * Clear battery interrupt flags which can block new trigger even=
ts.
> >        * Note: This is the default chip behaviour but added to ensure
> >        * correct tamper timestamp and interrupt function.
> > +      *
> > +      *=E2=80=87Power management functions set to:
> > +      * - battery switch-over function is enabled in standard mode;
> > +      * - battery low detection function is enabled;
> > +      * - extra power fail detection function is enabled.
> > +      * Note: This is the default configuration except for pcf2131.
> >        */
> >       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
> > +                              PCF2127_CTRL3_PM |
> >                                PCF2127_BIT_CTRL3_BTSE |
> >                                PCF2127_BIT_CTRL3_BIE |
> >                                PCF2127_BIT_CTRL3_BLIE, 0);
> > --
> > 2.39.2 (Apple Git-143)
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Giampiero Baggiani
Sfera Labs - www.sferalabs.cc
