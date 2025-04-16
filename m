Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E402DFA3B;
	Wed, 16 Apr 2025 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786154; cv=none; b=BNo/BhkglbL0q/NNe87u0UzY8ZbhssuVpf4UoFBC8KSp8Tek22JtUbMRMymsF1hNiEpU6ZpSVqJHOMDgvUA7PXbrqMdpm3dxCce9+RdJhNF73MIFEMhTybrD5PRxAgS3+IYNRSX1sXd/NTwgzhr2n+eg3av2YSuEFKqd1kczZyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786154; c=relaxed/simple;
	bh=MtS/yVAht5nt3obzvvJItyMfu5dZzJNb3kRNCJoNAmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHolVa+8jhTM5wAzZZEBM150bjqNmqF0ibJEEp/kVcSdcqOQfpoUCAji5CpC8gM0dficIpWjT6KVmInS2MIi/gYWfM6CDSDgMBYjPDU+Ig383KoefY25eaim/9Cbne0tmEQYWJFeA8TaEoykgLeO0rE4wH2S6oG2S3FoIcvlzew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7ug4lAn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7ug4lAn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744786153; x=1776322153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MtS/yVAht5nt3obzvvJItyMfu5dZzJNb3kRNCJoNAmA=;
  b=Q7ug4lAnKPGvIwJtB2diCdO6jRJDIp7xSc5bDzXXxqluHEqz9H62csrQ
   AdmC0XpAK/N/4DKAiCPQy4QZzbifiW+SDNjjFWI/WrMHSWebuqc8/55/b
   mxjKP9We85ABfkNWCSraib1+5GsXtTOMvWS/RAwLARSAIAAC6UWDzgE4y
   NYA5zl/yGaghXsEFZQQaDUWcuPKZvlu0QIVYeUwbAxjMC+XWaW05YXwVK
   ZeNfGuId9oSBOd74V6DKqTcMuxYMqz2ExJPr9Br4T3cGH/kG8o9K/FEio
   m3vQXPvwHkEanAzN7cvr8WthdGcrElKI9QElez/xbwqYceHLrcaCP284q
   g==;
X-CSE-ConnectionGUID: uscc5MBfSYG6tFOnNBkkHA==
X-CSE-MsgGUID: /+LNpgKOQKK/Ea51HIr87g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="49015526"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="49015526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:49:12 -0700
X-CSE-ConnectionGUID: IoCK9fuFTGWI7qT+baweUw==
X-CSE-MsgGUID: BI2S8IdfRISkwUnEcbe4tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130368711"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:49:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4wa2-0000000Clny-0xlf;
	Wed, 16 Apr 2025 09:49:06 +0300
Date: Wed, 16 Apr 2025 09:49:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	ckeepax@opensource.cirrus.com, heiko@sntech.de,
	shengjiu.wang@nxp.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ak4458: Remove useless return variable
Message-ID: <Z_9S4jPrx5-gX6V2@smile.fi.intel.com>
References: <20250416041023.546311-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416041023.546311-1-nichen@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 12:10:23PM +0800, Chen Ni wrote:
> Remove unnecessary return variable and compress the return logic.

Makes code cleaner and shorter, definitely a win.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


