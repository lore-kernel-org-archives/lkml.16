Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA9B1EDA0E;
	Wed, 30 Apr 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999653; cv=none; b=fZoQUa/eJEnjtp6xr2ru2AZu/f6PZtEKAnYqd2pqMEN9KtVQtGcvAbCWm2mW2sy2OnGSImm/Ttl9YXPESwjYXCRDu3jgYHDqWz7y4Ombd5pSFujXG7ruYc0STo2ToeT4PrJxJQiUGhQd9R+7XfrdDsajK0PNgXExukWtbMJedA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999653; c=relaxed/simple;
	bh=IyKN6ohZgS4Uv1c2hkLZ3IVzBxrVSh/ZWlq6dOqpqI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5RJOyK8tMbiwirGIN0QzqQNoemuBuxiemgeVdkpjM6YbF64VgcnedTymWqG+RjbYt8BCxzP+cQZrMUzkisQRB3TrRLyviK3eE1e+vYfU1SDhBpLfdutcY0Pyw95S7yNk/xbyxwj1qYBTXdSwXrc7CVPklRpXikIHf5NAhBMBMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593631063;
	Wed, 30 Apr 2025 00:54:03 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 865F23F66E;
	Wed, 30 Apr 2025 00:54:08 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:54:06 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org, johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/3] firmware: arm_scmi: Add Quirks framework
Message-ID: <aBHXHnXA95TwJths@pluto>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
 <20250429141108.406045-3-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429141108.406045-3-cristian.marussi@arm.com>

On Tue, Apr 29, 2025 at 03:11:07PM +0100, Cristian Marussi wrote:
> Add a common framework to describe SCMI quirks and associate them with a
> specific platform or a specific set of SCMI firmware versions.
> 
> All the matching SCMI quirks will be enabled when the SCMI core stack
> probes and after all the needed SCMI firmware versioning information was
> retrieved using Base protocol.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi

just a quick remarks that a bot spotted the usage of __VA_OPT__ which is
only available since GCC >= 8.0 :< ... so I will probably revert to use the
previous, less clean, mechanism to build the NULL terminated array in
which the compats array WILL HAVE to be explicitly NULL terminated when
provided (even the empty ones...)

Thanks,
Cristian
