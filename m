Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0D321348
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747435649; cv=none; b=pcf7+qVYiBDIap18Egj7ITQYh4tPq36B5qCqnqikeeg55HaHvob0iBiFyQFH3wmhvvd3qD7MGDOhbKDFjjnnKjT4smpGwTp/ZAMxin4qtuvPeL8XVSHAvU29zcTe5F8EiqVM+vNvKjfMz639WwoaKDTzQm04rsc+Pe/DOf+8OgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747435649; c=relaxed/simple;
	bh=UCZm5e7bhbSO117kVyZRhEddjxRrg3LYGm9kggxX210=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDjPQIQ5wFDTnrqo1a46osiYOVf/sHqZlMB4PVPmdWrPCOPJooWvAo44DerAQ9Enx9rQui1Zp1NWs+/8yzLoyx2fpwOYvsskc6k+O0InTfGqg52gwJ0B1sCcLeZ0y/A5sEAAF7r2DhD13cf6fKR5CvQoY8lXvNNSzJkfc377xJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyxfOPI5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyxfOPI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747435648; x=1778971648;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UCZm5e7bhbSO117kVyZRhEddjxRrg3LYGm9kggxX210=;
  b=jyxfOPI5SSd7q8KI6DtbNy1s/LonoJFFz1ctGpwDkxf4hUuLJOtE3U6u
   UjZBTiPI668IcfTwi3naPXY/ER6l+0c+9TXye0ZVZN+VWaa6SiMae1KWF
   MVuX4cL0St2Ndy9DAQbOc6DvBUL//v5cizolm0m1DyarxwN4q2vzYSkfS
   8c8SMZk+Ej0zmxUXSHqvgIJFzHqrjLKymlQWnSh5Lrzx6wEg67qUfa9B/
   uAyxE9jngklwgloEvU9AWjOWOucKCIdtShYXXvxtxt0qKHgZcd8FcqwvM
   2OPrUqqbekBQzNIm5Ybxh3TGCCB/Kd++WTur3BT1vPdjP/BmFmuiZ9YGN
   w==;
X-CSE-ConnectionGUID: 12Gv9XJ9RIG8ktZrt4ZUBQ==
X-CSE-MsgGUID: 0gY1/92RSe2/oeCMNEfMBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="48533116"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="48533116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:47:27 -0700
X-CSE-ConnectionGUID: txjL3qCbRMScPeTLUEm2Og==
X-CSE-MsgGUID: bPSlD/LITua+fBt+JA+ZaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="169853635"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.125.109.65]) ([10.125.109.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 15:47:27 -0700
Message-ID: <ba2239fb-6740-42c6-b6aa-e1c7a575b83d@intel.com>
Date: Fri, 16 May 2025 15:47:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/bugs: Restructure ITS mitigation
To: David Kaplan <david.kaplan@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250516193212.128782-1-david.kaplan@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250516193212.128782-1-david.kaplan@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/25 12:32, David Kaplan wrote:
> Restructure the ITS mitigation to use select/update/apply functions like
> the other mitigations.
> 
> There is a particularly complex interaction between ITS and Retbleed as CDT
> (Call Depth Tracking) is a mitigation for both, and either its=stuff or
> retbleed=stuff will attempt to enable CDT.
> 
> retbleed_update_mitigation() runs first and will check the necessary
> pre-conditions for CDT if either ITS or Retbleed stuffing is selected.  If
> checks pass and ITS stuffing is selected, it will select stuffing for
> Retbleed as well.
> 
> its_update_mitigation() runs after and will either select stuffing if
> retbleed stuffing was enabled, or fall back to the default (aligned thunks)
> if stuffing could not be enabled.
> 
> Enablement of CDT is done exclusively in retbleed_apply_mitigation().
> its_apply_mitigation() is only used to enable aligned thunks.

This seems to be explaining what is going on, but there isn't a clear
problem that this is fixing.

Why does this need restructuring?


>  	if (!strcmp(str, "off")) {
> -		its_cmd = ITS_CMD_OFF;
> +		its_mitigation = ITS_MITIGATION_OFF;
>  	} else if (!strcmp(str, "on")) {
> -		its_cmd = ITS_CMD_ON;
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
>  	} else if (!strcmp(str, "force")) {
> -		its_cmd = ITS_CMD_ON;
> +		its_mitigation = ITS_MITIGATION_ALIGNED_THUNKS;
>  		setup_force_cpu_bug(X86_BUG_ITS);
>  	} else if (!strcmp(str, "vmexit")) {
> -		its_cmd = ITS_CMD_VMEXIT;
> +		its_mitigation = ITS_MITIGATION_VMEXIT_ONLY;
>  	} else if (!strcmp(str, "stuff")) {
> -		its_cmd = ITS_CMD_RSB_STUFF;
> +		its_mitigation = ITS_MITIGATION_RETPOLINE_STUFF;
>  	} else {
>  		pr_err("Ignoring unknown indirect_target_selection option (%s).", str);
>  	}

There seems to be a mix of command-line parsing functions that have a
separate 'foo_cmd' from 'foo_mitigation'. What's the reasoning behind
converting this one?
