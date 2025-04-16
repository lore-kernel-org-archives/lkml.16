Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DECC18787A;
	Wed, 16 Apr 2025 07:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787778; cv=none; b=aKAa4pxYKhohGORnARY3F7fUabBd8npOwzqH+ORfmYJQFD62X8YkY+P4+yxKrsacH1/2KU+1iKwaCM06jXyq7ypqshjsxWNB/HjAd9l+Vt1m+k+gr64C5LmaU5fBTHZGXawJXDf/CkUufZ5KtVisDNHG7jdE6fHUtFTSVO/YEac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787778; c=relaxed/simple;
	bh=C8myiaFqWsaataown0n2Ge3P0lpZ0VUVE2ROm5FM9BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRSPfUOpQabM+GchmCzHLQsEyvTTXpnKfWULhTGaxfM8CfSZJ8DpY2Krk7DUJsRqUR2mtzsIHqaWXFkewRYcQL5D6qztLdxFs7kC3tgEfxBf5cPRUsRuE1yHMPEhMJ+E5FE4uF6XuRzg9H3uXVyOOsTLrTHUD/NFR+5da+SzUsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmBHSpFp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmBHSpFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787776; x=1776323776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C8myiaFqWsaataown0n2Ge3P0lpZ0VUVE2ROm5FM9BA=;
  b=JmBHSpFpgivPBch+6PEQTPkLhBWBqkWT9ZiIMXinu0k5oXcMjA7kixov
   k3v9tt5kPgRghJwBIncJg28NcY6riIxynifCOUNXkftBeXLUppPUrgksk
   rdA4FPSUS513UAV71oprsnX7c+5JMbrtgWEXmb4b459Iz7yLPF90VDZCk
   qJi0BRz6FlaKGQ0NhFWh3y6MO0Pbwk2nHOFEofFV/DvtLYyIdVIbuIlE2
   WbHeReOp15oAJFO+cUyDvrk7xM1WgpRdLgj8/x3F+PSzvbehX8MqtFAwv
   kvOul1CLUafez10U6KrWiorq8zLuik16PFMO+Dahw24lva3naRtN+z+mB
   w==;
X-CSE-ConnectionGUID: 26gaTOmFRC2LjiZOPnwiYA==
X-CSE-MsgGUID: AmPxQ38yQjqVUPihAMFoVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46203189"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46203189"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:16:15 -0700
X-CSE-ConnectionGUID: GfOwOcv/T0ali2sPfkJ87g==
X-CSE-MsgGUID: xfKbddfORuCQNpMRi5DhTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="161309830"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:16:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4x0C-0000000CmGV-1O2g;
	Wed, 16 Apr 2025 10:16:08 +0300
Date: Wed, 16 Apr 2025 10:16:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Alcock <nick.alcock@oracle.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] .gitignore: ignore Python compiled bytecode
Message-ID: <Z_9ZOInQVgx5wtbG@smile.fi.intel.com>
References: <cover.1744786420.git.mchehab+huawei@kernel.org>
 <eb7c854d1bddab19ec1105b928463bb1845d4d50.1744786420.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb7c854d1bddab19ec1105b928463bb1845d4d50.1744786420.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 02:57:39PM +0800, Mauro Carvalho Chehab wrote:
> While the building system doesn't create any Python JIT bytecode,
> if one manually runs kernel-doc.py or get_abi.py, Python will,
> by default, create a bytecode and store it under scripts/lib/*.
> 
> This is normal, and not controlled by the Kernel itself. So,
> add *.pyc as an extension to be ignored.

...

>  *.mod.c
>  *.o
>  *.o.*
> +*.pyc

Shouldn't we prevent the order? (This should go after the "patch")

>  *.patch
>  *.rmeta
>  *.rpm

...

P.S. I'm going to test the first patch (at least) soon.

-- 
With Best Regards,
Andy Shevchenko


