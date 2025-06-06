Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312A217BEBF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231592; cv=none; b=HxWD1XOtHOUHGoc+Skn5siprD4sWW7ZUM2DZ8E7fXh2qZN/II+Bf+Dba6X8sJ8sYm1NOWJsggUk9QYlpmkUVSRQUxBwF8PR9JKaJuhLbfDbzW7PI96crpXrstxBpoZcJ0HT3x64iMpoxkNkCEphE51YIQT0aC4aaYWmDZ17zf5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231592; c=relaxed/simple;
	bh=PpsNFcJLLpq3qCAPQOfa2BG0buqYrApPFwhcLp2r+4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCSG8vB41/Rwbk8vRcaOseKm1xxMp8pij7F3wI0aqq0z94TPtV4WgdhGIxATyDp4EQVbRhy1KyjpMIALJihRAo8VpnQJI98E5+z7j72dp65xAMZaKHYTvFXyQS62vj+hlawKMaQHoFwvvXlDHEZRv5LQS6B2Jyjbksb8YlDz+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLoWd5aU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLoWd5aU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749231591; x=1780767591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PpsNFcJLLpq3qCAPQOfa2BG0buqYrApPFwhcLp2r+4g=;
  b=NLoWd5aU8wi9QlNciVeAxeU3txmz0F+7lFqHXCG8quThYQMdIkS08xCN
   abzDeY2OmqGrr6WDnWmzTPMCGeU+fzGNik/faysbDSj+dW8g0YkQtNlPf
   JFfbSTUaOj/EAyChVhUKJgjIkitP47QneHap2YjWNkwUn2GGsNtaT1arQ
   EkIUcRyb8uu3mFfp5qBX7hMMXmzPDQNCDqMQ2kR2/RU3P4D/Wl7zHnlLZ
   eGNRhuNcmPbQhcC2R4rJf/NZL1+w4arplz7pqbuxG4ymqNntR63QP8weL
   UBsfxKG9DoUemPmniDXZAcStVdHJMlJGXg9UvuL8lr/94a1gVRevzj8gN
   A==;
X-CSE-ConnectionGUID: rb9vSTWzRVWFIFsHM7ODrw==
X-CSE-MsgGUID: b1nfvo7xQMOxHxvy1Y5JPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68831460"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="68831460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:39:51 -0700
X-CSE-ConnectionGUID: sYqpaXAwT32XFVyUDNB4bw==
X-CSE-MsgGUID: 5WzDUv3KR+y0wpTORiDfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="150722794"
Received: from mmercado-mobl6.amr.corp.intel.com (HELO desk) ([10.125.146.40])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:39:51 -0700
Date: Fri, 6 Jun 2025 10:39:45 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] x86/its: Move ITS indirect branch thunks to
 .text..__x86.indirect_thunk
Message-ID: <20250606173810.tkfj3mlojzv76z4b@desk>
References: <67a17ed2fc8d12111e76504c8364b1597657c29a.1749228881.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a17ed2fc8d12111e76504c8364b1597657c29a.1749228881.git.jpoimboe@kernel.org>

On Fri, Jun 06, 2025 at 09:55:02AM -0700, Josh Poimboeuf wrote:
> The ITS mitigation includes both indirect branch thunks and return
> thunks.  Both are currently placed in .text..__x86.return_thunk, which
> is appropriate for the latter but not the former.
> 
> For consistency with other mitigations, move the indirect branch thunks
> to .text..__x86.indirect_thunk.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
