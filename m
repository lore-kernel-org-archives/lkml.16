Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFC4283FFB;
	Wed, 28 May 2025 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434671; cv=none; b=e3lgBwqDhxbi3RV+150kNMiy2W8CWfYOHYFu3HLiGJvolxTNK9IxUA22a3GJuAYPRadUdZ1gQYwyYAh1tH71WWVMfAVhlHbwNG1fzGPZpMfQmIigFTzIv/nY1RBOqvpAUaV/qxSHARNkxZddd5jXADHfknyuy9MQU4qtTjl4N+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434671; c=relaxed/simple;
	bh=nUJBaB2GORIkiCZ1ogLH581aDFQMv2bEy87KDOJq+fU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5oTzWWvxjx/jojq5LBfu2joDRC6jDSe7MNW7dkSpmDkCIoaviA7YGyBTm/5qQPviHiZJEfuruzClwEeD32Jetsdx78kEfTTR1c5rXulTrNmM4OtE21B5de6C2oMpW1/TyXi74BYIYCSGJKQVuKl0rHz0RiUYMqorhnfCsIj02A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6pMT2P7fz6L5Bg;
	Wed, 28 May 2025 20:14:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B80141402F5;
	Wed, 28 May 2025 20:17:46 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 May
 2025 14:17:46 +0200
Date: Wed, 28 May 2025 13:17:44 +0100
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
Subject: Re: [PATCH v4 18/26] arm64: smp: Support non-SGIs for IPIs
Message-ID: <20250528131744.00001544@huawei.com>
In-Reply-To: <20250513-gicv5-host-v4-18-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-18-b36e9b15a6c3@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 13 May 2025 19:48:11 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> From: Marc Zyngier <maz@kernel.org>
> 
> The arm64 arch has relied so far on GIC architectural software
> generated interrupt (SGIs) to handle IPIs. Those are per-cpu
> software generated interrupts.
> 
> arm64 architecture code that allocates the IPIs virtual IRQs and
> IRQ descriptors was written accordingly.
> 
> On GICv5 systems, IPIs are implemented using LPIs that are not
> per-cpu interrupts - they are just normal routable IRQs.
> 
> Add arch code to set-up IPIs on systems where they are handled
> using normal routable IRQs.
> 
> For those systems, force the IRQ affinity (and make it immutable)
> to the cpu a given IRQ was assigned to.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> [timothy.hayes@arm.com: fixed ipi/irq conversion, irq flags]
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> [lpieralisi: changed affinity set-up, log]
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
Hi Lorenzo,

A few trivial comments inline.

> +
> +static int ipi_to_irq(int ipi, int cpu)

Maybe this naming needs a breadcrumb to indicate this only
applies only to lpi case as it's directly computed in the old ppi code?
A comment might do the job.

> +{
> +	return ipi_irq_base + (cpu * nr_ipi) + ipi;
> +}
> +
> +static int irq_to_ipi(int irq)
> +{
> +	return (irq - ipi_irq_base) % nr_ipi;
> +}


> +static void ipi_setup_lpi(int ipi, int ncpus)
> +{
> +	for (int cpu = 0; cpu < ncpus; cpu++) {
> +		int err, irq;
> +
> +		irq = ipi_to_irq(ipi, cpu);
> +
> +		err = irq_force_affinity(irq, cpumask_of(cpu));
> +
Trivial local consistency thing but maybe no blank line here or...
> +		WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
> +
> +		err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
> +				  &irq_stat);
> +
here to match the style in ipi_setup_ppi()

> +		WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
> +
> +		irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
> +
> +		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
> +	}
> +}

