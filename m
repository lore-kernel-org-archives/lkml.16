Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450D223C8BA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738944142; cv=none; b=WsOKhoQU/olHxyDS+j3NovT4eo2vpJZ4oTqNYkSppGCCX2NcDNQE9sKaIRyRJbldcViz/5n1Q9SBgkCAOv4ZAkhUI+ZD//jn4zWUUYt6GKE1A3ZjpxrfVXbsg9wejOeZNA8wn9xXFhIV0x6cl0/hZpEX6BMAvLdQqASGT4Sg8ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738944142; c=relaxed/simple;
	bh=zpMXVfQjnAUBW6qykmx3EJiuUjgkhNeI+8nEmVNmDko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSjAoyU+/foTHh+Eug669F4/p/8mMsz+RftUQk6J9qwnz92aF+kTweTwLw2kUsL5lAON/IiGc2N2mYk8/xOBD5pLRpdBaI18hzCFDrE/Gg9O68zp+RNVRK68+oy/Q3q8Pf3IgAE0IKNnK6UHjulZ0137MqdN1UA98Q9XFpCvWlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VHlZg2ER; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VHlZg2ER"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0155af484so297356285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738944139; x=1739548939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XBpucnCVHzGQH+O7bMwiQtnZts9S0udJs+IqXXWisiQ=;
        b=VHlZg2ERA0DascTFe5PwYOVyGHK2KqVWQv7FDvQHq6jbNOVtIUmlzEbf7gOx8kamoF
         D6eyukfOalEygtvLLf2jgKaCDld7bRjLu3TPPpuocLSNnJvEjb7XXAV1d8ZkLT4Bj6kY
         Fg+SYtb+0KGIbaPM1Xt9qmnZgbcuaJqeh3D+It3Qqst1MEIQ+ACo5GS3pVSDNyy4BgyL
         D6Am8UsBNGaJ0pnz7/s0N7Lhim7pNZ05dvIPx1NhSw56U0HQshsxh2rUcq8grIwzricg
         QLbKjsqG/dexWCoYxntSzGJ4v30LqHksWJXcX19otZweMjd0DA8vfqIOsKzHR6cq41H+
         v3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944139; x=1739548939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBpucnCVHzGQH+O7bMwiQtnZts9S0udJs+IqXXWisiQ=;
        b=CPdBDEFlVybzE91NxBd2ZuMxzyZmDSZOKTumq5t070mFG3LqaftoK0RtBLAZcJpGOa
         V5BYV0SDPvOSg6tFCxIXrIvm7G5xNRnuOyJmZkZyjoAOAN9S2eC8BKfkPoP9P4UofSnh
         giK6QgN558sl7UlYngJVTuHFdop8jLKkEpqYA8RLfa8OTwdqS+xH8SGJzi5T3Da0WoXX
         i/TV+ChS3ZBQxhn3wiaaaJj8STT4y7+6+Tle7/agyzuUUcxNgOv1egmttWtDgy8/c+AH
         N1bMNfs4iMuIdV3+NaZMFjfyZqFzLmNFTunoH5PS6zxI/u0uir5B4RHeZaBPxrPAs1P8
         NY1g==
X-Forwarded-Encrypted: i=1; AJvYcCWALpR0kCFYnG+657L1dzuDTCC8/E7FLghK1ymyBKjgb0f0gxbn0GLt8lXuczQtPd8TdLHnhpU3rVOQgPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQZ1LDbja/LXqyXvc0aGDpFW1cH6z+Dz00Me76cL17PQCRDFu
	vzVO6TDvy/pDfX45gxKuEbqh+Tn1/fnVDMFK+PWT2Cv+DaTMPJgoljqKdkNAAxM=
