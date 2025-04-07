Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBD9230997
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017470; cv=none; b=XxgfnMoh0BVa78n6kkztqWdbrV121INGubo9SOWIs3nPNMqGTy4CMeG9NNDZt/DCGDBumEukN4SUHKKFmDIkULJpuuHPZqTYcyAz2oQ7QIp22VBmOYVn4imHJd67CAhlleS615Eo/Rc5JkK0nYO1OzIDDiM9j4JBH1PW1dHuZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017470; c=relaxed/simple;
	bh=vJteRcZ1RHfaUsgI/ybzlRhVTD2l0d3PALqfe9LWi8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pjt1FwzVe3IuGMmY3lR+dXKRjtHaOcNCmC18jSWvnTKgN6Az5sqdhGdZJGTIozg0XdHwIj7yqa+MCw2Lp6GyDr6otfeFGkcXqgfztZOl+O9Ac/WntZ+mife9eoFieefCDi+eNLJoDmWMcAuuORLzO8nPN6e1V5mkiBmlJT/fgsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95DC7106F;
	Mon,  7 Apr 2025 02:17:49 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D141B3F59E;
	Mon,  7 Apr 2025 02:17:45 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:17:43 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Donghyeok Choe <d7271.choe@samsung.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com,
	joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in GICv3
 ITS driver
Message-ID: <20250407-amiable-perfect-hummingbird-06ad83@sudeepholla>
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
 <Z+Nv8U/4P3taDpUq@perf>
 <8634f0mall.wl-maz@kernel.org>
 <Z+TEa8CVAYnbD/Tu@perf>
 <20250402-messy-wild-squid-7b4da9@sudeepholla>
 <Z+3kwsesiXyC0hbO@perf>
 <20250403-rare-wasp-of-management-9bce59@sudeepholla>
 <20250404041323.GA685160@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404041323.GA685160@tiffany>

On Fri, Apr 04, 2025 at 01:13:23PM +0900, Donghyeok Choe wrote:
> On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> > /me more confused.
> > 
> > Are you saying you have some cpuidle platform specific logic inside
> > trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> > trace the entry into the state and nothing more.
> 
> If you have any further questions, feel free to reach out.
> 

I was trying to understand the difference in behaviour between normal
cpuidle entering the same deepest state that is entered in s2idle state.
I assume GIC doesn't loose power and no need for GIC ITS save/restore
in normal cpuidle path ?

If so, what triggers the GIC suspend in s2idle path if syscore_ops is
not getting called ?

Why would the firmware pull the plug on GIC ?

Do you use any suspend/resume logic in drivers/irqchip/irq-gic-pm.c ?
I am still missing something in this flow.

-- 
Regards,
Sudeep
