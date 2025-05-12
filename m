Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE4296FCE;
	Mon, 12 May 2025 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071905; cv=none; b=MZzefdZwe1JhlpYcUdEg25R2evUW6K6d0dWUqWTk9eqxb2lSRtyAAcHe69BGqvHZ6dP64Ntm0yLzh3+UNDs9ts6qUx0te8CI9D9iLwFpLPrpNlMwsr76xwXmQtzvA9Us45PnW90CzBnn5EPZiLNQcGdrFDoqIl04ebp7H8Gdomk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071905; c=relaxed/simple;
	bh=IbHD26T7TJi17tWvHFDV8yx6yenPjxhPt46ICXom1eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCMpL+wAp+xcQAStLDHAc/kmKUf3G1Y4xPf+gC160Qw8GUDABieDRfOA6nQzpkkqHKk7VubMlwZcDa8yF998UtkyqJL6DX2xqHYPqjKOMZ6bw0ZJmV9v0pDByMsW/nB4apq5I2moXkEKGNJiDcxGGXHl4XWkDinjyUq9Rd9yA0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDgj0s49; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDgj0s49"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fbeadf2275so8256189a12.2;
        Mon, 12 May 2025 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747071902; x=1747676702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbHD26T7TJi17tWvHFDV8yx6yenPjxhPt46ICXom1eg=;
        b=BDgj0s49lPzeww/xLYgozxTlOaloqg4Saba+mAWKlYfMZsb/BKnlWXq8X8g8QU2AZO
         BL0auXN7AgysYRMbA5rCF/pescOZtYWvQjv1Lc8lO4RrLlJL6vkZRBwXllwHy/M295b9
         aTR+eETzH9asjCTYFXOxpoP9m+SxgPUHIm48Ul+03fqHBllT9tdf7XPJ+AwlEfWkasPD
         tJ6tYo0bezVYyflAqp5NDEdzdnCGbsWTP7CJAZMFB8rjqJ/oDvEqSzv3Zd0KK8v4mkMj
         7O3WJE25+p5Y7MqsK8YnVyE1VVMUVPWhavg+qokYxA3n0kiIs0Cnj5TYFeYyVkSnkH8Z
         xXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071902; x=1747676702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbHD26T7TJi17tWvHFDV8yx6yenPjxhPt46ICXom1eg=;
        b=cH5OqXBNc5W7RmIptTJwnES7dDNdTMS0aOC9CTij7WvX0fDNlNtsJtBuQXm2OJbJKh
         X/GebE6nuagN1XUxTJoKC+1bUegDFP6u34Z4XsluYUnrq+Sbnqs4YnKwleq/8uZK1KGn
         1MInZt6DvSMqdmcAH6omtxGpDCZvzZCwoWc8ge7QHAKWiyjv5ZEDDhIT/t8h9AIvxdXP
         VFR/9Zx3ENcV42s6ZTxF2IA3Vp/Dr6NABDgyT9KsFqN05WdVpN7ASAnewP0FOaHVnsh2
         EjESADN/UqPLGBTukQcEsiMHAcJ2HyDOtR7sFqMqqFau2LEBBzVGgfK1NwOQ/92fEKnd
         CZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYFmd3Ns4KFWwK3AWGMQBRUWqAOsAIBaZAmIqJW6FK+ppgrQBvEJyTaYfnml3c1rnqso3rhsX16uujSLH9@vger.kernel.org, AJvYcCVOc7QMCWcEkb0tL8QjR/X3OR+Z5ObWiCPmsWB64JDzBKWpZ4N0hk6dWCgZFUeefKhrHetEUEF653sd@vger.kernel.org, AJvYcCVX9BOv2rRGnD9kZRulY8IYnT5AoBJQ988DlGAMaKcpYrzBT4P3ZEcmk1XT+Mrvk+X88TgwKbLCHpzn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1vumr9K3oyJ+PRXyLIl5mmgGD+QaQvUCzKYGLHCZ4O7+gJKpB
	+TYgU/e27CfImLTRhKiSAjp45k6081Io5TzAUeI6wPXSOsyCsMtoXhzCbyGm1X6/OtnwskVnPBU
	+OZpLER1HxeuEdYp4s8Q5qTBu0LU=
X-Gm-Gg: ASbGncs9icCRPWey3QVObCa/NP9+2bSKbVMp7DXIsn0wypgrAeLc1manMbfhmW+Z7gd
	Km1Ta6MsELOOTCZpPYh/0/ix6xICme3Ebh29Rpnuw8xVomVWOjgocc7pSCMzrk0cdSxSx7MfRgu
	YpuRy/JidA/Md4BKDP1nEZ4Hcv7nKJMalwgfM=
X-Google-Smtp-Source: AGHT+IHTpJ+KqOMBpvLw9OHOzt51BYTvVbg0/DBVeumgV6SyfohsNPoqJkeOtO1sf4M8kRC14Np+nfatHekXtQEPzvQ=
X-Received: by 2002:a17:906:4796:b0:ac3:3d10:6f with SMTP id
 a640c23a62f3a-ad218e52dd4mr1205609266b.8.1747071901905; Mon, 12 May 2025
 10:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCGPuKtfprIvwADa@smile.fi.intel.com> <20250512173800.6767-1-trannamatk@gmail.com>
In-Reply-To: <20250512173800.6767-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 May 2025 20:44:23 +0300
X-Gm-Features: AX0GCFuyrg0pl3_1JnzzyTR2SET4D_gcDkPdMIkU0_BIXXKlPTSw1GzhcNh8zuQ
Message-ID: <CAHp75VcXmOByVsuwm0m0+FYXoaxBc1CLKtofGgHfB4sMDg+T2A@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, lee@kernel.org, geert@linux-m68k.org, pavel@ucw.cz, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christophe.jaillet@wanadoo.fr, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 8:38=E2=80=AFPM Nam Tran <trannamatk@gmail.com> wro=
te:
> On Mon, 12 May 2025 Andy Shevchenko wrote:
> > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > On Thu, May 8, 2025 at 5:27=E2=80=AFPM Nam Tran <trannamatk@gmail=
.com> wrote:
> > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:

...

> > > I think setting PWM also same as brightness_set API. However, there a=
re
> > > many PWM config for a LED and it is one of other config to make auton=
omous mode work.
> > > Therefore, standard led API can use in some use cases only.
> > >
> > > Please see the link below for a better visualization of how to config=
ure the LP5812.
> > > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> >
> > To me it sounds like you should start from the small steps, i.e. do not
> > implement everything at once. And starting point of the 4 RGB LEDs soun=
ds
> > the best approach to me. Then, if needed, you can always move on with
> > fancy features of this hardware on top of the existing code.
>
> Thanks for the suggestion.
> I understand your point and agree that starting with standard LED APIs is=
 the preferred approach.
>
> However, the LP5812 hardware offers more advanced features, and I=E2=80=
=99d like to support end users all
> features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x=
/ver/0.10.0/.
> It is easy for end user to investigate and use driver.

I see. Good luck then!

> If I want to keep the current driver interface to meet this expectation, =
would it be acceptable
> to move it to the misc subsystem to better support the hardware?

Don't ask me, I don't know what you want at the end and I have not so
much time to invest in this anymore. Only what I'm sure about I
already expressed in the previous replies and emails.

--=20
With Best Regards,
Andy Shevchenko
