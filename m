Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B8427510B;
	Thu, 26 Jun 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936665; cv=none; b=EDMDjbslenayRXL7TPODMoW2RHPe/bDGJ1gzvGQlHSnt645kotBBBbBxwinJ685Ek7AxhNTchZ8UY4j6Nnx4eUZc8r64stFpOa/GtHmgs9UMgGWd8BoeA8Qt0DKdnJJ2TTS63e6pisEIVWUlKKLlDi3I2utzjEx7Oy2jWFSZ5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936665; c=relaxed/simple;
	bh=DbC8niO+mT+qeJNXyWeuSXxCYn6eYtnUq0uYSkhbVaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB3AEiiUsWBSAb7rCNAYAzn+AmmR4pQR33UbpNEKfrP3BpaMgwqfoZGlby2ITsEkSUfQNLsw77vW6oNFJVnRpsB8sJ2vsKUNg7wu/T6yP02MPO9EGUkcGNRzm1Pj0XCidt+xQA7lcdls7g+xUnABD87OE/xsMAP6qTp7WgrkG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC9741758;
	Thu, 26 Jun 2025 04:17:25 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C0CF3F63F;
	Thu, 26 Jun 2025 04:17:42 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:17:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
 functionality
Message-ID: <aF0sS8V4om3_5YOr@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-5-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-5-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:04PM +0000, Philip Radford wrote:
> Adds scmi_inflight_count function to fetch the current xfer
> inflight count to use in trace
> 

Hi,

I agree with Dan's comments on patches 3 and 4...once those comments are
addressed, for me:

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
