Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3C22DA15
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747437620; cv=none; b=Y5kh1ZmSg7IsD378kOcvRQ/gtCLxoM+Mftw22ky5a9ndcLHt9rgYiyaJEF1TVv/4HqmN+qOAmEzO31dQJV3Ngx9e0BVco4b/f4VeicVV8+tPQR6dRt9vT+uS80dDMAOE4BwbzeKm1XN7NeYjWSSDZN0iODlLBGb8+Gey9RR9PPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747437620; c=relaxed/simple;
	bh=GMJAExymKlyzpKcXEpE4D10c3rl+qsRVgQASHsL38Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6PSH+2vCHhimm5giteFJoAG89XaFzFRnBIoewo3yB68HCK6ODh56loRKfl3+MhxILaK/YbQa5lG576zZbEX/ox/FPj/2AyjJgdx7Ap9QrqurA3xbe3fKvOEisktEdScje0f1luEPxuNZhVX9ZDLIgqE5by8IiLbpAZQzKS1rR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SANjnk6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SANjnk6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C0DC4CEE4;
	Fri, 16 May 2025 23:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747437617;
	bh=GMJAExymKlyzpKcXEpE4D10c3rl+qsRVgQASHsL38Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SANjnk6Vb+BV6/eaioMfhryZ33AY8VS2FmqNMrzTFR8ZTUNHsHHzgjFwy7FLyh9Q9
	 w9mmRCZbD3O7pVuMFz2cIDTgHudJEP/u3r1yH/DKpQrDx1xbOuOysg/hnlUTLDo9yx
	 7bL/ud3bRhN9+U/2mxdtBknOrMvmFJORsxTLzKuQcXEon+ez+ZAQ9lYW5c3SLFreAF
	 bk2C0N4ViNAg5kUXMt6mEdZPXmHogrFcJXOdpsp7erOY3+a+tMUUfcJNvoaA7q9Gj8
	 EXt9SL6LEItndZ3iT0s/ozN9ye1yEuPRnjOnBY2DPf31QGNZuChnvwPc+GQ3W+VDc1
	 A0DmVYAR4sulg==
Date: Fri, 16 May 2025 16:20:13 -0700
From: Kees Cook <kees@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: Coiby Xu <coxu@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
	fuqiang wang <fuqiang.wang@easystack.cn>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <202505161616.F4C1BCCF6A@keescook>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
 <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
 <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>

On Fri, May 16, 2025 at 11:35:12AM +0800, Baoquan He wrote:
> On 05/11/25 at 10:19am, Coiby Xu wrote:
> > On Fri, May 09, 2025 at 06:35:18PM -0700, Andrew Morton wrote:
> > > On Fri, 9 May 2025 17:58:01 +0800 Baoquan He <bhe@redhat.com> wrote:
> > > 
> > > > > The bad commit was introduced in 2021 but only recent gcc-15 supports
> > > > > __counted_by. That's why we don't see this UBSAN warning until this
> > > > > year. And although this UBSAN warning is scary enough, fortunately it
> > > > > doesn't cause a real problem.
> > > > >
> > > > > >
> > > > > > Baoquan, please re-review this?
> > > > > >
> > > > > > A -stable backport is clearly required.  A Fixes: would be nice, but I
> > > > > > assume this goes back a long time so it isn't worth spending a lot of
> > > > > > time working out when this was introduced.
> > > > >
> > > > > So I believe the correct fix should be as follows,
> > > > 
> > > > Thanks for testing and investigation into these. Could you arrange this
> > > > into formal patches based on your testing and analysis?
> > > > 
> > > > It would be great if you can include Fuqiang's patch since it has
> > > > conflict with your LUKS patch. This can facilitate patch merging for
> > > > Andrew. Thanks in advance.
> > > 
> > > Yes please, I'm a bit lost here.
> > > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch is not
> > > presently in mm.git and I'd appreciate clarity on how to resolve the
> > > conflicts which a new version of
> > > x86-kexec-fix-potential-cmem-ranges-out-of-bounds.patch will produce.
> > 
> > I'll resolve any conflict between these patches. Before that, I'm not sure
> > if a separate patch to fix the UBSAN warnings alone is needed to Cc
> > stable@vger.kernel.org because 1) the UBSAN warnings don't mean there is a
> > real problem;
> > 2) both Fuqiang's patch and my kdump LUKS support patches fix the UBSAN
> > warnings as a by-product.
> > 
> > It seems the answer largely depends on if the stable tree or longterm
> > trees need it. Currently, only longterm tree 6.12.28 and the stable tree
> > 6.14.6 have the UBSAN warnings if they are compiled with gcc-15 or
> > clang-18. Any advice will be appreciated! Thanks!
> 
> I personally think UBSAN warning fix is not necessary for stable kernel.
> 
> Hi Kees, Andrew,
> 
> Could you help answer Coiby's question about whether we need post a
> standalone patch to fix the UBSAN warning fix so that it can be back
> ported to stable kernel?

I went back through the thread and the referenced threads and I can't
find any details on the USBAN splat. Can that please get reproduced in a
commit log? That would help understand if it's a false positive or not.

Also, referencing the commit would be good. I assume this is discussing
commit 15fcedd43a08 ("kexec: Annotate struct crash_mem with __counted_by")?

> In the case exposed during reviewing this patch, the code UBSAN warned
> is not risky.

Given that this makes things work correctly with newer compilers, I
would say it should be backported to whatever -stable kernels have the
"counted_by" annotation. (Hence the request to add a "Fixes" line so
that it will happen automatically.)

-Kees

-- 
Kees Cook
