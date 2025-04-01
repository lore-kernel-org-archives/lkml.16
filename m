Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F41494DB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533396; cv=none; b=L8KWjuS7VTWlg97f7DYshkEhdCU5/xWpuUngc5iBIai1yhVzGpLDpLSLHlBGFQaJvVX5JhXVRcukHXkq1NudYMbBeNcs22HSIiBLIcf9Cb243FCJhocUTrBjB3dLcb6eFYdc7noQaBtCQ89w1wQEYZkt0Ymzavs+GFQ/BZbkKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533396; c=relaxed/simple;
	bh=2uWb/6uzzkTp3X0eEbzve7Ufw3V0DHg2/4UaUwAu9PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oy5RkT5NLknt0vQeXJ7ezdZlSsVI2p0lIzqqPMxYdzTgVxd74pgicQE/pvBCLQSmSPBPtHtp1zC9NAjxjEoFONJPlAxsj8rm49YzVPyn/iAuQh+vi1KkIyihySHZRmJP/LALjBjoMxmPSWA1C6FSmbYWLWZEXKd4S4/tczTLBHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWDL495g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWDL495g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F991C4CEE5;
	Tue,  1 Apr 2025 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743533396;
	bh=2uWb/6uzzkTp3X0eEbzve7Ufw3V0DHg2/4UaUwAu9PY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWDL495g0nZ6beWPLRGdR2C0kmaCcns3HNO0TsxrbmO8bp1YakxnIltctvM193wRP
	 eMWk3zcxJHzjSfdKGO7CgTLSmPj9/BXWPrziEtj1xU4E2MdhkhEPn22hGoGFF+yo/d
	 jXRhxQcCyDeTz8GLH02rbGoKoGL8/vjU4YUGOw5a/DEz1XkCeToT7Wlpb+YDAnEXxW
	 Fv9VAWD8fgrMtXJBEDJKdvHjfdogRUwzYJfO5ZDUybaEnfGVc674OgAQDbAf1FmYMe
	 QJQEgA2pdbP6Dfpop70xYnanhHRK2K23AA7nHCUWizC6+qFltFIygWVkOO6hD8OJSh
	 OhfzoV10jYriw==
Date: Tue, 1 Apr 2025 20:49:51 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 23/49] x86/alternatives: Simplify smp_text_poke_single()
 by using tp_vec and existing APIs
Message-ID: <Z-w1T-CAr-TPXrsT@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-24-mingo@kernel.org>
 <20250401144010.GJ5880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401144010.GJ5880@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Mar 28, 2025 at 02:26:38PM +0100, Ingo Molnar wrote:
> > Instead of constructing a vector on-stack, just use the already
> > available batch-patching vector - which should always be empty
> > at this point.
> > 
> > This will allow subsequent simplifications.
> 
> This should go before patch 20, otherwise you'll have this intermediate
> state where we trip the WARN, no?

Yeah, indeed - I've shuffled them around in the latest 
WIP.x86/alternatives.

Thanks,

	Ingo
