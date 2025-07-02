Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58C524DCEF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452736; cv=none; b=GWRVAIDFCwTORUk4gVSWoaSlRjyYqOaHGySg7JAOxI6FaQ64SYIG/yuU0q1KrN6VEPFArQVW3BQtqqlQEeACCWEPeTOBzpUDDk3/k0omzS0BEhaUJ/AIv/lIboHrPLKzPmQLcE+BQaURVAzTrEeL7VqYplIha/rgtEuCVozwgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452736; c=relaxed/simple;
	bh=SKGm1xXETNlirDRLzgF2//nyH4iX1mHdPD5vsjkeiKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWERywWKmdrF2Raj/Bhi24LDNPyMbxT1QoryoblYHiMdRUlEpTewKIVIE/RZnNbthz1GS4hfKgZ8/uEGTVzMuUk5669jF8a6RqWOgK6Dq7JZtIS+hm0fVk9RKam5X+bUL9PYUDrlju1Q1NWj0jfE7ka2CjkZ3V6/79b3x1PpYh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3E2C22D9;
	Wed,  2 Jul 2025 03:38:32 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A03E3F58B;
	Wed,  2 Jul 2025 03:38:47 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:38:45 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/28] coresight: Change device mode to atomic type
Message-ID: <20250702103845.GV794930@e132581.arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
 <aGUAjcZ1elCoJ+KU@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGUAjcZ1elCoJ+KU@e129823.arm.com>

Hi Levi,

On Wed, Jul 02, 2025 at 10:49:01AM +0100, Yeoreum Yun wrote:
> Hi Leo,
> 
> >  {
> > -	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
> > -	       CS_MODE_DISABLED;
> > +	int curr = CS_MODE_DISABLED;
> > +
> > +	return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
> >  }
> 
> Just question. why is acquire symentic enough in here?

My understanding is that acquire semantics ensure ordering between
cmpxchg_acquire() and all memory accesses that follow it. However, it
does not guarantee that memory accesses appearing before the acquire
are ordered as well.

This is exactly what we want in the driver. We must ensure to first grab
an active device mode, then it is safe to proceed later operations (e.g.
set configurations in driver data and access registers).

> before this change, local_cmpxchg seems to use full_fenced.

Not really. Arm64 has atomic instruction for cmpxchg, it does not use
full_fenced. It should run into the path of arch_cmpxchg().

Thanks,
Leo
