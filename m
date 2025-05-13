Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6CD2260C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146712; cv=none; b=TmwOomW2wNmmgUiQjP/DacF9ZXnwGpc2K2gCuyjgBej1w1KliLEHUUkmpsW9P5cwpG6ktx5JZD356gSfKgI91vX823Yw4x0nDvmkWebAJEgmUo9zSYWV4FZxH6eLN7j5vIDNZ3b3V7GnfGQV90biHH29wXyxL9GC71gZWsmh0h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146712; c=relaxed/simple;
	bh=vvoH7hwi+JxUz+93mNR6csyhgFsywBIGw+igaPb76Mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5WDb9X4Sd2OZ4SuqikSkdMW9JnYTCwgrg7WktesP2Jx62CnjayzK9cS+umus+8MXxIMFkg7SHEem34S4rverb6zMB2gcBXPbTTDxCSUHbREJEvjItQTf+uxObXhtkWzCDuxjOp9fHjioBCkNf2qFcqgnnoIwi6xPfrl8j6HvWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kf0Bqtj6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kf0Bqtj6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7396f13b750so6248180b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747146708; x=1747751508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvoH7hwi+JxUz+93mNR6csyhgFsywBIGw+igaPb76Mk=;
        b=Kf0Bqtj6Rsbj7AfsQ/qHpJU2IowCVEPH2l99v4OjijBKez2RUJ2ip8TwZveCw8D2y9
         FKkGIm1RYQO1zyDNmasAZ4HhmD7ZdULgcB9f2zUb+d7F/WqkMCT8AsBuOrzrNWY3KTqd
         oeYDpu6oY7U76Vej1tNTUC5UJ8X9jUqMk1Zig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146708; x=1747751508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvoH7hwi+JxUz+93mNR6csyhgFsywBIGw+igaPb76Mk=;
        b=eBo/gYl1FGUj6eWirkea71ZUNX/Mtjb5RacrhjTLTjIeYJ7xsJAuI7zvOgQ0pPnpaW
         5VvuFw5i0obpzvbRM9ykkKRDHXmwqYsMckeI1HprOJFVR+44tKEXLNnh55EUVBh1uVE3
         9a0l1j8H9ms+pGb0sWzr7lwu/+FDJD8kCq6DbfcH51zXsry+gXnoI9a9WufXGJWlM2sI
         951JN1T5R5edhMsLGtXM6hkj2KRDrB27wVkh5ecfOL04dmVSc4Pa+5CCsIQmfEX5AOxM
         GmFkF3H8NEnGsXbCuCEB89HRMjsMzQb+9GrxOvQnx09b1wWWNvwTnKtvbPS5ukqmnoZk
         uNoA==
X-Forwarded-Encrypted: i=1; AJvYcCV2U+djb7MfsvyU9SIMSg3WT9Q+LrfedIYKO7ThujtIlVrrPLhNxT1rBnxo2hkjPTBmf9c9gJElTRV2dN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOccUu/IcvW4kdNfoY1KWophnjPCR3qz94iEamyFySg0s96/e
	iDrl7NHO3WRXsi/m66zGyM/GLrXh7zd4fwsCsVSW9RE1AOrH7nSqT7xQYAFd1Yiqism8TiCC/vo
	=
X-Gm-Gg: ASbGncuHJVt9cID8bmjqrXdbFUaW4NRmtOmqV6+wS2kkXUmW1/POu4E2javQD6bnelt
	z9aHbhPW754FCRo/d+W3PvYfxThT056CF3rdxes6aGTJbPj5/UuucCx/eZdQfsbupTQWZ5vpUGU
	ki4cAlpKUjlhHu3/bVVa64im2gW3gTgDL+m+29Eq+U+Ke4lG+RhEOz6MaYWTcHRtEuZBSp3CtQV
	eKNlUrB57QUzx3zADsqYFqM96g9aqtxAFF7yD2amYoeyCnUTeyBH6c3kGDlNkR+HdMVqXpbGSWW
	mPCiOpc5YAFITibjg6ngTbeXZEdOfp5I/6nD7cDTV2tfS7yz0BDP3ALheO/PWDuoWrVbAEhEFGM
	DioT+0q3QYv7+KyHMpwg=
