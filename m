Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0949246761
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585793; cv=none; b=U4D8AKGWCU9whXUH3RFKozoqsfVw5Ri6eqTRpOxal1tae85omf1hDWslAkqR9IbrbdmHc/IsrpcbwnazIRI8YXdMD+VE4HLsVVy11I8XS0hLz133oRTxOx9bOkNzcZro0/NCVJotpnTpGEVJVMx1yIx3dc8IA5PnBzVT3+lauzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585793; c=relaxed/simple;
	bh=wGQrwjvbxP5TElWRzftoyq5VMQ1P3z0T9KV3nef+RkU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OgrpwYTmJwbMOa3SvFqBrZy0DRgziGGkUsPAQ34naWSwhgqYc6A9DkMth3oMniiE0VEgisdxv6nfUTTyr7lZAuXaBLySFpRE3LlMMVX+uPu68GN1aTbnsIEkAaPOPs3rigji5ma+HRJ59u0tSGdLs1sbrmy/JknewYYgRHD/USc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JQ0BMac/; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JQ0BMac/"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f71831abso5537756f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749585790; x=1750190590; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wGQrwjvbxP5TElWRzftoyq5VMQ1P3z0T9KV3nef+RkU=;
        b=JQ0BMac/myFnKgIVsEGjYdvKS8gJkfsLNkbReik3SqapjYxGO1NmjI4eYtbv2XaDyh
         5PxvD5Gmp2iUvsXnTQPufDei61Hjfg+LbwcanIaSq/xvWWzXwYY0mkibwgh3vh9tDi64
         0+y38ECtymXBT9JZw8qJAUuJUuzXiwUCAgiPGS7FLkwXL2PqfJgDO5/Iz4zMekXEhYo/
         WJ40tlPmcCrQpSVUZSVU78tgw1AezAW5/BQ0GWszKyWBkxYKOU4CeiMCvWj5VKjmqsz4
         Wa4VQosJZHIKCuYYKGoGh+d0VCuaY1nNSMF87a3r3MxLIL15urED+esXcXsziXlWV09N
         KvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749585790; x=1750190590;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGQrwjvbxP5TElWRzftoyq5VMQ1P3z0T9KV3nef+RkU=;
        b=UVZ+T0qSJCrxuo0dE3Wp59n8GZvRJA12GBH7BEtoGlkqGolOEOg0lmvgtjo+HkkfJ1
         9adxmRKZZQ23WQi6l46KfxWJqSK/visgJH3J+FLz1iY3J4cu//bXFiwP/drAwe6jutcC
         mApUrSn5VMcntytimPhqDffQlV/JN0Gjd01xkHyEQSoHst5wBNYyMlq1FsFmQOk4OZJ8
         Dp3EGUqNUQ20PEQ/xpE/01tY+IK1AQbJwe/MoejeW9UQU4WKBZPmfJafY6sMsgKdIGt/
         UN7PTyz4ptvGH6GneEeHkPtyNQu9YNDJOOoDc7ls9pWSrYU61VoOj4NH3xb90PA8LW5o
         uyXA==
X-Forwarded-Encrypted: i=1; AJvYcCXiKSPC71XDl5UcgRp/OLZm56hXozszbp+W6599HvqGEBGSJcZnLSTmE42rG1bFfacfsLgHwR69ybsLzpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOdBFJmQTKUg3Oef1Hzev7Jb5yh3DMr/P3csInFVwFd9lv0wgT
	p3aGEOcOwC5YUw9hPVZyKIdEzX/zCOcnTRteiG0B1Ha6mC9QghZ30C6HIa23/vyr8o0=
X-Gm-Gg: ASbGnctaTdt5Zg59Tu2o3K6BErfpC7z8pUIY53Aq7AAUgXCjkJLI2ZnnHJTy9Cc+knQ
	FZHLd84UjlehZZl9Nuet307mG7iiK+ocTrVy1q3rosYU5UUtMs2c5OLmw2BVd81beOMaZUmKG0d
	NbHtPj/et97B5zevpqYY+ftniVKn4V2BA0PYYoxRUrFiESv4l0eDkClUImOB4HVKPjvrcW1TlCc
	dTebl7tZQKBEoRbhcLG7YdNBJdFDXn5Jm2kfDULDFuXZEYPpSjZO5gdPzBf1S/v/szhY9AfplLm
	h6tXZkOOE896S4KYpyBgpbq9fWppjbCvjvw2oSyBgHl6bAMxpuUxMZ+EgyGEcFbGX5zzdWqnogj
	jHbcPhG/fCOIntKYt
