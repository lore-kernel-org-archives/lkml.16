Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533171DE4E1;
	Wed, 25 Jun 2025 14:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860249; cv=none; b=XNl0j+QMqAmBt1vC4l+2Nhtr5StYLDGsHsrwKQ15CgUxDmubCClVwCnvzIMy+UYZtGtWpLnVx5Zbyx0HVjFE/gwGVS3huTcuKiXi6nXMHZuTGLFUzbmVXFRVmWvxgkw6/1awltT0nkhfBi1Pf9avup/FmW1hBgD/RPhlZKTmCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860249; c=relaxed/simple;
	bh=73FhgEBtwPy6gR7FbpYwI5Qv0zgA5QgEZGXPwZLoqJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuoEw8lC/mR8YilwHOfUASVoS8bCmdel+AhloOclj8b2Zhh8Ix6yXPBuIP85/+BgjgxaZcA3Q+966hHbtTY1/0NZ/VqpILWB0NSEXor7AeGrke0FcJ5eCjvu9ik0LeIsCKyzmVMnoBErHfmlfkAXYzAFRL4Vz+qFUiU81eH+OMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53FE7106F;
	Wed, 25 Jun 2025 07:03:48 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4E893F66E;
	Wed, 25 Jun 2025 07:04:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:04:00 +0100
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
Message-ID: <aFwB0Ok90aoSxPe5@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
 <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>

On Fri, Jun 20, 2025 at 11:46:15PM +0300, Dan Carpenter wrote:
> On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> > +static int
> > +scmi_telemetry_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> > +				       struct telemetry_info *ti)
> > +{

... and also...

> > +	int ret;
> > +	struct scmi_xfer *t;
> > +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> > +
> > +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES,
> > +				      0, sizeof(*resp), &t);
> > +	if (ret)
> > +		return ret;
> > +
> > +	resp = t->rx.buf;
> > +	ret = ph->xops->do_xfer(ph, t);
> > +	if (!ret) {
> > +		__le32 attr = resp->attributes;
> > +
> > +		ti->info.num_de = le32_to_cpu(resp->de_num);
> > +		ti->info.num_groups = le32_to_cpu(resp->groups_num);
> > +		for (int i = 0; i < SCMI_TLM_MAX_DWORD; i++)
> > +			ti->info.de_impl_version[i] =
> > +				le32_to_cpu(resp->de_implementation_rev_dword[i]);
> > +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> > +		ti->info.continuos_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> > +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> > +		ti->info.reset_support = SUPPORTS_RESET(attr);
> > +		ti->info.fc_support = SUPPORTS_FC(attr);
> > +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> > +		/* Allocate DEs descriptors */
> > +		ti->info.des = devm_kcalloc(ph->dev, ti->info.num_de,
> > +					    sizeof(*ti->info.des), GFP_KERNEL);
> > +		if (!ti->info.des)
> > +			ret = -ENOMEM;
> > +
> > +		/* Allocate DE GROUPS descriptors */
> > +		ti->info.des_groups = devm_kcalloc(ph->dev, ti->info.num_groups,
> > +						   sizeof(*ti->info.des_groups),
> > +						   GFP_KERNEL);
> > +		if (!ti->info.des_groups)
> > +			ret = -ENOMEM;
> 
> It the allocation fails we need to jump to the ->xfer_put
> 
> > +
> > +		for (int i = 0; i < ti->info.num_groups; i++)
> > +			ti->info.des_groups[i].id = i;
> 
> otherwise it leads to a NULL dereference.
> 
> > +	}
> > +
> > +	ph->xops->xfer_put(ph, t);
> > +
> > +	return ret;
> > +}
> 
> [ snip ]
> 
> > +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> > +				       const void *response,
> > +				       struct scmi_iterator_state *st,
> > +				       void *priv)
> > +{
> > +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> > +	struct telemetry_info *ti = priv;
> > +	struct telemetry_shmti *shmti;
> > +	const struct scmi_shmti_desc *desc;
> > +	void __iomem *addr;
> > +	u64 phys_addr;
> > +	u32 len;
> > +
> > +	desc = &r->desc[st->loop_idx];
> > +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> > +
> > +	shmti->id = le32_to_cpu(desc->id);
> > +	phys_addr = le32_to_cpu(desc->addr_low);
> > +	phys_addr |= (u64)le32_to_cpu(desc->addr_high) << 32;
> > +
> > +	len = le32_to_cpu(desc->length);
> > +	addr = devm_ioremap(ph->dev, phys_addr, len);
> > +	if (!addr)
> > +		return -EADDRNOTAVAIL;
> > +
> > +	shmti->base = addr;
> > +	shmti->len = len;
> 
> There is some code later which assumes ->len is at least
> TDCF_EPLG_SZ and de->data_sz.  This is probably where we should
> check if (len < TDCF_EPLG_SZ) return -EINVAL; and the de->data_sz
> would be checked later.

I will add proper checks

Thanks,
Cristian
