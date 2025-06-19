Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FA7134BD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312345; cv=none; b=uJHeQIB7MTWPnHZDDVGgyQvLPnK5fSHYo9QHXHOFiH8RzTL/RMjcp0+bubHMWlM4QkxgrIoPkpjtRHVoiH9Z/I/hQXl1ziJISel+9VMfYwNuRHq+7BgrrDMe4t4xkjnxYg6rf2sEIth/NwwqZRXhthhSdtf8C4sFqM8GPufCMJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312345; c=relaxed/simple;
	bh=kc9iHWOTgIyamZMSgsXNsmgvoo2qBtnD9yutC/j1C7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWqtOuQXTvPNV6YJ7/213J5ytc9T8lQ/U0fbTr4zGGywJb0oReQ38uRAB0Nc5UFeuWPlv1QNJpzq5TllDR749fiOmCTN3Am6W6HnTtGxU4Liw0FKg5Zh5x/rLBjgciByhYP6ITcpiz7s0TAUBKRAATv5Dw0slbFnGDbCKtusbBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MP5L78nD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MP5L78nD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750312345; x=1781848345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kc9iHWOTgIyamZMSgsXNsmgvoo2qBtnD9yutC/j1C7Y=;
  b=MP5L78nD1YMGq2RLgs2Z/baspNR5Jmhh3hP6TxD6qJKe3spDg4JirJcN
   3Uav0dERVh/wQZ5kGWUHfPZJ+pYNsXb0pbmZExyyav2umEWBgNFu9LtHO
   RjCqVY/nVx92LTZPLITP0oZ653brLjAAHv1r2ehgMpGNdDAIgusa3qQsL
   LCoAgI90pep1uZiBIJeGgtOecwMRgVcq7gznhLesqrpeMX/PoD4YFsK4P
   TmXT5ISryA33hmoaF1yVrGSVE6HQy7lzZLfKXenEYPOh8YyrjRdb31lQk
   HZ6O7uXFaunw6hChpblUY1PD+onrwLMnBR/rZZ+0yTAED/Wk7FgvkNcEe
   w==;
X-CSE-ConnectionGUID: Vi623GtoRsWtFuGWvJjZkw==
X-CSE-MsgGUID: TSLzXXurRtWJx6Jr0lIo3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63984732"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="63984732"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:52:24 -0700
X-CSE-ConnectionGUID: NBnyr+FNTCibP1AKIZk+HQ==
X-CSE-MsgGUID: ggTQWJ63QPmslLBeu+LZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="149996168"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 18 Jun 2025 22:52:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 2E7EF12D; Thu, 19 Jun 2025 08:52:18 +0300 (EEST)
Date: Thu, 19 Jun 2025 08:52:18 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com, martin.krastev@broadcom.com, 
	maaz.mombasawala@broadcom.com, Marko Kiiskila <marko.kiiskila@broadcom.com>, 
	Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: Fix guests running with TDX/SEV
Message-ID: <gb6pm7leba4ayhh2f6wjirq4ytmemadqeij6cbnak6r22e3c5b@uyakvi62fqfd>
References: <20250618192926.1092450-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618192926.1092450-1-zack.rusin@broadcom.com>

On Wed, Jun 18, 2025 at 03:29:26PM -0400, Zack Rusin wrote:
> From: Marko Kiiskila <marko.kiiskila@broadcom.com>
> 
> Commit 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as
> encrypted by default") changed the default behavior of
> memremap(MEMREMAP_WB) and started mapping memory as encrypted.
> The driver requires the fifo memory to be decrypted to communicate with
> the host but was relaying on the old default behavior of
> memremap(MEMREMAP_WB) and thus broke.
> 
> Fix it by explicitly specifying the desired behavior and passing
> MEMREMAP_DEC to memremap.
> 
> Fixes: 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as encrypted by default")
> Signed-off-by: Marko Kiiskila <marko.kiiskila@broadcom.com>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
