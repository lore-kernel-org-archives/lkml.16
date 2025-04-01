Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A4207E05
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523562; cv=none; b=jdkW0IQCZuRrlkpb/eIYF2HQdAn7OtdAWzmou9dV1rMtgJpkyc+77Er+xPDKxJzLINfp6vcP0PonWxpTW9zOdinmjn5FZJENYZiCE4r6XoYi4B6yw6/2BGoOZkOrG74HpoiX/sdFxKomGxOfy3FcUn+luiuFdU7Mc+Kc7FOtwhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523562; c=relaxed/simple;
	bh=2DTe70VGxuBOt/LP/Qp4+Hu35qgNdvgQcrZCfnEFhzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh5zTM+GnrZtS9iLsHQvi/25a5McnFkcev8oaWOmmXsE1jF49+NoC03ehs0iDwQ8GlClhLpGaRNUOolzE8WTndabt9MsmU6Iv5k/HbTX3eRrC7BLmd2TyZMhdTbUtZMRThOYYDqvKStD/SNglxHxxyv2Ny5qUUCRvzOIJrcl3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNuJj+9P; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNuJj+9P"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22580c9ee0aso117234145ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743523560; x=1744128360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=BNuJj+9P1NVZ11v9iFbHrbqiT8sWMvNZPY0/L8OuprU1OYtsEdtOjyHpGBVyJbMDPh
         mAPlRBIJ8VrpiWuBuDTI/IuafxC+HDirNqihC0om9hX+MKzmL6apqBPVtd/plxfz23Qm
         D6bpDDc6SUUtIw/uNuQoSJpLgNByTR7PGTnMbYYPPy0/rTp93F2c1+PbEZpU9RP94rkw
         yeS2vu6+y8McsAeQ0ecUY1g/rxvpXoXAaycQlIPlpZlNmARCUoko55R+u/+r1DsxEDJl
         xrpyKUL1S57MaocPGX+IigH1BCS0vIhVnLWGMnMrtOAiMQqTXM4DbHDCpdu1QOGeOJr8
         QZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523560; x=1744128360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuO3JoiBaWEWl3zVvnUtjCtMgfiv8CYDUp0HTVXRARo=;
        b=q+PHpAYIUZmaMj8J/JY0Wab3yFyXaEmsCWEaaDhXwBDy18ImXDUrC/SmPO+VH/eanN
         aHBs6YubHInl496qmPuIvQkhsQjYEwDlybE4VEPQiDbn560od3yZRwUTctwJWvJH9dS3
         IDHWEpaUZokv9l+yC3vskR1zg+xiRVby7FDMXUa8o38QwC4BqUjOv1F1YzewEzaJenBH
         4hCtCGQy0ZNs5sV2yznQsvfPYNluLyvgBnkAwuHYgAXYdF/dCTdf2ch9XX77Lmpe788q
         ov1QGWxvujHn3e4Vv5OsJ979w9GdYLEp+/l+TtMglipLKKpkhUHjNLlrNHyu8K6U2obN
         rrsA==
X-Forwarded-Encrypted: i=1; AJvYcCUBNqoVrMmH74kduW94zzuYhStv1VLMYNieLPywMzrYC37KDNzU4cgrAXgvDHYNxchvosBJsSXDra2o7Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy26xK+GGXNwLoBu6YLeyE+62RvDe1eK1JxFc7AMPNI3DeuBoEW
	Yh6rhbgyrWsay6m5yaUWCPIRynT9nwrfIPQ36YCAtv7lCUs81JXXqMg8zzo8rsQ=
X-Gm-Gg: ASbGncvrYrvUXZzPOo7yECR50Yl3hJoWyCnCnYFr7lFDJcq8KJHtae/mZPlN4zSvNrZ
	sldWg1W50JXNWzDXrddZXTwq8gp6YlLPwJRyJrQ1ll8rBn81W73kX8gEAHiQTK7XvZx4XZeI2vC
	OOv1ToW4eVgxNYZYHDmS24T4bpD8eHYa3kU+OtKV8GhMXmi6vQDnyISoO8lqidrttvjnJK1Mh8I
	Kan6zUxeJyZZc+FeH6XM7L2mPETSwrphU2+yeG9JXGsZaO6XH4dDNbkd1CdtRJDFZ9Asr8R66j8
	z4M6Tbd2zuf9+hErltq94gJoUs5YitWn/YyqrxV1445piB/B
X-Google-Smtp-Source: AGHT+IHS665q9tq8I4Rn8gAFViO1Vbyxy5C1fhneAWy0pBzjbtNJpFCpmq60Cuhz94aODSClJDgSTA==
X-Received: by 2002:a05:6a20:2d0c:b0:1f5:a577:dd24 with SMTP id adf61e73a8af0-2009f645311mr20981139637.25.1743523560465;
        Tue, 01 Apr 2025 09:06:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:62bf:3c83:f3df:dc76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af95d59a786sm5788320a12.53.2025.04.01.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:05:59 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:05:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH V2] remoteproc: imx_rproc: Add mutex protection for
 workqueue
Message-ID: <Z-wO5PLU01Nd3QDU@p14s>
References: <20250401140402.3676049-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401140402.3676049-1-peng.fan@oss.nxp.com>

On Tue, Apr 01, 2025 at 10:04:02PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Same as commit 47e6ab07018e ("remoteproc: imx_dsp_rproc: Add mutex
> protection for workqueue") and commit 35bdafda40cc ("remoteproc:
> stm32_rproc: Add mutex protection for workqueue"), imx_rproc driver
> also has similar issue, although no issue reported until now.
> 
> The workqueue may execute late even after remoteproc is stopped or
> stopping, some resources (rpmsg device and endpoint) have been
> released in rproc_stop_subdevices(), then rproc_vq_interrupt()
> accessing these resources will cause kennel dump.
> 
> Call trace:
>  virtqueue_add_split
>  virtqueue_add_inbuf
>  rpmsg_recv_done
>  vring_interrupt
>  rproc_vq_interrupt
>  imx_rproc_vq_work
>  process_one_work
>  worker_thread
>  kthread
>  ret_from_fork
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V2:
>  Add RPROC_ATTACHED check, because i.MX supports remote cores started by
>  bootloader.
>  Update commit and add R-b from Frank
> 
>  drivers/remoteproc/imx_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

NACK - for the reasons I have explained in "[PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown"


> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..4819a9e57543 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> @@ -785,6 +786,11 @@ static void imx_rproc_vq_work(struct work_struct *work)
>  					      rproc_work);
>  	struct rproc *rproc = priv->rproc;
>  
> +	guard(mutex)(&rproc->lock);
> +
> +	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
> +		return;
> +
>  	idr_for_each(&rproc->notifyids, imx_rproc_notified_idr_cb, rproc);
>  }
>  
> -- 
> 2.37.1
> 
