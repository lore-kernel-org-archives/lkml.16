Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C9193077;
	Wed, 28 May 2025 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748442858; cv=none; b=Hj418L5PDz9Gf1/fOmAEp6iWhG7kxsRP8Vjz8b6QUxEceOSDdUqghHAMCONjYftWlc4cBy1kSdLd+6RlG7QjT2bLbg60uHEyAU2qLxzcoLGb1GbzDi21DX3NN6iOGOBN4pbkRwgrS9L2E3cqBbaCgLSen4OpfHqCUdizh6Qs8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748442858; c=relaxed/simple;
	bh=bD/iZOx/OO0MmzF4E85/i3xPWDZwNRVsc8nz96LYuR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diQsPisY5T4ndQuYQqRKBMZhmfj94te6zwSRlXksSXqxnbfeEU79S35Ccce29EL3MUzHJNmO5yZNHzgNVt69NhLrjmqHebREEBpC0HX8NkzJK1K4wCEFWm6GCJzjZd+1+VwYOr+diq5Ck2txKNiacV4QWWydgKA/MdkD4niQZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iz6o/u7S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iz6o/u7S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BC2C4CEE3;
	Wed, 28 May 2025 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748442858;
	bh=bD/iZOx/OO0MmzF4E85/i3xPWDZwNRVsc8nz96LYuR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iz6o/u7SG54xss53eKO8vPEeMsmQBvFSsZxs0lpx8xsH7bcPcl4x2z6O9PazMOtgo
	 yxIfXXtttpo/zAr4CQbPZDf6U1ucqr+T/B9wseTSog9s2LwnP+crfUqPjmN6Qgjj/j
	 8FQyKpmcrFfS3/M6Hptkbt648JUVg7hGhHbkwa2gLIVi6L5uxfqcPwmwXJTOI5IAQl
	 xTLpYNifM3+x67pPSeYiITjt0NEeLVB1p3MsRoZ10JF4oY900vlov9f6vW2R8/yuqi
	 7DzrqGUshosPYRz7M/9M700ZennoVRAeLLFA9uT0Bbf6Shq4kqjMebK9IGP/AOt+lA
	 wBbg7F5UngOKA==
Date: Wed, 28 May 2025 16:34:09 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 19/26] arm64: Add support for GICv5 GSB barriers
Message-ID: <aDce4TGxUoGGONA3@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-19-b36e9b15a6c3@kernel.org>
 <20250528141730.0000232e@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528141730.0000232e@huawei.com>

On Wed, May 28, 2025 at 02:17:30PM +0100, Jonathan Cameron wrote:
> On Tue, 13 May 2025 19:48:12 +0200
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > The GICv5 architecture introduces two barriers instructions
> > (GSB SYS, GSB ACK) that are used to manage interrupt effects.
> > 
> > Rework macro used to emit the SB barrier instruction and implement
> > the GSB barriers on top of it.
> > 
> > Suggested-by: Marc Zyngier <maz@kernel.org>
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  arch/arm64/include/asm/barrier.h |  3 +++
> >  arch/arm64/include/asm/sysreg.h  | 10 +++++++---
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> > index 1ca947d5c93963d33fe8fb02d6037fc71bd9fd7a..f5801b0ba9e9e7e0433f16ffedf0ec7dfb3e358e 100644
> > --- a/arch/arm64/include/asm/barrier.h
> > +++ b/arch/arm64/include/asm/barrier.h
> > @@ -44,6 +44,9 @@
> >  						 SB_BARRIER_INSN"nop\n",	\
> >  						 ARM64_HAS_SB))
> >  
> > +#define gsb_ack()	asm volatile(GSB_ACK_BARRIER_INSN : : : "memory")
> > +#define gsb_sys()	asm volatile(GSB_SYS_BARRIER_INSN : : : "memory")
> > +
> >  #ifdef CONFIG_ARM64_PSEUDO_NMI
> >  #define pmr_sync()						\
> >  	do {							\
> > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> > index 2639d3633073de10f5040a7efff059021f847530..e7734f90bb723bfbd8be99f16dd6d6fdc7fa57e8 100644
> > --- a/arch/arm64/include/asm/sysreg.h
> > +++ b/arch/arm64/include/asm/sysreg.h
> > @@ -112,10 +112,14 @@
> >  /* Register-based PAN access, for save/restore purposes */
> >  #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
> >  
> > -#define __SYS_BARRIER_INSN(CRm, op2, Rt) \
> > -	__emit_inst(0xd5000000 | sys_insn(0, 3, 3, (CRm), (op2)) | ((Rt) & 0x1f))
> > +#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)		\
> > +	__emit_inst(0xd5000000				|	\
> > +	sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
> > +	((Rt) & 0x1f))
> 
> Perhaps indent as something like the following for readbility?
> #define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
> 	__emit_inst(0xd5000000 |					\
> 		    sys_insn((op0), (op1), (CRn), (CRm), (op2)) |	\
> 		    ((Rt) & 0x1f))
> 

I can do - even though readability is subjective, this looks nicer to
me but if possible I'd avoid the churn required if I change it and then
it is not readable for other people.

Noted.

Thanks,
Lorenzo

> >  
> > -#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
> > +#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
> > +#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
> > +#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
> >  
> >  #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
> >  #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)
> > 
> 
