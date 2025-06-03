Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E65024BD03
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974729; cv=none; b=sOJkBb7S1R9c5bSgZAyEQpykr+zW1tkphWoQ2gBuPgAWRzZ1KoZBeLiZP0tsVpSseDhBDqfbBy3ObAedgDTIRrgEOSgjBu/OH0ousRPPbTN57IfhL/8EHw7TOE42oqaXulY6dfyn+9MINVPGH7ioCNC0dPacGspF7FhQZYiKX4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974729; c=relaxed/simple;
	bh=HoBD+u4JPdi3tM3u+f0z1VJQQMiz5I/9d7zy3LyDCCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FysiedqREtrH+ZX/iXn/+7g6+Hflc9L5QW26pImX1/QQDLDcT6ygi6XgfvljRIAXSEH6Ad01FqkiBlBa7lJPe0KbWVxSpA1nIOV4Z0kkdkRijLZoEMl11Ob7BhhSgVAvvwraCh2aQB78OLWKXi/CN4MJpvJTiJGUET9TUTdlGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzeV70Dx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzeV70Dx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40FFC4CEEE;
	Tue,  3 Jun 2025 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748974728;
	bh=HoBD+u4JPdi3tM3u+f0z1VJQQMiz5I/9d7zy3LyDCCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tzeV70DxOn87rdYHjmaG6oMQ0QYPL+HvMXtrJhLiieL/XLFmlsNYeXErMhF1D7Qgw
	 cOGmlnRz9uogBr0Co0UsPvQ11FODwr53u2R95D0kPSseRj9+DF0U6JXNoH+hmuTL1g
	 r6RR3iRPbwgbMBN3xMgk6Z07gBkmqlKuAvtTPTOhV7/VogWCBJ/axuWPqczhWwdlSN
	 v8AoXbUsoUs9NSHSNjt7lVt2BdzsdsbDCO6JOlcQOJfeojedDs0YXoAnAgMfwA3Ubp
	 zs0QRQSuS1/cSRc5042I99uZi6rr43hLeLSzOriyCNcOlc21OFl0fOJP1DRsmjqe7O
	 BMvBIyUA7AuUQ==
Date: Tue, 3 Jun 2025 08:18:47 -1000
From: Tejun Heo <tj@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: Re: [PATCH v2 01/10] sched: Add support to pick functions to take rf
Message-ID: <aD88h1kvJguRN0mC@slm.duckdns.org>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-2-joelagnelf@nvidia.com>
 <aD48Zq2FdYlBJAk2@slm.duckdns.org>
 <63fed4b9-1c04-49ac-b4c9-f1e5359d8550@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63fed4b9-1c04-49ac-b4c9-f1e5359d8550@nvidia.com>

On Tue, Jun 03, 2025 at 09:38:35AM -0400, Joel Fernandes wrote:
> On 6/2/2025 8:05 PM, Tejun Heo wrote:
> > Hello,
> > 
> > On Mon, Jun 02, 2025 at 02:00:57PM -0400, Joel Fernandes wrote:
> >> Some pick functions like the internal pick_next_task_fair() already take
> >> rf but some others dont. We need this for scx's server pick function.
> >> Prepare for this by having pick functions accept it.
> > 
> > Hmm.. after the whole patch series is applied, pick_task_scx() still doesn't
> > seem to use @rf. What am I missing?
> I need it for scx *server*'s pick_task, i.e. ext_server_pick_task().
> 
> Sure we're not using it in pick_task_scx(), but I added it there for consistency
> since pick_task_dl() needs it, due to ext_server_pick_task() needing it.

Ah, yeah, I just missed the usage on the server side. Thanks for the
explanation.

-- 
tejun
