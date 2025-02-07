Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578C01CDFD4
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926050; cv=none; b=k8EsHna2X+HLxyzLcze+L593ByhK6/Mkz6rxvfzxfWDzQ2j87sXAXxzp9RSYHsb+GAYitm9eync0g19hLQ4ehrzPBCEcY9U2WZEZsE6sneGxkGCZ0hSZaVrI98YrfWoYjaiMPEH/XDFiAk/J/XR5/3bLGw7ewVN2b3geDvivkrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926050; c=relaxed/simple;
	bh=ElkCd0VSmZ1y7aJo1xSkdXaYuOZ//Q71DJVBY+TzsMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyrckIyoHZyn8ihElC/Fod0gSKBPxHPOTsY1EWp/lPjxvwAGaCsU7tFr+Zsbb5m0ppaUPDp6t97ibwj4/RSFjD35iInNlJjdSrCefqRF1EfErH8sTP0BSEtRYvXprR2jWzPwqCiuiT34V1SDu1fIxBiU9qBnuAls06NBSSRDkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v0fiYgzR; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v0fiYgzR"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so5827a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738926046; x=1739530846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPNEh3d8SXd4UyVBzDYe+DWkKrqBsXALhs4HDck1znw=;
        b=v0fiYgzR3YU7cPppw9/J+DWXjC3a22NO3H+m0Dxy4+K1O5YZJdp6f6rVKIwUzVr5cU
         4iwvJH9Hgkm7e5TDT5ABeIpZ/PEqd39XJExp6BEuKNwHqyWXO0jRaPTrYASv9Oye2A0T
         gJGrpaTH6cfdzBzersaOGgIhDDtzJIhGCMyau063Mih95d6b8OXUecD8cfXpbsmba6vh
         5Osm++ilG1cm02U6vR0j0PHPyFsMalNPhW+ikrPVnf5zGhhzE6BkgehoxxH1S0NhBf10
         Q/5B5XoSCnmHCEH3QSJaHxQ4X8545dPNrPhk6iZtNxhDuNkbmzZTjzeGH1JrXTO3o9wi
         5SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738926046; x=1739530846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPNEh3d8SXd4UyVBzDYe+DWkKrqBsXALhs4HDck1znw=;
        b=BFMIsIztqC7qzQpBHGL3ed217/nO4i73MMJj1jEMSmbby4ZWHQ1oQg7+ip247E42CU
         MC23ceC3YJ24c7t5qYUah67TMfMWbpKMtyKOWZ31mUHP61pj5lziG20EQk1L5q5pQWzB
         S4UoIA4RzY8Ns+gaccZ9JAx6BGk6Kwdi1j9qoauxS7H4+cB3p439UYyGske2Qf9UkbCa
         n91pBoH4v3cyvwFCzSJDIu3cCA/YhxAK/0vJYAnU5IgR9c40ZZEzVIS6UVdZOLgwm4ci
         //fVUFAliXpbg/665Rwa5PJQGpxANALt2Qd3oiNHpVhC4zunE+3o0EJ3VIb0cqODpI01
         xFXw==
X-Forwarded-Encrypted: i=1; AJvYcCUokD+6KoCWyzp4jpyBODaGbKfXJdevt/zbCpm2j1VXtOVRuV0RPuB/ksrK/IKlhsIFJ+14YIGStxelqx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47WyLpflqWzxJomn3WCDlVEslFHLrMit5gyYG0cyliTRwQKzK
	KIQW2f4W6G0P3Tdjt/PWuly/ECdzya+xbpoO2/q99MBtWsTL0wmjCDCr56aAaCD/PmFHJpdraZv
	bSqnmfCsn0+n45/GTZS3vSHB950fC0VM2hVyb
X-Gm-Gg: ASbGncsfnYAdj147+gAA56oSlSGNHZBHkX4T02cQeWXlicf8KL4xf5vQ33t9TN1p8Kl
	CZ2xUqRk12jd/+IQUdPY0oTZUxNnit5K3tU5PRkJAt74Q311A0pPzeAoZnpK0lljg603PPOmWhR
	FOpWpLPOEkI3oroN/uxFJUKEok
X-Google-Smtp-Source: AGHT+IGKGJth5652Acd+gw45CCa0RFZ/zp8RtL4d3FGKWPR2wRFDG4a+498kMReRGmDCy02tEid8QT1Lvxxfgod8Vaw=
X-Received: by 2002:a05:6402:299:b0:5dc:59ca:8f3b with SMTP id
 4fb4d7f45d1cf-5de47d9504fmr74611a12.3.1738926046475; Fri, 07 Feb 2025
 03:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-6-guanyulin@google.com> <20250206011324.4729b548@foxbook>
In-Reply-To: <20250206011324.4729b548@foxbook>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 7 Feb 2025 19:00:00 +0800
X-Gm-Features: AWEUYZnVEvD7t_Dz9KkFhfaKqY6-yN5VtxdJYuumvbaB5-jEOXHVpXFPVyLQTDM
Message-ID: <CAOuDEK2c-F8dEyR894c5=OVYTJiLX6y1e1vd1RKoxusNa5PFig@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] usb: host: enable USB offload during system sleep
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, kekrby@gmail.com, 
	lijiayi@kylinos.cn, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com, oneukum@suse.com, 
	perex@perex.cz, quic_jjohnson@quicinc.com, ricardo@marliere.net, 
	stern@rowland.harvard.edu, sumit.garg@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 8:13=E2=80=AFAM Micha=C5=82 Pecio <michal.pecio@gmai=
l.com> wrote:
>
> Hi,
>
> > - not flushing the endpoints of actively offloaded USB devices. Given
> >   that the USB devices is used by another entity, unilaterally flush
> >   the endpoint might lead to unexpected behavior on another entity.
>
> This doesn't seem right, because flushing applies to URBs managed by
> the kernel, so it should have no effect on offloaded endpoints.
>
> As far as I understand from your earlier discussion with Alan Stern,
> the real reason is that it disrupted operation of class drivers, in
> particular causing kernel-managed interrupt endpoints not to be polled
> during suspend and some events were being lost.
>
> Or maybe the real problem was that if the INT IN endpoint isn't being
> polled, device events don't trigger xHCI IRQs that wake up the CPU?
>

The main reason is as you described above. Without polling the INT IN
endpoint, some functions (e.g. hid, hub) failed during system suspend.

>
> And by the way, usb_hcd_flush_endpoint() doc states that no new URBs
> may be submitted during this call. I wonder if this can be guaranteed
> if the interface has not been suspended first? Perhaps this alone is
> good reason not to flush.
>
> Regards,
> Michal

To my understanding if the interface creates another URB, then the
interface might be able to submit it. Is there a reason to not
flushing all endpoints on a USB device when we have offloaded transfer
happening during system suspend? If there is, we'll identify what kinds
of endpoints are influenced and not flush them independently.
Otherwise, not flushing all of them might maintain a simpler code
logic.

Regards,
Guan-Yu
