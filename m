Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC39D238C16
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750456279; cv=none; b=hMZQv/203g3ypphnRQtTSp4JmRsfVnHMOYWIW+Mbq6/1IlSjh9SXMKkiPt6RawZ8kuYYc0qGs/2WFZKJGohJNqOJDKRJWhLgojvHR++2pYglwdAXr96xzV93+h3lQuRzmz42yncz/lPgNawo+WX3jxSxIR037XTNxKjhacC8apw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750456279; c=relaxed/simple;
	bh=bfITkeYShQSWbkf0r8/RmW2u9c17/1b7cuwuM7i5gDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLcKO+/xsMoVeYLiNYQQ+LZCKS6mz+fpTcYzTDcDaQojdesMXKvQJQiixoe31DvO8dhBdY6NSxUZzpRj/8pXAK89E3kzSrG9o8Lc3dXSFs85X43tiPWSRID5zJFMKY2Z7237iX9/UE9AB33UC8Mo9hOh0R/s63m4XxcaC6upTGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TxKhxVPY; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TxKhxVPY"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4080548891fso624385b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750456277; x=1751061077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qciZZcm9ZhGrH66JTdpjaM1ur/fzC7K8oAKg3h0lmsU=;
        b=TxKhxVPYG2lPfAIdx9xs2zsDK8uffCoBgDvFnVp8PEngdvZ5YABKGMDX+CdnWBF53i
         vrms6pFociO0hcL0frT7nSkMOA7dRzOc2Nu04J/u4Ym8mg4mJ42iKUbc+k4A8sTkcLOK
         PaVLmJB4oDennFVNLGUtxB7iN7Uu0EvP05hpShNhOzSICkblLlInmdZKkPkaEqLDZu6S
         jVx2xpchcATeKYOOXkZgIAh5VJ7WDZ7RFLRrOrJcYpFRFL3JriqPLnrs2/OnkEqRg6f+
         pxwHbMrflgI+1dgxhg7hNZMDLETenI+wSxQP7l+mZbT2U+vzZidzfw3S6qQNWOoSoTcW
         o9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750456277; x=1751061077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qciZZcm9ZhGrH66JTdpjaM1ur/fzC7K8oAKg3h0lmsU=;
        b=qnbCmOhuHiOK1bpZRMkKg+WwIVlIBeaygb3vjhCdr2Gtgkb8HID04YEXW5oLTxZWkl
         SOLfIthwE7noVNl4FlhVzyzqakXN7uWAT49TEJ31vf8CS/2V5dQatR7ljcS8FCkgy3zh
         8xPEXFyjV02PmHqsolRIdOXdsEMgqohWT3TkXZWhJl+n1aGD+fRwqHuRazOVVmeuRrzi
         X/BdeQDDTK3hoTD6+gMed+LUS/4JhyOlFyMNXLXJtu8khme1Zd9p8RRFvEunmNKOgdtI
         2kq1ndnRMdF2BvvJaIidr6m81+WeVb2PudWkiIoT/TM2YK8Ef9M6J+eggKX1fY78VNYr
         ReYA==
X-Gm-Message-State: AOJu0YzKnzxs5la8c+LFUpNL/eWnoxf/AwKa/0zvKar1o0Cl8aNifZ1o
	k3qhcSvTv0sqO5wr6FOHhEXvGX0FODY3HIdBSF2zrARx3uDULbc4fxMwEKpq9E+Yk/A=
X-Gm-Gg: ASbGnct4Y2J+agcBoLVmAgz50J3YqisMFXtkUFzyKiDe6zN6L4PSTv68D8n/iaWvc3i
	mEuo1oyeiOxlcr91oUywRXFmodaKWwkW840ogjeUadp55jTNaKo6I34QNFZLdgzYyAfIESy9P2G
	AP38RE32lCpEAo8nRvl07QnPm/wKKrr+7KahonMRbZvfLof2VGtVMxR0VmBYUl0jMRw/Gnmn+Wg
	TYzWK58/PSrw5m2M6w6l69Z0CxECoDJLZrLVI6Pzzvyea2Dkc59CejoDhipXoZOJ6/mSLM2iGBc
	lcYmUjGH61XIdp205MlNwHJ9RkOy7wElisg/S2sJ7onjTNnoJu5DPPTIeK8rrVh+iEQtSQ==
X-Google-Smtp-Source: AGHT+IEUKt2T8NPo19dPeOycUEZfJIdPu2BwWVzJ6tGEwvl4xQ4AjLwthY3jfBkPvwEIgCaF/ro8vQ==
X-Received: by 2002:a05:6870:af42:b0:2d5:2955:aa66 with SMTP id 586e51a60fabf-2eeda4e114emr3105643fac.1.1750456276972;
        Fri, 20 Jun 2025 14:51:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b7c909esm342923eaf.27.2025.06.20.14.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:51:15 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:51:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 5/7] firmware: arm_scmi: Add System Telemetry
 chardev/ioctls API
Message-ID: <6fa26a61-1f61-4ab0-8b7d-caeae7eb801e@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-6-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-6-cristian.marussi@arm.com>

On Fri, Jun 20, 2025 at 08:28:11PM +0100, Cristian Marussi wrote:
> +static long scmi_tlm_des_read_ioctl(struct scmi_tlm_instance *ti,
> +				    unsigned long arg, bool single)
> +{
> +	void * __user uptr = (void * __user)arg;
> +	struct scmi_tlm_setup *tsp = ti->tsp;
> +	struct scmi_tlm_bulk_read bulk, *bulk_ptr;
> +	int ret;
> +
> +	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
> +		return -EFAULT;
> +
> +	bulk_ptr = kzalloc(sizeof(*bulk_ptr) +
> +			     bulk.num_samples * sizeof(bulk_ptr->samples[0]),

This should be struct_size(bulk_ptr, samples, bulk.num_samples) to
avoid an integer overflow on 32bit systems.

regards,
dan carpenter

> +			     GFP_KERNEL);
> +	if (!bulk_ptr)
> +		return -ENOMEM;
> +
> +	bulk_ptr->grp_id = bulk.grp_id;
> +	bulk_ptr->num_samples = bulk.num_samples;
> +	if (!single)
> +		ret = tsp->ops->des_bulk_read(tsp->ph, bulk_ptr->grp_id,
> +					      &bulk_ptr->num_samples,
> +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
> +	else
> +		ret = tsp->ops->des_sample_get(tsp->ph, bulk_ptr->grp_id,
> +					       &bulk_ptr->num_samples,
> +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
> +	if (ret)
> +		goto out;
> +
> +	if (copy_to_user(uptr, bulk_ptr, sizeof(*bulk_ptr) +
> +			 bulk_ptr->num_samples * sizeof(bulk_ptr->samples[0])))
> +		ret = -EFAULT;
> +
> +out:
> +	kfree(bulk_ptr);
> +
> +	return ret;
> +}

