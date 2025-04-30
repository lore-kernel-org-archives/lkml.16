Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090625B1F0;
	Wed, 30 Apr 2025 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017287; cv=none; b=ChF+u5mQK64F4P68s8xjTGdAIgdywshecfgbiBthtIzllRYdo7YbMQcOZeIM7Uu2hvfasx+qzRFDcAa7Uk1yVA2bAdC1SG5AVajI0lwYMazMlMOGvbBLzP5S/5zoUvNfm+rHBqy2UegTL6v9Zw11pwW7aUA8DS9io1oMtDtG94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017287; c=relaxed/simple;
	bh=FNSfl7sJXyyMr58cTcycGqVKOnJzdf3JLX0L3/BzZRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fudAn+799N//hkV84CuwQn1CspzGUY6Gr0i03hHbn3pKIvBebq0SxKXRZGgeoeKgB6eS0Q6er7KV4ybxIfY3xUI/rT/cTYyH3UFiys6V99/ZvWDXng/kEul+OZOAjTgpXYBWWZ6KoCDJfz0f+gAmwp55OZH9VT93JmfhSrGr65k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/+thX7a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/+thX7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746017286; x=1777553286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FNSfl7sJXyyMr58cTcycGqVKOnJzdf3JLX0L3/BzZRA=;
  b=Z/+thX7a22NncWeOH5T+1628bm0rhV4isAUpES2AhcX3JUBJqgrZcnxl
   N+MUk3eIf9/DLFsNLNi0UJ6a8gXKu8psG7tcv+49IgzOobnxpGicHexQK
   yUQN2wKW1l4pUlaTFGQcprZ8A4KP6/hM6iIzXj5FDl17pytHgWYV0oiXD
   GtaTOHkGbkTqwwzBpjiotagZOr7m7H/YR0tLy91t4ZQsE3V46j57FXblZ
   d7Mc96+jwCr4bQzbnn8T6/FkGM6YLSwH6S+NoV4vZlrW+5VgDHjKCIfGz
   eQmyDDlQLG3eIQLP9B//kh7LegF5u2jUYJC/t9zY9rk7WBD8BTnkmsp7T
   w==;
X-CSE-ConnectionGUID: bcCu4itLRQmyUe3LNmJ63Q==
X-CSE-MsgGUID: wGYBAX3pR7mwG5NqwBi89Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58307638"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58307638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 05:48:04 -0700
X-CSE-ConnectionGUID: sgyrkr1tSMy/f8/B9aXFnw==
X-CSE-MsgGUID: 0xbFseEsT/SY1Zk732Sa5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134060316"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 05:47:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uA6qx-00000001d0J-0oph;
	Wed, 30 Apr 2025 15:47:55 +0300
Date: Wed, 30 Apr 2025 15:47:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: pmladek@suse.com, admin@kodeit.net, airlied@redhat.com,
	akpm@linux-foundation.org, alyssa@rosenzweig.io, apw@canonical.com,
	asahi@lists.linux.dev, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, dwaipayanray1@gmail.com,
	geert@linux-m68k.org, joe@perches.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st,
	mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
	simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com,
	tzimmermann@suse.de
Subject: Re: [PATCH v2] checkpatch: remove %p4cn and add check for %p4chR
Message-ID: <aBIb-nOSUqaLgIsV@smile.fi.intel.com>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95970CA0E1E1972B39405B43B8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95970CA0E1E1972B39405B43B8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 29, 2025 at 05:50:30PM +0000, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.

...

> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")

> 

There shouldn't be blank lines in the tag block.

> Signed-off-by: Aditya Garg <gargaditya08@live.com>

-- 
With Best Regards,
Andy Shevchenko


