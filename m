Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E1619D8AC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937025; cv=none; b=cUpyiYCSLpS/aEmcEC7xCLjM0iYLE3LTDot8bsMSMzP/uKVypz7lDabsTXN4nMd19uQRhV8Dnrob+xMMgK30Od2K6159ll/+cY7udBv/K2GgIV1db2LQqJy5/Uhn7zwJvZg4iFGSCOQcq8ayf5uMV9EnKZQ+6QMftiCOja28qEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937025; c=relaxed/simple;
	bh=qv8H3zH7NTCkdnryDBQLNZNb1rVzn06gbKOcxntxchI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFsgQ3w5tO9WSyrT6J5GC1jE7q+xiWpmNpo16V7Q+UT93JaM8s1GVgncQayz0J+fTa1YY1qjbNoNqCWKslQZqackm5opJ6Vl4THeOU0q48RXdHZHhfCy7Kbk/HlFxhnjfh4OFvFHaqUwZUh28IBbNqGsjjMNN/r5cj14kG0Dw6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3PHomMp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3PHomMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747937024; x=1779473024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qv8H3zH7NTCkdnryDBQLNZNb1rVzn06gbKOcxntxchI=;
  b=n3PHomMpFCjAh18Ips4EfkxlJ1I8+6x/vTmTeGGrMlwkHs6iSkRaLiXR
   Snj21k+REUN6JX40D0UjUr6P3ThKYPTZwZHbu0JsggN3z2o4W268zjDtg
   hGg8BbxziwpBwgD9lg7O62Mf6LvnXDlxlc4TwZytLpVXM4OjuqsPl4PB5
   yPid/BC+a1FwDq7ah78vHZh8v5s2bgVXxQy7V6pzNANT4384g065O7r3+
   uTHLZ8fc1qh9ztfihk7qu4djlZK4QtnxK/odSaO+mIaJXSKMAMngIU5/L
   10W+PHFLVCXUPQ9hErEhpoNddkSd+XNmNJGgi4FbxETZQSjIlmPdK7xy3
   Q==;
X-CSE-ConnectionGUID: xZ22urXUTaCMDan+eQhhnA==
X-CSE-MsgGUID: jepOce5dTfiV0yUvCHFjdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50125298"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50125298"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 11:03:43 -0700
X-CSE-ConnectionGUID: orDlWroCRgeuWu+24SM17A==
X-CSE-MsgGUID: u3KXqVsyR3Kf/x0BbYSENw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="141130130"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 11:03:43 -0700
Date: Thu, 22 May 2025 11:03:38 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 3/7] x86/bugs: Exit early if return thunk is already
 set
Message-ID: <20250522180338.uddvg6hm45soshpg@desk>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-3-70e2598e932c@linux.intel.com>
 <e7453122-54c4-454c-871f-dcb7179506ec@suse.com>
 <4b60f99e-ae4d-49ae-b886-21e7377abe51@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b60f99e-ae4d-49ae-b886-21e7377abe51@suse.com>

On Thu, May 22, 2025 at 01:26:16PM +0300, Nikolay Borisov wrote:
> 
> 
> On 5/22/25 13:22, Nikolay Borisov wrote:
> > 
> > 
> > On 5/22/25 05:44, Pawan Gupta wrote:
> > > ITS and retbleed can both set CDT return thunk. If the exact same return
> > > thunk is already set, avoid the warning and exit early.
> > 
> > According to the code there is only a single call which sets the CDT
> > thunkand its in retbleed_apply_mitigation() if RETBLEED_MITIGATION_STUFF
> > is being used.
> > 
> > ITS OTOH only sets 'its_return_thunk'.
> > 
> > While the patch itself is not wrong, the description doesn't reflect the
> > current code?
> 
> So this is in preparation to allowing ITS to select the CDT, but this must
> be mentioned explicitly or simply squash this change into 'x86/its: Remove
> =stuff dependency on retbleed'

Right, will update the commit message.
