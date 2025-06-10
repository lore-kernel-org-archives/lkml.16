Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785829346F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560279; cv=none; b=sBEVy0B4eTAR/z3MdaPaDC3OFOzzSU9hvOMQdw1heYZhoaTEt/hyz2S0hkF2YsWls6V+ID9p4btQAry0iLmwiMLQzuLSWvMeLAk+SiPCw6TkseiYvL936EwkscapZDgCLAISz6GeA/Cccuo6fIzFLqvWMFQhdbZaie+PnwY9KYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560279; c=relaxed/simple;
	bh=/ORod+q4pMRysAMyth0/jxFDYPc1JQGZ+vuZGoPr9Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvCJ4piikCrPiXyY1Pzh0/evw44k6OhJcLWxGvFuCC+xccT6lysUvji4q21ENrcodQTZwXajGUTSz7Nukga8WHp/if2CDMLLClw0Gih2YJPJVMkBnmC5Y+XGDkCTD4W5ajkYDz35XM8l1k+OaATBpSjbp38y1yo5R0hhAljn75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6++MZ7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6++MZ7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32E8C4AF0B;
	Tue, 10 Jun 2025 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749560279;
	bh=/ORod+q4pMRysAMyth0/jxFDYPc1JQGZ+vuZGoPr9Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6++MZ7X6btF0lmzf8HC6IK17QZngJi7y0TI/+3FV7UUSoqGRBgxyvrLNba+6fY0z
	 rOx9ow4V1SiR9F6VW+Hnk+lJ7TKwpNPUIWLsJIw9bQwLKTR9YpdSxLFOOiThg3A9nP
	 9KHye8WMdEZ28VVJp9O7Ze/3jozRNpNI/mV87/Gk8w8KhPmi4Rn7834Ph5U6lZjzGK
	 A9XXbEphjY3LxpmRHYRKQTgLlxyFPcWIyeKWdQbLAwP328SUvlofTcb3MvrKtTODPY
	 bvpBPptiPzPBT2lXJAg4xNg2oQd5/+rWcxkIeDkK5RqAwnItNEXjBdN+KMm6PtSzs9
	 B+3Fzw5dubKOA==
Date: Tue, 10 Jun 2025 14:57:56 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Petr Tesarik <ptesarik@suse.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	"(open list:HIGH-RESOLUTION TIMERS, TIMER WHEEL, CLOCKEVENTS)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] timers/migration: Clean up the loop in
 tmigr_quick_check()
Message-ID: <aEgr1AVrvWDkIR2v@localhost.localdomain>
References: <20250606124818.455560-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606124818.455560-1-ptesarik@suse.com>

Le Fri, Jun 06, 2025 at 02:48:18PM +0200, Petr Tesarik a écrit :
> Make the logic easier to follow:
> 
>   - Remove the final return statement, which is never reached, and move the
>     actual walk-terminating return statement out of the do-while loop.
> 
>   - Remove the else-clause to reduce indentation. If a non-lonely group is
>     encountered during the walk, the loop is immediately terminated with a
>     return statement anyway; no need for an else.
> 
> Signed-off-by: Petr Tesarik <ptesarik@suse.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
