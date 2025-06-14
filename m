Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578D1B0F23
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927669; cv=none; b=p/mpElqiwxXlHUtyr1HqmYfAmQHnhallfkny22zC6Qks+nAZGxjAKgCGvsm2RXKKvWBSIO+rNV8cfhSQhkK2A7Nhlqabu7vWQcyK90LXBcsHnrbFUBkrW3fRRSSYWkLlbDt/Aizm80PtyhcC+MDJe9sCjoU1N5vWLx/6ZT0Kfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927669; c=relaxed/simple;
	bh=EurAu8ALfM1WmJw2l8EX7dc00rR8wAYYEHq3SL6ZBtA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hBbw5MEOC0Bd36xUyrl46jFza0TQGJ+ea49E6norSOjxEvw4dOePVEGh6tbJDZt3zfOrkGNH9xzQ9pmokbpc7U7Qg5tZxdtJV6kdqv1s8+les89WgGzhZDsOTraLCnS/MfbCbiGa4AetUCZ7P+xp/yKFIcjnD0V1lwDdhADX1K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FZBFLsYv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nJN7LaEp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FZBFLsYv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nJN7LaEp"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749927664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mREGSnFXjFYBfuEU2fWQxVRz5qLYhliniT1peCme8d4=;
	b=FZBFLsYvk0k6nkWWfMnQ14UKDY3RB+nnOXWZyT6M13Kf/JH9iTm4H/wHyOGlZAiORtCWn6
	ifeHLiHhiioDYKMakAtrLt/rwGSwO+qV2mbxba0EZnJpdXOERu1DI5RUyeiBYti2DApLSW
	Rxc7sdDxUhTRAQ+9DgWPzTu90kWN5ay1euVnNYIgg1CQMqh1owj6Uo30k6n9K+q750epPX
	t2lBIWkMTSxNIssvyt8c0cs0amRdyt1wfHWYbsPaCbcM2OyBOpjq2aUbcr0DwRGzZE4EGa
	5PkVDv1cOhEotR05/f4NfhAZ3LznT0kAhX/BL+fnEsnOHvsgXV1cbt+alaw7JQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749927664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mREGSnFXjFYBfuEU2fWQxVRz5qLYhliniT1peCme8d4=;
	b=nJN7LaEpiS5bfq+AOl6AWYz5Ttzj5rNIqv2C377MnCy6G55Sy7lPyHdJQ38ajAvJTzEqm6
	wWDenDOKmVv/vKBw==
To: Doug Anderson <dianders@chromium.org>, Brian Norris
 <briannorris@chromium.org>
Cc: chintanpandya@google.com, Marc Zyngier <maz@kernel.org>, Maulik Shah
 <quic_mkshah@quicinc.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] genirq/PM: Fix IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND if
 depth > 1
In-Reply-To: <CAD=FV=X_nkzpWzaPaFb+OC0+r-BYUoXmog=BNV43CR-WHoDTpA@mail.gmail.com>
References: <20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid>
 <aCPPgiamOQSSHH-m@google.com>
 <CAD=FV=X_nkzpWzaPaFb+OC0+r-BYUoXmog=BNV43CR-WHoDTpA@mail.gmail.com>
Date: Sat, 14 Jun 2025 21:01:03 +0200
Message-ID: <87sek2no5s.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10 2025 at 09:43, Doug Anderson wrote:
> On Tue, May 13, 2025 at 4:02=E2=80=AFPM Brian Norris <briannorris@chromiu=
m.org> wrote:
>> It seems to me (again, not an expert) that maybe you need to solve your
>> problems by dodging the disable-depth entirely. But I'm not sure the
>> best way to do that.
>
> I can give a shot at spinning the patch, but before doing so I'd love
> to get agreement that this problem is worth solving. As I said above,
> we're not actually hitting this in any real cases and the issue was
> just found during code review. To me it feels like it's a real
> (potential) bug and worth solving before it bites someone in the
> future, but I won't force the issue and I'll drop the patch if that's
> what everyone wants.

I don't have a strong opinion either way.

> If it's agreed that I should move forward, I'd love advice on which
> approach I should use. Should I do as Brian says and try to sidestep
> disable-depth entirely in this case? I could factor out the "case 1"
> case of __enable_irq() and call it directly and then make sure that
> all I do is count "depth" while `IRQD_IRQ_ENABLED_ON_SUSPEND` is set.
> That doesn't seem like it would be too ugly...

No. That's creating inconstent state. It's already ugly enough. So if we
go there then we make it explicit like we did for the managed case,
i.e. something like this

void enable_wakeup_irq(struct irq_desc *desc)
{
	irqd_set(irqd, IRQD_IRQ_ENABLED_ON_SUSPEND);
	desc->saved_depth =3D desc->depth;
	desc->depth =3D 1;
	__enable_irq(desc);
}

and then have a counterpart which disables and restores the state.

Thanks,

        tglx

