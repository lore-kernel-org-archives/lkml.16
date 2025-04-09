Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA111C5F25
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744238941; cv=none; b=hPPfCsqc1fql7WDHiAwp/uvDDl57448eZ7uEV6BS9M8K0ty70KgHrsRRBQBCnDj55fZjVwj1XJW1kis9XWJo3mC1eLn3fW3F41BvsVWdFeoIlhs9ZoD/XamnyQ5xpccy4xPXAht59TK0hWR+YMfAYK+2dbpR7q/QZHkuYosUH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744238941; c=relaxed/simple;
	bh=9EcjlMK/aECC7Z0EsbqajEnUDd5WSMpfa5B3tFPhdFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es88k+4pY/as+m0FY3hhGHJ6wxJ65kt/nfwmX8fsWkSkydCBJKubYrp13DpnfnoX1l00IMnoFFf5VAt2bqXSVdLvEO5DrpNauovFhaemePSl2nfwqGVrxLKvgYOnbO1osqwxnIWhTcxi3a76SM1zn9M0NpLAHAQAy0JGErBeujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=n/ZNJXzN; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="n/ZNJXzN"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5b8d13f73so25922485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744238938; x=1744843738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/htfkjUcjTtbQhaXMacTvcz8vKgEhUM6n8QlQjKIc+g=;
        b=n/ZNJXzNImeMnsC7T2HkKc3crA7DrrwB0ADNlA2K2WBVm9jhe+3S7feWANjbM/lNeQ
         lt7MiTNVhBGOtdjuQgNbYt5/5LzoTpymgCgYyvtiXjrqN+jLKN9BKR6WO1mmeX77AGfw
         IqVpLxpoPWPIxqsYSP50i6tPGyibURq4D6ZCuJgJD4filzWp5+m69bwatxAK08180+zF
         FBwcikKT2g286CDXLsOsuOc6TWn/Xv3BoLyH2FGOH7vGRi0RkrN3wkazTF1iDpv6Ld+N
         y8OSkVnU4gNSquBYsqESbp943OdTVwE4O4fcJ16aqbm5Fwo3CZCDtZ/NnuLGgrsDepjF
         fKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744238938; x=1744843738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/htfkjUcjTtbQhaXMacTvcz8vKgEhUM6n8QlQjKIc+g=;
        b=But8lWesxeocktbp+ZWvRMunMNpsC503z56fvnTn5jj7amsKtgbLajNuShg7iSX08p
         0kjZA0UZc9FJT9onjuKbhLcAdnfGZLe4Zz+Mhhibj40/LbhlimTbh8dAWswaanRfOK+1
         qIYVYLwyHFD1i9DAHE6qAVQYkZBEtqGDOvwFV1QVQOyI3fU4dMeihx9C4n8dqggmxCmp
         EREXoWMWseW7Ii4gZ5G3O7NvJaQ2kF3zFCEMUUF/psxc8HD9mlPN+Df8RSGkRUUin2Li
         C0/32I6QKGoWX8ZdbYx2ujuz8q4sDehYfkiTCFHuhNQyy2pZlFfc7PWgts1WBKNF9te4
         uMSA==
X-Forwarded-Encrypted: i=1; AJvYcCVK1g9vvQOvBYlRgLHsrJ+7XzE8R7E9ZOETc2RY4I+hEKJxKIgY4ocix7DAqhPmNj/G47u/OChMuL2Xaqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjjw8kHq6DIgLKqozVK93nDS2mE/qab3pTP7ITCy+P5bX+vYQr
	U55CHGGtWC/1divR75zryLbLslxbXLyz8voyaq+NAgoSMuSEpdXld96BS12uQ5Y=
X-Gm-Gg: ASbGncvSv8OIPkiDnLyaQqI9lZ8Uq2bmQwGJhnTWJ7q8FPwlrPqYgKbfpDKpYq56T+p
	vqGAkU2JsKwtzuwAaK8YPr4N8ZVy4iov2P97NbXPXS8Kn6qLXsKsDLfHu3lzV5M5wqzB75mDPyj
	09g6Jl48Wb713IxC9JPQmk2sdeYZo7ukdFVJL95tw6R7QHuklI6iIQwitWzh1lUDwaaFyzFtXOJ
	AcuPadyknprzDtUDVMlSy53intYiloYdTpThxqXHpEXzv4e3HkHxf0Vf7BKY6twauDX0Dn63zz9
	IyjNM4St0Z2uD43agdlXZ2P9tu03osl/Z+/Mzw5pnXf6DfY3F7cDbw==
X-Google-Smtp-Source: AGHT+IEKFpKNfsSWwOgoi6DRSObHn0c2ff/NBOM3pXCDlmuVPinzb7ITQcqd7tkPTc6RK5Po6EYdag==
X-Received: by 2002:a05:620a:1712:b0:7c5:dfe6:222a with SMTP id af79cd13be357-7c7a81b14fbmr21927485a.42.1744238937941;
        Wed, 09 Apr 2025 15:48:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2607:fb91:e45:4a49:ba4d:3fcc:71ac:af2a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a10d0ec7sm126492885a.59.2025.04.09.15.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 15:48:57 -0700 (PDT)
Date: Wed, 9 Apr 2025 18:48:54 -0400
From: Gregory Price <gourry@gourry.net>
To: Alison Schofield <alison.schofield@intel.com>
Cc: linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dan.j.williams@intel.com, vishal.l.verma@intel.com,
	dave.jiang@intel.com, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] DAX: warn when kmem regions are truncated for memory
 block alignment.
Message-ID: <Z_b5VsY0S5cihYga@gourry-fedora-PF4VCD3F>
References: <20250402015920.819077-1-gourry@gourry.net>
 <Z_bzAapzjzFR3u_P@aschofie-mobl2.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_bzAapzjzFR3u_P@aschofie-mobl2.lan>

On Wed, Apr 09, 2025 at 03:21:53PM -0700, Alison Schofield wrote:
> Existing unit test 'daxctl-devices.sh' hits this case:
> [   52.547521] kmem dax3.0: DAX region truncated by 62.0 MiB due to alignment
> 
> Tested-by: Alison Schofield <alison.schofield@intel.com>
>

Thanks for testing, good to know there's an existing test for this

will respin w/ Jonathan's recommendations and tags.

~Gregory
