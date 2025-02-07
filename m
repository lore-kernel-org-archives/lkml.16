Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E023419C57C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738961732; cv=none; b=pTVyp4mNeEzUkW/u1RTShrj/kcCbxgxPj3xHB5w2Sg13rGZYbVZhD6BrZT/f9u1CA8BQmbxu8GwrBqULaFrAWtXVhRDuYepvL/+yr5heI1D23juPI5scpGuo4Ks7bU9OVrAYuINf77Jl6Tho38p5Qx5KZUM+XcfDPxrrul7ooWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738961732; c=relaxed/simple;
	bh=C7bqweA12h38rcKsGaQED1Ruwl6dcgOcvq9QnHKfCj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZMvbHupH+KLAxEGTwnR8l/AZlUI/idzrRsss6IsbvPcXLKA7AMtsmsN6uB4yFpXo+/L5damkzEoJwXYVKsx1ToXSH6CsstZGHwlW6rE6af3d7+7eTxqsqhr/bLCKrt4OBlb7HOUQn+8LlJoSnFrQVBqWm1HmaFidv2jHOz5SNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bG0vnmjE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bG0vnmjE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21c2f1b610dso62450565ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738961730; x=1739566530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YlWyHb1yBc5DBniS4DiHdUvL/zX6NTlfaoF7d9baRFQ=;
        b=bG0vnmjEtnwAIxDQwsAO4qPnky02tfSk9waK/EMrT5IclCWWIFfoaXSIbG6akXuXHr
         Jtk8lCd8+OgxuPCepJXb+dTzJVE2uMW/aMfVJIFXOhSCD0WfWe5V1jiJLhHhLCrj0qlA
         E7RG/o1IUioDMJSAnPhY7fG+yfCilwR15QzNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738961730; x=1739566530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlWyHb1yBc5DBniS4DiHdUvL/zX6NTlfaoF7d9baRFQ=;
        b=fd7qBOeBAq2iyJoNztUMYXcdLScEvkv03hk2oKm9StL7DSIucRjOsfeaPZfl7+vpAE
         2wazb+cTKS188mWOb7Xwt3vVm2gJSD1N2WyHXqk49ANP8xvFkvzK4GSGN62/2wZwcUNd
         dNYGCwAPv/msi0ihXLjsvY9PHFkh7YUXAkn8HTUZaJql6fvUhsdEDzyb91jRWb3j2z3/
         40NE36aqAmAVgcNACURGzscJoIUFMHVCSvOgdMuiUTYDMr7DLbi4tKMKJJ6uIum7LYcR
         WqxzwNTHP6+2IYC4IeSd4WJEofL/dxsqf2bRNEFnQyH4Rr2W+6pbBuvUZPDwNklI0+6d
         kf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDp5aDgu7Fpv9yuIaS5xUhTXgfYVCsjLr4h362+Kduv5zi9wwFGhv976a1Qv04Uuf2ELdFrdDIhKmabfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HQi3oTAy1R0RTD85sQqRG09xXxD6P5f3wKFZm2MvR9xwvKsP
	Kox3g7eoXawaLY1l6xPB1SNl8ob0RG2q5IK31lonu+S3Fe6XcQRe+WQH3uogew==
X-Gm-Gg: ASbGncuTmCRLMT8Kqlxp3ngynhlGX47dZmg9OPrAVFYdnw6WqdUHMTxn/dulb4Ckp7P
	c9RTLCdU5WMZgK99Ih1jJMZeTsVn2kAtUUQnkYlWIcnDq7KNj4Gim+o/bmPzj8vmmmRIMi+nO/O
	jIn+uWQ3u/+tLP8HT5XDH17nWJXOFJhcaxO2SyvCqzuNXot0zw9mURCC5JrSmkH3de1iAyeUvqY
	0FCNoNjkXcZkDuCz5fBkej7dCZ25AU/6JjQ8BN/jczpOPULaS90cK4zdbvCWviULeozfimFXuDQ
	9ZpEIg/pyRLxM/PQvF5T/xEJa4upmFVnqpICfONA3Udnk0qNdYWCLw==
