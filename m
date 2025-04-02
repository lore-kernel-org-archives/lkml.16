Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D2CEAD7;
	Wed,  2 Apr 2025 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607838; cv=none; b=i8SEtNtE1XXidfzL47FwDSslr780JiDMeQy/XFqaqQCIqe0D5Jj+HGRmUgZrMy/ToONk/KG0EAFdcRWA0KhUzZT3sykpan8X5+CAYBRWdho6wMCSRQIipo2TLpdM4RoY0xC875YIYEx1ANNABiLo5BXUBA5jBFXC5kjWohpjneU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607838; c=relaxed/simple;
	bh=50ulFjUqXwgfIP0/hz3Pe+E09PZpugkbNUnxMO3Zl9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kX9a3rN0qCDnVNM3wzZduTDoUtTjT9yaQi6of+1ZSNQ4WOmpUGaGemP1qhdJDTXvvvSQZ47Od3Kr7kzzueTxBY+DjLai4WaNjzZDy6cGba2QqEzhfGTju9CFNH7M9GDFSSJKOXXIJN2VlcwhcO1ycYuDgwOuyKMBE37MW7kan2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27D3A106F;
	Wed,  2 Apr 2025 08:30:38 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E9943F694;
	Wed,  2 Apr 2025 08:30:32 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:30:29 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
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
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250402-pastoral-screeching-panda-da4a45@sudeepholla>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
 <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
 <20250402123503.GA23033@nxa18884-linux>
 <20250402-acoustic-analytic-guan-d3cda5@sudeepholla>
 <20250402161037.GC23033@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402161037.GC23033@nxa18884-linux>

On Thu, Apr 03, 2025 at 12:10:37AM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> On Wed, Apr 02, 2025 at 12:46:14PM +0100, Sudeep Holla wrote:
> >On Wed, Apr 02, 2025 at 08:35:03PM +0800, Peng Fan wrote:
> >> Hi Sudeep,
> >> 
> >> Thanks for reviewing the patch.
> >> 
> >> For comments that I am not very clear, I marked with [TODO] for easily
> >> jump to.
> >> 
> >> On Tue, Apr 01, 2025 at 03:15:46PM +0100, Sudeep Holla wrote:
> >> >On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
> >> >> From: Peng Fan <peng.fan@nxp.com>
> >> >> 
> >> >> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
> >> >> 
> >> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> >> ---
> >> >>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
> >> >>  1 file changed, 801 insertions(+)
> >> >> 
> >> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> >> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
> >> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >
> >> >> +
> >> >> +PROTOCOL_MESSAGE_ATTRIBUTES
> >> >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> >> +
> >> >> +message_id: 0x2
> >> >> +protocol_id: 0x80
> >> >> +This command is mandatory.
> >> >> +
> >> >
> >> >For completeness add parameters here for message_id as in the spec as it is
> >> >referred in the returned value and seems incomplete without it.
> >> 
> >> [TODO]
> >> Sorry, I may not get your point here. You mean below format?
> >> 
> >> +------------------+-----------------------------------------------------------+
> >> |message_id: 0x2
> >> |protocol_id: 0x80
> >> |This command is mandatory.
> >> +------------------+-----------------------------------------------------------+
> >> |Return values                                                                 |
> >> +------------------+-----------------------------------------------------------+
> >> |Name              |Description                                                |
> >> +------------------+-----------------------------------------------------------+
> >> |int32 status      |SUCCESS: in case the message is implemented and available  |
> >> |                  |to use.                                                    |
> >> |                  |NOT_FOUND: if the message identified by message_id is      |
> >> |                  |invalid or not implemented                                 |
> >> +------------------+-----------------------------------------------------------+
> >> |uint32 attributes |Flags that are associated with a specific function in the  |
> >> |                  |protocol. For all functions in this protocol, this         |
> >> 
> >> message_id is not put in the table, but it is list above just below
> >> the protocol name. I would prefer to keep current layout and align with
> >> the MISC and BBM protocol.
> >>
> >
> >I meant why is the input parameter message_id not described in the table,
> >but is referred in the return values. For completeness, just add it even
> >though it may match the SCMI spec in terms of input parameter.
> 
> I will add below only for PROTOCOL_MESSAGE_ATTRIBUTES which refer message_id
> in the return values. Please raise if you have concern.
> 

Ignore this. I see even existing BBM and MISC follow the same pattern for
standard protocol commands(0x0-0x2). We can fix them all at once if it
needs to be in the future. For now, it should be fine as is.

-- 
Regards,
Sudeep
