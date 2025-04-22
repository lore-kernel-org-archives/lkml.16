Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453B2290BA4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337067; cv=none; b=dqnVaBG6xmiSdhI4KmWlfctnvE1+LBZ8WHOZWnlKLoGqjG+GkYh/YeMnImeVg8ITvPlHwbK0xHQg45bik7Dbyj0LfBIDPXDaIWQ2LDjY/C37f6+xqFtdeQk8lwerUQ9lK4ikaN3kNUSz5q/ioocUObudv+x09acwehXSk69otA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337067; c=relaxed/simple;
	bh=3sqNGatK3nNf3ioHPn/vTJ1ihZQnxYjPJUzKw2ujuNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJe9dM+wxJFHRk5sC5Snwg4DXo7AxPuMJeyMPQ7WJ7f1QmfrJNFkI0voaiSB2FVhQtai4YifYdet1HmssSJJTGTYqBI67d/YZy7eGF6XwU8k6yQGvXR0Cai8GdX0QmO6bZF9mXLTGDBuim6XoVdOT9qRx+cCMV4yDk35GD6ql6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WC2yptBz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WC2yptBz"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d486d3535so6775e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745337062; x=1745941862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdFGD2OG7sa0PhB8zVDzwTwQ3rmo3v4yX/7hU6EpgHE=;
        b=WC2yptBzUE4Cu5A/1Zf0rY4marKoohubisGqMU8HDaA2CjNIt4qc3VnKoqK32RBc8D
         YvwEXXqgZhR6L2rVT0epwwDea4opUN/G4hNHUNKRh8/OTxgDPCzPvOSISShOfzroiq4O
         3lNWa5dAXrIEVv6U2MiO3WRR0Ob/snHAXS6WSY6TGi23SM6Dwm3z0D/Mzfl0gGXrzmQj
         MKML2Xx1Jjg2ucMkUEF6hcyY7B6frA1bHLSpMM2vX2Gz7INJAb9tSk+8UKfeFFusiTtq
         sDofLki336i6ILQWAkTT6OpgDGG17ZlnrOzdEf6Gc3wjvSZi1G9f2eTZGAnB5InApZXb
         i7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337062; x=1745941862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdFGD2OG7sa0PhB8zVDzwTwQ3rmo3v4yX/7hU6EpgHE=;
        b=XaM9wTfGOXtoYNKMrJsX6gDdCuJyuy5Vrmgxjh8kgSZhiIxb6JtFbGtRkKffcZzR5g
         uaKeNbci4MKLRQEfSCbpnXEt70Haq5L1jLJZslFGRX0htQEaEmSB1Xjf1ix2/jbqlm1q
         6RbvM5ULx4Xwe5jx1xy3p/DtbjDCB6hZEGmXB7WZZ30TbShgtokv7tSajV0Nb9eqkOeC
         i+6+HTCCt6D33DD6IUwKcdr0vWz1Uk99AECxwhAdlhp/0pm+eN+HrH6OCYqpqCO1Y8hV
         QBQxMge/8GRDZcDGKvvoHLkHGJOXnotag5HDRSehhFUSnKkT2leZWNXi16CYKosNShlx
         EDfg==
X-Forwarded-Encrypted: i=1; AJvYcCW6w/9kFkKZPRNPs5LXOkA/AKUWqCLIVpynMzq2rVNrbh0pr/U818unz0dtgIGGlIz1SilgopSPH2BuJxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9lIRtK23/WPo4qQ/qRhqasFhF9zm47SCj2LHZZfo3tvU8FI5g
	Bm3XHXkz2sqoOPkLmSq/pMO7BYg1rw451SVMHbjIaH9YDAisTo7/TJfHgUVjwO/3/EdC/7RQqaW
	BbBoKBs5YyWbQZQ25tUqUE9GoK5r3vsQGk3lwkOWo4Sa21a5AuEqXqrQ=
X-Gm-Gg: ASbGncuzYQFjrvjV3B56j+3kp9LBPxqz0K590CqKybg8ckGScKtdtkWdKlq02JGkrpM
	tJ/kkDuPJoyKyeJoI4jqBbyGoVNhadfZn/vzAf3uSWFadBqLvMvnNCZlmtc4v7FGbZ1Gp+CNfvH
	HcxzcykqCZgX+wXEevvWET533TEHEzVHh7hiuuPkhpL0eOdM6g/3zpYdua
