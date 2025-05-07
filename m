Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B71ADC83;
	Wed,  7 May 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614235; cv=none; b=TurFjsqxUGRikE33YUQ7PZjMl/BuKoCyBB4Su5UZnhcrTY13XFLrgYwLn1Y+xZaEoP0XfR0wNoM5l0BzDzntvt4+bm1Z2sQXvWwKNkaFPsTmc17Xl+r3pkuOOUrnOtPe6NQYsh0CFhFCepAu0ZMAJd1fO9wr2+h1imCu2je32fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614235; c=relaxed/simple;
	bh=PKmzPKZxLGibTaDENTnxKC2Jk9tltj9S9C8tWItvg7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ln7+tAnT1QRqQJs0TFfAQeAFIdNnKvQcSCpjKHFZb4tAtJt2U+981h0YxfPgSYfftS4eDzV/mVpqKJ9CJNv+foX79CmDOvJl+gJRWz+Pw5aj/CHJDVSjZqeIXUmhN6ytHbBV7KrJx2TsUtAFCDigGEVH0OOXU4KJUhGVtLs3Vts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ic/NYBaf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ic/NYBaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614233; x=1778150233;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=PKmzPKZxLGibTaDENTnxKC2Jk9tltj9S9C8tWItvg7o=;
  b=ic/NYBafHIPwHHjH3JyA11ZttxQ0AxDDJSPPighSOMVrp2jg3hAg+xlO
   WCfVntKRAic2DykRjd5eGV1GVbSCbSA3mZSXp+ql31x/h8sagByhvTutf
   s7TVLJNkmjQVIbK7rnFAUaeJRPJ48csNaK7envuh1wJSZRqoa/P054J9p
   fWYRDQ6xOK8Xp3a1BZ/BvEczMpWwpksbxyILSxhrAZOvm3Sl/grh75LBq
   F3QzPyno7cy0d3WE0JuB9s/NbO40QvHgUcGAqAHVQENoa2qo+pr4Hn0ae
   7/Rehq7Wlt0CLmRaNjVpbi9qU0Vgy2Vwb75E+pcqlDB1ojl0mHdMtBUcu
   Q==;
X-CSE-ConnectionGUID: 1MHbS4LXS2SBIHR9uQQUaw==
X-CSE-MsgGUID: lUt7nN8rR+eNvM5GKbvNrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48239725"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48239725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:11 -0700
X-CSE-ConnectionGUID: PB5RQWOcQgqFos+s6XKWiQ==
X-CSE-MsgGUID: dSRaCutFRzO/XEivz75tsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136438711"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250506163531.1061185-1-srinivas.pandruvada@linux.intel.com>
References: <20250506163531.1061185-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v2 0/3] platform/x86: ISST: SST PP and TF revision 2
Message-Id: <174661422459.2744.1628875111773039987.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 13:37:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 May 2025 09:35:28 -0700, Srinivas Pandruvada wrote:

> Add support for SST PP and TF revison 2 support.
> 
> Changes:
> - Minor change related to variable name and change to define
> - Add additional patch to update minor rev
> 
> Srinivas Pandruvada (3):
>   platform/x86: ISST: Support SST-TF revision 2
>   platform/x86: ISST: Support SST-PP revision 2
>   platform/x86: ISST: Update minor version
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: ISST: Support SST-TF revision 2
      commit: 61d5aeb2f7b3f6f478be2b2804a0f55e210b8e25
[2/3] platform/x86: ISST: Support SST-PP revision 2
      commit: 3b6cac219e2fab41168e0a9536263bf4d1f422d4
[3/3] platform/x86: ISST: Update minor version
      commit: 05e9065edb7a4f0de08d8978621ce4f7da8d4891

--
 i.

