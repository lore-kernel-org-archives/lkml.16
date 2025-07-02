Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237032BD5B5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466353; cv=none; b=AjoAtqg6iHf8MJyD9ESU4lc++SYEBtiB0DoZoJ+VS9BcD1bTlK+KOp6tUyXziEMr24wA7m3moY8TkWdXMhoqUw98dMv0aIpYOM//HjIW0zHN3dBXvsniVJi19UJUQyctgNfm5Lp90ANV+nHPRdRBydMK2qqoR6Rsba79np7R9es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466353; c=relaxed/simple;
	bh=XI2aabHxDjSDZsjSbjqRlue+1AmCMU13tnFObRNUcYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9Tde0TBP7oWAvkLmW0iNPh6vKR0NEzow4Ueo3C38O4yVkq1gPCcMv5/hY7yePbfzv9HZG0J2IfBiD7bgvplAmqQkuhqK4+ki57FAEArdFDRd2JgTKFvhw8s3UvXz0t3qJeAD6eD+j/1IlJeGDCn1JqXErpiYXTMi56zVCg24kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+JNuQkj; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+JNuQkj"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b34ab678931so5770478a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751466351; x=1752071151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E1kr9u8m8E4TPdeiQ7uwSuSGKdX9x6J9xyjPynOJkDg=;
        b=a+JNuQkj35N0lPgIX+2ayY7f3pVANPHKaMqsIHTp57eIp3LHVucrOuoB4r3EDqmvJN
         8sG+6EyrM/2dYnf+HRuz7qtZeiDCIzdPuiWdsnH6g4N7gpbwJj4pnbigq8mUrO+ZzRYX
         vqcX8S1fq+CaQGk+cEAM+t+XNx8GaF1fWSS6Xua7uxcYG+Z5FvEhxwCg3POyHyRamV9a
         14gSq0F0sLVIO6OF8tMXayMWzr6KiAieYOWclDIutrxfJzDr2fSHoS4XXXItVTAMBMtR
         7ONjDDQ+m5IjFWQTcaQKVWg/Zu8G02Mo6X+vZU2DWiSCepJQPG5MjznAeIiyzVHava1m
         zBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466351; x=1752071151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1kr9u8m8E4TPdeiQ7uwSuSGKdX9x6J9xyjPynOJkDg=;
        b=cdQzOf2MP0R5HwfiOyqUCEe+KJ7Ycd/9cYznGoX8PCG7WeBOC/Ypvz/bTM38oBPR4T
         48IAhSCCTtp6EsFAzKEyRbEr4wuapcEmpFTGYmO0YNAvHPHQYqt/tWB/rKfvnH7Qx5OK
         t932jadh8HLKlf5weUA61c7b+3/9EGuIT2nVhwCfsd9OV/PiKtV/kIvOl9ruKCmhz6NE
         0Aj6jLpE4IjNMB+Z0+BxDQ+sxyOVs9E9Q4+95FPsZHvDnc4wi9uTwPcphRLKzP6eK0Eo
         DccP49ecMr8xeHpaTIJ6YLvkgz2VEJa/59ajZilsO+NukGnDHz/1QMOvqm1zzqos5jXO
         4eVA==
X-Forwarded-Encrypted: i=1; AJvYcCUmmW+BLFoAhrixJp3Y7nkb3cJW5kStJNBTI+lYjRXa4k/FR7YwiEbF9rOTvepXJZem/cfFyxSyax1Gr8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEhVDKIlXx9gioreWxAMqJ3rRcSQ4H/wq3p2mWbr5Mpv+RjfJ/
	Ne8TQdF/8375ak3RBbphZAmY94o/iYX/+ku8+LWAsI+Oz6m2eb0L0IQD0sUJH5XWwIs=
