Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEF91F0E55
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341286; cv=none; b=NxOxFZrzJbB+tDdmdwDl3jndBb0YlZ5HkPjPWsnZgy6XabbNo47t9iXungQcIJ0QUI7Lwc1nxmHZflijyCHbzJs0y5bvENB/TYiJb4A5ajJGSDibxHrR01lefsF/QyKwh1RjLynrOTc7/0Q0dqE7i57EeflGcb1IA858C2rZV1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341286; c=relaxed/simple;
	bh=RdpyCD/KySnNnFzl4ZxjWe5tiOKurirLJA0SIKhe3po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYa5oZBQecrOLGP6gAtuZdHrhQrQnpVXXTj0asyhFqt24hUD7tUtFWLxVj9H7CJWziZlljn+S1FSwPDLD6V5uOKA3w0OgxY1DNVDGn1h27uZMtJ1SKYudvzN8g/Z7YbIGILDzDA3at0qXwgxuMCg+Qg73xUNlILv8djYlEoonck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98281497;
	Fri, 31 Jan 2025 08:35:09 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6FC53F694;
	Fri, 31 Jan 2025 08:34:42 -0800 (PST)
Date: Fri, 31 Jan 2025 16:34:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ionela.voinescu@arm.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <sumitg@nvidia.com>,
	<ptsm@linux.microsoft.com>
Subject: Re: [PATCH] arm64: amu: Delay allocating cpumask for AMU FIE support
Message-ID: <Z5z7nws-_7VEe_d-@bogus>
References: <20250131155842.3839098-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131155842.3839098-1-beata.michalska@arm.com>

On Fri, Jan 31, 2025 at 03:58:42PM +0000, Beata Michalska wrote:
> For the time being, the amu_fie_cpus cpumask is being exclusively used
> by the AMU-related internals of FIE support and is guaranteed to be
> valid on every access currently made. Still the mask is not being
> invalidated on one of the error handling code paths, which leaves
> a soft spot with theoretical risk of UAF for CPUMASK_OFFSTACK cases.
> To make things sound, delay allocating said cpumask
> (for CPUMASK_OFFSTACK) avoiding otherwise nasty sanitising case failing
> to register the cpufreq policy notifications.
>

I thought I had provided my tag, sorry for that. FWIW,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
