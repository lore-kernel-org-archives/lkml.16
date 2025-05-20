Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B09F1DE2BF;
	Tue, 20 May 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736127; cv=none; b=Q16dBVnn8L4HlRPpnYPOmSPnwUEHpBQHyGgwa0xOulOAt9WKrWdYVajs/GAW2dqmqS52VcYmCNcAXnMvkgBun2zADYU7vkgLtY30UVD97ajXVyV1134DsNNkhAE9MtzZ1rkxZM5w+e9l772GkkF3wIqTmObrFpChm3LVDhWcpuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736127; c=relaxed/simple;
	bh=lhj3h/zvQBN34VlrSnjcLLcOV7A7rxSFqTDiRPsqdMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DYMXBxrwhjOY+Zr4fnNtzCFMCXbLzbTBBIknP5g+ri5yb6GEwYalt5BnWbgUMe40fzp54s9CIbiLTh1l0KdEAipJGYIhMMKEsScoIVy8e3tFoKV2jnodA9VuSewuXOEJwFuOzbf1g7zewQVF40x/dlBo2sj+IFtrThU1xiW3sB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMWLyeS1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMWLyeS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747736126; x=1779272126;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=lhj3h/zvQBN34VlrSnjcLLcOV7A7rxSFqTDiRPsqdMU=;
  b=IMWLyeS1YXRGafO3oMwlOOCDBiRhXBu/QDQkYhOam3LqsAmRmheuLpTX
   9WgEM2nUJSy9bQROk6vwMTI5RvZMRWlj19+pw74B9CsU8DOnQyTjPncAt
   yASisbMyVBDoIjtisS5zUIQXR+1Nb2Z7yoO/1OLH1h65c211eyKte4qh7
   Bznn9GYcwrBrm5RVsKA+2GCHwVS1Gy/JOP0YcMQDsyuH/wxZgZ6xO3JKv
   Pd6+j6amhJTfAvKb3QUs2qE6DsFfmaMUr21QLLp8hx/sRYKEnnmsz3pAC
   uM+qkT8Iig8ghFjVLT31vN1/LUQcWc1djdPT6Ee2h+TFfN1zgD5C1FxKE
   Q==;
X-CSE-ConnectionGUID: IwiAWzexQGe6qHbBJvkoxg==
X-CSE-MsgGUID: N0iloAGLTGKMKa4BtRmRbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49360216"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49360216"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:15:26 -0700
X-CSE-ConnectionGUID: vszWKutSSauZ6JoUt6tDYw==
X-CSE-MsgGUID: fKBEbTx5Qlmhrhdz/N0rjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144637187"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:15:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250520005027.3840705-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250520005027.3840705-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] platform/x86: think-lmi: Fix attribute name usage
 for non-compliant items
Message-Id: <174773611857.1880.17914235275899520904.b4-ty@linux.intel.com>
Date: Tue, 20 May 2025 13:15:18 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 19 May 2025 20:50:18 -0400, Mark Pearson wrote:

> A few, quite rare, WMI attributes have names that are not compatible with
> filenames, e.g. "Intel VT for Directed I/O (VT-d)".
> For these cases the '/' gets replaced with '\' for display, but doesn't
> get switched again when doing the WMI access.
> 
> Fix this by keeping the original attribute name and using that for sending
> commands to the BIOS
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: think-lmi: Fix attribute name usage for non-compliant items
      commit: 8508427a6e21c1ef01ae4c9f4e2675fc99deb949

--
 i.

