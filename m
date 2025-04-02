Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0994323718F;
	Wed,  2 Apr 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591599; cv=none; b=TOz2ltgEKN8ShTnUlY8azG/f1QbBdL/N+l+mh+Sz6urGlEhTejlqXZHCiVCwnEYb4HvfhdrNZgUufZ2jBhmhHz9B2PD0LT+U4g9viM60+HMyPYcvcKg55usWNaUu84pOJL6pm0vbSxtPxgTCG3p+9K7KuuZgJfiovVr17tTd9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591599; c=relaxed/simple;
	bh=XYtMnJhwN5XHs2G0fBAQxeCSmWaBCaKqfdUaHfzbp44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEqA2QxQMK/A3CY+FLbpOZrQvBvmTVapWFIz2haYvbJzI0r4sb4bOHAQC/KWiyagRaKw9PlQ7OSS2h0G731sXYtp27VUKSj/4GpERIugCuWRx9fibWjytoXgsnBHpYOOT77dHsv+v1qx2YlqdzMOMq9XsiLqUgQ6SKQ3VsRcdGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F943106F;
	Wed,  2 Apr 2025 03:59:54 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2C6C3F694;
	Wed,  2 Apr 2025 03:59:49 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:59:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402104254.149998-1-dev.mbstr@gmail.com>

On Wed, Apr 02, 2025 at 01:42:54PM +0300, Matthew Bystrin wrote:
> Add timeout argument to do_xfer_with_response() with subsequent changes
> in corresponding drivers. To maintain backward compatibility use
> previous hardcoded timeout value.
> 
> According to SCMI specification [1] there is no defined timeout for
> delayed messages in the interface. While hardcoded 2 seconds timeout
> might be good enough for existing protocol drivers, moving it to the
> function argument may be useful for vendor-specific protocols with
> different timing needs.
> 

Please post this patch along with the vendor specific protocols mentioned
above and with the reasoning as why 2s is not sufficient.

Also instead of churning up existing users/usage, we can explore to had
one with this timeout as alternative if you present and convince the
validity of your use-case and the associated timing requirement.

-- 
Regards,
Sudeep
