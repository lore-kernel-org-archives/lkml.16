Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94782D98
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194580; cv=none; b=mrMV8KSdCdsISoJ+NTXSftFSUEmzEJXfLPzywkezzpDwMaBa7ReiLBG1PwtZDhIR+7kWQih8tpWKZx9AWinciq0/JVkeJl/86wQgTBLL5nYQ21v231yU3wJBrHoQwlZjWZqGynWBJv1t8FgJ0KxA97K/lWx5lBauALchAwX26y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194580; c=relaxed/simple;
	bh=F2zdVFItAdmP9ucapL/4OsjVj1IjfBsSOTDIvAGScgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSNNhF5p4znRIoxsCAVDvDzpD2aTtG2PLoFyZ+jsVIQ2EtXojuYgxmdqvDLBX20yToFkz6u7CyO2q2wh18ayfmilBOpw6ruCuZHqft9ORWDK5WlMghdJvQlfqgH4KXfLG7uWi4IOm29UjC5iEKut9qwUV9fJfTKB5m2xLXJZuGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7QhHo8A; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7QhHo8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746194579; x=1777730579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F2zdVFItAdmP9ucapL/4OsjVj1IjfBsSOTDIvAGScgM=;
  b=b7QhHo8A71wOKJGCEFeWrQjJrlw6e2Pgsd9i+4NkwB8hWqraiZNbzDwt
   Y/OMXnO5dQXExohlZRqSARier+8EXaM6Ahoz0gFlZxG+QY0MGAbxpgrQ1
   owbsMtHYFt4gEZonFrC4DgCtILupr1y2TXNgZBNGb3VOmnWyp4S6G6hdr
   q1k+eiwFLK/feApzftCH5KAP6W/V/G1SS9dDFZcV3lJdTcz5SZTzUAGTU
   ICch5sCYgvTXAQW/LAIodIBNtY+fHFHCnu7eJrq7lJvQGTUhDZmBurqph
   Yvxuqu/XNhphnKgyNH6Pgal2bX72fkW2cYtIQcUn2Ae3CAMu0mWwzTNxh
   w==;
X-CSE-ConnectionGUID: zWOxBcvORtSo6YGW3MGHxQ==
X-CSE-MsgGUID: +L17VChUS8SuWKChMTKYNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47763365"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47763365"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:02:58 -0700
X-CSE-ConnectionGUID: umyZV+QmTYuDpp7pnZnxEg==
X-CSE-MsgGUID: /cgFCEp7Rue/ouOi24P9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134602630"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 02 May 2025 07:02:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 91AFF1A1; Fri, 02 May 2025 17:02:54 +0300 (EEST)
Date: Fri, 2 May 2025 17:02:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Waiman Long <longman@redhat.com>,
	Carlos Llamas <cmllamas@google.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] [RESEND] lockdep: change 'static const' variables
 to enum values
Message-ID: <aBTQjnB8ej3z_van@black.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-6-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-6-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 09, 2025 at 02:22:58PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns about 'static const' variables even in headers when building
> with -Wunused-const-variables enabled:
> 
> In file included from kernel/locking/lockdep_proc.c:25:
> kernel/locking/lockdep_internals.h:69:28: error: 'LOCKF_USED_IN_IRQ_READ' defined but not used [-Werror=unused-const-variable=]
>    69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:63:28: error: 'LOCKF_ENABLED_IRQ_READ' defined but not used [-Werror=unused-const-variable=]
>    63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:57:28: error: 'LOCKF_USED_IN_IRQ' defined but not used [-Werror=unused-const-variable=]
>    57 | static const unsigned long LOCKF_USED_IN_IRQ =
>       |                            ^~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:51:28: error: 'LOCKF_ENABLED_IRQ' defined but not used [-Werror=unused-const-variable=]
>    51 | static const unsigned long LOCKF_ENABLED_IRQ =
>       |                            ^~~~~~~~~~~~~~~~~
> 
> This one is easy to avoid by changing the generated constant definition
> into an equivalent enum.

Any news here, please? The problem still exists in v6.15-rc4.

-- 
With Best Regards,
Andy Shevchenko


