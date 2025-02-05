Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967F1DE89E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783020; cv=none; b=bk5HM8EwivlfoyZ+TP0CLkNvuLBvxrTomn1wsZHMMMNXd98Q8P9JtMVyUSJbZsIwwc3CC+KYaGG7FjT04HzwEQPQUgYroGilZ+EAX5r9OvD8RNov8+iOGqSLPWY6/cyG9oYuVb6CLRPLstqo1cKoEIRPGg8yxVfkSmePXUoWWOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783020; c=relaxed/simple;
	bh=mD7XWDvuIrkysisDXIVc/LntT2RD6K7r7e4lNQkKiXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtmF6PrT9OHng7IO5AhKu1SR+ltI2Q9pcyrJ3OgAZwa7XtJaiZCbK9ilGRSMVR+SidTmBByRZpoPe3HZ+w2cqfY1H/S54cm9YYO6CJudtMyZ81VokXzm6/Sl0TLNBIOrkVgWiXS9Z/wANFRht6ucQ3QjHnWwZWlpqhU05i+INoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=N4SOe/e9; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="N4SOe/e9"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46fee2b9c7aso1474001cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738783017; x=1739387817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AyF22ck5wlRe12OagalfFv2Yzfm1UdTCcLrkvea++OY=;
        b=N4SOe/e9hKiJVKHbXzBtbVEFmpqqnzkAg7NMFRkHhES68d5jTKmOqZ6iSP+LWDx0K4
         PYRWpkGSLPu/gHfhfjll1jA+asQswBipplKHGq54G7+0En5dgpzpBTDSP0oJbvbpvKdF
         z6j7mtQnUmHlZ2LyHWeEjcn640fdXhgbX34N1xHV3Bz586nMVB3de63Y5mKhMnsLNoIa
         8OSGvovPXrjdhOlxn9gIpxcqMcNkbwERx0pkkP5ZVGeg4d4W7Qf97dycQndhFWlOIXow
         ZBxJjoDR52E8CHmvnpsP29D0Y+iG98IpNsZOzJ4/PvD/iOtO3tihCmJx5FEBTNkyoL7d
         E7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783017; x=1739387817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyF22ck5wlRe12OagalfFv2Yzfm1UdTCcLrkvea++OY=;
        b=Oro2thHqxscJHXafoQz4lWAHsA+tQh2w8p1VDoglRMfatctDWryWnhqX1gmPTDQ1GS
         7ytQI7zZnuBmdR1ER6UIi1FAp6f60WVQ8q8+clVbuyrwhJOPqBMdJGE6U8xooH+2EcDI
         LdRxycEngpnvw0RaNHa1dqzt38c1HiAL0jbVblLs1gENisoKNHPoQNMieeuaA+FWuPEZ
         wcC34HDD99+Q1DOyuDWLsqBdWimuWtCY1j12YtBwKPtfrZCowtqYQEoMEnTjJNMjJbh1
         uy57cLflLx22/Y7/wADYPckdOCjt6kObWOLPlbbaCq8UprSJMI7kir0/8LyUzpVoCILQ
         GPLA==
X-Forwarded-Encrypted: i=1; AJvYcCWsv35gbWOd8szVMHCIgeGnDpd8bhOqrjwjYioW4isYg9tK5Mb+VpTlaKgjITeOju7ORTwELv24EYe+2NM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG3+/8zXJFo2k8nFd7H/7+6OPD7R7jOMDj8me1/iIDDRv7GNoG
	7cjNOaNAGaJ9D4tmgYVTE3TLroZiqTuWtMi/fqQVwJbW/N9GtxhCBSVZ4Y/GAhc=
X-Gm-Gg: ASbGncvVn3NAM7ZKgcqYnO0P2r6UX3HhW2penjm4Gcl4+Nwy5KQdndkhiifN/+1FBQY
	XOV3/8452SbuXGklLQySZoprTR5icFgk+AjMuyXioaqUnKBE/3/qA5DR54GtDmBl/2o5X+WvwdH
	bubxVrL4GrUWzt9vve//iDxB2J3GOZcvZi5QpCPJsW8FIv2dML52IDHOf+jZMPcC9OQ8UCgN1aC
	x0JlgyZ046lV9IhAD8ujH4l1hAYNsS3ErAqCFSQdLQG9wE4hi1mxlP8CToyCH4EWkqx5NdtDHCi
	BBwZZCu8AFREXdoPpeVyBHYBQ2LbfBT3iZZpbdaCGCBbXnXh1heoqqzL1EVqGLBtCpJjfv228w=
	=
X-Google-Smtp-Source: AGHT+IGT+yTwoj6CP/vGkbljNLoLAl7MggI/BIq25DtBgr/RTTH+LQZsYYwhHhuY7OgWFev0tmt1Nw==
X-Received: by 2002:a05:622a:1826:b0:46c:7651:158c with SMTP id d75a77b69052e-470282f1ee9mr41819711cf.48.1738783017294;
        Wed, 05 Feb 2025 11:16:57 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf189497sm73560951cf.73.2025.02.05.11.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:16:56 -0800 (PST)
Date: Wed, 5 Feb 2025 14:16:54 -0500
From: Gregory Price <gourry@gourry.net>
To: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v6 2/6] efi/cper, cxl: Make definitions and structures
 global
Message-ID: <Z6O5JqL30lFr4S8Q@gourry-fedora-PF4VCD3F>
References: <20250123084421.127697-1-Smita.KoralahalliChannabasappa@amd.com>
 <20250123084421.127697-3-Smita.KoralahalliChannabasappa@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123084421.127697-3-Smita.KoralahalliChannabasappa@amd.com>

On Thu, Jan 23, 2025 at 08:44:17AM +0000, Smita Koralahalli wrote:
> In preparation to add tracepoint support, move protocol error UUID
> definition to a common location, Also, make struct CXL RAS capability,
> cxl_cper_sec_prot_err and CPER validation flags global for use across
> different modules.
> 
> Signed-off-by: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>

Reveiwed-by: Gregory Price <gourry@gourry.net>

