Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCE21A42F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 23:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738713186; cv=none; b=RnAPI9if/C3xRHi8m/DZWFuvMtAZ+sXZJ58rlQRNEy0g0Bd+J6q6xQPogX/IlMzBqidhLh2lYIDrP79Xlol87TB4kUke4HLgp9QKG2gjY+MmQN73EeEKxwv/nlKwoj+I+xweInZmLiAwMF237xnOVjinGeM7Va8etKoIYV959Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738713186; c=relaxed/simple;
	bh=HDBETOnnDKYdUbldkmXtgxU6aLAk4EpTG/rCxjNdfTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k09FNf7DNxgzz5NX7TbXO2MnM+eFrnijvqOV5d0k4ebZ9riPUYD2BKs+28r4sdp3FUiS1A24bbLWA84tYgipw8OGwlJXrHUV742mauFMSqwb7VR7DuQPdzDjSgxGwmL+NokZxmpx+wT23a2pF6JleuRzwlE7JxLLGG0L10LaSbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IdJQbGFc; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IdJQbGFc"
Date: Tue, 4 Feb 2025 23:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738713180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aty+ANBki8vd8K5qrbGPn1eFRL7U1+Ke6iGWT0ec40Y=;
	b=IdJQbGFcwdrAQZYo4ldhrPJfK+K3DW647JeHvI+fV3JfOpvYSaEnHJr1OK4wRok06P06C3
	1L9uJTC1ZB+KHMaiRRasHRgL1xTPYFR0u9f59apZgiEnvIMooyFJLV6qKjNXVsC90aL4PL
	73vvrkrHMQ+vqzvwvwWgjiNeollFHwM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 1/2] perf: arm_pmuv3: Remove cyclical dependency with
 kvm_host.h
Message-ID: <Z6KoUBdmjVRuqPnU@linux.dev>
References: <20250204195708.1703531-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204195708.1703531-1-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT

Hi Colton,

On Tue, Feb 04, 2025 at 07:57:07PM +0000, Colton Lewis wrote:
> asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
> which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
> causes confusing compilation problems when trying to use anything in
> the chain.
> 
> Break the cycle by taking asm/kvm_host.h out of asm/arm_pmuv3.h
> because asm/kvm_host.h is huge and we only need a few functions from
> it. Move the required declarations to asm/arm_pmuv3.h.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

Please do not move KVM namespaced functions into non-KVM headers. Having
a separate header for KVM<->PMUv3 driver interfaces is probably the
right thing to do, especially since you're going to be adding more with
partitioned PMU support.

-- 
Thanks,
Oliver