X-Gm-Gg: ASbGncvn+JbJcT6J7wcmP/wGRpXEn91+GmgqWLjtp5eGbJkRoqZyxdOJxHIe2N8LbmU
	NmHnOFnl3+4pvoUKscnH8GWVy4zBHoznovDSESEPV1avOYTAOHkn76P5m4GbE0drpjznhqBPpEt
	mtuKInMM8rFNYK/JCqa7vB0ktlrSPpE/4KvZJalyrWyk9bfdgXmv1A35ex3OqRwSUed6KtQ8YIV
	hdfXVcqGikmbzSmuD8uPyZVEyb3jxsN2qyPIoc7W+w50ELRFZrUqfx2rZdZrAFHvktgvJYSeIVl
	3XYIqMguTNTv9RQ6UH2ls/V/P1t3sXFsCgO5vRgxm+wOGQbKxp4iC4aiEHF1nvkiSg==
X-Google-Smtp-Source: AGHT+IGACXNzORcOLr63yAnV+v1XsFnEOTBrD3FtNZjqSYPdOEFrg73DioscuFNcU4UYVROnpOULxg==
X-Received: by 2002:a17:902:cccc:b0:234:c22:c612 with SMTP id d9443c01a7336-23c6e61daf1mr43537575ad.43.1751466351325;
        Wed, 02 Jul 2025 07:25:51 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8b86:98d8:fd22:2368])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ad16fsm140424455ad.141.2025.07.02.07.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:50 -0700 (PDT)
Date: Wed, 2 Jul 2025 08:25:48 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: add shutdown callback
Message-ID: <aGVBbPO28LlLlZmT@p14s>
References: <20250620195728.3216935-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620195728.3216935-1-tanmay.shah@amd.com>

On Fri, Jun 20, 2025 at 12:57:28PM -0700, Tanmay Shah wrote:
> In case of kexec call, each driver's shutdown callback is called. Handle
> this call for rproc driver and shutdown/detach each core that was powered
> on before. This is needed for proper Life Cycle Management of remote
> processor. Otherwise on next linux boot, remote processor can't be
> started due to bad refcount of power-domain managed by platform
> management controller.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 40 +++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>

I have applied your patch.  

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 1af89782e116..30294e7fbc79 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1463,6 +1463,45 @@ static void zynqmp_r5_cluster_exit(void *data)
>  	platform_set_drvdata(pdev, NULL);
>  }
>  
> +/*
> + * zynqmp_r5_remoteproc_shutdown()
> + * Follow shutdown sequence in case of kexec call.
> + *
> + * @pdev: domain platform device for cluster
> + *
> + * Return: None.
> + */
> +static void zynqmp_r5_remoteproc_shutdown(struct platform_device *pdev)
> +{
> +	const char *rproc_state_str = NULL;
> +	struct zynqmp_r5_cluster *cluster;
> +	struct zynqmp_r5_core *r5_core;
> +	struct rproc *rproc;
> +	int i, ret = 0;
> +
> +	cluster = platform_get_drvdata(pdev);
> +
> +	for (i = 0; i < cluster->core_count; i++) {
> +		r5_core = cluster->r5_cores[i];
> +		rproc = r5_core->rproc;
> +
> +		if (rproc->state == RPROC_RUNNING) {
> +			ret = rproc_shutdown(rproc);
> +			rproc_state_str = "shutdown";
> +		} else if (rproc->state == RPROC_ATTACHED) {
> +			ret = rproc_detach(rproc);
> +			rproc_state_str = "detach";
> +		} else {
> +			ret = 0;
> +		}
> +
> +		if (ret) {
> +			dev_err(cluster->dev, "failed to %s rproc %d\n",
> +				rproc_state_str, rproc->index);
> +		}
> +	}
> +}
> +
>  /*
>   * zynqmp_r5_remoteproc_probe()
>   * parse device-tree, initialize hardware and allocate required resources
> @@ -1524,6 +1563,7 @@ static struct platform_driver zynqmp_r5_remoteproc_driver = {
>  		.name = "zynqmp_r5_remoteproc",
>  		.of_match_table = zynqmp_r5_remoteproc_match,
>  	},
> +	.shutdown = zynqmp_r5_remoteproc_shutdown,
>  };
>  module_platform_driver(zynqmp_r5_remoteproc_driver);
>  
> 
> base-commit: d293da1e4dbebb40560e4c6a417b29ce3393659a
> -- 
> 2.34.1
> 
