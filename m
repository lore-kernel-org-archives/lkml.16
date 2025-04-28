Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE479E1;
	Mon, 28 Apr 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840071; cv=none; b=OFjGn2Qz87WBNlDY4ilkmEhbSnkkGLauqHaA0M0BmIUeRB76iiOcZN1dHFmubVVcV2FyO3DkWoQNh8gV9syiJ9yxuB16q+Dh9lrGZnq9yc0DfCR0N5iEb1ao4JjW7BZPFuNnlZiuqRTV4FlQCKDTdH4X0zl0Az7iHi6Q/lLHVvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840071; c=relaxed/simple;
	bh=FaVcAOkDQ7uwALoze+whS6FNUvEv5VQAsvSJRP865wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxsDF+HBBalzbKh07z5PluY8f6X0IHdoUO/TLxUfHzS31IGeLF8QIRFaKf43jgHrl/RI/b57RnOg+0zbEpHAree75avU63LEzZI9Fb3QMs8Ufb/Cm4yh9wE/f/ItGfkFmZo+zPV69XUAMlfVHMA7jbw6C/59UdEko5DuixWmdJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1862740241.2;
        Mon, 28 Apr 2025 04:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840066; x=1746444866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsMRvP1XrPCxK2127w/cMyY/iDM/irDUSUu0quMrzrc=;
        b=ljbPT8FOGQ6KOrBp6rf7jtA8iuHpK5XxjBzb0wUTS2z1RUrJeFQsMnN6EipDEMG8HE
         JskdxUyLNx3fEkp8M9vTw7QFE7HRR1zDqSrBQWdupT4qetV3eRyUk/ufsqIsA/xpLNBE
         tCPmhmRl0nZZgO4oOk6941qhy8lf2bLvpJ1mgxta1RO/+igquaYF8Z6ilP84BUD7oHzv
         pnLXJk2mHPrgCz0AU9LaaH0nWXwNUPNzIQnnOJogkjcUcRRL2+/rdEdA3WkKpU14TJoJ
         PFRQFqlQJdRpIsKTZANpH4r5NGnSzMEtoxLeEG5opXsX9CS2timx94gsnBffqQKlNpMr
         XIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGRM4tNJdskIzdV31o1S9TN/zn4QVCxYTC8NbgokTYN+iyMNSZQTBYLc5zLMYOibdZZbo/8ElD2xRK@vger.kernel.org, AJvYcCVbSEeH2zDfsap408VLGLHJ7dqhKVGLogwi9hXRYJtEGMMVIliraWq0r9lI0YqukwF9NcHh37PJsim+LwsY@vger.kernel.org, AJvYcCXVGylk6tBo3h/lDDVhrNCq+ej9tVMEV2WEWvHTpgPpJNtpOPpeJVbnFmTEt2MvVN6p/3bvwsC8XxpV@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZ4LrLKCWnKATBnq1IlM792z1v6qEPBi09hcnyOlVRGDWraY1
	Wqj0EA3uYX9hTgHHnYWYNecKe1FWFvGTYWCQzRg3+3M4AsqJxgDxcg/9gSSO
X-Gm-Gg: ASbGncsxk5tibue+AHRd2UrbpGLc+mKgAzxWKzT+/mZYYxVMq08GrCb1DU1CdFo6a8n
	e740u2w3pMnDT40PU23lko4NVXljAI70iguiWGLn3uUFKgxLh7QY/nsrpZgE5xUBWVmEnB/ybat
	qnQ9PPsww32aIC+4jPIzPte6i8Ngdm1hSeEehhkVUhwYdiQEI4aE0ems5Uvyfs2/m1kADD4XOgC
	6sNMXM3H0ahiRSiQdqMSalKD0iQIw+bCJ+arSefp7OW5DglviQkpyqpCfFg++tAF3umnAIdUOCU
	tJMAxBe+74Oshu2O8Pvolxv2JDfsKoSDINixMpv8Sji2fIgBJzE7OayM6yOeNZAFKCgvC0bk9S9
	qJ0I=
X-Google-Smtp-Source: AGHT+IHfaT70BX2zxXzgZktIohIRVK2xc+kZRpkl955MDRlephWB5SeZ2l9b/jRw795bawp/KBTaDQ==
X-Received: by 2002:a05:6102:3ca8:b0:4cb:5d6c:9946 with SMTP id ada2fe7eead31-4d64078d5c3mr5227035137.10.1745840065877;
        Mon, 28 Apr 2025 04:34:25 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4d3d75bcd02sm1864502137.28.2025.04.28.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 04:34:25 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86fab198f8eso1852892241.1;
        Mon, 28 Apr 2025 04:34:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURgSZcYKmPUzfqfPGdhP+BonsX9OJSvUR21BdQ1zoBcmV3rb4OrgGU1latdqcFlvALHLXgZHWTV0eR@vger.kernel.org, AJvYcCUXWUcqeAUGp6f9VNceZsZ5tI16u2FSyyKJPhAfh0Qw5FXcywpR/52YkfrcKylPY69WBhoMhTn4WUUc5E8U@vger.kernel.org, AJvYcCV62RQ/2yz7HijzsKEsBv2Bkwrp7FOdt66mxqVIn2JxqlZE6HMvRoBKjesDFDNJ4YWp/YrSaDKUkPcd@vger.kernel.org
X-Received: by 2002:a05:6102:32c6:b0:4ba:95f1:cc83 with SMTP id
 ada2fe7eead31-4d641f67490mr4726020137.16.1745840065194; Mon, 28 Apr 2025
 04:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427082447.138359-1-trannamatk@gmail.com> <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
 <aA9aTjhXHb3gddd9@duo.ucw.cz>
In-Reply-To: <aA9aTjhXHb3gddd9@duo.ucw.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 13:34:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
X-Gm-Features: ATxdqUGozfO_A0x5sTl7wTcnhEJGNjE5AoOrad-BSBsbvNUoot5qyBGVSxOijmM
Message-ID: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nam Tran <trannamatk@gmail.com>, andy@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	christophe.jaillet@wanadoo.fr, corbet@lwn.net, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Pavel,

On Mon, 28 Apr 2025 at 12:37, Pavel Machek <pavel@ucw.cz> wrote:
> > > This patch series adds support for the TI/National Semiconductor LP5812
> > > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> > >
> > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > > ---
> > > Changes in v8:
> > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > >   and update the title and $id to match new path.
> > > - No functional changes to the binding itself (keep Reviewed-by).
> > > - Update commit messages and patch titles to reflect the move.
> > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> >
> > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > Thanks, no.
> > Please, put into the cover letter the meaningful summary of what's
> > going on and why this becomes an auxdisplay issue. Brief review of the
> > bindings sounds more likely like LEDS or PWM subsystems.
>
> It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> but...

Is it intended to be used as a 4x3 matrix, or is this just an internal
wiring detail, and should it be exposed as 12 individual LEDs instead?

BTW, my first guess was that you just wanted to avoid the LED
maintainers becoming responsible for the extensive sysfs interface ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
