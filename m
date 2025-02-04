Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7FA25A640
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 01:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738633890; cv=none; b=A0UGq3mgk1RiSXJ80GZa3fVBrb5cDufNdrato/qVwp2WNdgL2JSdB0YKjqd50XzAoHVPnfmY2/uDo2ZqaRxA/z1zV7UsMQQ5IsKgdAAoDhyLfDLiJvvLeJhXY6QI5XWWjignbUTo1pOlCaAlpVYiSMAerJYX/0762D6CGwZxOkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738633890; c=relaxed/simple;
	bh=Qv8I10e6NzpV/XOLKMWGOAmu84bftLnx0mtmOcpehJo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=r4n1HhLVgCjN4xEvvggBoDP8AEcrsSACphxZYuI2Y1fR1lmhNs50bLwfzFjw9KZNF5yfL8EuKRWZcLrlxZkwLUEtj+MjLDu9tZ6Z+uRF4gVed7im4VhiQ3Ociim92ycRYnBcvPO9/yT9mcl+x9x5V7xNFlSDKnbTuGVdpayTZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=G2Tu4S9P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="G2Tu4S9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2BDC4CEE0;
	Tue,  4 Feb 2025 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738633889;
	bh=Qv8I10e6NzpV/XOLKMWGOAmu84bftLnx0mtmOcpehJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G2Tu4S9PDsRV1y2QSs0A47NdpX2OyQCk10H29Jlp/tb1fOtX8Pe8HexFJWHSSyPK/
	 k33Iz/CbX8bXfQ011Ta/G3HgNwFLuf5U1f2r5DvFDdJixxBtFvagX5EgY2pPn05158
	 gInq7+3iBgMMSAF9rXrfwfFPv6/8pVuy2cLp4oYI=
Date: Mon, 3 Feb 2025 17:51:28 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, ebiederm@xmission.com,
 oleg@redhat.com, brauner@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] exit: hoist get_pid() in release_task() outside
 of tasklist_lock
Message-Id: <20250203175128.80319b42c9739f0d420080a4@linux-foundation.org>
In-Reply-To: <CAGudoHE4vTUQtSnp01ziqCXVm_qw9sBYnKe2Gbwp6Kz5NOp3Gw@mail.gmail.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
	<20250201163106.28912-3-mjguzik@gmail.com>
	<eqoac7dyanvez62nc5ge3lfxxxbjcln3k6nrz4tkrg67v55sdb@sosx2sguy5f6>
	<CAGudoHGXR-vnYm-wMs5c8EE448UeuEps3ecrf_g22Mw=9oQtLQ@mail.gmail.com>
	<2f3gjvg6zwp2xpkhb2e36ux2resnjdtxuinbbgnr57jdqesrm6@oau2dgx63fxy>
	<CAGudoHE4vTUQtSnp01ziqCXVm_qw9sBYnKe2Gbwp6Kz5NOp3Gw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 3 Feb 2025 21:22:31 +0100 Mateusz Guzik <mjguzik@gmail.com> wrote:

> On Mon, Feb 3, 2025 at 9:14 PM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> >
> > * Mateusz Guzik <mjguzik@gmail.com> [250203 14:36]:
> > > On Mon, Feb 3, 2025 at 8:27 PM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > >
> > > > * Mateusz Guzik <mjguzik@gmail.com> [250201 11:31]:
> > > > > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
> > > >
> > > > Change log is a bit sparse?  I get that the subject spells out what is
> > > > done, but anything to say here at all?  Reduces lock contention by
> > > > reducing lock time or something?  Maybe even some numbers you have in
> > > > the cover letter?
> > > >
> > >
> > > I did not measure this bit *specifically*.
> > >
> > > As one can expect get_pid issues an atomic and that's slow. And since
> > > it can happen *prior* to taking the global lock it seems like an
> > > obvious little nit to sort out.
> > >
> > > I would argue the change is self-explanatory given the cover-letter.
> >
> > But when you git blame on the file, you will not see that cover letter.
> 
> if this lands, I presume it is going to go through Andrew who uses
> tooling pulling in the cover letter for each commit

No, I copy the [0/n] description into the [1/n] changelog only.

> but i'm not going to argue this bit, just provide with a commit
> message which you think works and I'll use it

It's rather irregular to ask Liam to explain your patch!

The Subject: describes what the patch does (which was obvious from the
code anyway) but the changelog fails to explain *why* the change was
made.  You've explained "why" adequately within this discussion so I
suggest you condense those words into this patch's changelog.


General muse: if a reviewer asks questions regarding a patch then we
should treat those questions as bug reports against the changelogs and
code comments: required information is missing.  So please let's go
through reviewer questions as we prepare the next revision of a
patchset and make sure that all those questions are fully answered,
