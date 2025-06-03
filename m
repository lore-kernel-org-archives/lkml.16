Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D84C22A1D5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955621; cv=none; b=ojlN5oN67ikMipzlPI4LWk09ioDJnddh7d9d+GBEvFdYDCmy4KOLA3n9/+entW47ZdFaOp28b4wpkdW0zqbCj6NuI1XM5Asc/QOWae8y0hksHm4NT3DSzHXAw0bNnunGDxngZZhZCxIqi8EKTxFQj0ntZzjsH7yHWqOTC0PjvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955621; c=relaxed/simple;
	bh=+r26A8QzZrY+Q2YDej0baKI+zIox4YxtZqAeozpOkS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL7CPtH2hH4Ip+iSKGr++VPAui7PTaaEVqCnrhZOqVNjiRpeZljHSg+pT4SDEROD2QjgE+DIfbhXMljE+AeUdU8F1kA8+kf5aDSYRsgMBwEdfxfp8ztcTWbEDhGZyC8471qzcgZMZRSKLKmvBJcpP+57/z1FCj28ZpTBNzFnJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCCA612FC;
	Tue,  3 Jun 2025 05:59:59 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B0DE3F59E;
	Tue,  3 Jun 2025 06:00:15 -0700 (PDT)
Date: Tue, 3 Jun 2025 14:00:12 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Message-ID: <20250603-jovial-whimsical-vole-029c39@sudeepholla>
References: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>

On Tue, Jun 03, 2025 at 04:38:53PM +0530, Viresh Kumar wrote:
> As per the spec, one 32 bit reserved entry is missing here, add it.
> 

Nice catch! Not sure how it was missed.

If there is no objection, we must add

Fixes: 910cc1acc9b4 ("firmware: arm_ffa: Add support for passing UUID in FFA_MSG_SEND2")

I will fix up when applying.

-- 
Regards,
Sudeep
