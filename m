Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F528C2C6
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 23:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820651; cv=none; b=rIPt7tsNs0vrFP91erN9Lzro4xRdoSMOIy4ORsaJnzEWNL2VDa4YFVgujP4CViTFRCVRbUZ/ydccDU56IssjzrHL3LKGMxxw1B4G4gpx7JoL7SlqX5YX8SVp3dirgI452uJkVMtQG+nOPbEiNvSPSOmgatpU3deq/X3Jeu86bBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820651; c=relaxed/simple;
	bh=SSGlRVBX7Ip3ay6aSI5KJLngtv0nEq6HZf42gbzA32M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO5gbEtmPGXzaWjcF633qNK+Ipn1t3eONMlz3SDZCst3vNUkbh98KYxB53RQX9IuaMdCzSb1yfE90JKy+vbQKGO/sFbSjgEI48XtK/iTbGaLqr+n/Nxciwszat8twKaBZB84IhHWXu/1EVYekwmHqwj1TsNd80fXvICo7qMeUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ALjex9gR; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ALjex9gR"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4947635914aso40355791cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 16:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1748820647; x=1749425447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3ahtq5iYBzerYLsn2L4RRjLdCR+uk5v7bMh9egaPjI=;
        b=ALjex9gRMTmQ50it4soOyvAbAxZmVhMqeTenLVUSlJgmgg2i436msWqW7NPxB+PcGz
         8E71fLpVjbn7fnG32k8Cd33Im37uQienEuVV5aZKfwwRJH/g2N4N0WSPUcHv/YJVB7Me
         vUCq1fJJRACnOIOO82ys7g6agTDGMGelgnXRZMkBRCPcyTJgNNyyNPL4QORouDo0bsWf
         LuiaONA3E5+LirJ8+frAHn94QnCaeSXPMS6UcWmmIxfgNPZMKmu1tTd1z2XgaaH2ZLfK
         s+wdNie7dcETYVAw3m7HcYLpI70eH6OKE/gT4ftKWRzPf9MJRXa9tWRLAiVM0w8zarNq
         p++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748820647; x=1749425447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3ahtq5iYBzerYLsn2L4RRjLdCR+uk5v7bMh9egaPjI=;
        b=no+3jOAPLfhmraJenrHvdN3LLnaGwVV+WzZLbBP2ptytYY/tM68Wor/IwObvfGMlNd
         J/GTV9+n0F30LYL0cyQ4LNLMfJ3+IRJ2WQgE1n5RjRE31xvi2KNvIG1eCMXAQxqsdIrj
         9W7whFMRlTZwV+Aenk9Y1gLCP0OXtNSgNiTsOPLAi6xu5jSOx2r4IHnv5q+5HJCEdTYd
         2r+vpdnMqUWx1akAc4LVtfb1DzxN5Lo1gf4RJxLaFLzqzWIAs7zEeyTKvvaOy8oCPHZQ
         7cdh9+OOE9tabz9Ne74oj3MYcEOAsqa5eHFFe7j1XYfN8BqfMpPQJO9pumiTENuRQM0o
         0zIA==
X-Forwarded-Encrypted: i=1; AJvYcCXO0fyHKczAtcwm0p27wbG/9sBMJiAC+09IVo2O523EUvIJjpQLzE2uC62YWuGP8bn5rJXaMbGZmrIngd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/UoHxOMEaBXzGPIE/RDbNd5VpsvWSFoPrCvsjwzKGmEPJTV6L
	6HWXxG3O27/MyiGiOkaOAAu9V/uQN/3xHrawC7Y9SSVkj9SCtg72PKAKJ9i9+mjGQ5Q=
X-Gm-Gg: ASbGncsAw1wwaCGHuB3xoswxU1RIdNXCS5sDJj112q65ZC/+6QwkYSWy9cYzDc4Ile4
	II4r0P1zJ+szjrai+ScCPTzQsaM+0qrpolIgN/EAzRpiJRJYYHVCU5bdyXszxq9Td6eEF3MrpTz
	P9q8fRUVM+FS3+sjNPlSPNf6iXi/Ag5CZyJUoLcbNKcDGVUI9DKY4/YWb7viNfSdTanWx37vkMB
	NIPJ/QoAWEAMOE9P/tf8HEPn8x1QRsxvMvO6MPu2qIdkPqJEMwMHD4MUBqRaxtSugW/xGPwPaF5
	sdoQ1GZIncsd7yZcBKV4z7uT+kzRpEImtVDr6fOzXtCHrXkxPRjsCh3ie2zbis7HBkib6GPU+nH
	EY6FYLeG4pttWsdfWBrBmrsY1FTGIIJA=
X-Google-Smtp-Source: AGHT+IHAt46IPZ2ZNZ13vLsgj7LdizYMg33TCIokRzOtUXTMz4rVh+t4qoD51lnIbRNNJhpIDOFVlg==
X-Received: by 2002:a05:620a:1a93:b0:7c5:49b7:237c with SMTP id af79cd13be357-7d0a1fb77c1mr1867411185a.27.1748820647265;
        Sun, 01 Jun 2025 16:30:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00cebsm52506366d6.73.2025.06.01.16.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 16:30:46 -0700 (PDT)
Date: Sun, 1 Jun 2025 19:30:44 -0400
From: Gregory Price <gourry@gourry.net>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com, corbet@lwn.net,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Subject: Re: [PATCH] Documentation: cxl: fix typos and improve clarity in
 memory-devices.rst
Message-ID: <aDzipGmldaeje43H@gourry-fedora-PF4VCD3F>
References: <20250531075209.3334261-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531075209.3334261-1-alok.a.tiwari@oracle.com>

On Sat, May 31, 2025 at 12:51:58AM -0700, Alok Tiwari wrote:
> This patch corrects several typographical issues and improves phrasing
> in memory-devices.rst:
> 
> - Fixes duplicate word ("1 one") and adjusts phrasing for clarity.
> - Adds missing hyphen in "on-device".
> - Corrects "a give memory device" to "a given memory device".
> - fix singular/plural "decoder resource" -> "decoder resources".
> - Clarifies "spans to Host Bridges" -> "spans two Host Bridges".
> 
> These changes improve readability and accuracy of the documentation.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  Documentation/driver-api/cxl/memory-devices.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/cxl/memory-devices.rst b/Documentation/driver-api/cxl/memory-devices.rst
> index d732c42526df..e9e2952a967d 100644
> --- a/Documentation/driver-api/cxl/memory-devices.rst
> +++ b/Documentation/driver-api/cxl/memory-devices.rst
> @@ -29,8 +29,8 @@ Platform firmware enumerates a menu of interleave options at the "CXL root port"
>  (Linux term for the top of the CXL decode topology). From there, PCIe topology
>  dictates which endpoints can participate in which Host Bridge decode regimes.
>  Each PCIe Switch in the path between the root and an endpoint introduces a point
> -at which the interleave can be split. For example platform firmware may say at a
> -given range only decodes to 1 one Host Bridge, but that Host Bridge may in turn
> +at which the interleave can be split. For example, platform firmware may say at a
                                                                                ^^^^
If you wouldn't mind, can you also change:                           "at a"  - >  "a"

Otherwise

Reviewed-by: Gregory Price <gourry@gourry.net>
