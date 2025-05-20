Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7A35893
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760251; cv=none; b=Dy3IRnu4uPhTJs/xIIkrv7TTQuSM5n5O4cbIq4tOgaXFISa6VZWnouN7lCoKY/8tsCCzQIYRV9tRADXS79yAcXTtKKz9zcM3s0udGXmzaBKDrit7V3+xSigMb17XXaalP/ILnh/wmdyQ5ON+8rghUR7tq81CZ2ExEwwTW2sHQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760251; c=relaxed/simple;
	bh=aNxL1aTVHEMzz5FK9fboIZ2vhWlwMFBKj8NyPo07GHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWIoVEgWsX6DGu9Vvy1FufavwwwTQDvRZBXm1u+26TnyR09zuTKk566H8gIW56XErkYK3hKTGo7TPT1q350X3Wc7afUjTn9lJsxYqAqTu5/lsbwyWb9TD3WLn8R7NyagbPNavn6wSMRln4tN6mblsl4Itvh4mgZTb//Ej6C9v9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROvd9qDI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROvd9qDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747760249; x=1779296249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aNxL1aTVHEMzz5FK9fboIZ2vhWlwMFBKj8NyPo07GHQ=;
  b=ROvd9qDIxVy4ryIFK+AkoowYGJjHttbh0n1+kmhdJ+umgyyRe1y1MxKP
   QaldHVQX4O9StyO17FGrMcHiLGKTUWGsrABkCTkjpWs86kcaYud5h0ttJ
   eul92ISb3KTP3Wlm1FrXeGxdh53DdE1UXE4YHaJw5SVuIS3LfwbWC+NOf
   x1jfk/jrP6Ye7H5iITJvLlkY3bY6/Fa5cl0A3hg4P9vF+pGoGGM2B5aVN
   r14ST70IXKlOGH05hai5ZePSd5jBRUIZHzWlMKJRiBLEfIhnCCWAtEFmB
   I9e+Hn7SY2ztzn4iYyedRaMbxc7jYA7EbEBeAD6PxZndxEgQUyEbq0aZo
   Q==;
X-CSE-ConnectionGUID: XKY1g9TvS2SBegf2lLL0mw==
X-CSE-MsgGUID: QNco3JPbTgKsbVo9rITwzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48824446"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48824446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:57:29 -0700
X-CSE-ConnectionGUID: HLWAKE3MR7+rj/dAWF4xgg==
X-CSE-MsgGUID: IDACnwiPSE2EFwVcXAPxzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140281869"
Received: from bruceprx-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.21])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:57:28 -0700
Date: Tue, 20 May 2025 09:57:24 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/bugs: Restructure ITS mitigation
Message-ID: <20250520165716.5rfmxe7gqizy55zh@desk>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250516193212.128782-1-david.kaplan@amd.com>
 <20250520163221.ndezdfrhoav43sxi@desk>
 <20250520164826.GMaCyyWodIiRMuBtw3@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520164826.GMaCyyWodIiRMuBtw3@fat_crate.local>

On Tue, May 20, 2025 at 06:48:26PM +0200, Borislav Petkov wrote:
> On Tue, May 20, 2025 at 09:32:21AM -0700, Pawan Gupta wrote:
> > Index 1 (which is now ITS_MITIGATION_AUTO) is missing. I understand AUTO is
> > a temporary state, and it may not be necessary to define a string for it.
> > But, assigning an empty string, or an error message would make this obvious
> > for a future reader.
> 
> Yeah, this AUTO gets overwritten and the other AUTOs don't have strings too.
> 
> We can fix that after the MW if you think it is important but from what
> I looked, all the AUTO settings get overwritten as AUTO means, user didn't
> make any decision here so it is left to the kernel to make it.

As long as AUTO setting is overwritten it is fine.
