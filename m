Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDB2264B1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011013; cv=none; b=X9mlaS/skRW/wS6NYPZ+ruG9ydtyT+BwYzqQQc41eh9PEDGi+zaMwUxC0M5yMVTFJh8uikruvtKCk5HjQBJv4sodZE0BdoMtPIljLaGkrmXuqa026PpgB60WSvb8uhRCE1+XoaPcB8vsyX0HFLEpjDZyO4a9Ji5YGJ8AP5Nsvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011013; c=relaxed/simple;
	bh=o+9R9X4qf1r8j39EZ1mR4c7s9H6+hwicix9ShM9qj5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMQHeboPHbhe0dd1i5b3nLQ7yaUgEUSRCZIyJA/RO8fpWzrToi949mx0W8Ey2mLljY3goFQPOvtYIz+G5BrYSK+G/VE6tGqo+7dxo9gP7QlexRRBSc1PriXxY94dsptbKCzYqiu+UnUZuOni3l/w5KL24/Qx78RdGEZTzWtTEuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uu7DPQRY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uu7DPQRY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cZ8KqJeTVmJcdtGEw5MJHSl2d+0iZtEQ4xk1+lQ2oHM=; b=uu7DPQRYdfBrecw83ZfbccZtH+
	l+npjLCojr/cEvSUFn/3zBRzl1SGprqt5T7eQwkP69Hpp29Vg9IOn1h1g4hEKk1BbCKcs9D3lbVGo
	6Ys/UmdkLoZao0t0p49bJEuI25JSL2ICzL2kWs96huhCYFPTArHCuwHL48CxG3tNwXCwLPNBbCZZh
	U+0NGC1A8qwvHsPkMJ2gw3Wdt1q/hV7AK5DQM7g1GNy6xQ19yyOX/V0ubnGsDPRXNp0u9EevumFs1
	J99YuQWW6g0NjQ3EzzjnIRrT59G4O70/QIzhtuFUUxHC5LMuhrQZBZPEkXwIRWcDRuQ8cFz/+v/at
	Dnbmqnug==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3wy-0000000DYJu-2mB0;
	Fri, 27 Jun 2025 07:56:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4095E300222; Fri, 27 Jun 2025 09:56:43 +0200 (CEST)
Date: Fri, 27 Jun 2025 09:56:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] x86/bugs: Remove 'force' options for retbleed/ITS
Message-ID: <20250627075643.GO1613200@noisy.programming.kicks-ass.net>
References: <20250626142703.716997-1-david.kaplan@amd.com>
 <20250626144047.GN1613200@noisy.programming.kicks-ass.net>
 <295f94d4-f5e2-4849-ab62-9fdc75722e20@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <295f94d4-f5e2-4849-ab62-9fdc75722e20@suse.com>

On Thu, Jun 26, 2025 at 06:13:05PM +0300, Nikolay Borisov wrote:

> > Testing; I use these things for testing. Makes I don't have to run on
> > affected hardware, I can just force the feature on and inspect the code
> > and ensures it runs.
> > 
> > If you use force, you get to keep all pieces -- no warranties.
> 
> I concur, however using force won't always guarantee that the code runs
> though, 

Which is why you should run gdb on /proc/kcore to check what you ended
up with :-)

> because there can be other condition that must/must not be met i.e
> trying to run ITS on AMD hw (yeah, yeah I know :) ) also required commenting
> out some checks in patch_retpoline.

Ah, I might not have hit that, due to not actually having any AMD
machines for testing :/