X-Gm-Gg: ASbGnctyODmCODkLSJ7nokoDbQSP8XTU6djtMVMdPGbDPCIijI5TH7xcO8wiXUJLxft
	ZojuuTY8cG5Z/ENEPdOmjBCx2fazIRbPYZeBXvFbk/Azqr33Me2+DmVCKX2aertGhkUz1oNqgHQ
	wK3Dhoq1PlmFSkgNPb9uBxJuGnKBwFXb34TtB0LoS1TWounPZ8OhmPm2+w0ZJbP6ldPcHAsXsZW
	/UMQObOv0Ki/WjiHiiAUVC8oqsmBTUikQVrHWTx+1ShUjOxsQrL7hsaei8QkigI+7iS06+Y6YiX
	HiEIPyUlL+tBzIah41f2W4+G64sxOa5c/tLZPAPOHxnGzKxiMY3nFcm6sAsLpS5Ga/xv9xfEVA=
	=
X-Google-Smtp-Source: AGHT+IHaACtCyvYcSAtPimBnfNUn6WiPGaHDl2LoofMFjXuD4jKdMZq31UofSzyQhbo/FJ8IF4spoQ==
X-Received: by 2002:a05:620a:26a1:b0:7b6:d252:b4e4 with SMTP id af79cd13be357-7c047c9507cmr677196085a.53.1738944138934;
        Fri, 07 Feb 2025 08:02:18 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47149275ff8sm18152201cf.11.2025.02.07.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:02:16 -0800 (PST)
Date: Fri, 7 Feb 2025 11:02:13 -0500
From: Gregory Price <gourry@gourry.net>
To: Robert Richter <rrichter@amd.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v2 02/18] cxl/pci: Moving code in cxl_hdm_decode_init()
Message-ID: <Z6YuhYHz7K-arZuo@gourry-fedora-PF4VCD3F>
References: <20250207153753.418849-1-rrichter@amd.com>
 <20250207153753.418849-3-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207153753.418849-3-rrichter@amd.com>

On Fri, Feb 07, 2025 at 04:37:37PM +0100, Robert Richter wrote:
> Commit 3f9e07531778 ("cxl/pci: simplify the check of mem_enabled in
> cxl_hdm_decode_init()") changed the code flow in this function. The
> root port is determined before a check to leave the function. Since
> the root port is not used by the check it can be moved to run the
> check first. This improves code readability and avoids unnesessary
> code execution.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

> ---
>  drivers/cxl/core/pci.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> index 2ec8c97ab160..f8e22bc278c3 100644
> --- a/drivers/cxl/core/pci.c
> +++ b/drivers/cxl/core/pci.c
> @@ -419,14 +419,6 @@ int cxl_hdm_decode_init(struct cxl_dev_state *cxlds, struct cxl_hdm *cxlhdm,
>  	if (!hdm)
>  		return -ENODEV;
>  
> -	root = to_cxl_port(port->dev.parent);
> -	while (!is_cxl_root(root) && is_cxl_port(root->dev.parent))
> -		root = to_cxl_port(root->dev.parent);
> -	if (!is_cxl_root(root)) {
> -		dev_err(dev, "Failed to acquire root port for HDM enable\n");
> -		return -ENODEV;
> -	}
> -
>  	if (!info->mem_enabled) {
>  		rc = devm_cxl_enable_hdm(&port->dev, cxlhdm);
>  		if (rc)
> @@ -435,6 +427,14 @@ int cxl_hdm_decode_init(struct cxl_dev_state *cxlds, struct cxl_hdm *cxlhdm,
>  		return devm_cxl_enable_mem(&port->dev, cxlds);
>  	}
>  
> +	root = to_cxl_port(port->dev.parent);
> +	while (!is_cxl_root(root) && is_cxl_port(root->dev.parent))
> +		root = to_cxl_port(root->dev.parent);
> +	if (!is_cxl_root(root)) {
> +		dev_err(dev, "Failed to acquire root port for HDM enable\n");
> +		return -ENODEV;
> +	}
> +
>  	for (i = 0, allowed = 0; i < info->ranges; i++) {
>  		struct device *cxld_dev;
>  
> -- 
> 2.39.5
> 
