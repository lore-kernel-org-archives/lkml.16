Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6BE1A3031
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029785; cv=none; b=W+HHmAFcnAPlpU8zR4EzFMH4JQoqlHK6tNIoVEMFvvuGeU4LuwAXwYMeoz2xvdIGw0PYPOX4c0mR6puxVPZMrp9BEi3SYBu3EYfPYhY21GXIUP1wtAbvyOR0KQvQNkEddUDXARViQ6KeczIFvLBaHVlmiELWs8R2+9ej0CtmgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029785; c=relaxed/simple;
	bh=Hd0aJzWC1FpMjysXW9lLbsVNZF/oNGxSjbUc4lokdUk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uewtemwGM6bjAfm2zfUXOH2MANZnK5zLnP+DmP2eQ+dB4Ha2PBQ1pTeOS/i31RyH6qFDM718Fw0gekLORyZVnEpJIlyo5T7cAfJpv5qr9Nbt70lpVJHNe2tP497FxBTkHEwtFMhzssRZ/0XFihY9ZUmXZu5+b+rWVbzLo5ZiC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328A1C4CEE2;
	Wed, 26 Mar 2025 22:56:24 +0000 (UTC)
Date: Wed, 26 Mar 2025 18:57:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <20250326185710.5ad0f9ad@gandalf.local.home>
In-Reply-To: <20250327094502.6ae56227@canb.auug.org.au>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
	<CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
	<Z-NHugcLdLqkEHFR@arm.com>
	<CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
	<20250326124025.1966bf8a@gandalf.local.home>
	<CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
	<20250326131200.1c86c657@gandalf.local.home>
	<CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
	<20250327094502.6ae56227@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 09:45:02 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> My understanding is this:
> 
> for normal SPF checks (i.e. not DMARC's SPF checks) the test is done on
> the envelope sender and in Steve's case, goodmis.org DNS SPF record
> says that anything from goodmis.org can come from the kernel.org
> servers.  DMARC applies the SPF check to the From: header address.

Ah right. Thanks for looking into this. This brings back a memory where I added:

 "v=spf1 include:kernel.org"

to the DNS TXT record for goodmis.org.

-- Steve
