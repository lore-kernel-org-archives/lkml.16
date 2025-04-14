Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F8219755B;
	Mon, 14 Apr 2025 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744629463; cv=none; b=cELYGmbpa622KOUn/lUC6IL/ZJcOnV7hfT23z/PxYSknklwROUc3oFKM+p7aj4orD70vJBNOAumqk5Mf45MpYIaFSY2MzR+EapjO24lD4azJsSLNQz4gCuFKBAf+lK2oEUBpYs2hJvWnPIC4NJlc7hH3CRo8Y8khRAd1HC3OcLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744629463; c=relaxed/simple;
	bh=n+hwV9+d77KoICPvUIsZbu9cRcd26P5Ng0WQswrgyyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0PpvLAYVtd/D19rC8PTegwO+j+kPY4soRgCFnONv7nmo/fiuSkNQ0QIkHx6X1ZjVyB7Z5445iQAB76E4UFqysysSrZ29Q7sRZDFzXdtiQiog/5fE7BTIev7SnpPBWt+WPeffsm34lJu9Htr3LqWrqs6mLzuw1HE6da3f8ITboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFB4E1007;
	Mon, 14 Apr 2025 04:17:38 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C4413F66E;
	Mon, 14 Apr 2025 04:17:37 -0700 (PDT)
Date: Mon, 14 Apr 2025 12:17:34 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Dan Carpenter" <dan.carpenter@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Message-ID: <20250414-ebony-slug-of-felicity-421b0f@sudeepholla>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
 <PAXPR04MB84593BB91063D13BB05BEB5988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB84598733FA39A7402E91DA1988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84598733FA39A7402E91DA1988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Mon, Apr 14, 2025 at 11:00:20AM +0000, Peng Fan wrote:
> 
> Oops, I just checked wrong Kconfig under drivers/firmware/arm_scmi/
> vendors/imx
> 
> Build this for ARM32 i.MX is ok, I just think no need. So add
> a ARM64 dependency.
> 

OK, I will drop the ARM64 dependency when applying. I also don't understand
the dependency on i.MX firmware LMM and CPU drivers in the scmi vendor
protocol as the dependency should be other way around. But I see Arnd had
fixed it so I will keep it as you have posted to keep them all aligned.

-- 
Regards,
Sudeep
