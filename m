Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38272E267C;
	Tue, 17 Jun 2025 13:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168764; cv=none; b=Zb93sXaNECE41nl7kgC4mE0O1cSptBQ4d8yXrgGy+pN0/rzFnpDwB8wirb0C4rjwW1TaJHzUv+nZ55nFh5q+tzjnSXI1m20HXexnLdj4t/F5RNw0iIkBPJbYfyozHnJ0RHmiL1IBLC7ytjGTTAJ3FsmY0Mq/1rWj1Qfsv0On8/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168764; c=relaxed/simple;
	bh=NEusVXqYW5G8W3iE/wiN3BLXDugWVDZdGwPEho1eri0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qikAvVZ8II+f58h1rlqdroDlKY4CVRzO7R3at44cqtiTulgj0D549TAksWvsl32vymPZF5U88ivb94Yk9Bp8+AliLhhX3+YsTBy3mGDIhqYNV2b7PS509qJaVbK5QSq+8C6Bfh4bs6UhmnbDjumXSe2PSfBrQd6LMyNUVsSKkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B5F8150C;
	Tue, 17 Jun 2025 06:59:01 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689DD3F58B;
	Tue, 17 Jun 2025 06:59:21 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:59:19 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: peng.fan@oss.nxp.com
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peng.fan@nxp.com, sudeep.holla@arm.com
Subject: Re: [PATCH] [NOT_FOR_MERGE] firmware: arm_scmi: Optimize notifiers
 registration
Message-ID: <aFF0t4-tkD6k72YQ@pluto>
References: <20250613095059.GA10033@nxa18884-linux>
 <20250617135038.2439818-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617135038.2439818-1-cristian.marussi@arm.com>

On Tue, Jun 17, 2025 at 02:50:38PM +0100, Cristian Marussi wrote:
> Some platforms could be configured not to support notification events from
> specific sources and such a case is already handled properly by avoiding
> even to attempt to send a notification enable request since it would be
> doomed to fail anyway.
> 

... btw....not sure even if all of this is worth just to cut down on
needless computation...maybe just reviewing the noise level of the
emitted error message could be enough.

Thanks,
Cristian
