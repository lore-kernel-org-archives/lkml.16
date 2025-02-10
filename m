Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7994257AEE
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213043; cv=none; b=eoLo2VqEBU477nfE8AkvQtSHfxc6jxBiKpDpoTSsZsb63MGQEMaBOsZ0UnRiFxIgjBpLKLHnvWGzi6Wna8e6J4IHoz+knmnFQqqRJM9leQrZ47nqkTVe/SobamRPVCo2z8zissWLOvs6nPGYSmxiRLLnYR7wuQq9U7XcZtARKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213043; c=relaxed/simple;
	bh=g+RLLz/xLn8yq3bJBjBR4VvexLtC/q9+LhWR2+/8h0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOXBSTsNqhebTF+PFaaccmycz0UDUJB7EQbnMXcGkGDfSbTmHsScXWs1YBehGsPE2mHdT5WO6E3dt/tIydaF7tXjEhzZRRyHW+0xEyfDSlfdMJHDLvbX8fLL0X/kjhZeNcBV0b7eOWtmIF3N44Fyc8JMjFZ3YsGO/AY0GpPtl8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Qy5FLFnL; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Qy5FLFnL"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e432beabbdso35032086d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1739213040; x=1739817840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mKqmSL2H/APhjIZ2w+BTA5IvzYblxi2A05dvCygiAwA=;
        b=Qy5FLFnLjh32XI1zhzBCAjmSj/G5+YjKBZtlgsqxR6DVQYTLKlOB55yhBl42YjN9AV
         Qk4tvo9s4UxLngjTQRR5vMIrBuuV9Q/mpQbWBemdu1FHjyDyWFZmlbQJjnWy2k91Kdw0
         lZi6ysDQSmjAaFzcOWHXZdkYUdj1Idm4vwnTf+3rtVCM8biyT2NaqogR1pVEMf+7ERbK
         jVNJ04yacpJJ7PFFSZgGIweFYlWf6bp4TqWBldtlqjC7x08FXMgS60imNiQ0h47TP6FN
         pV8eiaPwtcr+sQ5kyYG1euniON+TOAOxZS48wuElJbRlIfc7oekjUDW68kJIXuXgMYA2
         Z9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213040; x=1739817840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKqmSL2H/APhjIZ2w+BTA5IvzYblxi2A05dvCygiAwA=;
        b=dnY8TphSAEfp1A3vMQde3ta9MyUcXFSI/WvwBGM/mzoW87C4/9Nm3Kf6aDPv6lTrf/
         LXr+Uaw4juBdetUpoTXWd5pbkncaFuUrQc63Px2YFg5z6wYtxYwVG0L5UfvsN8BQUpkd
         GdkenFvau6AMAOr9PKn+xRt/XknsfaiLhZRAQr5r30Stn3FHaSAQJZbJFrjcNriRc0Yt
         i7C/xUQt+LHrMjKY2MWiZ9n5ffQrbdOatVCdeeP2MW2Osfs0UXcUCyDSzfxo2gKis6MA
         AKDB3MyUymLepv8IcATGOb+CFa+YXhKCIZAxZtFV+l8/iLmweTOWSiCxUEGb1spgV1MO
         hd1g==
X-Forwarded-Encrypted: i=1; AJvYcCUHlElc230P02oWUoierlQmAeC1XoeIef5cGrahdy8Nt+f/5miU6OlX12OHpvWoquVsVyNU/h4eHOthxGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTyHO5xGx/8xgH1YweOJa8oHofUvUuh96XtxLqqPZekRO2j1MP
	wrJp7uXH0CMNsXHemfZD9W+HB9MbnDo5xGqWuUCYiFlRuAhx3GuhTL16ysuY+N4=
X-Gm-Gg: ASbGncuQYEoiU+nqZGUG9aSdrUhm0iC7vIYqGyZXZQ1f0uKxSVX/MRXsCKLQ1HlcTAo
	8nvvVt0VGh93hewH6tkJxGepiEJaIMHroLCQNfqQHOWia+8pV9+0YBwgL1dzUmsaejLLWq/Tzrs
	nfbwltBjVI0KyjAeOCbF2wOWIvEcLKbOxnGZ0eft4f2rVw0a1ag5uv4ks0uHT7O1ENRzthtLJQH
	z/L3E/l2c8p7zQ7m27B/86oNxKH+w4D8Unx5K4Y3XzwqoL4Fq6Iya1LAf9jt7iRMENeCpBXDOLJ
	P92KjLlc6rYUXIb1SBPZHs3YFnmsWqA0r4kxbXBsb5/XGoeWCvghlHjTigOkJuI2RmjUqBIO0g=
	=
X-Google-Smtp-Source: AGHT+IGPN0vUu+9xImUv/0T7AL/p7HAa65vynZmWp2hLCNl+jzDCkk1rpyc+ciMt5y0usbsQ2BCrTA==
X-Received: by 2002:a05:6214:21a1:b0:6d4:215d:91b9 with SMTP id 6a1803df08f44-6e4455e6ed1mr222298246d6.11.1739213040662;
        Mon, 10 Feb 2025 10:44:00 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43dd7818esm47643626d6.68.2025.02.10.10.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:44:00 -0800 (PST)
Date: Mon, 10 Feb 2025 13:43:58 -0500
From: Gregory Price <gourry@gourry.net>
To: Terry Bowman <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com
Subject: Re: [PATCH v6 06/17] PCI/AER: Add CXL PCIe Port uncorrectable error
 recovery in AER service driver
Message-ID: <Z6pI7oGXYyoecJzG@gourry-fedora-PF4VCD3F>
References: <20250208002941.4135321-1-terry.bowman@amd.com>
 <20250208002941.4135321-7-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208002941.4135321-7-terry.bowman@amd.com>

On Fri, Feb 07, 2025 at 06:29:30PM -0600, Terry Bowman wrote:
> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> index a5c65f79db18..eda532f7440c 100644
> --- a/drivers/cxl/core/pci.c
> +++ b/drivers/cxl/core/pci.c
> @@ -661,10 +661,16 @@ static void __cxl_handle_cor_ras(struct cxl_dev_state *cxlds,
>  
>  	addr = ras_base + CXL_RAS_CORRECTABLE_STATUS_OFFSET;
>  	status = readl(addr);
> -	if (status & CXL_RAS_CORRECTABLE_STATUS_MASK) {
> -		writel(status & CXL_RAS_CORRECTABLE_STATUS_MASK, addr);
> -		trace_cxl_aer_correctable_error(cxlds->cxlmd, status);
> +	if (!(status & CXL_RAS_CORRECTABLE_STATUS_MASK)) {
> +		dev_err(cxl_dev, "%s():%d: CE Status is empty\n", __func__, __LINE__);
> +		return;
>  	}
> +	writel(status & CXL_RAS_CORRECTABLE_STATUS_MASK, addr);
> +
> +	if (is_cxl_memdev(cxl_dev))
> +		trace_cxl_aer_correctable_error(to_cxl_memdev(cxl_dev), status);
> +	else if (is_cxl_port(cxl_dev))
> +		trace_cxl_port_aer_correctable_error(cxl_dev, pcie_dev, status);
                                                              ^^^^^^^^
Parameter isn't added until patch 14 - causes a build error.

~Gregory
