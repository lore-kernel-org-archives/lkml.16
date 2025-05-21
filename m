Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0053B14EC60
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836171; cv=none; b=iStDejIDFs0YAA29rULiX8np27XNoUmoV2sdu2uPeFtVhGQOaI0zyDxHK47cPWlq6gjdNLrL6OqlJqg496mKPzS7zjiAKbtL8qzxshaFzhmRuMbkF1DM8VHLG8up9Ytx6CgDXfWhBXBGmzotxGXqqFh5otwgumFbClB5Vz0yBVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836171; c=relaxed/simple;
	bh=YLIIV+2IuLeIQhiYkHV9+inQgFqNA+OvViMDglYKshU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhUpRqPSyXQPMCEdebXKJRtlJAtrhQjEhaD/i4uQnAR+k0AUleCQXIOkHTvCERdt8Bfw5gAvCfmPTc7FXcPzAmli1RD7ZkdjrzEzQ/kgxjALxVRYifTD2YkGU/hg66b7C6BONOJwmmAXZbooOzmGqQYFA3DN9dHo6LxWyLgkXTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70BB71515;
	Wed, 21 May 2025 07:02:35 -0700 (PDT)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 348563F5A1;
	Wed, 21 May 2025 07:02:48 -0700 (PDT)
Message-ID: <5cf1790a-3eed-4c0a-8a31-b3802c5d9b35@arm.com>
Date: Wed, 21 May 2025 16:02:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: scheduler performance regression since v6.11
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, vschneid@redhat.com,
 Juri Lelli <juri.lelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250520193831.GB39944@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 21:38, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:
> 
>> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
>>
>> With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
>> 4 times per task switch in my setup) in:
>>
>> __schedule() -> psi_sched_switch() -> psi_task_switch() ->
>> psi_group_change().
>>
>> There seems to be another/other v6.12 related patch(es) later which
>> cause(s) another 4% regression I yet have to discover.
> 
> Urgh, let me add this to the pile to look at. Thanks!

Not sure how expensive 'cpu_clock(cpu)' is on bare-metal.

But I also don't get why PSI needs per group 'now' values when we
iterate over cgroup levels?
