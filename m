Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1A1FF1D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252534; cv=none; b=rFhRnydtxU96SnQ3NwrWhqPReuQTX4pTdicf1c1uM24zY0sWdROeqFciz5QNlZcqLAn/SEH9S9r25As5kp4QsvqAvcl+pYqLublNDUNPtRZsSKobx4pjSbVL1I6QOyRnXDJp9IXkVW4KaC44UoKoAJ1YHxXn8RCXikl/FaCCxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252534; c=relaxed/simple;
	bh=5kWEeoNfBAbEPXOLp6+1nV2aiGnT6yHyaFHBl1gVcws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANYagoFdZjFTqR8UHfBYqejMg3EKxWS64MVxjFf/rO/BEaES1lUsiEf9rV91PLtFPU4JfVlWQcVwjBvi4SE3iOdSSQV8ULPPpVRLilrO4xkFTV4RwM7ae+UlaR3hRWlCdGUiT91lF8335nCrJwlctutra5KBMtYbPEDW7vmL19M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThJH5l5k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThJH5l5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750252533; x=1781788533;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5kWEeoNfBAbEPXOLp6+1nV2aiGnT6yHyaFHBl1gVcws=;
  b=ThJH5l5k05SviFtDc0w4jb47rb8fVe3UZpeiO1K7vTUIKuOwGFVsu8wN
   wPbbMA3QQlNxx2VVHsRfHAHLzgJifSbBoZWptUeR5E/VdmXyjvayJiYBd
   P9OPYBkzeYAzLzHimIu9RXEXikT8OmX4ZYo3LUl0z0mw3VHreBAjm4+2z
   GGWCdpepx9ShKmd5TRTCB4TC0sJ8qHtV0JUG/yfCGthRXVACPf3mNHsgO
   12ZWrca4XoZeVO6iWTSu1vuCpXacuiVmcM1QCf0i2zWnB7Mqc2P0fMQQa
   0w9QTSYenFwJYCk7LNoltoeVFfaeoRVpVpy/1wx9PbMv09af+se6VZfC4
   A==;
X-CSE-ConnectionGUID: Byeu0llqREeL6VOj4cFYig==
X-CSE-MsgGUID: 4dH4gQuSQhuFvZr+fqhxXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56287012"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="56287012"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:15:31 -0700
X-CSE-ConnectionGUID: pyPXT9rFSdK7bdM3ltYt4g==
X-CSE-MsgGUID: 8PhR8gw9TgCe5S0ucqiyBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149403503"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:15:30 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 6507520B5736;
	Wed, 18 Jun 2025 06:15:28 -0700 (PDT)
Message-ID: <5aabcb15-0def-4f73-b4dd-03c958192d67@linux.intel.com>
Date: Wed, 18 Jun 2025 09:15:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
 adrian.hunter@intel.com, jolsa@kernel.org,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 ak@linux.intel.com, zide.chen@intel.com
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
 <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
 <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
 <1121293d-777e-4c21-b1ad-d34516d2cd3a@linux.intel.com>
 <a116761e-30bc-49bf-a1f8-9cc0ec1faae2@linux.intel.com>
 <4d4d1ca5-aab6-45be-9485-43c39b30fd62@linux.intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <4d4d1ca5-aab6-45be-9485-43c39b30fd62@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-06-18 8:28 a.m., Mi, Dapeng wrote:
>>>>> Not sure, it eats up a whole byte. Dapeng seemed to favour separate
>>>>> intr/user vector width (although I'm not quite sure what the use would
>>>>> be).
>>> The reason that I prefer to add 2 separate "words" item is that user could
>>> sample interrupt and user space SIMD regs (but with different bit-width)
>>> simultaneously in theory, like "--intr-regs=YMM0, --user-regs=XMM0".
>> I'm not sure why the user wants a different bit-width. The
>> --user-regs=XMM0" doesn't seem to provide more useful information.
>>
>> Anyway, I believe the tool can handle this case. The tool can always ask
>> YMM0 for both --intr-regs and --user-regs, but only output the XMM0 for
>> --user-regs. The only drawback is that the kernel may dump extra
>> information for the --user-regs. I don't think it's a big problem.
> If we intent to handle it in user space tools, I'm not sure if user space
> tool can easily know which records are from user space and filter out the
> SIMD regs from kernel space and how complicated would the change be. IMO,
> adding an extra u16 "words" would be much easier and won't consume too much
> memory.

The filter is always done in kernel for --user-regs. The only difference
is that the YMM (after filter) will be dumped to the perf.data. The tool
just show the XMM registers to the end user.

Thanks,
Kan

