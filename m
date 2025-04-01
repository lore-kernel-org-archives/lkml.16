Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67408205AAC;
	Tue,  1 Apr 2025 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519657; cv=none; b=J6qd0Wuoj3ShFhyHFt/csPW/hPTXXRzeJhc6Ejp49F5iXiLKhJkEbc2I7smBTg16krZo+vLAztPvWj0rBffjIoPk0uBMsOUVolD8mtyA0S/BucdCEEl7qOvrkgqoIAARgVIWNQL/D72GeC1676VPWNEgVXWg7PHtJRPfPtDYns4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519657; c=relaxed/simple;
	bh=7pJrgWLqk1prP4GmnWx1GLVm0go1qORG82fLRSO8ke8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccBA7KcmXG8VIj3BJmn8dE0Rc0/N32RDaUquRWckRCudG8dOvIUT+cSaa41BekbmNOpuwfdkVjKvbbqp2o6M1m0bxzA6IgjNXQ8UdlLbU5Jzo+5Iisg2mqXcy0InaCAzKl2ZigY5+6FHL2kb/IUf9fCqz4SInGOL9TuQO2LlLMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CCBC14BF;
	Tue,  1 Apr 2025 08:00:58 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24B923F694;
	Tue,  1 Apr 2025 08:00:52 -0700 (PDT)
Date: Tue, 1 Apr 2025 16:00:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <Z-v_oTjETSLoX1FB@pluto>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>

On Mon, Mar 03, 2025 at 10:53:24AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add Logical Machine Management(LMM) protocol which is intended for boot,
> shutdown, and reset of other logical machines (LM). It is usually used to
> allow one LM to manager another used as an offload or accelerator engine.
>

Hi,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
 
Thanks,
Cristian
