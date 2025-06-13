Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5C272817
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804521; cv=none; b=mIZ4P6666LrpY9H+c9v1KP/zm6DxZYzIdYnosXPiP6yGYjYEG4fplYlym4KUZXhJ03HrKETCyb0lYMpZW4qZI0pv+63afi70CZ8WK8nxyZ95trMzrI+mQ7WA+a1oe3HZEPV3LgfWNWLLcsm7WsTRxmXQfDpmXTWXVm5KCIkuHRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804521; c=relaxed/simple;
	bh=n/QFnQGQ4EB6B9Nni15cfoa1weo9vIdAacjQN+HA/E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MuUwEW+rq/j6T/SgWGTCLyFr2X/kFzjRm3T4OJGq3k5ngDEZq82OqxZC/RS7IdPyTtOJXaQtCLXVjnHQ/vIej7Gg3vYEgS3EQlUDvnLWHV+P9NF4hutX28PolTrtGEBu1vuvS1Whqlbmqp//RMUm7iBlXWas1oLoEooEeLibjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6M3m/hd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6M3m/hd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749804519; x=1781340519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/QFnQGQ4EB6B9Nni15cfoa1weo9vIdAacjQN+HA/E4=;
  b=b6M3m/hdH5GDaVKnmj438wcNOl+cvZCaEKZof7/B3H3N/r2YnZb1+Bok
   EizkH78vLdkMql9UKppa+yNeBc3FqkYRuNzfIArZrhpQd3ds/PL68UzqN
   nYUO6+JSxZYqe7WnUOO8O5RK7FXRclc8miHSVJcNuauLaFc65zU1S4i8x
   NPWvFK/AzlDW5O6xRtcaYwIecOM35+UTXgs0i4NeoV1yZASZKv3uHI0U7
   wf7UnusSErYlJ9G0lt8FPn1sFZywwM8BVXhUQa9xeQ4x1QqPA7YbW04o0
   fLi6ojRJYr3AggBJHmQ5tBf4ctEDc5Al6m0u11r2L5i64HTFiG15JXunS
   g==;
X-CSE-ConnectionGUID: J9WCJLc8Q/GCJeGQoh4EfA==
X-CSE-MsgGUID: DdCZ+sueTwOc0GOEdkr/aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51238423"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51238423"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 01:48:39 -0700
X-CSE-ConnectionGUID: QPMAclAjTCa3tvB/CHiDmQ==
X-CSE-MsgGUID: tAPWA51gRTySvyrRwVB5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="152668190"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 01:48:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uQ05T-00000006ByQ-2epz;
	Fri, 13 Jun 2025 11:48:35 +0300
Date: Fri, 13 Jun 2025 11:48:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] iopoll: Use fsleep() instead of usleep_range()
Message-ID: <aEvl4yXPStVTotnx@smile.fi.intel.com>
References: <20250502134346.4146857-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502134346.4146857-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, May 02, 2025 at 04:43:45PM +0300, Andy Shevchenko wrote:
> Use fsleep() instead of usleep_range() to improve small time delays
> by avoiding the timer use. With this, use slightly bigger initial
> delays then was passed to usleep_range().

Any comments anybody?

-- 
With Best Regards,
Andy Shevchenko


