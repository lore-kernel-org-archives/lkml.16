Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36526AC3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743132585; cv=none; b=rkkIKKOq9bcVzEA6NmP1k5qvUYl2ccO9LbNY1UCmlU3E14SZ8FAzm+Mt5nJ6hbiO6i7ONb0DgVO/dz6mHJdF7b5+C8Ke/wPFDWjdVR/6lKuGaHuzCQQNyt9gteb54DrQ9LmdGwazuNJ1SzXcUmnOJzNz07309PEMVb2aRVyfqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743132585; c=relaxed/simple;
	bh=y/M2jK7+2ViBU4Hx+TawBujzDtXcImVgz81Xs3A6p2o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AoG7EOp8G6epM9MqIynHvZ/v34/pHB8oS+TyDyvxO3X3BLYcPapG8SVmwdp6cgzPUmNus6oJXyVpBudvgcLMcu5iqwsUOCgcM9xuXid5k3Kv2L1dfes13fpva6Cg9nlI+JnGnvAvg1N0oQdj1O50o7cpB6BSgpCtbCfwI6v4et8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD9AC4CEDD;
	Fri, 28 Mar 2025 03:29:44 +0000 (UTC)
Date: Thu, 27 Mar 2025 23:29:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Feng Yang <yangfeng@kylinos.cn>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
Message-ID: <20250327232943.254c50a7@batman.local.home>
In-Reply-To: <CAHk-=wh3VnL5Rpuh7tCitOKYDPqWoucFNCh6b3-JR6qZtxCiCw@mail.gmail.com>
References: <20250327171037.032bf7e7@gandalf.local.home>
	<CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
	<20250327212447.24e05e7e@batman.local.home>
	<CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
	<20250327220106.37c921ea@batman.local.home>
	<CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
	<CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com>
	<20250327230104.660a4b35@batman.local.home>
	<CAHk-=wh3VnL5Rpuh7tCitOKYDPqWoucFNCh6b3-JR6qZtxCiCw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 20:19:09 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> I think that would have been *enormously* better, yes, if only because
> it clearly abstracts things out, and doesn't do the whole "oh, let's
> ask what the VM thinks this page is" which really drove me up the
> wall.

Thanks for verifying. I'll update the code to do this, and get it ready
for 6.16, and hopefully there will be nothing in there that you will
think is "hackery".

-- Steve