X-Google-Smtp-Source: AGHT+IEKf7czkJNevTGMhpAdDFoFjEh2QpEQKqLs8z4KdrhAR29WfrxtsMlf4Ewdrz5w8JSoQdILaQ==
X-Received: by 2002:a05:6a20:c78d:b0:1f5:769a:a4b2 with SMTP id adf61e73a8af0-215abafbdbdmr21624608637.17.1747146708533;
        Tue, 13 May 2025 07:31:48 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7427fb03fc4sm1168463b3a.84.2025.05.13.07.31.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:31:47 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e70a9c6bdso79140235ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:31:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOBOgR8lHLW6n+YU1LeROu/xRjQ77ZuE6uVJm77pVUNcVug/pW8e6ZPoo2OVfrt9Zb99dskxQKYyA/MeE=@vger.kernel.org
X-Received: by 2002:a17:903:2a8e:b0:224:256e:5e3f with SMTP id
 d9443c01a7336-22fc8b59827mr287727935ad.25.1747146706761; Tue, 13 May 2025
 07:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid>
 <86plgdeyrx.wl-maz@kernel.org>
In-Reply-To: <86plgdeyrx.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 May 2025 07:31:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYk+cXZCyPoeWwqpVc9hUXcU_BiafJ9s7B2W_Ow2eyWA@mail.gmail.com>
X-Gm-Features: AX0GCFsp8SCqYGmOj0-EDhv29ocsfEYuQg6EbYMcYbr_nJ0-_c8twh--m5N5kvs
Message-ID: <CAD=FV=WYk+cXZCyPoeWwqpVc9hUXcU_BiafJ9s7B2W_Ow2eyWA@mail.gmail.com>
Subject: Re: [PATCH] genirq/PM: Fix IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND if depth
 > 1
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, chintanpandya@google.com, 
	Maulik Shah <quic_mkshah@quicinc.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 12:49=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Hey Doug,
>
> On Tue, 13 May 2025 01:32:52 +0100,
> Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag doesn't work properly if the
> > IRQ disable depth is not 0 or 1 at suspend time. In this case, the
> > IRQ's depth will be decremented but the IRQ won't be enabled to wake
> > the system up. Add a special case for when we're suspending and always
> > enable the IRQ in that case.
>
> For my own edification, can you explain why you end-up in this
> situation?

Dang, I meant to put it in the commit message. ...but this patch
doesn't fix any problems we're experiencing. The issue was found by
code inspection during a code review.


> Because I think I can see a use case for the current
> behaviour, where a driver controls whether it wants to use this
> interrupt as a wake-up source or not dynamically, irrespective of the
> underlying chip's capabilities (which I suspect is pinctrl-msm).

If a driver wants to dynamically choose whether it's a wake-up source,
wouldn't it just call disable_irq_wake() and enable_irq_wake()?


> This is also consistent with the way disable_irq() nests, making
> IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND the equivalent of an enable_irq()
> call.

To me it feels like we need to go back to what we were trying to
accomplish when we added IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND. The main
issue we were trying to solve was to make it so that an interrupt that
was masked by disable_irq() could still wake the system. IMO an
interrupt that has been masked _twice_ by disable_irq() is logically
in the same state and should still be able to wake the system up.

I think we'd also have to compare this to how it would work on systems
where there is a different bit for enabling an interrupt and enabling
wakeup. Those are the kinds of controllers that _don't_ need
IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND. In those controllers, we're not
going to look at how many disable_irq() refcounts we have when we
decide to set the bit enabling the wakeup...

-Doug
