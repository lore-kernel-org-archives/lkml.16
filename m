Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B902580E4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758753; cv=none; b=p8RgNwF7qXBgiZyLx1P9Kwq7J9RINg8ZAzblyIaekWnOreieQChBmRVN75fvdypOUvhSqffXXWC9VZEMdjG0Od81aRHNPHo6FseuXXjGiY5t1ZD9LQ5YhoguLwizyyxmV+8V6Uuk1V8JhoGGeq1Hc7iZDOARMMAkLzwQtLpltLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758753; c=relaxed/simple;
	bh=NE1lbQoX3Y6rrhD5RK6HSkfUgRGFG4LfnQSLgHP+z5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYCy0qC3KpeukBtZPixnNNnll1ofNfQYwBjMF+JP0u/uetWkdui0Jmlru3JOb29Es80ZWGGxeJcSlAZckY97d61uWO/uo+Oerw83nxjn+VrPDxmH5h6ZeQr3z9oGjLaCXj9WlZoYXnK0yItq1GQNlvf0h9IXNc4VcqXgJbP0BHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evLjZHay; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evLjZHay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747758751; x=1779294751;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NE1lbQoX3Y6rrhD5RK6HSkfUgRGFG4LfnQSLgHP+z5U=;
  b=evLjZHay649z4rDgKG63GZvjxX/A62bE1YW2PYWFJN4rE+I2nR3fewOg
   APDByuazUxozncvYAegbypx4S8NzSdY5J9uVFZjY/T+7t9D8K3c+zR7Z1
   mpkVdeBnseJK4wMRTnGa1vZ5y7q9feV4O/xP/htriqzjWG3f5wE3vK7xL
   nhr0oVmVGEVPxSk5OAJIv8y709bMoxcPzBooCbr1gec2HQMnaVCPQdrvR
   VBUrIse9h+hi0MgToMd8CYOSqDZ/KQxI4ArA8vxHm8c2MwvrMqPf4pky+
   WoPa8o7vo8Ri0fD6Mg1mVKQ/0BnqzGFk2N4JhRVRZgpsxEyFDTd7J7zAi
   g==;
X-CSE-ConnectionGUID: mKK4XTgZTde8se060qywwQ==
X-CSE-MsgGUID: 7YQNauUpTQ6qjiHVNHCKYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49634765"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49634765"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:32:31 -0700
X-CSE-ConnectionGUID: P8NPDRkARqiK2iMhHMuCfw==
X-CSE-MsgGUID: Gd/ORA//SRyNqlaUM9XX1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139625018"
Received: from bruceprx-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.21])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:32:30 -0700
Date: Tue, 20 May 2025 09:32:21 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/bugs: Restructure ITS mitigation
Message-ID: <20250520163221.ndezdfrhoav43sxi@desk>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250516193212.128782-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516193212.128782-1-david.kaplan@amd.com>

On Fri, May 16, 2025 at 02:32:11PM -0500, David Kaplan wrote:
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
> 
> Changes since v1:
>    - Moved ITS enum definition before retbleed logic
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 167 ++++++++++++++++++++-----------------
...
> @@ -1338,20 +1365,6 @@ static void __init retbleed_apply_mitigation(void)
>  #undef pr_fmt
>  #define pr_fmt(fmt)     "ITS: " fmt
>  
> -enum its_mitigation_cmd {
> -	ITS_CMD_OFF,
> -	ITS_CMD_ON,
> -	ITS_CMD_VMEXIT,
> -	ITS_CMD_RSB_STUFF,
> -};
> -
> -enum its_mitigation {
> -	ITS_MITIGATION_OFF,
> -	ITS_MITIGATION_VMEXIT_ONLY,
> -	ITS_MITIGATION_ALIGNED_THUNKS,
> -	ITS_MITIGATION_RETPOLINE_STUFF,
> -};
> -
>  static const char * const its_strings[] = {
>  	[ITS_MITIGATION_OFF]			= "Vulnerable",

Index 1 (which is now ITS_MITIGATION_AUTO) is missing. I understand AUTO is
a temporary state, and it may not be necessary to define a string for it.
But, assigning an empty string, or an error message would make this obvious
for a future reader.

>  	[ITS_MITIGATION_VMEXIT_ONLY]		= "Mitigation: Vulnerable, KVM: Not affected",
> @@ -1359,11 +1372,6 @@ static const char * const its_strings[] = {
>  	[ITS_MITIGATION_RETPOLINE_STUFF]	= "Mitigation: Retpolines, Stuffing RSB",
>  };
