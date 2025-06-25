Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F035D262FED;
	Wed, 25 Jun 2025 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860307; cv=none; b=roxxarcy5YiOyWyFHq3H8EzTWauLHI27hvYlzTub3KChFQEXB6D4BkSh9REA6oCQN60VY5wJo1U589wP40ROOOVlLO/fGTsJVruzK/PCtvJDLtQG4y+RfWq1mftPp9lCMVLWMRXXaFzwj1xUC6y/sCPKAJnO0xu6wMiZZex6g+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860307; c=relaxed/simple;
	bh=YdqWQDnWQKpceGWG/yOIy0TAN3Kxu/U8E+6u9APizjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftetdaWi2Er6rulK7RA8PtJBxVb1x4em+2G6yk87CGLlJrd15o2WG1q5WjrgRGSr6YUK8MMnsRCRFfDWax65g6/fEO5PWcZ1E2PLL2i9GKMRVTVsVQ6BIu1cHjXDm/YgqkuIzvAGakmRONs+ng479+RunMxQp2eqZk8N+adY1r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FC9B106F;
	Wed, 25 Jun 2025 07:04:47 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 982683F66E;
	Wed, 25 Jun 2025 07:05:02 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:04:59 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <aFwCCw6K2NWuz5XZ@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
 <b33a0c18-2850-453f-8ee6-5574330b3670@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b33a0c18-2850-453f-8ee6-5574330b3670@suswa.mountain>

On Sat, Jun 21, 2025 at 12:01:23AM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> > +	/* Build compsing DES string */
> > +	for (int i = 0; i < ti->info.num_groups; i++) {
> > +		struct scmi_telemetry_group *grp = &ti->info.des_groups[i];
> > +		char *buf = grp->des_str;
> > +		size_t bufsize = grp->des_str_sz;
> > +
> > +		for (int j = 0; j < grp->num_de; j++) {
> > +			char term = j != (grp->num_de - 1) ? ' ' : '\0';
> > +			int len;
> > +
> > +			len = snprintf(buf, bufsize, "0x%04X%c",
> > +				       ti->info.des[grp->des[j]]->id, term);
> 
> Please use scnprintf() btw.  Otherwise if there is an overflow the
> next iteration will complain that bufsize is negative.

Yes, I will review all of this.

Thanks,
Cristian
