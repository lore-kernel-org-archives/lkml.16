Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4C1FFC54;
	Mon,  5 May 2025 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449928; cv=none; b=PhZ8N2Hb/VPaUjWo5aQUJrWlEhc4r2Pmey27G2/qixrwdV+qXsoQNDzl6bGzz1CFuugR1ZJ8J4WkQ/gKzcs4vh5ckRCjUOXRr0f1Loy3wJYwXnNLNIixzirs4zy/5csFWj7nMiQkfYCHxytwcFPNrC834Hkh8NofK/9eJnu5IyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449928; c=relaxed/simple;
	bh=sNmtbDYyAH0QhdlAVyLq1vp0uWmcDyuaUF8/6fzv6SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPmS5hisULCQsQi1a3BXtRQqNsCBZ5AU22FG+cS8H+XAK1BUbKe3jSz5VzCWnaXsABIv8woZZfaBrj1p1+0liWAQ8gCusLC35FuraZaVvvlTeM4ob9hjGgBIKdetu++QaybAnJFlVnII5qm76Q5hRA4wgE/mECK2JWI65NVtiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cf8OQu6H; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cf8OQu6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746449927; x=1777985927;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sNmtbDYyAH0QhdlAVyLq1vp0uWmcDyuaUF8/6fzv6SU=;
  b=Cf8OQu6H4jOSornSXQ5pKB7mB3h27WUv2qK2zS+rOsgFxTUjtrFO7Sil
   TjWKbWyEIhMcjV+zk1UJHpMHD+WPzraXZJuAHNzRiqgfqggW/YXdF1n/3
   rOJvUjG6gBPcQSBFvuFqYFHR8xOXk5g5UG5MqwnaNsLn5mYdej89Q8As9
   wQdN9BzOvo/rHb4WYfR5DuExppEpNjScrb8pe1KCtwH45DEvBfSE4D9oc
   Dgu9ORLX8eTW12DB7m5fyR2y+QfLnuKcR2Xl9sUOn2zypXjd/vS3jwEc5
   UsNjlES9vQsKRo3FBKswuqU6zjLtuxwCJr4BelFkgFoHLvygAyIhQIBQH
   Q==;
X-CSE-ConnectionGUID: jL8189nsTdqT7wf0hF4i4A==
X-CSE-MsgGUID: XNgEARydRWWZ62I7iidhBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51864137"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51864137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 05:58:47 -0700
X-CSE-ConnectionGUID: EwyPKLVdRHmygFvOuKFeGQ==
X-CSE-MsgGUID: /sEBP1+/TQ608Uge10qMnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135757610"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.105.120]) ([10.246.105.120])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 05:58:43 -0700
Message-ID: <e1be89ec-186b-4195-90c2-bd97e50b01f4@linux.intel.com>
Date: Mon, 5 May 2025 20:58:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ASoC: intel/sdw_utils: Assign initial value in
 asoc_sdw_rt_amp_spk_rtd_init()
To: I Hsin Cheng <richard120310@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.dev, Vijendar.Mukunda@amd.com,
 peter.ujfalusi@linux.intel.com, peterz@infradead.org,
 christophe.jaillet@wanadoo.fr, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, bard.liao@intel.com
References: <20250505074142.615408-1-richard120310@gmail.com>
 <2933e4c7-fc4c-4161-afee-cd6abcd79ef5@linux.intel.com>
 <aBizHlY-UxnBsNDs@vaxr-BM6660-BM6360>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <aBizHlY-UxnBsNDs@vaxr-BM6660-BM6360>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/5/2025 8:46 PM, I Hsin Cheng wrote:
> On Mon, May 05, 2025 at 04:27:04PM +0800, Liao, Bard wrote:

> 
> Hi,
> 
> Thanks for your kindly review!
> 
>> The existing name_prefix is with either "-1" or "-2". But we can't make
>> the assumption in the asoc_sdw_rt_amp_spk_rtd_init() helper. We might
>> have "-3", "-4" etc in the future.
>>
> I get it, so in that case we should stick with current implementation
> then. For "ret"'s initial value, do you think "-EINVAL" is ok or do you
> prefer other value to be used ?

-EINVAL is good to me.

> I'll refine commit message and send a formal v2 patch with your
> preference.
> 
> Best regards,
> I Hsin Cheng
> 