X-Google-Smtp-Source: AGHT+IEtm22Ya9JUV8ulYRQRT6vYHBjx+q7IOEDUr9BMoA+Edf/n/UDiFasL+UkKEL9+F1awgGEj8Q==
X-Received: by 2002:a05:6000:40d9:b0:3a4:d31e:4af3 with SMTP id ffacd0b85a97d-3a558ad6e98mr181211f8f.37.1749585790019;
        Tue, 10 Jun 2025 13:03:10 -0700 (PDT)
Received: from [192.168.3.33] (115.39.160.45.gramnet.com.br. [45.160.39.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de48sm13364311f8f.10.2025.06.10.13.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:03:09 -0700 (PDT)
Message-ID: <f962e9bab3dc8bf5cae1c7e187a54fb96a543d51.camel@suse.com>
Subject: Re: [PATCH 4/7] drivers: serial: kgdboc: Check CON_SUSPENDED
 instead of CON_ENABLED
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Jason
 Wessel	 <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>,
 Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg	
 <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, 
	linux-um@lists.infradead.org
Date: Tue, 10 Jun 2025 17:03:02 -0300
In-Reply-To: <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
	 <20250606-printk-cleanup-part2-v1-4-f427c743dda0@suse.com>
	 <CAD=FV=XXQyZLYKoszj68ZGFDY=9-cmEUp406WeOeSBVZOHyUHw@mail.gmail.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-09 at 13:13 -0700, Doug Anderson wrote:
> Hi,
>=20
> On Fri, Jun 6, 2025 at 7:54=E2=80=AFPM Marcos Paulo de Souza
> <mpdesouza@suse.com> wrote:
> >=20
> > All consoles found on for_each_console are registered, meaning that
> > all of
> > them are CON_ENABLED. The code tries to find an active console, so
> > check if the
> > console is not suspended instead.
> >=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> > =C2=A0drivers/tty/serial/kgdboc.c | 3 ++-
> > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/tty/serial/kgdboc.c
> > b/drivers/tty/serial/kgdboc.c
> > index
> > 85f6c5a76e0fff556f86f0d45ebc5aadf5b191e8..af6d2208b8ddb82d62f33292b
> > 006b2923583a0d2 100644
> > --- a/drivers/tty/serial/kgdboc.c
> > +++ b/drivers/tty/serial/kgdboc.c
> > @@ -577,7 +577,8 @@ static int __init kgdboc_earlycon_init(char
> > *opt)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 console_list_lock();
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_console(con) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (con->write && con->read &&
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (con->flags & (CON_BOOT | CON_ENABL=
ED)) &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (con->flags & CON_BOOT) &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((con->flags & CON_SUSPENDED) =3D=
=3D 0) &&
>=20
> I haven't tried running the code, so I could easily be mistaken,
> but...
>=20
> ...the above doesn't seem like the correct conversion. The old
> expression was:
>=20
> (con->flags & (CON_BOOT | CON_ENABLED))
>=20
> That would evaluate to non-zero (true) if the console was _either_
> "boot" or "enabled".
>=20
> The new expression is is:
>=20
> (con->flags & CON_BOOT) && ((con->flags & CON_SUSPENDED) =3D=3D 0)
>=20
> That's only true if the console is _both_ "boot" and "not suspended".

My idea here was that the users of for_each_console would find the
first available console, and by available I would expect them to be
usable. In this case, is there any value for kgdboc to use a console
that is suspended? Would it work in this case?

I never really used kgdboc, but only checking if the console was
enabled (which it's always the case here) was something that needed to
be fixed.

Maybe I'm missing something here as well, so please let me know if I
should remove the new check.

>=20
> -Doug
