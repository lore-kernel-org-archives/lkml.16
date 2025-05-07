Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207E528B7C8;
	Wed,  7 May 2025 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632906; cv=none; b=OZczqEoHE102Y55cPRJlsiTcnD+3F5jxb/K8IEo6XyzziCsiwXWt4OkBXJN+Unsl2A6AH82rkldcXs1K6kYnf3zQS1p0K7TUyAsAy39zJP3fgLCZuGRxbi8m/BKNiQUPpqgSpNoBCYQ47ywF/NnVO7Zfctj5hvhmWOeATh4essU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632906; c=relaxed/simple;
	bh=+nifJ1mcgdFZ8EQHTT9wprTRUK74+bCGpuEhl19I9hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtugFiX8krgE3ptiG1PXnh3qVZT0d26ENB4bf5s9GREkudXxe6jP/e7Fa2xCgAS0xUu9FQ/SIYwoRqoJ1R8s3x10pGNa8i+PSq1cxJEdYljIz224FvwYuh5Uz2vxhAL/TD2QVNsqvpYBkmbcZ8a5+4zdnH9+i+DuCEP5mGT90LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KumkK6FP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KumkK6FP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818E0C4CEE2;
	Wed,  7 May 2025 15:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632905;
	bh=+nifJ1mcgdFZ8EQHTT9wprTRUK74+bCGpuEhl19I9hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KumkK6FP8mLHEoo+i2rNeZK2niwKQ3cSDNcDqMHEZgZGTc1+czCzAhv4mix2mxK73
	 L2JB582kCNCrSo6M32QqIwkLZVlZLqTBxzoed3Tt/cgCmL9Cn5VQWwi143b9fbeCFq
	 65bfbrfyNwV+UcvlrqDgxaSYEVy0mDdgiT9+bqxg4VDq37rbGQPCtR5mVDLpM16Y3L
	 9LQ5tHZCfI4mAypRnWjG8JHkOmCZJAfbbonq4ormQC3n+uJyLJT7QFRGILaf8yvNfJ
	 /HaRCWKY40P97VWOlE4B7trwZtQztaGKaKsL7C69Ly2kOZnjEV1kBwiBeQH0acca4L
	 3/kOMWSn6cyBQ==
Date: Wed, 7 May 2025 17:48:18 +0200
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
Message-ID: <aBuAwjiSJ+01vJL+@lpieralisi>
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

GICv5 PPIs handling mode is fixed (ie ICC_PPI_HMR<n>_EL1 is RO), can't be
programmed, I removed the irq_set_type() function (for the PPI irqchip).

Lorenzo
