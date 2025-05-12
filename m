Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D282550A0
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075650; cv=none; b=AF/t2O+tIS0r4wodU2uB4GapV8NOl6rEPXEnUtkppygLkCmo0PX/jWi/G23gVW3dLHiqmIjV6BH55CAj34mN42smD5zE7/iZjhNnE4yOl/C09690CB4f8bYqnpr0MRP22tMZh/ZaZDkV7XDqe+SFLGPhPB3AnF21yq2sHwOkh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075650; c=relaxed/simple;
	bh=ufw+GE8HQEk8s+1r52a0AoQvL+irfth2f04OYx/FmwQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gX+C+QMuw3OOoYUd97O+ZVTTTgq3qXmrYrlpY4BF5pd3KqUZ8cnJBCXrPwyaGLgFFFhWiVLcPeA7hA+0ECmyKQAAGEPZ7iQEG68QaxoLLN9NBZuMEKFuFXPXfJhnuNRRctBWMb3BoIHEUoZEVavJfDUa5NvpnZlhf6ydraVHcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Icj9fsug; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vtdc6rMi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Icj9fsug";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vtdc6rMi"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747075646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHmzi1JghzgO2lKN7GfkMIAB+j0JUv2F/ls2ddofuRY=;
	b=Icj9fsugE7Xl2MsWfdMVUWGJhjPTfEoe6zlNASHGY/toScPK1MHSVWzkTNkxavWwxcFwsl
	6jYuXbpA6sx7ZOouSDUHrM8U6xt9uLpfyH8i82F5YcK3P1lKzHLgVat8kfrLjx0rHzRHMY
	Tu/vopPk+5fGFNZR8tcYMKYsY/KHhHvXM4xyxO++gY4XqpVpNJUcZg7jRY/XRSaMEDj/DA
	mAXBjy0aENBEe+C5U4xpjx8XkinOHSJbEymQb5ARCxTB/IcQBxYnHucr5hChS76uKfaWZn
	nD+YLIBiE1dIR6WHm8nrNUShqBzWjJCBSJWMVMKBxJeXILgQe2dOR3s7nXJmog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747075646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jHmzi1JghzgO2lKN7GfkMIAB+j0JUv2F/ls2ddofuRY=;
	b=vtdc6rMiCftIgQQzBqx51RmevM5pbSBHVZRqyQSA7eduSZfiNZXQE2l+MYpzk5rTVx0q+j
	ivvrWb15lFv0Z2Bw==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 2/4] irqchip/gic-v3-its: Implement .msi_teardown() callback
In-Reply-To: <86sel9g694.wl-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-3-maz@kernel.org> <87ecwtlwx8.ffs@tglx>
 <86sel9g694.wl-maz@kernel.org>
Date: Mon, 12 May 2025 20:47:26 +0200
Message-ID: <875xi5ll8h.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 12 2025 at 17:09, Marc Zyngier wrote:
> On Mon, 12 May 2025 15:34:59 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Changing prepare first breaks nvme and igbxe, amongst other things,
> for the reasons explained just above, so you need to implement
> teardown first, plug the MSI controller into it, and only then you can
> switch prepare.
>
> What I can do is:
>
> (1) introduce teardown without the call site in msi_remove_device_irq_domain()
>
> (2) add its implementation in the ITS driver
>
> (3) move the prepare crap
>
> (4) add the teardown call to msi_remove_device_irq_domain(), without
>     the check on info->alloc_data
>
> With that order, everything will keep working, with a temporary leak
> of ITTs in the ITS driver between patches (2) and (4).
>
> Is that something you can live with?

Sounds good.
