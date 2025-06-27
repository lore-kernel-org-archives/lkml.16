Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A652E2E264B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033871; cv=none; b=RDd4Z+vOT8iRIaB/Da/qW3ZdPjdy8gfRspu1uwW0j93G2xi69eVXsEpEKaXyOgnsOk9S4Iw0gwouYFBKnm55jQKU+3Y6kWxS7l2UxXTYVF0EKRXyG6LSm9lti5PGhUyFF5Yu5iv3RZdV2hgxZdfQ48aBLOsL08EZz9tTSn0uAEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033871; c=relaxed/simple;
	bh=SIDSxPACo3swYolhYSJkG/ZrpWuC2ELMGnQmef6BVPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAig2irvM5q0v1bjn1BJjVHUICPIhtC6YU9y0Jm9AIuNNscObWpK9QqMmAt3ShLmVeg7b0GKAKUdF/goh6Y3kqMt0C6qGwLC78/dlivqVtd6yFYDZOVA5fXXDdZc68JLu/KSQxVC/tAr2j03ySmB3Aub6iMudB0edKdgsWzP6gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5571C1A00;
	Fri, 27 Jun 2025 07:17:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 252213F58B;
	Fri, 27 Jun 2025 07:17:48 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:17:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
Message-ID: <20250627141745.GS794930@e132581.arm.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>

On Fri, Jun 27, 2025 at 12:23:29PM +0100, James Clark wrote:
> 
> 
> On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
> > The current implementation uses a fixed timeout via
> > coresight_timeout(), which may be insufficient when multiple
> > sources are enabled or under heavy load, leading to TMC
> > readiness or flush completion timeout.
> > 
> > This patch introduces a configurable timeout mechanism for
> > flush and tmcready.
> > 
> 
> What kind of values are you using? Is there a reason to not increase the
> global one?

IIUC, this patch is related to patch [1].

It seems to me that both patches aim to address the long latency when
flushing the TMC, but take different approaches. In the earlier patch,
both Mike and I questioned how the timeout occurred in hardware, but
no information provided about the cause.

I would suggest that we first make clear if this is a hardware quirk or
a common issue in Arm CoreSight.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/CAJ9a7Vgre_3mkXB_xeVx5N9BqPTa2Ai4_8E+daDZ-yAUv44A9g@mail.gmail.com/
