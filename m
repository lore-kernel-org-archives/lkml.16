Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3078E555
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751430792; cv=none; b=SwyFeROuSGdKN0nFnBeMiGzJw7fP9qTN+IH0jJwXEsyc8G3UA9Tq9PO6MTZL0rCJqyzV4tBPIxCFe32yiEeiLezbmrivWYTKKrlqvLwXV9Cdg8v1J2bPFA2IGJNTV53ixwP5Ikw9pbc8Ate7lwQ2dv0HVfm9ZTFHhgD7kEimHGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751430792; c=relaxed/simple;
	bh=V+yKMN52ursvZcOAwRHO3lkom4QQNqnBRvji1e+HM7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHUMqzNMHAEEVDoBtPLwwPDfTTdFcdlBUwdhKj0/5sc3bLGvt48k8SJDEuFBB/evUaQh9iXxykNI6BiqHRUzvTM4Aj3M12hWKDEUVqoWVvxNwoedwBf7+8Oj10GTJgBr2K6wt8QQhhPtUeyattnvjc9Ix6PvFRxDAarvTKjMLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zrl6l6Km; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zrl6l6Km"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3de210e6076so225955ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 21:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751430790; x=1752035590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6ibeF7iQFN6MXFCKTT12fPtzRdzmMgmVRdt8ogRjrw=;
        b=zrl6l6Km3g65R5OKwYJQJSYXd6ojUkHfKNvGCJmZ3otCsrizo43EUjcXgHQ0KdWTbF
         TNV2D2ylMcCIlH1apXtQvmbEONGhCIgFsZdxdUOU6hYpcst636vLnig78diSDyJt3R0g
         GbLkMJS5n3nZVFlLalzgJ2a3DGDnDhC1odXmRL3EPCsglIyFWrLuRdUyopc+m4y6AUR0
         pN5okWl2Urqwja4SoFKB7W7/ih9lu9+hKOIuu1IOnGtEacRr1ssROuTxZwI2WTOFV+Cm
         krbuPyXQo/llgP/mdpTnICxRVGOd53e2nxIK/nKxW59fA7FyAgjeZz/nQPJ5YfpBPS+m
         3EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751430790; x=1752035590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6ibeF7iQFN6MXFCKTT12fPtzRdzmMgmVRdt8ogRjrw=;
        b=dW+oAFZvGtskazJjK+tg0XNKBiN1oLBIoHUxRMTlQ6rkirbjf8qvdSEDapNo/06j9b
         f8YkR4fp3USLbq2HOTlu1DEpER4kLoiOkbRwj+n/2dw0EBjRjCGbkElwRFZ8fOcIm7Hv
         GGkTMuQtKRARBmpTkBFWf39QGViV9CAtyDyKjPbG3jkI14w1Q6Z+47FOZmGlbmTl6aJ5
         1j7/os82Aoplu1VymjJ4WxHRb3Zxd0oTe3bsObyeemVt/NBeETKy2CW+SJwiAIpZtyBa
         EvgMvLWQO56U3TbqOiypyxzYM2aNx6ClBIou02DEYI34S4H7gRSKRROWAwntdgBLPuxf
         zCDA==
X-Forwarded-Encrypted: i=1; AJvYcCXTuqwpjrBrcvm+xxup6D4lLV0BGOcxewTNclm/mufPAQXPmneR1TFzkuKpOqixE9f7fbt7EHGlrdrspIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2K+yk+VaSOzcq72ANJw53FbWGmoqyAxUhVO6WhroQGujO6DU/
	AJsZUalSdRbwAIMoXOZlnKsyr5hZpIHGgq2NHjXIFXos8XMHtcnhwjRETfUJkCUWniXO5eyBwoi
	AXH6FADceSNpJPiJIHWncmjW1AlwO1JD1TsmwemLF
X-Gm-Gg: ASbGnct3+UXsmZhh92KehtvrUnjhDgwwOGNtt3QrfIdge69i1OWUe1QZ5Pgai2LxB7Y
	lpQBqO+30hz+KOCGqhQW8SzIlMxzDf3ugGtnETfOeXs256YWbGJ6LNh5atKgM0Yk9lsxLNNPpfw
	ehWOWEPVZSJadCDYMoeOLIsOBfkxACZV7eVCCB8E+LRcaDVTcynEJPSoEcmtHq0T/gEJi/uKZSy
	A==
X-Google-Smtp-Source: AGHT+IFhAG7FmsUNvWegEmSDkXGcLC7QCKJe8X1+A6cDiTAh0Ppff/d4janmsYhEacLJkqjEiLzvlo+uvuAA7hdxFV0=
X-Received: by 2002:a05:6e02:148d:b0:3dd:c9c2:820e with SMTP id
 e9e14a558f8ab-3e04a07a123mr5428215ab.23.1751430789780; Tue, 01 Jul 2025
 21:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
 <2025060407-geologic-excuse-9ca5@gregkh> <CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>
 <2025061957-daylong-legal-fed1@gregkh> <CAOuDEK1mY7++0NxRYR_+fhQB5+74KB-=MHhk4Dx3cpD6XrG93A@mail.gmail.com>
In-Reply-To: <CAOuDEK1mY7++0NxRYR_+fhQB5+74KB-=MHhk4Dx3cpD6XrG93A@mail.gmail.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 2 Jul 2025 12:33:00 +0800
X-Gm-Features: Ac12FXy2XrB-PQl8vwk3j9enF8UMK7euznjxv9NYAA8UCnZfd5AtSLx-n3WC5Pc
Message-ID: <CAOuDEK3+=FVj2zrajjqsWamqCEx5-0v+dSS=gRLYyO_8YdEy1Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
To: Greg KH <gregkh@linuxfoundation.org>, dh10.jung@samsung.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 11:05=E2=80=AFPM Guan-Yu Lin <guanyulin@google.com> =
wrote:
>
> On Thu, Jun 19, 2025 at 5:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Jun 04, 2025 at 08:32:00PM +0800, Guan-Yu Lin wrote:
> > > On Wed, Jun 4, 2025 at 6:56=E2=80=AFPM Greg KH <gregkh@linuxfoundatio=
n.org> wrote:
> > > >
> > > > On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
> > > >
> > > > Is there a reason you aren't cc:ing the developers from a "big andr=
oid
> > > > device company" that is currently testing and finding problems with=
 this
> > > > patchset in their device testing?  I will require their signed-off-=
by or
> > > > tested-by in order to even consider accepting this patch series bas=
ed on
> > > > the issues they seem to be finding with it in an
> > > > internal-company-bug-reporting-platform that I seem to be also copi=
ed
> > > > on.
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > I'm not sure if the company wants to reveal its testing right now
> > > since the company raised the problem with the internal system. Hence,
> > > we still use the internal system to communicate with them. We
> > > understand that "signed-off-by"/"tested-by" tags are required to merg=
e
> > > the code, so we'll keep working closely with multiple companies to
> > > achieve this.
> >
> > Great, please do so for the next version you post.
> >
> > thanks,
> >
> > greg k-h
>
> Hi Wesley,
>
> Right now the system sleep with offloaded usb transfers feature is
> pretty much settled. I was wondering if you could test the patch on
> your platform? Thanks!
>
> Regards,
> Guan-Yu

Hi Jung,

I noticed that you've adapted the latest sideband design for audio
offload in your system. I was wondering if you could adapt this
patchset as well to further enable offloaded usb transfers during
system suspend? Thanks!

Regards,
Guan-Yu
