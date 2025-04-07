Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC411D8E10;
	Mon,  7 Apr 2025 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035790; cv=none; b=ETmeQm9/R1Xi6DyB/aoVg0KBKgMaLPGFewaKX+asvhYxoiyis3xZjCcqyuDOJ24BbGMLsTp3RbenJABftqPMfpNQlkNj/88Zv2/T8cR1DIoTYqRlbgKVP+dYKAKB4UUOYDhuN+0Htl4dmH2i+sJ6HkxCm2zP2HIE5TdLyPG0Wzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035790; c=relaxed/simple;
	bh=zTmn5P4FyENhR3+TvfDsp/1/HX1sb8RCnnjZ9N23NDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjSJruMvk59iHiOVmduNfQPp/aGnu+TYmNGKMlbdpY6XEcBPKzeF8fNq+a9jfNfC68zR2VFKWYJgj94VtcEoY0SVpjN7kNhR4MuxC4q2pKqZVhh4F3xtWPF4k7vG5oINm5TAlW00Amdj7k629Iv5xaLKKOIfP4xzIMGQoapzNDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9R6bIAt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9R6bIAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744035789; x=1775571789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zTmn5P4FyENhR3+TvfDsp/1/HX1sb8RCnnjZ9N23NDA=;
  b=T9R6bIAtWBYGdBttlOAOUkwBxVDoXkzJZv3pTiQAimC7ykImNYjECLa0
   ewBiWWFcWd/JvXQYFH1Z9DOWnVG5gkPu7S1Knt83Il3WhmPemPlx7DFYF
   e4cvpesnjhCQsUm7FH8FfXNCYkmy/MGZsOUSSP0TEi3750rDP82FVmfNW
   ZaMfcgwGN/t3n4iKB0nLGdRRA6KcTPzzby9WjDfPcY1/HlBWh22FS07dc
   wNMeuXm9imJnwK/SZFvZI+iOEK0Bb4FKLujAfi4kIp5ZTTmQP73E0qoFu
   NyGteuvpGEHtBR2FxhaRjzVHKwxy5IfDDbeebitwMyXIQGF86z8752oIj
   Q==;
X-CSE-ConnectionGUID: qACBmBWURaWFC8hCO21g9w==
X-CSE-MsgGUID: N7y2tFq3QT+qbO408cSAmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56404753"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56404753"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:23:08 -0700
X-CSE-ConnectionGUID: 0/Np+nHdQzWhFwn8StpAXA==
X-CSE-MsgGUID: vkdJP5xQRfG8NCeg5d7hXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127952584"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 07:23:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1nNJ-0000000A5r6-2o0a;
	Mon, 07 Apr 2025 17:22:57 +0300
Date: Mon, 7 Apr 2025 17:22:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>,
	"airlied@redhat.com" <airlied@redhat.com>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	Kees Cook <kees@kernel.org>, "tamird@gmail.com" <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_PfwShQX95IyHWR@smile.fi.intel.com>
References: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_PZXPAklfkMlx6O@smile.fi.intel.com>
 <PN3PR01MB9597E19A55EAFC3E7B191F5FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597E19A55EAFC3E7B191F5FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 02:17:00PM +0000, Aditya Garg wrote:
> > On 7 Apr 2025, at 7:26 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 07, 2025 at 07:05:13PM +0530, Aditya Garg wrote:
> >> The vsprint patch was originally being sent as a seperate patch [1], and
> >> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> >> them via DRM.
> > 
> > Your message is detached from the thread, make sure you use proper tools, e.g.
> 
> It's not a problem with tools, it's a problem with my email provider.
> 
> Microsoft now supports only oauth2 for SMTP, which git send-email doesn't
> support. I had done a few tests using msmtp with git send-email, but msmtp
> also had this detached from thread bug, since it doesn't read the message id
> specified by git send-email. I've been using macOS mail for a long time for
> kernel patches, but since it was a pain to reboot to macOS every time for
> this. So I just tried using thunderbird in Linux this time. Now this time, it
> was a configuration issue in thunderbird, in which it was making a copy of
> the sent email in my sent folder, resulting in 2 copies there. I replied to
> the copied one by mistake. I've finally fixed this issue as well, so should
> be good in future.

There is a project called email-oauth2-proxy, which makes it transparent, so
just take your time and configure your box or find another email provider.
The above is not an excuse to break the process.

> > `git format-patch --thread --cover-letter -v3 ...` gives the correct result.

-- 
With Best Regards,
Andy Shevchenko


