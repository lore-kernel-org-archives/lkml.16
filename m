Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA57C28BA96
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548447; cv=none; b=uxMVBW7w6c0gNd2qmQkQ8NHNwgWCrhQyILeNjeQh+97GRCelYl+u3xrqIxf4M3kBGq7AuKIOM7Nz7fEgmywrIPTCL83KrhytxnKVy9FiWEcCkDul9WRJx/wvLjkEFeFTxZ6juCWDbirXv3nl24WR2awIhPCmmA5jfLYXYUKudBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548447; c=relaxed/simple;
	bh=5pkii6SF7amxY/zbQsyV6fFRFvcNbNy7olqsxmKo5ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+xhfwqJxI+2R+6C2VBPyHUwJa0M1/RkrAyS1IJOZHy504FX+1pdXhK+gblC54Gku15nMVRciZmpgKqTA9q9rvoTAvn8Ofc8FAbmOJeK/UrdAFmklEfldHDxhzKaObgmtiPdny4msy5YGM0OHIDgC9L72t7T27PouKlg0g8FSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901BE1424;
	Tue, 10 Jun 2025 02:40:24 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D0973F59E;
	Tue, 10 Jun 2025 02:40:40 -0700 (PDT)
Message-ID: <85830220-8144-4df2-9e02-d34b48782c34@arm.com>
Date: Tue, 10 Jun 2025 15:10:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
To: James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/25 3:49 PM, James Clark wrote:
> DEN0154 states that hardware will be allowed to ignore writes to TRB*
> registers while the trace buffer is enabled. Add an ISB to ensure that
> it's disabled before clearing the other registers.
> 
> This is purely defensive because it's expected that arm_trbe_disable()
> would be called before teardown which has the required ISB.
> 
> Fixes: a2b579c41fe9 ("coresight: trbe: Remove redundant disable call")
> Signed-off-by: James Clark <james.clark@linaro.org>

Agreed. An isb() barrier is required to ensure that the TRBE is disabled
even after clearing TRBLIMITR_EL1 and before writing/clearing other TRBE
registers. Besides trbe_reset_local() seems to be the only function where
such a scenario exists.

LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8267dd1a2130..10f3fb401edf 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -257,6 +257,7 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
>  static void trbe_reset_local(struct trbe_cpudata *cpudata)
>  {
>  	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> +	isb();
>  	trbe_drain_buffer();
>  	write_sysreg_s(0, SYS_TRBPTR_EL1);
>  	write_sysreg_s(0, SYS_TRBBASER_EL1);
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250609-james-cs-trblimitr-isb-523f20d874d6
> 
> Best regards,

