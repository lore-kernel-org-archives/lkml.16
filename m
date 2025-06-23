Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB3242D68
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703740; cv=none; b=HgdlYyQ9jDjz6bKzqmjriwXOhwuM155FRglQxZRKZr1A0psomWYYV8F8IxmmzZI2icVZin5JwM3aChPl+ygBBeaiFhu6KTN81C3wwYHEFEbsogSIJV/GJLOz/sK8NReFOjovi+Ig6wCQv1HMRAjnZQ8C+g6qQ4Py56aZvUz9PTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703740; c=relaxed/simple;
	bh=6HqUYKBGfGtCh6ZElY/M+HpK1HeIWOQe6DOiuz1YGYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+RQBVQbhLxRmfnvwY/fxwD+nwMCzmACN4ip11RcO4hJEUVqQ9N1PFZ2j6bcn/PAE2EXHhhiNTC9q9ttBoPCYjaY1/UOCC5kdiGo0NR4U+I+FWSDVyKY1wWte6eTO0esdPJE7UiByMT3pkLrnQMnei+IMV1f/Emkbc3Q5Rk0gVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jlcd+Pvx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jlcd+Pvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750703739; x=1782239739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6HqUYKBGfGtCh6ZElY/M+HpK1HeIWOQe6DOiuz1YGYg=;
  b=Jlcd+Pvx+ausk0UVmrHpys9wWdYdH8aApasXmodLiO3/WTcSpqPf/tHQ
   pu1NovLobymC5TXwZFNQOLe/zSul7NCPYERY9YJhYX7kYhxkOoicDdni6
   SejGH8DXry9jzPE53Uqgfq07k/a9rFCCWeXcMne1JHJ7Mb9kxI3uQw+is
   DBX2K2kR6bXgx7lWVhfXDcTcUEpRpiC30vYjMe+UkMe9E1O1qPu/8I5gn
   B/OzveQNUuctIsoV/opzhWCxGS87op+W8R+o7QCmWWSCwiuTPPw7e9PT2
   U18LtqnRjuh4rEneFPefhFhxWuQIFGeYmvdywlhVqIw2iw0pFQM7ozdod
   g==;
X-CSE-ConnectionGUID: HjQFaGtRQIyEUM/Eoj5XNQ==
X-CSE-MsgGUID: QyBuoqrCRHSk+ovK9ZdONg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52641333"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52641333"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 11:35:37 -0700
X-CSE-ConnectionGUID: APxCS4UnQ4qJtnVinkdVlw==
X-CSE-MsgGUID: EsyulhYcRFiiL40UJEEI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151446134"
Received: from guptapa-dev.ostc.intel.com (HELO desk) ([10.54.69.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 11:35:36 -0700
Date: Mon, 23 Jun 2025 11:35:31 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>, 
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nikolay Borisov <nik.borisov@suse.com>
Subject: Re: [PATCH v4 0/7] Retbleed fixes
Message-ID: <n65yrom6bgghmdwhuk2gszpltnznx47xftjsbovlo4bufow2en@ux4uuizje6ye>
References: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>
 <20250622160122.GDaFgo0tAwyUpIfiGS@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622160122.GDaFgo0tAwyUpIfiGS@fat_crate.local>

On Sun, Jun 22, 2025 at 06:01:22PM +0200, Borislav Petkov wrote:
> On Wed, Jun 11, 2025 at 10:28:44AM -0700, Pawan Gupta wrote:
> > Pawan Gupta (7):
> >       x86/retbleed: Avoid AUTO after the select step
> >       x86/retbleed: Simplify the =stuff checks
> >       x86/bugs: Avoid warning when overriding return thunk
> >       x86/its: Use switch/case to apply mitigation
> >       x86/retbleed: Introduce cdt_possible()
> >       x86/its: Remove =stuff dependency on retbleed
> >       x86/its: Allow stuffing in eIBRS+retpoline mode also
> 
> Note that the subject prefixes are "x86/bugs:" not the mitigations themselves.
> 
> https://kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

Ok.

Do you think also appending the vulnerability name like "x86/bugs/retbleed"
would be useful for someone filtering commits based on vulnerability?

> I've fixed them up.

Thanks.
