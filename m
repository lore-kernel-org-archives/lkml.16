Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDDE1386C9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573844; cv=none; b=sJmtLuTB52+smVdfZNYYDwzqGDxyFADFW7f0mFze+bbHZHPsk9vAGZsJ4N7F/UWbNhtVNpBaiQEkFhxTxBh/TqQGwd5i7ECI2IJBO2SG/7avgE+nITcSJvYS+hfYqDwLvAfN49mZxzKekasi+IFJrqizwv5f7ypHqmGhxJ5zndo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573844; c=relaxed/simple;
	bh=LiKiq+ZGuOAcrq2w4x1bC0epAdHoq/i0pu5fe9JOHf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ9Pr8Dd9ixEivGQZGghOMH8F1gFftcLIJ6xh0AkiuI8Kfiz0YCzUU5hzqNK5Ya89vxhR4bEfPdtfC1xJNhkLZK3PRxm1g2W+BS7mJaLHNOUFjBHXyYH4P7DX481XLbEw1tG4AfzQ/nYN9VfgtzSDs4/t7RcHVWoJHsJSJBexeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZZNGMtQB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZZNGMtQB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23526264386so48941895ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749573840; x=1750178640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rb/fawWpfc0ce2ShUHastFfxNJWcQ6JGsfv7r2JgZNQ=;
        b=ZZNGMtQBRJIlGjeRuVUGFpburD1hhVzT8UMCTb/m/qvKxnDgsSP+Mzuw3HWafMihAq
         Fck9NpIlhzfZw2JNULsB54Yzrm8iGECYowCxXtpyCstS2DjM2NbqNxtMqQmIo/h6ezdR
         6bNYzl9jqxMT7syeFs1ROZpAZ+JJLngCDjC+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573840; x=1750178640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rb/fawWpfc0ce2ShUHastFfxNJWcQ6JGsfv7r2JgZNQ=;
        b=uE0IhClFjDS1rwOLDlG2IOBDsqihz3BXmox0I1wJeA9lhlZ2CquFbj1ggRvsyEIrzG
         9vCQYeEQrjX/jkyqpKbTWUI+yayCfNVCfa+ulx7P/fqhwXzrUb9DeqU/chLObXxftYzC
         ssRfDawNO4pu/iVEBsa7d8Vso7xZgPGYSIwaLisktFc4B+e/JL3BDtcBAOVBexkWk59N
         ddFlNc8wRGBVDJhSsaJae82hKoxMmOdc92u0xhCoZE1Niop7Wbg+OtKqL/82OcjMKddT
         c/ARSZ7VEnzObdO+c+I+YStcRX1/vq5OdW1KlH+JX4AyuCPVvb8Za6z0SzuApwdawcHo
         4cbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWgvXeCSZXHNjHx7JCKVDfXgy3fx66XQWw0zgfTVoI9AjjdFusauUJOVIwvNJL9zzJozBhHqzyO94Ax8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOHhxgk4QNljqwmi2RVEitMIL5kHdpq0QOXyk6vKPV71Js4CvO
	XeugHG415pUKX34740/0Q1NY8ToNxzMXDPeekQqegX9BEA4R3qXpSKdsZk0Ym7eSl8D3d4TmZRY
	9YOUmrA==
X-Gm-Gg: ASbGncuW72ryssyfIPo1o2EvQo7Kn/J4HzhQ5mNwrD+m6GIWNrr3SLLL+eLiFFC1do4
	AxCLJ1UwAPepNCYn1xyIfnh/EhdzudLol9meHtI0ENJdz8t+dJaNJIBwLboNOwZO1DjvRuFwS7y
	m/WKvkEG3rH7jMWHLGb9HvrxA8oBBg8Sh/kbZlDQgHhzQHQT4i49taV8Hm7xtqcCOwvxvY9BNsq
	IwBMrBoka7IcEiSaj04D/BYnSchDjey+1TE6/sxngewySZBdscqc0tsJ2co2kLTGUqeR7hW5fHA
	H9602UMI1KLz1BAe6LCR0Y922TWBU2+Ls16oUzDsSfz1wkgVOvIIQr49PxBknnLLbFUkjvPI5VC
	Kd1tt3ATI4zAWN9cF9ZFc8krHmA==
