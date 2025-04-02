Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C663F238D39;
	Wed,  2 Apr 2025 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596472; cv=none; b=NQnCRUTX9oKGsmFfPGePgXYDzzfp7Qw6r719dNMgHUbZSym056eZv7/tmvzWNfVnVBQ08P232bX/bvRb6aanUqDvsGXVhFoio+IqdrJuWS7ZS9qeeR85Rk+5TKBA4q0CfPSZW/KIcsWHtdzNAdljBZzOa2iShOFlqkIhoUi59Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596472; c=relaxed/simple;
	bh=+Ds8HgjZZO+CP6jfwATICVt4PfCpv+l3LbQfdw5ZnQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6aLFwpKX7jppH/ouSehtd5g0UBJPJmTXFIyL7WDlqmapI7CS9sLjbUJlf4yugAs2W58Et+cBjNMyIWozU47zBWhi1E1H/Pzplo2R7zpfX+PU63hf7aJ1CNaQ4p0HUYgZ0NwTz66/LeaSU1dDrca5Q1XsxocIa7xI3TddeKlh9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ubXR4d7k; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ubXR4d7k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g6S1SZ66evHddI0d0mVypp923OoaFor/bIVE2U1Pgsc=; b=ubXR4d7kUAA/nRulsdV6sYIsTB
	+PDpjYSpFirN3jL4jd9bRMNf0XfhGpR48ZyEjANimmVSMWEEKF7JDwybsWeISvFuyotquqibaFWoB
	jbGxsmk0VB3P3u2FcbGBpf9OpnFFFPINRHQcS/rR+Fj4a1KYNQWD3WWoVpXuQNyI+yj53O0Q3ete9
	xUwdzFsxTtV3DBENz3QyglkvwnEGH09ROHpUe8HFAIyNr+N1pCXa4mzhCQFkhClpJyB3OFsPDUIso
	PdqbLUIi1wz/xgrTZ968kjFaLEIBCk/d0FwYhkmGnOl2LrhsEne559XltLAvddTri0mdyOyJzvpjh
	YTDpBuXA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx5c-00000009RmX-34Nr;
	Wed, 02 Apr 2025 12:21:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5614130049D; Wed,  2 Apr 2025 14:21:04 +0200 (CEST)
Date: Wed, 2 Apr 2025 14:21:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, vbabka@suse.cz,
	torvalds@linux-foundation.org, intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org
Subject: Re: [RFC] slab: introduce auto_kfree macro
Message-ID: <20250402122104.GK25239@noisy.programming.kicks-ass.net>
References: <20250401134408.37312-1-przemyslaw.kitszel@intel.com>
 <Z-0SU8cYkTTbprSh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-0SU8cYkTTbprSh@smile.fi.intel.com>

On Wed, Apr 02, 2025 at 01:32:51PM +0300, Andy Shevchenko wrote:
> What would be better in my opinion is to have it something like DEFINE_*()
> type, which will look more naturally in the current kernel codebase
> (as we have tons of DEFINE_FOO().
> 
> 	DEFINE_AUTO_KFREE_VAR(name, struct foo);

Still weird. Much better to have the compiler complain about the
obvious use of uninitialized.
