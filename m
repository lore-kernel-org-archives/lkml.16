Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E723204592;
	Tue,  1 Apr 2025 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518205; cv=none; b=J+aH9JsIB6S6RzxsDVa83PGYdtM3FxTcuSyZFVaX4360XP1xOq0+iIPVirq1YtWrJ3PISfBsaSAFgoQfEKKn3FxS0m4w9m6J7R29rMu0i2UbRyQxEZ326P36j4Ji8kfnB5/cjSM4pstMex8KjqLXCwNK5d5KIk3C/1u9P1k5NTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518205; c=relaxed/simple;
	bh=DPY5lAsvFTnhyrf1fKbNnO8Xot9pFQ1ACSX6jX1u5H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ6QnjtBwXoQJAkGuxnoy8op2h/WLq5n/YLQJ2zjllwx4JvZkctoH8RXupcCB/l+Kmoh+NJvYog9b3XDdhzYBpYP4rpt4MiuGAx/BPoKdbTmjqO7ierQBFvts+LZ7Zn9Mj0qcGaTpBUfSwFuNibRs3KqfQvkA1DSoaOBTO3Rz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA6E12FC;
	Tue,  1 Apr 2025 07:36:46 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAFE83F63F;
	Tue,  1 Apr 2025 07:36:40 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:36:31 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
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
Message-ID: <Z-v579n5wuAqTuUW@pluto>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
 <20250401-magnetic-spaniel-of-influence-f3ee90@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-magnetic-spaniel-of-influence-f3ee90@sudeepholla>

On Tue, Apr 01, 2025 at 03:21:51PM +0100, Sudeep Holla wrote:
> On Mon, Mar 03, 2025 at 10:53:24AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > Add Logical Machine Management(LMM) protocol which is intended for boot,
> > shutdown, and reset of other logical machines (LM). It is usually used to
> > allow one LM to manager another used as an offload or accelerator engine.
> >
> 
> This and next patch LGTM. Just curious as why Cristian has given tags only
> for the drivers using these but not these changes.
> 
> Cristian, any specific concerns you had that had to be addressed or addressed
> in this version ?

I think I had some review comments on the previous version of this
series for Documentation and protocol....let me see wth I said about
this :D and if they have been addressed...

Thanks,
Cristian