X-Google-Smtp-Source: AGHT+IFroo7pAMlZYCwFJ66NnmBwMgsunxIsEjvmDydJrowK1DzLvlMzQgKph+1RniGYY/K+YCBE8A==
X-Received: by 2002:a17:903:2349:b0:235:1b91:9079 with SMTP id d9443c01a7336-23601dc3bc5mr256288115ad.32.1749573839848;
        Tue, 10 Jun 2025 09:43:59 -0700 (PDT)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com. [209.85.216.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340519fsm73180505ad.156.2025.06.10.09.43.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:43:58 -0700 (PDT)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso5991966a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:43:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXofZwHz0PgXPrtpusRvLkOal7Z/zla6QQVVwhk7rjRVLx5nxcRUlnyYzpsrSFCEJgIzCt8NMs+rZ8ZwLw=@vger.kernel.org
X-Received: by 2002:a17:90b:520e:b0:311:eb85:96ea with SMTP id
 98e67ed59e1d1-313af171e94mr449165a91.9.1749573837560; Tue, 10 Jun 2025
 09:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid>
 <aCPPgiamOQSSHH-m@google.com>
In-Reply-To: <aCPPgiamOQSSHH-m@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 09:43:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_nkzpWzaPaFb+OC0+r-BYUoXmog=BNV43CR-WHoDTpA@mail.gmail.com>
X-Gm-Features: AX0GCFv1HTJqczEdhl2xjy2xObXfHpEEoE9habwGWTU7hvWWTkafZA3x5lE4RIc
Message-ID: <CAD=FV=X_nkzpWzaPaFb+OC0+r-BYUoXmog=BNV43CR-WHoDTpA@mail.gmail.com>
Subject: Re: [PATCH] genirq/PM: Fix IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND if depth
 > 1
To: Brian Norris <briannorris@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, chintanpandya@google.com, 
	Marc Zyngier <maz@kernel.org>, Maulik Shah <quic_mkshah@quicinc.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 4:02=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> On Mon, May 12, 2025 at 05:32:52PM -0700, Doug Anderson wrote:
> > --- a/kernel/irq/chip.c
> > +++ b/kernel/irq/chip.c
> > @@ -272,7 +272,7 @@ int irq_startup(struct irq_desc *desc, bool resend,=
 bool force)
> >       const struct cpumask *aff =3D irq_data_get_affinity_mask(d);
> >       int ret =3D 0;
> >
> > -     desc->depth =3D 0;
> > +     desc->depth--;
>
> I'm certainly no expert here, but I'm treading on the same code and ran
> into a problem with this line too. It seems wise to make this a
> decrement, and not an unconditional 0. But I'm not sure that we should
> then proceed to unmask an interrupt that might have depth=3D=3D1 in the
> general case. I think we should defer the unmask until we actually reach
> 0.
>
> In fact, that's one aspect of the very problem I'm dealing with here:
>
> Subject: [PATCH 0/2] genirq: Retain disable-depth across irq_{shutdown,st=
artup}()
> https://lore.kernel.org/all/20250513224402.864767-1-briannorris@chromium.=
org/
>
> It seems to me (again, not an expert) that maybe you need to solve your
> problems by dodging the disable-depth entirely. But I'm not sure the
> best way to do that.

I can give a shot at spinning the patch, but before doing so I'd love
to get agreement that this problem is worth solving. As I said above,
we're not actually hitting this in any real cases and the issue was
just found during code review. To me it feels like it's a real
(potential) bug and worth solving before it bites someone in the
future, but I won't force the issue and I'll drop the patch if that's
what everyone wants.

If it's agreed that I should move forward, I'd love advice on which
approach I should use. Should I do as Brian says and try to sidestep
disable-depth entirely in this case? I could factor out the "case 1"
case of __enable_irq() and call it directly and then make sure that
all I do is count "depth" while `IRQD_IRQ_ENABLED_ON_SUSPEND` is set.
That doesn't seem like it would be too ugly...

-Doug
