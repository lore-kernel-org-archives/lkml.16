Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EDE15B971;
	Thu, 26 Jun 2025 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936521; cv=none; b=M0NYp6qsmhGNngolXMpqP72D1Zgfr6ym0P2wzz4YW64GS6ExiPbWyUKNU9usXf61l+darRZENAQKOeSZZ1Lca3HnW+gy1b8iFZq2FEKpWBVRGOCqW5CI/4P4B3iD33xC6H9WfrTf5GCnihEVulwLkA98f8SmdV8wvTxZ1NoEsjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936521; c=relaxed/simple;
	bh=QvZnqyVFpuNoWA+Hux8IUB+bxe+jFzUq4c1Y3poSc5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObRJXu/YtwJeIxjwX4TSzXWij53HqbzliUqhEdFYWHhmJ9ChCVz0h/ZrZaJ+DcClg/YOD5ilbEPjD+nqvFhm2QyT8j26hP84i83wDULmnE5XisqWz+0q78Z8QEd8iIaZSYbTStGnG0r83KBzolHwmKKcj0LbZD8DVMCQlaU9De4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AF781758;
	Thu, 26 Jun 2025 04:15:01 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9713F63F;
	Thu, 26 Jun 2025 04:15:17 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:15:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <philip.radford@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, luke.parkin@arm.com
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add xfer_inflight counter
Message-ID: <aF0rw1D6QXGrCdmU@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250619122004.3705976-3-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619122004.3705976-3-philip.radford@arm.com>

On Thu, Jun 19, 2025 at 12:20:02PM +0000, Philip Radford wrote:
> Added an xfer_inflight counter to the debug_counters struct
> to record the current number of inflight xfers
> 
Hi,

nitpick around the commite message.

Add a counter to the debug_counters struct to record the current number
of outstanding inflight xfers.

...note also the full-stop :P

With this:

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
