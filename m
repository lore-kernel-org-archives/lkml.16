Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87EE1714B3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657022; cv=none; b=pHnt8ogEy0DU/oH6j58BJ+BtJk6hn+jDvBL2K0MsETWAFhSl9nMdL6RQcVEZeYX4Cf+N2W7uKjfWUid9iUPVY93QCpeGIusHgd0YT1ot0Gz+X9HiX5BrUf/YpBeAbnOa0yoV/SnJO9+tcVM/igIJPtVQoluPqKcV9IAVBIwjkhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657022; c=relaxed/simple;
	bh=BIOX9H4O6cTEWwlkrpWf5u+kicgtzztgCG71TnhgjQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tzrStEHolUXpDl5Yd17JQJUg6KkbFgmDEMiuYqW+8E8q+zmBgND1Wjn9kdDbuX528+Z2vWREEU8RVZ9pnG2mNLhrfDp4F0VoNpzfq3lOLYPjYdiCWYeOVpT2RQ1EuBq4JjvRNFraE7eCng0YCRIONzcaUtPzC6td+BoinFafxdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MjjivDDY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WB/Q5r8E; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MjjivDDY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WB/Q5r8E"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747657018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k27fO7henKnq4UPnDJ7hnHW2OVYLSMfn/J8w9qfUsF8=;
	b=MjjivDDYyJR2hfCPEDkEYDfh2V6bEly/UssS0T63VB9O0C+TM8a5a6ZetMdVipO4btpgsp
	69psghpmQ28ifE+yzLBrcOtMju+HtY9Mn9iXU8WLrLko61Ee2gxVBDn5urZxnRPkMAlOa0
	i8oTOL34hK0uHCEtZRq6kN/xcJlP2FdB5pzQ/FOj1+KSr6hiDjKkUKkSZOPUtX8MnrM/CA
	+esaRZgcHJ/lKAMZro0oyVZlCskiE+zR7W5RU32S5IZib7HO6ZT0AkJIK4AtCWlQx/Amy4
	Pg8lnPrb061e1Gi1DdWyCUNYSTBIMhe1YtvLXo6fsx8n8IYToa6hjq40EgUKUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747657018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k27fO7henKnq4UPnDJ7hnHW2OVYLSMfn/J8w9qfUsF8=;
	b=WB/Q5r8EZiZ3SPP6wnORvG2F0zUMrX+ovCj1NeKg0YpcoPoen2Rud3xa2bKOqMiknxsge0
	8Zg7ET7P2j+trJDQ==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 5/5] irqchip/gic-v3-its: Use allocation size from the
 prepare call
In-Reply-To: <86wmacewjr.wl-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-6-maz@kernel.org> <8734d1iwcp.ffs@tglx>
 <86wmacewjr.wl-maz@kernel.org>
Date: Mon, 19 May 2025 14:16:58 +0200
Message-ID: <87zff8hk1x.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 19 2025 at 11:15, Marc Zyngier wrote:
> On Sun, 18 May 2025 19:53:42 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> On Tue, May 13 2025 at 17:31, Marc Zyngier wrote:
>> 
>> > Now that .msi_prepare() gets called at the right time and not
>> > with semi-random parameters, remove the ugly hack that tried
>> > to fix up the number of allocated vectors.
>> >
>> > It is now correct by construction.
>> 
>> FWIW, while looking at something related, it occured to me that with
>> this change you can enable MSI_FLAG_PCI_MSIX_ALLOC_DYN now on GIC ITS.
>
> Maybe. It is rather unclear to me what this "dynamic allocation"
> actually provides in terms of guarantees to the endpoint driver.

It allows the driver to avoid allocating a gazillion of interrupts
upfront during initialization. Instead it can allocate them on demand,
when e.g. a queue is initialized. Of course that means that such an
allocation can fail, but so can request_irq() and other things. I'm not
sure what you mean with guarantees here.

Thanks

        tglx
