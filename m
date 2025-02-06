Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27BD1A5B95;
	Thu,  6 Feb 2025 19:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870586; cv=none; b=NhSfFWISQjBm33jXBz9lXSzt0ldmQvD9KrNqesX5VUAZK/j4xpoTgojwN7kXuGzwDH1oluX4YY92tuIx8FuBHX06MNmtPSPMKM33Z6yoguENswM3TLfw3ZLavsXKVHvcErI88dmU0+5Ni9Hi6poUgOz7juNcXMoEt0QnUuK5uHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870586; c=relaxed/simple;
	bh=K8L03tJliCRfd299LkyvqtwoV+h0PEo6T6Ng3J9ccMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=TKqs9OAbSYBBU6+m3FriqpM6krd3Q+MzeSyog8bdkBgG/YICPXmCt5RO3wSZoa8gWIzmuExnswQSeyTpeqoE8HV+acVzaxTaLNQr5N5Vqu8M4RP8uCaKiyWcr5ATfpBgtjhCvBpGVC3AdWjEIDfVf2W6kBSIJ21wcZzg/9Rrcpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eg8LoDC5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eg8LoDC5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9bd7c480eso2377010a91.1;
        Thu, 06 Feb 2025 11:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738870584; x=1739475384; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnyfzxTA1eGjOVunTE6wEsUnj05Nc9jMZ4amWEHiQm4=;
        b=eg8LoDC546AW5vJQ+8J0S0bTRoim688tw8JFH8fRDd3HVKmdJfEYMWE5ZM89DZIi/C
         Qnq7dHEZgz8vNwsXj2kKeIymxvxoX1N0LtiASNduNxzzeZhqi2co0HZzL7fPTYPq9xFX
         8fXFmCvxtlRupqx7a3P3Yff9ino3c4zhtvy2tvUgOJ+z0Li+Q+I2ZaOu4RD68qmIVdSr
         o8DkGWDtmlyem14sfDkdfEprSFJRlPTDCBtsSqY4bcToWdmDq8B2KTdV5dDYLFyScfIy
         NMIHKL+Ltap9JWFJrLIsjbSMiZM6kMZEqdKnaBlNaN3P87Qv+TqNzTRfrz763hjgKoBZ
         m90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738870584; x=1739475384;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnyfzxTA1eGjOVunTE6wEsUnj05Nc9jMZ4amWEHiQm4=;
        b=dBvxMsgsu4sXqm91zuxt3KCdXS/UZgEsbeBX08pCWhl90DL7lUpJmRH/x7jp4jJBki
         jfXJncQqQ1DCFS4BxtPFwN9cljTV8C/6H7JNlu4f6i5krOZxv2JIPqCC8YyyhpToO8oj
         1rLsxs4NfXZ0c97KG+T5VPjI7qFlYqEG9K6EOWEo8xMDw8qrjk7M9rNyZJ9iuB02IAey
         UIsKihziovnLFR6DfBtR+NZTabeCf+l5cy0Qkgt3m8sbh3yv7eycyH90CM9SZzL4l/4V
         h7nKUd1g2UxPDyXwGl40ZJFxU60sZaSwP5ZSXxGsy5FOg7LAMxwM1v1AuPP/OhIIX/Vy
         Ht5g==
X-Forwarded-Encrypted: i=1; AJvYcCUhxHvytyx0jzkFII9ttShmZsWeyd26LVV/J6MBSFioF/p+6f6akoNhGwvt08IfNQMPM8CJ2+BnIyq1@vger.kernel.org, AJvYcCVJw5bfYV0TG0EP6ljfUlmi4bTxH81TFxyajNqkxe+zU0l8qP3K8aJzJgMVyZHyekqSxuKO/GcSfRjQtD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqsvlTwCedYNwSH6/Ee4T2YLdyJminPU2QEJFzO7ugfzsEUBm
	hAwTL7+qTthlvTiERlhoI1Jfjo/4mw7eEhONbEAHYbf2eFAhQUO1yyvu2JIo0PEWNqI/rc3vgAw
	fbaXFfTCPHSvuM/AQQBY3069N41rOVVT2