X-Google-Smtp-Source: AGHT+IHxVWGTJ8hkbVNiUmFo89nI3fRGDKAHNUiE/0JoLsfO45nS7VGDoTGDUnknnSjSpAmyGAAq5Q==
X-Received: by 2002:a05:6a21:151b:b0:1e1:adcd:eae5 with SMTP id adf61e73a8af0-1ee03b761a8mr9077244637.42.1738961730134;
        Fri, 07 Feb 2025 12:55:30 -0800 (PST)
Received: from localhost ([2a00:79e0:2e14:7:bdbd:e5f8:229c:716e])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-ad51af7b744sm3554318a12.77.2025.02.07.12.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 12:55:29 -0800 (PST)
Date: Fri, 7 Feb 2025 12:55:28 -0800
From: Brian Norris <briannorris@chromium.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: Use level-triggered handler for MSI IRQs
Message-ID: <Z6ZzQKf1N4kBifok@google.com>
References: <20250205151635.v2.1.Id60295bee6aacf44aa3664e702012cb4710529c3@changeid>
 <87ed0btpfj.wl-maz@kernel.org>
 <Z6UWK6EvOLRrtRDH@google.com>
 <86mseyt8w3.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mseyt8w3.wl-maz@kernel.org>

Hi Marc,

On Fri, Feb 07, 2025 at 09:13:32AM +0000, Marc Zyngier wrote:
> On Thu, 06 Feb 2025 20:06:03 +0000,
> Brian Norris <briannorris@chromium.org> wrote:
> > First off, thanks for reviewing. I'm a bit unsure about some of this
> > area, which is one reason I sent this patch. Maybe it could have been
> > "RFC".
> 
> RFC means nothing to me. Or rather, RFC is a sure indication that a
> patch can safely be ignored! ;-) My advise on this front is to either
> post patches as you have done, or not post it at all.

Haha, OK, I guess you're a Cunningham's Law proponent :)

> > (See also v1: https://lore.kernel.org/all/Z3ho7eJMWvAy3HHC@google.com/
> > 
> > I'm dealing with HW bugs that cause me to have to configure the output
> > signal -- msi_ctrl_int -- as EDGE-triggered on my GIC. This is adjacent
> > to that problem, but doesn't really solve it.)
> 
> Configuring a level-triggered signal as edge is another recipe for
> disaster (a sure way to miss interrupts),

I'm very well aware of that, but I'm not aware of great alternatives.

> but short of a description
> of your particular issue, I can't help on that.

Sure, I'm not really asking for that, at least not in this forum. I'm
just trying to color the background a bit, that I'm not trying to flip
level/edge settings just for fun.

> > On Thu, Feb 06, 2025 at 09:04:00AM +0000, Marc Zyngier wrote:
> > > It also breaks the semantics of
> > > interrupt being made pending while we were handling them (retrigger
> > > being one).
> > 
> > What do you mean here? Are you referring to SW state (a la
> > IRQS_PENDING), or HW state? For HW state, MSIs are accumulated in the
> > STATUS register even when we're masked, so they'll "retrigger" when
> > we're done handling. But I'm less clear about some of the IRQ framework
> > semantics here.
> 
> IRQS_PENDING is indeed what indicates the SW-driven retrigger state,
> by which any part of the kernel can decide to reinject an *edge*
> interrupt if, for any reason, it needs to.

Are you referring to check_irq_resend() and related code? Notably, the
current patch doesn't actually change the result of
irq_settings_is_level() -- the nested descriptor still retains its
"edge" status -- so the "We do not resend level type interrupts" comment
doesn't actually apply.

But anyway, that still suggests my patch is probably the wrong way to go
about things, as it further mixes up "edge" and "level" concepts.

> This is actually how lazy masking is implemented, by not masking the
> interrupt, taking it (which is a "consume" operation), realising we
> were logically masked, masking it for good and marking it as
> SW-pending for later processing. Hence the while{} loop in
> handle_edge_irq().

Sure, I've familiarized myself with lazy masking. I don't think it
causes any problem here; handle_level_irq simply non-lazily masks it,
and we'll pick up the latched result (if any) again when we eventually
unmask.

> Switching to level triggered removes most of that processing, since by
> definition, a level is not consumed when acking the interrupt. You
> need to talk to the end-point for the level to drop, so simply masking
> the interrupt is enough to get it back when unmasking it.

Ack, thanks.

Brian
