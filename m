Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85551804A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895382; cv=none; b=O9Jm3YDRV/1jMIt5u4uEr8UYuOoc24RcQ/XSYUMnSxOkqQCX9EtGyT4L2YnGJ8NeW8AoYTMAa4NLMT8lSmWjll33JOIkk9bPldCljCZILC2dKhqf7p2asvtUKKm6NAR9lXpDnOaXqgCp4QwDNL95CJC85rgIXgEfjkEc/sHeNU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895382; c=relaxed/simple;
	bh=bllUZPiYXkWVubmBkx0oJfmMBfVJIOu4AoK3I8f49uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olsmNxN1rpjYF89lh3L6yAwdkgyflF6WZkc7Zd3h4rZ07MpsRAxMSE5u6lFvHeRePZrPohVJlY1rvnghe+qJZm7nDKkulisPZmfGfvo4lf+566e84Gm04885wu/bk/6RN5nV+qdfofF2UcaTAegHY/dy9kWfzJCgSiygH/2HNZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksY/vxol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksY/vxol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366AAC4CEEB;
	Mon,  2 Jun 2025 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748895381;
	bh=bllUZPiYXkWVubmBkx0oJfmMBfVJIOu4AoK3I8f49uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ksY/vxolIqP32X9VyspMBpkJUHF4vqCJB+0CtnZTd/OcXzLZ99dPzMSk80O0Q4hdd
	 a+xDsOzZkjOd3BVk9GC4IMyXkw75A+p6qXnv+PFtAUDheoyx/rGeeRBCuBuqnDcqOv
	 5br52vm06H2S8GU3bNGi3mvApyiACQgFgbmqhMZFLSd31fflvSgLpu5VegMWhId+8F
	 pVyGr+q9L92UJMQSfq7qprRfnBO1qgTZEzQRhat+QR9kbwq6TRSmlQn7mWptsAjU8O
	 d05hUNaEO3B+nwZuYtNHpGhlubTZtCk2cBVCMVpoyGZi+6zWxmOq4Qfy+lmZw35e0k
	 CpaltvHyPm/GQ==
Date: Mon, 2 Jun 2025 13:16:18 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kees@kernel.org, acarmina@redhat.com, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <fm4xl3yt26xbqq3oczrlbbo6ot5t6nelxweuscrbkcialcz6sp@zx57t3jh463g>
References: <20250602144201.301974933@infradead.org>
 <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
 <20250602154943.GB30486@noisy.programming.kicks-ass.net>
 <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
 <20250602180922.GC30486@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602180922.GC30486@noisy.programming.kicks-ass.net>

On Mon, Jun 02, 2025 at 08:09:22PM +0200, Peter Zijlstra wrote:
> Right. So the problem is using asm macros in inline-asm. We've tried
> adding those macros to a global asm, but IIRC that had trouble.

Yeah, IIRC, the problem I ran into was that clang doesn't allow defining
asm macros in global asm().

-- 
Josh