X-Gm-Gg: ASbGncsLg8ps0XLEIYguXNyjmF0oVRN5FzO0QMWgRmA+ZelYI2UqTEqV9FTJYKwDAZs
	LHNdzS3Bg8FlH7jiUupDj71+S9EEB07rfElpOqjiwBno13f5KyBuO7Wud2DMUvfaJ2FGjIyrc
X-Google-Smtp-Source: AGHT+IFZyNalL6Dv+DNIs0u7a+Vd1SnQhayDC+8IpIDDde57RO2mAplJELbXowuu9B5AkqT5OEftG+E8U38NbKI8Ams=
X-Received: by 2002:a17:90a:ec85:b0:2ea:9ccb:d1f4 with SMTP id
 98e67ed59e1d1-2fa22b997b4mr650249a91.0.1738870584231; Thu, 06 Feb 2025
 11:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAArt=Lh0S6UPX0OAhudTWxE7g7xbukQqHmuDAwCDwjBUbuJUnw@mail.gmail.com>
In-Reply-To: <CAArt=Lh0S6UPX0OAhudTWxE7g7xbukQqHmuDAwCDwjBUbuJUnw@mail.gmail.com>
From: Jillian Donahue <jilliandonahue58@gmail.com>
Date: Thu, 6 Feb 2025 12:36:13 -0700
X-Gm-Features: AWEUYZngdHeWSApdgKMThK2XvC6HLyNDbBB3MWcgxuT5af83Hf9zSezAzn9GeXE
Message-ID: <CAArt=LjGqL4bYyQ5=Exz4cNk-EEQaQKCBMY=PRck2_UVe6HaKw@mail.gmail.com>
Subject: Re: [PATCH] f_midi_complete to call tasklet_hi_schedule
To: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sent with a broken link, my mistake

On Thu, Feb 6, 2025 at 12:23=E2=80=AFPM Jillian Donahue
<jilliandonahue58@gmail.com> wrote:
>
> From 9cb2628740d9f55f6f3faa5cce2de5eb8590f434 Mon Sep 17 00:00:00 2001
> From: Jill Donahue <jilliandonahue58@gmail.com>
> Date: Thu, 6 Feb 2025 10:18:05 -0700
> Subject: [PATCH] f_midi_complete to call tasklet_hi_schedule
>
> When using USB MIDI, a lock is attempted to be acquired twice through a
> re-entrant call to f_midi_transmit, causing a deadlock.
>
> Fix it by using tasklet_hi_schedule() to schedule the inner
> f_midi_transmit() via a tasklet from the completion handler.
>
> Link: https://lore.kernel.org/all/CAArt=3DLjxU0fUZOj06X+5tkeGT+6RbXzpWg1h=
4t4Fwa_KGVAX6g@mail.gmail>
>
> Fixes: d5daf49b58661 ("USB: gadget: midi: add midi function driver")
> Signed-off-by: Jill Donahue <jilliandonahue58@gmail.com>
> ---
>  drivers/usb/gadget/function/f_midi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_midi.c
> b/drivers/usb/gadget/function/f_midi.c
> index 837fcdfa3..37d438e5d 100644
> --- a/drivers/usb/gadget/function/f_midi.c
> +++ b/drivers/usb/gadget/function/f_midi.c
> @@ -283,7 +283,7 @@ f_midi_complete(struct usb_ep *ep, struct usb_request=
 *req)
>                         /* Our transmit completed. See if there's more to=
 go.
>                          * f_midi_transmit eats req, don't queue it again=
. */
>                         req->length =3D 0;
> -                       f_midi_transmit(midi);
> +                       tasklet_hi_schedule(&midi->tasklet);
>                         return;
>                 }
>                 break;
> --
> 2.25.1
