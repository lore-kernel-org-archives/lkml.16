Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A640226D14
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750452381; cv=none; b=KRW+xA2JMEL08fWY3ebDckVAKnZpMl6nLk4XbHt+N+Ds92wYO7GtvREParEdiWddPRoPECCUdGBiZzjwq5YwmQ5u18ALpu3n0PrE+dT3y92k2gVuBnn3x2SXwBbMIVUqv6BH9KQ0CtR0/Bowl3ReGRL/XLCB01Ldeks0sUIMjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750452381; c=relaxed/simple;
	bh=yla5rx/LIQkQauMdJz3dZ6gJIjO/t5WT36UDJK/WW/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtOTxyUm6lVYY8Nomhz9Dn/kHff+psI6PI/eJz3X3QpNpN1njKLh6LaIcHQk7WcRAECilWmN299YNhOFCrOY7zE5JJeA8gwq/mvs4XFUlZA7wpG/VFL0YdjPVCt1OqYC8FI2SZFhBHTWzr9kXOrz7osTSkFfEJtwU91aivvEjN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qS+dsPCb; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qS+dsPCb"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2eb6c422828so1279978fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750452379; x=1751057179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/Y8DjVDPlXRXyjpGs6r48QlsTt9FjgMTVP1ecP+30w=;
        b=qS+dsPCb4aKUCt9tsczRRx5U+ZYR3pg8CID8nHQ/L6HtfiPYoc48+c+j65xYk9iHa2
         sInYGSNRRHUVBxp2Q6t5FwFtPfXjeNuzIzPIZKlrmBeutj4CY99/+NSs/3sfy68yRfTE
         3gsnQ8YHhEByZQi9pSRXaj3JFLkPUlRL31OslN9Nkj9Be5DuJrzUZ/nvIlesSA6d7Gui
         nd46LZt00rBizn7VhIznwyVliMUav1wl6ZiZZOUm0QxaJrSCWnPylj1hc6vjKGjiNF5e
         A+a/dRkken14oTQh3vOLkOne+PvCGP7UP4THvYUHkKEyw/K+RJJXNfXIdzDVMk6D+mb7
         IEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750452379; x=1751057179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Y8DjVDPlXRXyjpGs6r48QlsTt9FjgMTVP1ecP+30w=;
        b=kf9EzOme+to02OrqzdxcMmpQ+gq+4pQA3/Uxw3/vYFZ4JVVKaLxuNDygiO0JsWISCk
         VJrvdGycKYQmSJj3Goj/Xb3sEq11aunox4/21GB8fPIGagDf5inXb7vywFYkVPBECVyy
         SaL5eLfZ3X4DxTJzrDPx43nSCnAVK3nSC+O2OAq6+MRWXSjVFNDQv4BswgXC28D8CbSt
         ZNISq4oxXzcftZOb47PGcJB8MHBDJNZQDpMsrPPOM5JK2e7S5l5zLrX3tAFlNkw2QDzf
         AHDUrIlBlLdsbFrpfxBZAL99pgHYfF2ynYj9skYZ5tcJVGsH7OMi5EfBHyhGEal5GUCs
         289g==
X-Gm-Message-State: AOJu0YyoGo3KPjAW25/ciCa9Q+kVCaZCrLPoLgmofXsQtlLKuEyIUGBE
	Od6SaKQURoUTmGsPLWq3a4Jh6ITFqgCZoOSQFW0t0E4S1V9xgpOStt6vQ8A49uukFrw=
X-Gm-Gg: ASbGncuQ4ghc2Rty/wk4ILmmYH8W+hQS8StwcfKJx6GmK9854rkiZa92RiXmftVORpU
	heU9nWTcr0nWyWlx2o7vtekmmTrkKGI4YbjikxDhLuhiUx3qfPXARSRRX3ZmZ0JuyFDWdNKs2D+
	zOthb40LxhLpHeV6R6CTBnl8J1H62K5rwXNVUxT4FJ9YV9Y4yVxeLgwiHEQT/0yIPxADGM9V8bM
	ei/PXQ+v9vR/KKYSLJmWu5UjE+UPjBT0CKvY7vyE3ytUpaHmGyJOOvv7Ny91TNY1ApWhI+h+cOF
	qNxmu0I+TZRsP2NDuW2NWaG1raoLXlBFLS6efZkVs6JKTGIxvQpBdmQZUQz1/pMjOTOWUg==
X-Google-Smtp-Source: AGHT+IEltVQQpWX6/49BBfYc6w8RKy2yGvjE97btwLbyyP6cYD1DXa6Ie9CAh5+D8nSPHysnFDl13A==
X-Received: by 2002:a05:6871:69c9:b0:2eb:ace9:197a with SMTP id 586e51a60fabf-2ef2a74cd89mr1902210fac.5.1750452379128;
        Fri, 20 Jun 2025 13:46:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b6da655sm344851eaf.17.2025.06.20.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:46:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 23:46:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-4-cristian.marussi@arm.com>

On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> +static int
> +scmi_telemetry_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> +				       struct telemetry_info *ti)
> +{
> +	int ret;
> +	struct scmi_xfer *t;
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES,
> +				      0, sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		__le32 attr = resp->attributes;
> +
> +		ti->info.num_de = le32_to_cpu(resp->de_num);
> +		ti->info.num_groups = le32_to_cpu(resp->groups_num);
> +		for (int i = 0; i < SCMI_TLM_MAX_DWORD; i++)
> +			ti->info.de_impl_version[i] =
> +				le32_to_cpu(resp->de_implementation_rev_dword[i]);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuos_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> +		/* Allocate DEs descriptors */
> +		ti->info.des = devm_kcalloc(ph->dev, ti->info.num_de,
> +					    sizeof(*ti->info.des), GFP_KERNEL);
> +		if (!ti->info.des)
> +			ret = -ENOMEM;
> +
> +		/* Allocate DE GROUPS descriptors */
> +		ti->info.des_groups = devm_kcalloc(ph->dev, ti->info.num_groups,
> +						   sizeof(*ti->info.des_groups),
> +						   GFP_KERNEL);
> +		if (!ti->info.des_groups)
> +			ret = -ENOMEM;

It the allocation fails we need to jump to the ->xfer_put

> +
> +		for (int i = 0; i < ti->info.num_groups; i++)
> +			ti->info.des_groups[i].id = i;

otherwise it leads to a NULL dereference.

> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

[ snip ]

> +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> +				       const void *response,
> +				       struct scmi_iterator_state *st,
> +				       void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_shmti *shmti;
> +	const struct scmi_shmti_desc *desc;
> +	void __iomem *addr;
> +	u64 phys_addr;
> +	u32 len;
> +
> +	desc = &r->desc[st->loop_idx];
> +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> +
> +	shmti->id = le32_to_cpu(desc->id);
> +	phys_addr = le32_to_cpu(desc->addr_low);
> +	phys_addr |= (u64)le32_to_cpu(desc->addr_high) << 32;
> +
> +	len = le32_to_cpu(desc->length);
> +	addr = devm_ioremap(ph->dev, phys_addr, len);
> +	if (!addr)
> +		return -EADDRNOTAVAIL;
> +
> +	shmti->base = addr;
> +	shmti->len = len;

There is some code later which assumes ->len is at least
TDCF_EPLG_SZ and de->data_sz.  This is probably where we should
check if (len < TDCF_EPLG_SZ) return -EINVAL; and the de->data_sz
would be checked later.

> +
> +	return 0;
> +}

regards,
dan carpenter