X-Google-Smtp-Source: AGHT+IHQqUWx2u3/cq0FvzsslIUm5Dy/4pb7LqJE77ayHMAIePU0Cj0gbTYfXvpwXwPkr+tZIRDQNcab7m9Im8ZO0D8=
X-Received: by 2002:ac2:5181:0:b0:545:1cbb:74e5 with SMTP id
 2adb3069b0e04-54d6e956f35mr697284e87.3.1745337061944; Tue, 22 Apr 2025
 08:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416100515.2131853-1-khtsai@google.com> <20250419012408.x3zxum5db7iconil@synopsys.com>
 <CAKzKK0qCag3STZUqaX5Povu0Mzh5Ntfew5RW64dTtHVcVPELYQ@mail.gmail.com> <20250421232007.u2tmih4djakhttxq@synopsys.com>
In-Reply-To: <20250421232007.u2tmih4djakhttxq@synopsys.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 22 Apr 2025 23:50:35 +0800
X-Gm-Features: ATxdqUHW9FF8cqE3jm_WZD_OgsvjOfh6Q1uw_o-6F0YcJvOWm3NGOVNgd0xjp7M
Message-ID: <CAKzKK0pReSZeJ1-iRUbU=w+dK0O1fB7AgecfC7KJap6m5cQWnQ@mail.gmail.com>
Subject: Re: [PATCH v4] usb: dwc3: Abort suspend on soft disconnect failure
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 7:20=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Apr 21, 2025, Kuen-Han Tsai wrote:
> > On Sat, Apr 19, 2025 at 9:24=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Wed, Apr 16, 2025, Kuen-Han Tsai wrote:
>
> <snip>
>
> > > > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > > > index 89a4dc8ebf94..630fd5f0ce97 100644
> > > > --- a/drivers/usb/dwc3/gadget.c
> > > > +++ b/drivers/usb/dwc3/gadget.c
> > > > @@ -4776,26 +4776,22 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
> > > >       int ret;
> > > >
> > > >       ret =3D dwc3_gadget_soft_disconnect(dwc);
> > > > -     if (ret)
> > > > -             goto err;
> > > > -
> > > > -     spin_lock_irqsave(&dwc->lock, flags);
> > > > -     if (dwc->gadget_driver)
> > > > -             dwc3_disconnect_gadget(dwc);
> > > > -     spin_unlock_irqrestore(&dwc->lock, flags);
> > > > -
> > > > -     return 0;
> > > > -
> > > > -err:
> > > >       /*
> > > >        * Attempt to reset the controller's state. Likely no
> > > >        * communication can be established until the host
> > > >        * performs a port reset.
> > > >        */
> > > > -     if (dwc->softconnect)
> > > > +     if (ret && dwc->softconnect) {
> > > >               dwc3_gadget_soft_connect(dwc);
> > > > +             return -EAGAIN;
> > >
> > > This may make sense to have -EAGAIN for runtime suspend. I supposed t=
his
> > > should be fine for system suspend since it doesn't do anything specia=
l
> > > for this error code.
> > >
> > > When you tested runtime suspend, did you observe that the device
> > > successfully going into suspend on retry?
> >
> > Hi Thinh,
> >
> > Yes, the dwc3 device can be suspended using either
> > pm_runtime_suspend() or dwc3_gadget_pullup(), the latter of which
> > ultimately invokes pm_runtime_put().
> >
> > One question: Do you know how to naturally cause a run stop failure?
> > Based on the spec, the controller cannot halt until the event buffer
> > becomes empty. If the driver doesn't acknowledge the events, this
> > should lead to the run stop failure. However, since I cannot naturally
> > reproduce this problem, I am simulating this scenario by modifying
> > dwc3_gadget_run_stop() to return a timeout error directly.
> >
>
> I'm not clear what you meant by "naturally" here. The driver is
> implemented in such a way that this should not happen. If it does, we
> need to take look to see what we missed.
>
> However, to force the driver to hit the controller halt timeout, just
> wait/generate some events and don't clear the GEVNTCOUNT of event bytes
> before clearing the run_stop bit.
>
> BR,
> Thinh

Hi Thinh,

Thank you for getting back to me and the method to force the timeout!

By "naturally," I meant reproducing the issue without artificial steps
designed solely to trigger it. You're right; since the driver is
designed to prevent this state, reproducing it "naturally" is
difficult.

I really appreciate your patience, and thank you once more for the
helpful clarification.

Regards,
Kuen-Han
