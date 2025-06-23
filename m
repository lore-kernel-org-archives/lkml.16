Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355F223C8DB;
	Mon, 23 Jun 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672646; cv=none; b=dZGbBcXZxqRfV4uc3U6RHx16yr0CDcveX0U/cKxVzFdlkuBLI1usXOSTPatkP7fHvwqthyh420xwETw5w8YDlVb1CeswUjqLG029hM4fQBv78h5VGastzrPJE18bDaODxHGQMmK7y21GsvbEB1SgWsYN6uu19GyaMA2qNeb294I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672646; c=relaxed/simple;
	bh=rAD+3fauzyuqVTdCj2U4nXL1tFv3ixP/Ntbqa7lU9Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Om2oZDjTn6RGkwq6hQbBx/ybNCMthz8Ta5fWKl6AYEoNRYMxby6GN15999WXANDMDoEiJK/AI6NiR3uKwqvDEnjfLzNhqM3/0Hdi9I2S5jRCGGmJh0MlYPimFa9kN+dHjHwnh1Dq+PBn38Pd1UCo7zvMCcJJ4qmoySPg5q9zzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYyt+LLt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYyt+LLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672645; x=1782208645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rAD+3fauzyuqVTdCj2U4nXL1tFv3ixP/Ntbqa7lU9Ww=;
  b=GYyt+LLtea86xzsDun9Lc/ZLBPtsRjg0wXYfkY+plkuc//21p5WvQY2Y
   VqDZ6MlKs4sTAWUIEQdXO2r3cALrEcWAhS+M2qsBHjJ0sYgSuc+qKyKyJ
   l3TBpMYLlhhMUDyLaHjnColydabprr4yIVfJ8XL5etNZMmgqRUdg6rhQR
   t50Z1GeT0EK32F/UuPf/pY97lhzZOmP2ftUJtNiaA6R0BRGiGAJA6CDsd
   n4KguPLHUoptkTrP5evnRO/2ZP7DlJdZCc24xThs6AOh8nhMkKLdwBqzV
   9kxsBkkDJsdKGnKfRwdrmdRCUI5eB+z5mPRid/s3Z83El7nxDn+SA9Q7I
   A==;
X-CSE-ConnectionGUID: TUDLh+0fQTeA3EhK3gFZWg==
X-CSE-MsgGUID: HKKTxz5yR0mlrjgjTSqQpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56680048"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56680048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:57:25 -0700
X-CSE-ConnectionGUID: mYED7dfyTleQD/j+BsqKVA==
X-CSE-MsgGUID: WkCVjudHTe29OirNstbHig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="157047895"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2025 02:57:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 638F5108; Mon, 23 Jun 2025 12:57:21 +0300 (EEST)
Date: Mon, 23 Jun 2025 12:57:21 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, westeri@kernel.org,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] thunderbolt: Fix typos in documentation comments
Message-ID: <20250623095721.GY2824380@black.fi.intel.com>
References: <20250622171705.4148948-1-alok.a.tiwari@oracle.com>
 <20250622171705.4148948-2-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250622171705.4148948-2-alok.a.tiwari@oracle.com>

On Sun, Jun 22, 2025 at 10:17:03AM -0700, Alok Tiwari wrote:
> Fixes two minor typos in Thunderbolt driver comments:
> Correct "passwd" -> "passed" in nvm.c.
> Correct "boths" -> "both" in switch.c.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Applied to thunderbolt.git/next, thanks!
