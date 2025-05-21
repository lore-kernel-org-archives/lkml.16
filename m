Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6C231833
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747850722; cv=none; b=cvWWGxhMV1eIhseS4pe6bXaSejBeYzkcFX+itMkTLH6Eh3ZVBDN61r0I/f2Kx+sYNa5PqQteDBXPNW/1pC5a45ryrycQU38iSvseYYva49MSUvyaxHCh5i3awVcECnzHJToLVIFTyS3Im9oYiw75o9Qwkbft8dG7RYSa0UBFlXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747850722; c=relaxed/simple;
	bh=wJ+IBS6nix+cKkSYMVxMMyIXbbth2l3uCRPqwBw5UiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cej5Y7WFd8T/e6h8GqcZ6n+Bzu25ZlYj+wRopOby1Ej3wSjEPUjQxXCmnX+p7Jn5Jy8hrwh5LwaRISnQns3PJn9NUA/cR69WjoQAicwD5M0w5CjluYd8SENtx+GncDIp1r+KLJHvAwnsZtRlz1CFvbF1a0d4xyro6M6K/Xu4Llg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SV7idZWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SV7idZWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC31FC4CEEB;
	Wed, 21 May 2025 18:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747850720;
	bh=wJ+IBS6nix+cKkSYMVxMMyIXbbth2l3uCRPqwBw5UiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SV7idZWs/xKJKbWDxXKMBzFBNn/F3JlGR3/0DZmIW6pznmuBhs5IiQ0qSev2KqEG7
	 D0yjjlusB+FOAm8HklhSscofb4YEJtLyojfChftZA1/lF3bpuYmyyFmfqVkYqZBhIB
	 1Ly0A+98OYevE3eyxVx3MmIwCX2xpVEt4MF9IspGFX1WWGEVaGJRi/PKJ/nqdETc9q
	 qlygSOUqvOI6Xp+zqooewHbpEifmHg7tfhkWEqA7KDssYu+zEOPxWD9cpF3AChvy7u
	 BX4pbtecEDBnTZhgPvaIzs9F/wPdoGxP9OIsS2O3p102yBuWL02dk65zBuduBsyvlH
	 Aey0DH7yMHbKw==
Date: Wed, 21 May 2025 15:05:17 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Fei Lang <langfei@huawei.com>, peterz@infradead.org, mingo@redhat.com,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	adrian.hunter@intel.com, kan.liang@linux.intel.com,
	james.clark@linaro.org, linux-kernel@vger.kernel.org,
	hewenliang4@huawei.com, liuchao173@huawei.com,
	laihangliang1@huawei.com
Subject: Re: [PATCH] perf comm str: Fix perf top coredump due to concurrent
 read and write
Message-ID: <aC4V3fgxT7YIsWu-@x1>
References: <20250519114836.611110-1-langfei@huawei.com>
 <CAP-5=fW3UcqwnwDPye=+LxG1vPGZEaATH-ggbR73yZQnWkA03Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fW3UcqwnwDPye=+LxG1vPGZEaATH-ggbR73yZQnWkA03Q@mail.gmail.com>

On Mon, May 19, 2025 at 03:48:37PM -0700, Ian Rogers wrote:
> On Mon, May 19, 2025 at 4:56 AM Fei Lang <langfei@huawei.com> wrote:
> >
> > (gdb) bt
> >     __strcmp_evex () at ../sysdeps/x86_64/multiarch/strcmp-evex.S:314
> >     sort.comm_collapse () at util/sort.c:202
> >     hist_entry__collapse at util/hist.c:1312
> >     hists__collapse_insert_entry at util/hist.c:1620
> >     hists__collapse_resort at util/hist.c:1704
> >     perf_top__resort_hists at builtin-top.c:303
> >     perf_top__print_sym_table at builtin-top.c:350
> >     display_thread at builtin-top.c:700
> >
> > Link:https://bugzilla.kernel.org/show_bug.cgi?id=220096
> >
> > Fixes: <3178f58b9894> ("perf comm str: Avoid sort during insert")
> > Signed-off-by: Fei Lang <langfei@huawei.com>
> > ---
> >  tools/perf/util/comm.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
> > index 8aa456d7c2cd..0438870d31d2 100644
> > --- a/tools/perf/util/comm.c
> > +++ b/tools/perf/util/comm.c
> > @@ -209,13 +209,16 @@ struct comm *comm__new(const char *str, u64 timestamp, bool exec)
> >  int comm__override(struct comm *comm, const char *str, u64 timestamp, bool exec)
> >  {
> >         struct comm_str *new, *old = comm->comm_str;
> > +       struct comm_strs *comm_strs = comm_strs__get();
> >
> >         new = comm_strs__findnew(str);
> >         if (!new)
> >                 return -ENOMEM;
> >
> > +       down_write(&comm_strs->lock);
> 
> comm_strs are a uniq-ified set of strs to avoid memory overhead from
> comm events. A comm_str is reference counted and immutable. Using the
> comm_str lock on the comm struct isn't something I agree with as we
> already have thread__comm_lock.
> 
> >From the bug report $rdi is non-zero but comm_strs are immutable and
> reference counted, perhaps address sanitizer and reference count
> checking can point to the problem (add -fsanitize=address to your
> cflags). I put together some thread safety patches to see if the
> problem can be caught, but nothing that looks particularly likely:
> https://lore.kernel.org/lkml/20250519224645.1810891-1-irogers@google.com/
> I couldn't repro the problem locally.

I couldn't repro it here as well, and without your thread safety
patches, that I have applied on my notebook and I'm merging with this
workstation repo to push out.

- Arnaldo
