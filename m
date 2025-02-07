Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD418DF80
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945259; cv=none; b=nhDQ2dq/5BpQc+5xirgCCpPSF8FdrZL9UyRjU3l606gCp5CiFzAHU7H9UkvCgZdWKvVm265FY4yfAOU0pWgz9UsdxyHmU7Yq+kKw5vU7gkV1in7yHt5bMEqRev76rdPeKyG9vWeHlpTh5P16UAkZGhFIjce1pVH2Ti5wmA52DNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945259; c=relaxed/simple;
	bh=bwi1mR0efbQ0atvsf4qyXQh1PcxIKVAfo5HJr4vIwBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slvfMI8ZPyPQOnvqSwSItkEHq8rP7z4YcRq7vXXckYgwMmv1nvde0fSHe+90g7GCY2ABQ796U4ORr8MzS3VFAsKSG5VaevXUFnnQxS1qJnc2GTsvjzI33pp0lBexEjb+zgQU60BG1CYa7aQMqlIvoSjChXJDwyiLrOkI19TksWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CYx9opYh; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CYx9opYh"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46fee2b9c7aso19029911cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738945256; x=1739550056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh9k4RZRdW11QvhV/2SGJLjBOH6F/bON3N22ZTDSXWM=;
        b=CYx9opYhl31q/2AYWjYpTqcdTHyxH+OLIynlUI46WOYqRrnxYlGhj1rPs4rcg8xuck
         ti6YhnO7NmzTUYciW4kPEp+WjCYktggUgRXczvuYl/UwY8I3lvEpYCUXxDWCxfugS5ER
         sA2Gge3sZNXDjVjewX/oAC5li6RukBD7D2wmdk+0fYBrl+OWmDTjZwC3n2FsxYBTrQx3
         OCPTKpZErF0vxgPRw01/Qkqnlz/+L43NNcN/3i5D7v056e6W1NN2ci2/+U9ik1UXOlq0
         lXUndeXKh5OoF2p9Sy82tGxhRl7QFBfoU/wPTR0IZBVmL5ka9mr9xA/nwJhV65VVwdnx
         GZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945256; x=1739550056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh9k4RZRdW11QvhV/2SGJLjBOH6F/bON3N22ZTDSXWM=;
        b=sDHE4RDFqVm8tHxSjk1pV3xLjronZ3MAtRUKSFS1MRci/GSR9DhITCFMadEhXCwn2R
         hHmVu0103i6L1fGf1QTh4f7ewR53ueIdzFf9eDLSV0DP+0t3WtrrDYyOwPrR979gJApg
         1UwFecJaQMWHynuEQyBDXg5B+XCLxNA+uq6IDqThEuGyeM6QTHkPeKJ18UUg//Ih3eMy
         On7CUKhNMywfGnzFXoE2bUrPJbtb+aCC6s+6gtbgZfbj89ZjwdrB5lDfK6oA95RbBtPT
         zVX1fRGXrVZgyvdgl9/LP6Um/QOE4hN5a4fQ9iIvLiFZdSx+9tgPVBIWDk9qpTFeJ0EN
         GUPw==
X-Forwarded-Encrypted: i=1; AJvYcCVJBimexHJW1pX2tf/T9y6Tmb5H5+hqDX/ZmHInp9qQaKw81yZMaRhsd1aExsdMGtToftkiMyhS/bgiV1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUWLoWA2zKDjih3L1aZg2Mbc1tyEKIRtp2X1fT/hj0UbNdInb
	TTuRNFn691J14E7gdxpir2oKTAI90wwiTqbGj/ZV+of6tOaYZHhIHcpLCJgNgew=
X-Gm-Gg: ASbGncvbZNE5lvDQrqTQmQdQbtuySkiydYZ3ZENL0c+Zho04rL678wtCZU5gyI/bJ/W
	4hnAP2leoXFI91OJu58owHG3AdX1WpRzpgCvoCQUz8/Vq/6JYZHQMHyJhNMrYJUaSkrTABGtcTG
	nqCOO6cfQCi1clCIudmkpvq8JHyeLaAucSKEZ4FtJANBnKC2d9jJQ3eQHLtlZSTey8flVSf2T3+
	1gNNokGYXgFUxegOtAyPX3noRet6DhSiYQVx4RmZO7HmrXGnfB5tHKj892G6REJcLf3kuIp6uAI
	vY2P0E/4rnO8MEWi0L7GIH1fBY5IltpLAvQiog7miqLjJJ+np9/o8yi9Rii3oGLSc3m6acNJzg=
	=
X-Google-Smtp-Source: AGHT+IHfuMkCN7VI9i7zAcNVQCDg6hfiIOa2gJKTgYg7HpSOH5m5OFmnvpJ9q/S/aX79khHSIkkimA==
X-Received: by 2002:ac8:7d13:0:b0:467:6617:2ed4 with SMTP id d75a77b69052e-47167ac37dfmr45777701cf.40.1738945256394;
        Fri, 07 Feb 2025 08:20:56 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bc6b76sm18119641cf.59.2025.02.07.08.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:56 -0800 (PST)
Date: Fri, 7 Feb 2025 11:20:54 -0500
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
Subject: Re: [PATCH v2 10/18] cxl/region: Factor out code to find a root
 decoder's region
Message-ID: <Z6Yy5l5xNanh7o1N@gourry-fedora-PF4VCD3F>
References: <20250207153753.418849-1-rrichter@amd.com>
 <20250207153753.418849-11-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207153753.418849-11-rrichter@amd.com>

On Fri, Feb 07, 2025 at 04:37:45PM +0100, Robert Richter wrote:
> In function cxl_add_to_region() there is code to determine a root
> decoder's region. Factor that code out. This is in preparation to
> further rework and simplify function cxl_add_to_region().
> 
> No functional changes.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>
