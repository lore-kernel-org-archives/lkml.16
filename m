Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60752C327E;
	Tue,  3 Jun 2025 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748942761; cv=none; b=hwSv10tf12GZPjhN7sR0XusrwxNPOryF0tpuDkxOD09iJP/1UY3tLvoEEebxfXaSN8wETzVzZUZaucr9tVdaG+92gHaeRYHb9980vdBJsuhIGKoiXtXsm1uIwg0N2SwFxpNojTZypJ4hEaIR51mLJTAc6X5yv8J4+GqVzfIL1aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748942761; c=relaxed/simple;
	bh=qWj39+I9XXyWVm6CoZwrmm4PfT/JNek01AT/iArpaVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLgYwJuh7ntl2egy7DUNnCxnvDbuazgFSFFP9FuV3aruk0Uoj6OHNg5lVQfkbPV7IAyAxzNER+uREhHZWTBktSK5OE5x9K71BRtstGXUAiAUWEoB8sF43shLOXZ9bYH/SVncUEG6TA5bytjxu3pl4ddsu+vEypr+LVXhvIi+ixM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00B6812FC;
	Tue,  3 Jun 2025 02:25:42 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E2D23F5A1;
	Tue,  3 Jun 2025 02:25:56 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:25:54 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Qu Wenruo <wqu@suse.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
	rafael.j.wysocki@intel.com, jonathanh@nvidia.com,
	ulf.hansson@linaro.org
Subject: Re: Kernel crash on boot, arm64 VM
Message-ID: <20250603-athletic-catfish-of-reading-65ef17@sudeepholla>
References: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
 <20250602103521.GA1134@willie-the-truck>
 <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
 <d7383d29-516d-4643-aaac-dfd930ec896e@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7383d29-516d-4643-aaac-dfd930ec896e@suse.com>

On Tue, Jun 03, 2025 at 08:40:25AM +0930, Qu Wenruo wrote:
> 
> 在 2025/6/2 21:42, Sudeep Holla 写道:
> > On Mon, Jun 02, 2025 at 11:35:22AM +0100, Will Deacon wrote:
> > > [+Sudeep]
> > > 

[...]

> > > I've kept the crash log below, but I suspect this is due to the __free()
> > > cleanup path in dt_idle_state_present(), introduced recently by
> > > 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT
> > > idle states are present").
> 
> Reverting works, thanks a lot!
> 
> > Do you also have this commit ?
> > 
> > 39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")
> 
> Not yet, the branch I'm using is from btrfs' development branch, which is
> slightly older than the upstream.
> (The base commit is a56baa225308 ("Merge tag 'for-6.16-tag' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux"))
> 
> Just tried upstream, which also fixed the problem.
> 

Glad that helped. Thanks for the clarification.

-- 
Regards,
Sudeep
