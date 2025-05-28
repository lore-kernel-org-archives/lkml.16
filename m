Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE391AC891;
	Wed, 28 May 2025 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438258; cv=none; b=NLk6BLu6V51y8YY3kRIUj/eeEEYJHaS5I3/fIdgM8fyG017C4gTqf3m/u7QTG5R2BJmI8ug2kaZ+UOHwc8Je0MgXBiIADMNBUdWODPy+SZmcMHwwHrDg7ro9oLCeGJuAZQOgcljX5a1kHOYFIS5Sm6Yu37+8Hd+P+6OPgeM0oi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438258; c=relaxed/simple;
	bh=GZfblSZ2sTL48y/a1XWqWbkhf8ZyUELSfA0kRxh1n+w=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNb6yqFdA8ailBL4xT18fup61h7p69CzLR5pRH5AGBJS457MSFNZSMFLDv58X2tDTz7LI2KGGUs75K6PmbUFpRk4N8xazxuCisgL3MT6mVBs+VEHf5rXzTBasm/UQKPSpV8xburmUB/YE4rFZGBR5xwQnrkOisjgpeJYwzcYsJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6qmV1qghz6M4Mc;
	Wed, 28 May 2025 21:17:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DCE7114034D;
	Wed, 28 May 2025 21:17:32 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 May
 2025 15:17:31 +0200
Date: Wed, 28 May 2025 14:17:30 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland
	<mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 19/26] arm64: Add support for GICv5 GSB barriers
Message-ID: <20250528141730.0000232e@huawei.com>
In-Reply-To: <20250513-gicv5-host-v4-19-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-19-b36e9b15a6c3@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 13 May 2025 19:48:12 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> The GICv5 architecture introduces two barriers instructions
> (GSB SYS, GSB ACK) that are used to manage interrupt effects.
> 
> Rework macro used to emit the SB barrier instruction and implement
> the GSB barriers on top of it.
> 
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/barrier.h |  3 +++
>  arch/arm64/include/asm/sysreg.h  | 10 +++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 1ca947d5c93963d33fe8fb02d6037fc71bd9fd7a..f5801b0ba9e9e7e0433f16ffedf0ec7dfb3e358e 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -44,6 +44,9 @@
>  						 SB_BARRIER_INSN"nop\n",	\
>  						 ARM64_HAS_SB))
>  
> +#define gsb_ack()	asm volatile(GSB_ACK_BARRIER_INSN : : : "memory")
> +#define gsb_sys()	asm volatile(GSB_SYS_BARRIER_INSN : : : "memory")
> +
>  #ifdef CONFIG_ARM64_PSEUDO_NMI
>  #define pmr_sync()						\
>  	do {							\
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 2639d3633073de10f5040a7efff059021f847530..e7734f90bb723bfbd8be99f16dd6d6fdc7fa57e8 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -112,10 +112,14 @@
>  /* Register-based PAN access, for save/restore purposes */
>  #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
>  
> -#define __SYS_BARRIER_INSN(CRm, op2, Rt) \
> -	__emit_inst(0xd5000000 | sys_insn(0, 3, 3, (CRm), (op2)) | ((Rt) & 0x1f))
> +#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)		\
> +	__emit_inst(0xd5000000				|	\
> +	sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
> +	((Rt) & 0x1f))

Perhaps indent as something like the following for readbility?
#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
	__emit_inst(0xd5000000 |					\
		    sys_insn((op0), (op1), (CRn), (CRm), (op2)) |	\
		    ((Rt) & 0x1f))


>  
> -#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 7, 31)
> +#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
> +#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
> +#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
>  
>  #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
>  #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)
> 

