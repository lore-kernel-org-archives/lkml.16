Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84F818641;
	Wed, 30 Apr 2025 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014268; cv=none; b=ZNfm8stzSuRFm57qfIWdE5iiUtJ1Vu2OdDqgGXSGcDNeSLgzZbqVnZvd9P3YCmEZk1NibDclr5i51eMK+6QVObj4b7r6XYwO41S0spXMebnEjvkNtEy0XzLJIeNeUm2lqCjaeDzCYPP9uNcjtFanFVxVRSKv6cVVzY1viaLPPuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014268; c=relaxed/simple;
	bh=pfYkqFg67CNDW2rFwmTFpnxrVjLmHA8CreXH8se/z/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cueO1N8WvF3WE2wzjKwCnMRHrsiaeAJfN7hwCZFZ2VFfSHJ5sTplLsiFw/tgdDNjjds36YEClrlMPFGb5hhHJk0am6wMMJ/P8YkFIh1kQ2/Ehc08kYrbytxtzFA1BA1szeVHMP+RX8aD3CTYyp7Xcpr1YLwZyO5OXr+OakDX3rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6281106F;
	Wed, 30 Apr 2025 04:57:37 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E63E53F673;
	Wed, 30 Apr 2025 04:57:42 -0700 (PDT)
Message-ID: <8c1af968-0e96-42d5-a5a6-c5581eda9f3d@arm.com>
Date: Wed, 30 Apr 2025 12:57:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401180708.385396-1-leo.yan@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 19:07, Leo Yan wrote:
> This series is to enable AUX pause and resume on Arm CoreSight.
> 
> The first patch extracts the trace unit controlling operations to two
> functions.  These two functions will be used by AUX pause and resume.
> 
> Patches 02 and 03 change the ETMv4 driver to prepare callback functions
> for AUX pause and resume.
> 
> Patch 04 changes the ETM perf layer to support AUX pause and resume in a
> perf session.  The patch 05 re-enables sinks after buffer update, based
> on it, the patch 06 updates buffer on AUX pause occasion, which can
> mitigate the trace data lose issue.
> 
> Patch 07 documents the AUX pause usages with Arm CoreSight.
> 
> This patch set has been verified on the Hikey960 board.
> 
> It is suggested to disable CPUIdle (add `nohlt` option in Linux command
> line) when verifying this series.  ETM and funnel drivers are found
> issues during CPU suspend and resume which will be addressed separately.
> 

The series looks good to me, except for the comment on the Patch 1.

I would like to get an Ack from James as he has looked at in the past.

Suzuki


> Changes from v3:
> - Re-enabled sink in buffer update callbacks (Suzuki).
> 
> Changes from v2:
> - Rebased on CoreSight next branch.
> - Dropped the uAPI 'update_buf_on_pause' and updated document
>    respectively (Suzuki).
> - Renamed ETM callbacks to .pause_perf() and .resume_perf() (Suzuki).
> - Minor improvement for error handling in the AUX resume flow.
> 
> Changes from v1:
> - Added validation function pointers in pause and resume APIs (Mike).
> 
> 
> Leo Yan (7):
>    coresight: etm4x: Extract the trace unit controlling
>    coresight: Introduce pause and resume APIs for source
>    coresight: etm4x: Hook pause and resume callbacks
>    coresight: perf: Support AUX trace pause and resume
>    coresight: tmc: Re-enable sink after buffer update
>    coresight: perf: Update buffer on AUX pause
>    Documentation: coresight: Document AUX pause and resume
> 
>   Documentation/trace/coresight/coresight-perf.rst   |  31 +++++++++
>   drivers/hwtracing/coresight/coresight-core.c       |  22 +++++++
>   drivers/hwtracing/coresight/coresight-etm-perf.c   |  84 +++++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 143 +++++++++++++++++++++++++++++------------
>   drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-etf.c    |   9 +++
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  10 +++
>   include/linux/coresight.h                          |   4 ++
>   9 files changed, 265 insertions(+), 42 deletions(-)
> 

