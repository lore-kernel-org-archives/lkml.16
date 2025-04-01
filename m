Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133468F54
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 04:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480920; cv=none; b=PhP/p9RFSdc6WtLYn/tMhytkhYEtcG7bzqC30hJR8vjixpU1bnLwYcr/jZWC9qfilr10Ml3rcRiqZCnjBpjXv3z9kRmjQq5ukb0r0+MjemjJmrF+fWB5T2aux3/0I0fsKJJ5637suYwXK/1iSOgYpKHPtNOCj/p+8y6PqLE/TFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480920; c=relaxed/simple;
	bh=ryprVHEW7JlOMD+oIbpsO0JTuYoLsYq6Q/WJTuVVj/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFT4wOZ7IqRgPfqYrvGo/TvjoToWTtf+VtbA0Z1D4SyScbE0gsDZkWOOgNFZZKvnxkY9O11xTlBMYmPKA0Pxijth+mByjyfFpMOFYMQENK4a8u9n/g4lW9XJTiY3ZcAs+SdQkc3of6lAVrLL9WiqWOAHJRzNANrBxIgTtYrnobI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A62Arblv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A62Arblv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E84C4CEE8;
	Tue,  1 Apr 2025 04:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743480918;
	bh=ryprVHEW7JlOMD+oIbpsO0JTuYoLsYq6Q/WJTuVVj/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A62ArblvPnxIr5mVDvIx52jdFE42Ea9ZLhMqO1zf1T/EQVr01thQbZsK16L0tHypN
	 TZq1yxRhZVjxIpAQwvUb+U/BTcgo4AyP7j9QsPZNPN/efe9Z+7owsS7b3Aryycv16E
	 2CsDNZdU1YMk53jd4AAcGw2m+YFHvK0bWOL7/lneXJW3w/7Fr0dMaYS2GPbPPZfox8
	 hfEYsbq7aqweQp01RV3upSBUfBA2e2GiMnP+BOXB7xl6wFaRc2+GWyIMlgAbGxbIs7
	 MPK4ull4jdVYVH273zmjIbqmPrHc8cbI63IVAuZkc9kJgxPyrlb7l4vmObDY5OgjSz
	 fQsV7G9DAGxlg==
Date: Mon, 31 Mar 2025 21:15:15 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: philip.li@intel.com, a.p.zijlstra@chello.nl, akpm@linux-foundation.org, 
	bp@alien8.de, linux-kernel@vger.kernel.org, lkp@intel.com, mingo@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <ublufyjv3ekvabhbsswswuhg25v7yalrucvtprozva46s7mli3@jhnsdb5wkqky>
References: <Z+s1ceHFa0L1GMrn@rli9-mobl>
 <703f98e1-5638-5feb-2b66-7cf7bb21a896@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <703f98e1-5638-5feb-2b66-7cf7bb21a896@loongson.cn>

On Tue, Apr 01, 2025 at 10:05:41AM +0800, Tiezhu Yang wrote:
> (2) I did not meet the following objtool warnings before this merge
> window:
> 
> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack
> state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack
> state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
> 
> and I did not notice the robot report due to there are many unread mails
> in my inbox, I will try to reproduce it and take a deeper look at the
> problem, maybe it is related with some special configs.

I actually already have a patch for it, will post soon.

-- 
Josh
