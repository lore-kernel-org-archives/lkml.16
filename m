Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375061C5D7A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706396; cv=none; b=jkXFcuhtrBa5yYMFgbsZsFwL1M4MYQTkd4bDXx9q5mBqCQz6bBQ7GV1uijHLMkSUn/+IxSDNrWylg1YI1IvXNnIR7YM8Ayt6EybFeLKX9bO/aaA1rqgI3nKnPqMzBzLucBR+nja5i/O+oIILzumJ5HNCkxzJC9eUSdxk6G28WzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706396; c=relaxed/simple;
	bh=/KzjYP4jGRkOL8tv1XYhP6PhsnBHTBQpvSmWP9PLkkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3UqLNDtQDfH0QOeEwjcRLtA/JA6Auoa0gLlOpnKwn+njCW3ZcJEMPrpvA55LpK+wYGzw7gwsgVvVsBC+9PJQVoWJQ0DOtZ5Sw1uSYjvFsiiPITlKRVkELpLS/ydfXRUwt+dtpZR6Cjlr40IM8qb5dA2zXHktg4Wjmhca+7ZOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bpvhanDW; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bpvhanDW"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a76ea97cefso50352271cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750706394; x=1751311194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc/yka3hfGiPDvvwtGoDtghN7JXKc2MnzeWxQ4J3bkI=;
        b=bpvhanDWrZRD4KArqodsP1nwH0JPliKlVjUo4dQFo8upKAgTyCVu5/XNHgiAutqk/A
         b2o+o8XCaA9p8OXqZVeyegeTZ6lULObDALj2vFnr5xsp1e6s5Yen9rt0AzJjCy2sBhPI
         34NO+MLFxyJplJ/MIP7sR5zAR6EeBq/VAfhEeJUNuB7z45/DWS5CiWtDQKLh2TjM7dxT
         RhxiX+7tguTY8clfb12xBKogkDhHNZ3cRiAeNUGY8nGg80z7+aH6XDF6ckXyrwkO7n5k
         SlOuGC6My5KTfOLATK2te1ZDnTixhj0n5r3RHeaoaULFzItObTutXQJdAo2Bi/TN+FvN
         InWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706394; x=1751311194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc/yka3hfGiPDvvwtGoDtghN7JXKc2MnzeWxQ4J3bkI=;
        b=a6CRhR0vHb2pkX2vwnh1VvZ/VXlo9KDfyzS9eTxp7Wuv2gJsEC+BuT2LHTAwwFIXL+
         wpCsV7NQJ5IvH3KhaPy2GidIR5OJhnRaV4A5JEonGVQ+q6dxTIkB2rIeWnZoQmxvfGLh
         ALB1jtowV5eUoFeSxnZekSo5czOCIespC+wO++Hyd40jTs227n04Na+ZJp61aDwLb6lV
         rHlbMimn6OLJVbZseNTbjCgJyX5puiIhQ3ZDtmfxiWOOq9LhKPfS01qWQjLbgWnisfyE
         1gjdW0JAEvRvKwr5Z9pm1ivOQN09ur4Nrb44qV9n9Xomk8U6x4qGtZLjFjzj7Jo2Cxa2
         Wx+A==
X-Forwarded-Encrypted: i=1; AJvYcCWe9RRx2i4BQGL49WhxYLA53Y7VyfHt5mi7vxW3u73wi4A5ZT+yaBbZpBqcUEfsJvrfx9ZQ0gQddBfeQRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKu/TpvxiZcRyLLd3A41zAMl43/HYpJoMLS5nbEoIX/WYw3irG
	3LpPOsrJYeIHXfLH413Ci/404/VxRptpw+S1LfB+f/uZG+CgFr3S8rTjt00xAY4LbRM=
X-Gm-Gg: ASbGncvD8G2pB3MBsa5m3lYvIooVPCqm4tZkDdR3lzBH3ziHOWSRznG3j47InhtZHR3
	740l2A0IcyEgJFH5sbIOHz1cjwo/G7RE1j6MTuymiEDEdInig/aAmdDiGqC1jnTWKXICw7q8X44
	8w8PsRzCk2hIi3833kWvnxqUC8cePAjQJpKitHP50SbwDqKWvxAjVAHUe4fD/9xwNYf5nkq9Ozo
	IDfxsw+8+Ynr92eEfUOmRKO/TvnWjYeXSfsEaSW1U1pDy+EBdNJzuqy5bZWXQqOkTtJpo4zPb35
	gQEtlFSbXSM1YUmsiOmaHwuXRMhKKasDSS2ixrQe+ZgpekHdpzI/fLSJ1Q==
X-Google-Smtp-Source: AGHT+IEJDgRZZ4nVCbDO5jD8bXYatavVeTWpCEC8bT+J/SLimj0HRJIsJlld3v5/Yfo/JKK58W+zjw==
X-Received: by 2002:a05:6214:268d:b0:6fb:4f9e:957b with SMTP id 6a1803df08f44-6fd0a600403mr207925346d6.43.1750706393967;
        Mon, 23 Jun 2025 12:19:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:e19e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd1dcf1be2sm28135296d6.71.2025.06.23.12.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:19:53 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:19:51 -0500
From: Gregory Price <gourry@gourry.net>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: linux-cxl@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cxl: docs/driver-api/conventions resolve conflicts
 btw CFMWS, LMH, ED
Message-ID: <aFmo18OEZGMA2HU8@gourry-fedora-PF4VCD3F>
References: <20250623152923.1048525-1-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623152923.1048525-1-fabio.m.de.francesco@linux.intel.com>

On Mon, Jun 23, 2025 at 05:29:02PM +0200, Fabio M. De Francesco wrote:
> Add documentation on how to resolve conflicts between CXL Fixed Memory
> Windows, Platform Memory Holes, and Endpoint Decoders.
> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

I won't block a doc update on a suggestion so

Reviewed-by: Gregory Price <gourry@gourry.net>

> +Platform Firmware (BIOS) might reserve part of physical addresses below
> +4 GB (e.g., the Low Memory Hole that describes PCIe memory space for MMIO
> +or a requirement for the greater than 8 way interleave CXL regions starting
> +at address 0). In that case the Window Size value cannot be anymore
> +constrained to the NIW * 256 MB above-mentioned rule.

It might be nice to have a diagram that explains this visually, as it's
difficult for me to understand the implications through words alone...

which is likely why the conflict exists in the first place :]

~Gregory
