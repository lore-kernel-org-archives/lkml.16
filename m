Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DE019E98B;
	Mon,  2 Jun 2025 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748866366; cv=none; b=YiHsfvQBTUbB+OKKHqq2lMqeV5Vsr+PjJ0WHB+TKFf/L1vLWm1ZD6LmJ+cVQdvnVP+Hf5p3Sc0vpYZjQYZSHurjLUkb+B+mlJwkAOt6foacp92gOHU9YDhZY1AevlhDzDw1x4dv6JQgefScH1L/6P6vtSm/ak1OVp25AzU9gWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748866366; c=relaxed/simple;
	bh=a3IUPscg9/bFaevNAy73AAOq9/dPj1GJfTvG4TKmNjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWZc9cXJx2xY9pds6eySxlpTPSsIG4Crw0U6AIDTOE2HczKmbecOFd8pkNvmOC4xCL+rNITNS+g/KKAN9EoyWuRTUHzfmp0VL5rEYmpa/905t6mhhZrL5Yil5R0g00KsB3lQkmu7VNd2cc8UKKua4i4BEmiyBMFw1VJ9YMcLOKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 326AA12FC;
	Mon,  2 Jun 2025 05:12:27 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AA313F59E;
	Mon,  2 Jun 2025 05:12:42 -0700 (PDT)
Date: Mon, 2 Jun 2025 13:12:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Will Deacon <will@kernel.org>, Qu Wenruo <wqu@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	rafael.j.wysocki@intel.com, jonathanh@nvidia.com,
	ulf.hansson@linaro.org
Subject: Re: Kernel crash on boot, arm64 VM
Message-ID: <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
References: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
 <20250602103521.GA1134@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602103521.GA1134@willie-the-truck>

On Mon, Jun 02, 2025 at 11:35:22AM +0100, Will Deacon wrote:
> [+Sudeep]
> 

Thanks for adding me.

> On Mon, Jun 02, 2025 at 10:00:38AM +0930, Qu Wenruo wrote:
> > It looks like there is a regression related to the device tree/acpi parsing
> > in the latest upstream kernel branch.
> 
> I've kept the crash log below, but I suspect this is due to the __free()
> cleanup path in dt_idle_state_present(), introduced recently by
> 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT
> idle states are present").
>

Hi Qu,

Do you also have this commit ?

39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")

Just trying to see if it is same issue or if this something else even
with the above commit included.

-- 
Regards,
Sudeep
