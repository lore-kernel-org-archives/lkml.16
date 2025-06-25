Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF6F25C80E;
	Wed, 25 Jun 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860895; cv=none; b=GfuimOlj1fSdQ1aDw4Wq7UQsOfSJ6iPHdT31qvbO6CoSRtVyxDe4+61TtluI26FnUlgd3VjkaYc1Mc1YnzGTevt7q4h0s/QMsmvNfCuUKDbE9hBSSN1g4K1D1KB9jPCsBYrT0Hrmf3ejNAOiRo5Lu815OUhJf3vjDldsmQZDR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860895; c=relaxed/simple;
	bh=I2zJDKU5W/bmaCKJNDCv5hygIu1go9DnuppVM0Mj54Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE+9TTELbWNSldEApeyX7cwHjf93f1N4W23QXpPim0J/ifW8tRZwB445mpd2LLPVdNSkhBEVhPDvBn+i+p7EmUkWZebuqnYdJmrpD/nLH1O0ENkMphNeCe54i0yqQQ7i96BKrwSe7awCn+HOQilMLtD8SBfwUiR7/HHhhZXvzig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4972A1007;
	Wed, 25 Jun 2025 07:14:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B047F3F66E;
	Wed, 25 Jun 2025 07:14:50 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:14:47 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 5/7] firmware: arm_scmi: Add System Telemetry
 chardev/ioctls API
Message-ID: <aFwEV6zK8KU_FP19@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-6-cristian.marussi@arm.com>
 <6fa26a61-1f61-4ab0-8b7d-caeae7eb801e@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa26a61-1f61-4ab0-8b7d-caeae7eb801e@suswa.mountain>

On Sat, Jun 21, 2025 at 12:51:12AM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:11PM +0100, Cristian Marussi wrote:
> > +static long scmi_tlm_des_read_ioctl(struct scmi_tlm_instance *ti,
> > +				    unsigned long arg, bool single)
> > +{
> > +	void * __user uptr = (void * __user)arg;
> > +	struct scmi_tlm_setup *tsp = ti->tsp;
> > +	struct scmi_tlm_bulk_read bulk, *bulk_ptr;
> > +	int ret;
> > +
> > +	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
> > +		return -EFAULT;
> > +
> > +	bulk_ptr = kzalloc(sizeof(*bulk_ptr) +
> > +			     bulk.num_samples * sizeof(bulk_ptr->samples[0]),
> 
> This should be struct_size(bulk_ptr, samples, bulk.num_samples) to
> avoid an integer overflow on 32bit systems.
> 
I will fix.

Thanks,
Cristian
