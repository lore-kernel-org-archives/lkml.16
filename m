Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB52623645F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595021; cv=none; b=rhRkdUphHAea1PeTOlEHiGoAM7MizLzsth1Ct1Q1F+S+kis8riCZA6HaUFETQqfnJ0XoJx6blruILfaonMPlj+g8krcDKlZdGNsFAbcJWmFnfMqPDClW2KHpoXTIGQDMNViSyZ/8rqXw47qzmn4PmNKnFHPnEHLbT4S3BmoMPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595021; c=relaxed/simple;
	bh=s5M/aPRa2EyxNaaaxFAuIuLRcVirIcM0xTVXbuzh1MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoiyDAyNInXYLsZWTa0UhSwRW1zNs72oZAr4YUptl6Zq+0muRszf0YxmP99jAYgfh0HW09RaKah5pTKY8FVoWLIKXToeV6Byb9XPFXKPhKX+Hq3NV/ZlpkApfFun9zYSmkQdiR/PtTH0m5ELif8Eig4CohkyIM4pehPx4pmETTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AB1B106F;
	Wed,  2 Apr 2025 04:57:02 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70E043F63F;
	Wed,  2 Apr 2025 04:56:56 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:56:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	d7271.choe@samsung.com, joonki.min@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250402-messy-wild-squid-7b4da9@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+TEa8CVAYnbD/Tu@perf>

(Failed to find the original email, so reply on this instead)

On Thu, Mar 27, 2025 at 12:22:19PM +0900, Youngmin Nam wrote:
> 
> The problem is that syscore_ops is not invoked during the S2IDLE scenario,
> so we cannot rely on it in that context.
> We would like to use these suspend/resume functions during S2IDLE as well.

I have one orthogonal question. The s2idle will just use the deepest
cpuidle state registered. So if s2idle needs this save/restore of GICv3
ITS, how does that work when all the CPUs enter that idle state.

With respect to the PSCI CPU_SUSPEND call, it doesn't change. So I am
bit confused as how it can work fine in normal cpuidle paths but no in
s2idle path. What am I missing ? I do psci_enter_domain_idle_state handles
s2idle little different but nothing to change this GICv3 ITS save/restore
requirement between cpuidle and s2idle.

-- 
Regards,
Sudeep
