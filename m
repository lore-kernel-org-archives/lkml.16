Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061F6195FE8;
	Thu,  8 May 2025 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690170; cv=none; b=WOdiHmbQcxmeRcUiMwNdQs10InVKu1YYFX1j6s5KTGcKmtbYBN/fpqMj0G+t1msIZ4i47j+XoZqho7n5FRS2kYFGWsu3Leaf8kcmkeInqrDDFW8KKIk+/k9Tit2x2tLOfxvsBsE1cY3BamY2jC4HEaf7XssPAiJxqn9WBLarTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690170; c=relaxed/simple;
	bh=5JMW7/uRAihyo83RPf09AucXsTK0nvq44mkKuP7GWpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZEXI7onaRmJjR4uzIMdNYKr1Stp2Rgt7Ns/Xx0+MQWhgkcBFaswDECUrBHX2ts5oscBospRWFLjPUJexhvdpU8tJICrpWTJKZQ07lHNgP1M9oKK4FVOMjcpw88+mnUz5/ix2YgIz0kzxX45ktU8zcFqHot9iytjaypXTz7V/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8hPxqEH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8hPxqEH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720A0C4CEEB;
	Thu,  8 May 2025 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746690169;
	bh=5JMW7/uRAihyo83RPf09AucXsTK0nvq44mkKuP7GWpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8hPxqEH6ko1pwYYxlSgw8PARLL/d5vHuliC9BGD997xaeYyfSHrLXXJfwjBmXvDc
	 ssW/+poQ0zBzDp3vRfCvzOIcTY6pg/6yEUnCg42I4WUgLvYK8KO5rf/1JtAmVV2Yoc
	 PTdBfMpb8oK81Zetk/SScGnLu8clsvtGNxrqnWrWQgbw1VxrEOT5+KvK7I961hS/xM
	 XluLolxDnLwEJO7LfF81kFo99a7G1pzTRqWNf7bBYhT6fqyhRnQJ0fbNGvEkin1mTp
	 uIJd6O9Ot9GCjVwEGWSwLwbdKjhfwlAs9GNI1CeXYwX0qAyhTjHiPlNEHTczbyALJx
	 pA7INs3gg9RbA==
Date: Thu, 8 May 2025 09:42:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aBxgceQBRA6vBK7o@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
 <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
 <874ixwmpto.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ixwmpto.ffs@tglx>

On Wed, May 07, 2025 at 04:57:07PM +0200, Thomas Gleixner wrote:
> On Wed, May 07 2025 at 14:52, Marc Zyngier wrote:
> > On Wed, 07 May 2025 14:42:42 +0100,
> > Thomas Gleixner <tglx@linutronix.de> wrote:
> >> 
> >> On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
> >> > On Tue, 06 May 2025 16:00:31 +0100,
> >> > Thomas Gleixner <tglx@linutronix.de> wrote:
> >> >> 
> >> >> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
> >> >> tests for level, no? So the test is interesting at best ...
> >> >
> >> > There is no distinction between HIGH and LOW, RISING and FALLING, in
> >> > any revision of the GIC architecture.
> >> 
> >> Then pretending that there is a set_type() functionality is pretty daft
> >
> > You still need to distinguish between level and edge when this is
> > programmable (which is the case for a subset of the PPIs).
> 
> Fair enough, but can we please add a comment to this function which
> explains this oddity.

Getting back to this, I would need your/Marc's input on this.

I think it is fair to remove the irq_set_type() irqchip callback for
GICv5 PPIs because there is nothing to set, as I said handling mode
for these IRQs is fixed. I don't think this can cause any trouble
(IIUC a value within the IRQF_TRIGGER_MASK should be set on requesting
an IRQ to "force" the trigger to be programmed and even then core code
would not fail if the irq_set_type() irqchip callback is not
implemented).

I am thinking about *existing* drivers that request GICv3 PPIs with
values in IRQF_TRIGGER_MASK set (are there any ? Don't think so but you
know better than I do), when we switch over to GICv5 we would have no
irq_set_type() callback for PPIs but I think we are still fine, not
implementing irqchip.irq_set_type() is correct IMO.

On the other hand, given that on GICv5 PPI handling mode is fixed,
do you think that in the ppi_irq_domain_ops.translate() callback,
I should check the type the firmware provided and fail the translation
if it does not match the HW hardcoded value ?

Obviously if firmware exposes the wrong type that's a firmware bug
but I was wondering whether it is better to fail the firmware-to-Linux
IRQ translation if the firmware provided type is wrong rather than carry
on pretending that the type is correct (I was abusing the irq_set_type()
callback to do just that - namely, check that the type provided by
firmware matches HW but I think that's the wrong place to put it).

Thanks !
Lorenzo
