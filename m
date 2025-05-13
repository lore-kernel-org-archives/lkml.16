Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC7CA93D;
	Tue, 13 May 2025 08:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123870; cv=none; b=W3vrwUMcCvo3v04eD2BLOp8xC5e1mNPm2oGqWUZk8YkW7/fSCTtWLMZrqWv/tjAYUH7CTJvsenSEUah6SOX+9GxzRrqEwjHHgCEAles+xUn4hwWO75cRjrOelAvoXczDJs4DOHjF6PG0VnE8EEiFGZGd58/ziVhv4j/Sejo3dhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123870; c=relaxed/simple;
	bh=MM1LpBhM1yC3INK9Qp+qRlKTzWYK6iqm4Jjmr9Ur1LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEoVd5kbYI5/ooph/BQG6HWjvMza8hKhU2iPv2zHdKpFIWo7kQgf1p9qe+RdcxkkIolfzEQ7U1PDpqoYdXvLh7sTEdWeaeMPDUks82TxPxASuRea4gZDd24XHSUhefTTlkXJGfKMI07W5+8/WOsGmrAa61kXmOxpDzC8h7h72mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c9376c4dbaso600663485a.0;
        Tue, 13 May 2025 01:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123867; x=1747728667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rCtnbZWFEyClftfNf+97GB/L/vNpKwxy5TFS7AwepY=;
        b=VGbb9e2GYHripd9ylCCZSKlpsQXEngFvwO9SkrdBofjuWu3kErZP9R51WXdgYsIKhV
         Dg24Cs5d3/Ud4+XsOcy6cvsOLwVlz8qotY63r6hJNeR5A6Jc6FF5a9OZtXeKKVvwQqw+
         U75lLgFM1taoOyHt7/KqF4Q4yOZ365zkx/ynwuhQHOCMvY1QCL2Vup2xfFeu4/h7/DNX
         5TtGImsFzLC3fuoU76pzYh9PUthynOXKOuWoM0v4EICnfb7LHFYn0kigxo/qLWg1VZiB
         nZQdC/HR8fJImpIjV3PZ8q4dkX+MyidfGsHynbEL4rRV33rkx30kGsIzSPGcGFvpufX/
         Ar6g==
X-Forwarded-Encrypted: i=1; AJvYcCU7jVpf6cpQQ1O/+RYcLAhqSyFSzH+qkCfqaOm+kKGXNVoOeNQXHT+e5bUek+3ucro9rv/ZkLJsgxzL@vger.kernel.org, AJvYcCUNO51Rg2NKgbQ2pzPKu8DXQof/TCRTj+TZJlXMf9vS4/VwWxtSaN4bb4rjhL6ckfOwN5Z3g0MfVExk4kww@vger.kernel.org, AJvYcCXYUXKwpwbnBO6K3FiMq2/VSdXGy6mDV4liJZRRR8BLINj1TKHKKH+vaTC0S7vqmaSOkynrnBlkw1m8@vger.kernel.org
X-Gm-Message-State: AOJu0YyGFy5r5c+JVJBaPJv7D/6mR+Z56IIUoFhKaKuCsnCOqGTuBRQe
	Qyw5+I7yvhcd+S3lCNUYCKRuMOFKdVHoytrXBGUnj68xhjw6ufZnwfeKDaLJ
X-Gm-Gg: ASbGnctGVpmJ65ZSHRYD2RDjIJdsBpkIJRfTJujJazKe7p98lbbyciqEXGG5Z82WuID
	SCDYG0sIX0Xlr7mjmlhNt/kiFdw5b7dij8oncGIIiqEPd6pp2ZT+u3Xeeh//vwz1ClfTNCN4QIU
	3y560MMiAD/a9uKlu9JXsCY36hf4d6x+Aui49qHd8y0pM0g+Gpbxc7PHi7x7jhDFgH51npx31r1
	oAglwh4U39gd12B32EHhfbQWvIMTA0os9t9Y9Ao9plZpcE98k0X6i7bDXDJYbkkLzCRqVlp+dcg
	9rVQIdnklKKk383pUBE18i9S7XJEHQrjim+V76+aXaKNCTefAAW3iYkp7Hq8+c9NblYiu0dITLn
	49zpev0iSJgrHPg==
X-Google-Smtp-Source: AGHT+IHlXqUOWm0WgsbW/F9Ow1+qrr9RECUNiEfQy23xXhLmkGr5MkdPZjJB/+/S/sbA8kB+qoE8VA==
X-Received: by 2002:a05:6122:1d02:b0:52a:654e:bd98 with SMTP id 71dfb90a1353d-52c8892c3c5mr2119092e0c.0.1747123856327;
        Tue, 13 May 2025 01:10:56 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c65600d9csm4984631e0c.33.2025.05.13.01.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:10:55 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so4143545241.1;
        Tue, 13 May 2025 01:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/FbpUm7D9FanKDXa+bp+kcUxhTBKWT7DvSi/uBuSPHjDaljjwJFUauWJo870B1CQitsZY5KNy8Dq27s/N@vger.kernel.org, AJvYcCWIeGIhmUcPpDsnVTwFHiFoJO3+T2w9VynY4iQK8y4863iY0C8NIOzRMc55d3Q1sCiRC5ktdJsqCfH1@vger.kernel.org, AJvYcCX5g5lfbLtWbS9u2gYmOGxUitIQMrOkvT/iladJvRfsRY18zCy/kx8btvH6LyY/3kK31FUUjAYMnxEW@vger.kernel.org
X-Received: by 2002:a05:6122:3207:b0:523:6eef:af62 with SMTP id
 71dfb90a1353d-52c88afe8b8mr1778704e0c.4.1747123855105; Tue, 13 May 2025
 01:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCGPuKtfprIvwADa@smile.fi.intel.com> <20250512173800.6767-1-trannamatk@gmail.com>
In-Reply-To: <20250512173800.6767-1-trannamatk@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 10:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>
X-Gm-Features: AX0GCFvxUbYICZnIC49acrtXEhbKJaNQ34KnJ9GMWMjpL7F8L3vH5lZ8JuyNYOU
Message-ID: <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, lee@kernel.org, pavel@ucw.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, 
	corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nam,

On Mon, 12 May 2025 at 19:38, Nam Tran <trannamatk@gmail.com> wrote:
> On Mon, 12 May 2025 Andy Shevchenko wrote:
> > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > On Thu, May 8, 2025 at 5:27=E2=80=AFPM Nam Tran <trannamatk@gmail=
.com> wrote:
> > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
>
> ...
>
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

i.e. a drivers/leds/ driver.

> However, the LP5812 hardware offers more advanced features, and I=E2=80=
=99d like to support end users all
> features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x=
/ver/0.10.0/.
> It is easy for end user to investigate and use driver.
>
> If I want to keep the current driver interface to meet this expectation, =
would it be acceptable
> to move it to the misc subsystem to better support the hardware?

I guess you can add custom sysfs controls for the advanced features
on top of the drivers/leds/ driver?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
