Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63936199EB7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963455; cv=none; b=nSy2OEEwPE6eypAqeulzz9ozEeAkDCdvuE12xsuIypY5OgUQo0mVg8MlmasR0kwzpz2QpaeBsKpzU0GjVp8G5pXH2Ueg7NHywAoRzYZQzcGS3uRq3qYo+5775M0kFaqQMOnHpR9Qom6o6rlhdjoZE3xN7Kf+zpnxVM8+74/uTmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963455; c=relaxed/simple;
	bh=Jh8bJM2/fI9Ng6LWK2hdPmWaTdsJAUhglOnt064rwcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UW6n4TgP+hJGhoXQV1IwnFg3AsNs7U4N+aMSnFBARpcewE3o4+5C7CX6cvm+1vgmrEwlcdrzKywGXcjsJEv0r8L0WvMBiNYUmHzQFNAeZRlnzMbJzsx/J+t8vKCGH2dOjzLawYWA4Vmxn+GZZEobm0aBDyfOFpFpuOKMbtFm/do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=odQmWd+W; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="odQmWd+W"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e440e64249so22716616d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738963452; x=1739568252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYyXNF2oTW8ZaEdbEsNiifpIRvkBhrKm317n8H4kIGo=;
        b=odQmWd+W3Dxj5N8vfZrbfR3yoHcsLCQQVyMysetv8CBtNjrxqb6yahA7njybQEUmW/
         V5OLzcbtDzFyZHaAGTk5ZK+eJnhskKVum8kqsW0d9ZbVb62fKSkAC80cliIFfxHdQGwH
         pBaHTMHmOX6bxkZpd+GQxlbLz/ZUsuR3t7SoUu/bbifRhJ8bAQe+myf7VQy2MszwtEgF
         +Wy/yYfg4DCjkKsuq7FhBc4KIolDF+FXnqBT4b2iOQoJ44ADjXp4D6N8SuIFuWT264qn
         BizcX4ML/XDzQ1BnlLbFp8988RIZX+5HyD2QurnYQFKgxN7tXtSDXALSoVtdAvaS6Aav
         1NEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963452; x=1739568252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYyXNF2oTW8ZaEdbEsNiifpIRvkBhrKm317n8H4kIGo=;
        b=NNpEgaCptYkVAm+LNj6SerMYBKUfKqxOVfB9sV4mZZkucLYoo78GjdCLs3xCPQOMBK
         Dp5/3IWorwlybtQFekLyY0+s9yykGHswZWQO9S6l41baPaL4ZVncELI2S9Bhp9dAY2zA
         WaI9HbR6lr5iHjDAwOZjdCn9O2SgwvA/Xlv16rHEQMPav5DALSveoqDGYNp90QFrt5cA
         ip3rscUW1zoXD3YsUgZb+ei4lP5lklWrfV7VCxa3Fdb5v6rA4MQ1xSBmclJwQFbgGF+Q
         4gWGMurQPv05O1MkxhZRIIrUCl803uZm0BgViavUR5Vv8/Zz2JcWP4U6ZkPLjUQvBApP
         xYWw==
X-Forwarded-Encrypted: i=1; AJvYcCWq6/XoMHG+a2KVCo92UjpifOeoal+/q3mz2Tkb156Z/GbPvpYQRbjFNI+48siI7L0Plam3Miy3TDaQtBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vY3UoDbeGv2z78MjkRTi3kTB5v6+m5W3/lK5kBbujs3pfZ7k
	kPx4ruRoDUYqcmUYYA4owhFQ1AZoIhRppjLF13u/BuhYGUKyffVmkXd1gGCUEtc=
X-Gm-Gg: ASbGncvAbU2zPVa7wjQeNXa0HzQm2MgAjJjEa0upSuuuKh1p1BG+sr7B34nePuRqBaq
	kc0CaVIXCLkQ8RsiHQ7a8NXEoOwYirGj4GR92xKBdLPeW0QW73C9coRisDXWQV59LXBntMUhSuT
	q1G5pnylGC2/GRbosjAzK2oGXpYCgL0b9kEh+DtgyxG9qkBCcB/ehUAunN6It658tmdBbA16pbe
	C/lq1euJ8EpzDQmO02JnGyY6W3OGaMZ/mlGYTJsNRko3+SWCuCaJ/bT6Ysr4BzsUcVu7ncCgRz8
	24jMZEHL5ml2snItgCZyXsSq2rNGXkk5HWs3/SwcP+hoSGb6tB8blezKduChFPWzuOawpbiioA=
	=
X-Google-Smtp-Source: AGHT+IFobMYtRD+ts0IjDmZUcfPs9gYsgQs0G1siAa2ZlSeZodwmtBL8KT228UzP8KiW1YKKcAkJYA==
X-Received: by 2002:ad4:5bc4:0:b0:6e4:41b3:4983 with SMTP id 6a1803df08f44-6e4456dd202mr74890986d6.35.1738963452178;
        Fri, 07 Feb 2025 13:24:12 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44f4835e6sm4336616d6.111.2025.02.07.13.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:24:11 -0800 (PST)
Date: Fri, 7 Feb 2025 16:24:09 -0500
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
Subject: Re: [PATCH v2 00/18] cxl: Address translation support, part 1:
 Cleanups and refactoring
Message-ID: <Z6Z5-UQYSfi7Btlz@gourry-fedora-PF4VCD3F>
References: <20250207153753.418849-1-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207153753.418849-1-rrichter@amd.com>

On Fri, Feb 07, 2025 at 04:37:35PM +0100, Robert Richter wrote:
> This series is the first part of adding support for CXL address
> translation. It contains cleanup and code refactoring in preparation
> of the actual implementation that will be sent in part 2. Cleanup and
> code refactoring have been split in a separate series to reduce the
> number of patches of the series. Even without address translation on
> top this rework improves esp. the region code, cleans it up,
> simplifies it and adds debugging messages to better analyze region
> creation failures:
> 
> Content of patches:
> 
>  * Patches 1: Remove else after return.
> 
>  * Patches 2-4: Cleanups and comments around cxl_hdm_decode_init().
> 
>  * Patches 5, 6, 13: Adding and modifying helper functions.
> 
>  * Patches 7-12, 14: Refactoring of endpoint decoder setup.
> 
>  * Patches 15-18: Adding and modifying debug messages.
> 
> Most of the patches were part of my first submission of v1 [1], some
> of them were already reviewed.
> 
> [1] https://lore.kernel.org/linux-cxl/20250107141015.3367194-1-rrichter@amd.com/
>

For entire series:

Tested-by: Gregory Price <gourry@gourry.net>

Tested individually and w/ a rebase of the full translation patch set from
[1] on a Zen5 platform with PRM and translation.

Will test again with part-2 as I expect some changes.
