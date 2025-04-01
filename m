Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47239204851;
	Tue,  1 Apr 2025 14:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518910; cv=none; b=CQ6VVXMMvLE8dD1/5LmOOV25LvG0KpbHxol6EjzWfOIcyoxgHT5jIdUVopoz596wgNNFwJPyEdJREwN68Gj56WycisQ5Sms9bhrVPUYNFJXJhN3a3Tk9IPho+/XPsEybJEH8B6PhsiWWnmI5eZSXdmYC1MUAy59F9pgaIEamfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518910; c=relaxed/simple;
	bh=KTKT+e6/5PMJLr9Kt/jAdOG27oe2Q8pkPJ5m8d4qnHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rp1Il0Ao5+dzp/pPpuqp+M8bhnGeFpq+Untp9K9H3MvLGal+WkPpFI38tddJqmnqleBTl8gVpm2cDQzdD/BHKs0NMR6CLyu24f9Fi24dWZc1TR5ThW+lydLVcZcZTMR5NiwPXl+RoXcRj5jcU3Q/kkmNjrDPk6XKzTS216TZT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA6A14BF;
	Tue,  1 Apr 2025 07:48:31 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083323F63F;
	Tue,  1 Apr 2025 07:48:25 -0700 (PDT)
Date: Tue, 1 Apr 2025 15:48:23 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	<linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
	<devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <20250401-accurate-quixotic-coua-86aed0@sudeepholla>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
 <20250401-magnetic-spaniel-of-influence-f3ee90@sudeepholla>
 <Z-v579n5wuAqTuUW@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-v579n5wuAqTuUW@pluto>

On Tue, Apr 01, 2025 at 03:36:31PM +0100, Cristian Marussi wrote:
> On Tue, Apr 01, 2025 at 03:21:51PM +0100, Sudeep Holla wrote:
> > On Mon, Mar 03, 2025 at 10:53:24AM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > > 
> > > Add Logical Machine Management(LMM) protocol which is intended for boot,
> > > shutdown, and reset of other logical machines (LM). It is usually used to
> > > allow one LM to manager another used as an offload or accelerator engine.
> > >
> > 
> > This and next patch LGTM. Just curious as why Cristian has given tags only
> > for the drivers using these but not these changes.
> > 
> > Cristian, any specific concerns you had that had to be addressed or addressed
> > in this version ?
> 
> I think I had some review comments on the previous version of this
> series for Documentation and protocol....let me see wth I said about
> this :D and if they have been addressed...
> 

Thanks that would be great. I can't recall which version I had a look,
hence thought of asking.

-- 
Regards,
Sudeep
