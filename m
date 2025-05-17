Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1176C2C6;
	Sat, 17 May 2025 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747513529; cv=none; b=naswXoyl8cV7WPh6cgoyc0giBNgWDP/8B3sxu4anUdevkN8cgppV60+zM/C2XBaOyQzlfVy4iCF4YKbUyC570oKMyywY6P3cyLyuLqTHhGxk0cQLbJGr9UPN9hL96k9+UTWDF31gGhzWbE5XLClYuStszQ6iU8l7gFPfU+nMFxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747513529; c=relaxed/simple;
	bh=q/+LJzWV//jJOpKwrMia7KlW4iMjaB4bjxmcmW7qiw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kqQ3BLq7FZoC/cKN5JDxPi9Z/BDCZuBvaixavXXEtRUPvAf0nOPhpYiDbt2OYXJHnU6HmQp0CXkP0f+mkJOje0F4IiMywMQX6jZERp0PaS0Uo9Y2dVv730nJqYl2qekgAMMF/I6nLf4swpDY0PV1L3Y7SxrBthF1qLI9UN0DUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHN5K+e3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHN5K+e3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E201EC4CEE3;
	Sat, 17 May 2025 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747513529;
	bh=q/+LJzWV//jJOpKwrMia7KlW4iMjaB4bjxmcmW7qiw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHN5K+e3zuEN/BDoe9RC8m3AEMhJKFPcFc2TF8QUouNHFZ4jPXTmHB6dJM0nw7zN+
	 HdS9ZZGfCiaFPrf1rbHbkiIxPuDkhWD1UQ8xUNt4djb2gZiPhge0uT/cwP8wCz0sfE
	 K1oTJGXqfprP2UU229Nl6tSNYxvlPfCkiApc1AxuPJvi1eBp47dAKzKiP7E5rjiefW
	 lqe4sXol5lzO+WnM7FJW+KkVUy+rNrBzpZTZ1Gjcp1nD2MiNK+eWam0Z+rZYyMoZdn
	 fjnhkwL7azFvIlqNg2Ckke0W10sOi8dIJGlPB9Gi5uqCQUI21nSuA6r8waTyjyoeeG
	 VOYL0e5stpqMw==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: Is number of process_madvise()-able ranges limited to 8? (was Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process)
Date: Sat, 17 May 2025 13:25:26 -0700
Message-Id: <20250517202526.39730-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <005161f7-d849-41a9-8350-f56e52c49e7e@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 17 May 2025 19:50:34 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

[...]
> Let's keep this simple - I'm just wrong here :) apologies, entirely my
> fault.

No worry, appreciate your kind and detailed answer.

[...]
> Anyway, let's dig into the code to get things right:
[...]
> So - this confirms it - we're fine, it just tries to use the stack-based
> array if it can - otherwise it kmalloc()'s.
> 
> Of course, UIO_MAXIOV remains the _actual_ hard limit (hardcoded to 1,024
> in include/uapi/linux/uio.h).

Thanks for kind clarifications.  All your explanations perfectly matches with
my understanding.  I'm happy to be on the same page with you!

> 
> The other points I made about the proposed interface remain, but I won't go
> into more detail as we are obviously lacking that context here.
> 
> Thanks for bringing this up and correcting my misinterpretation, as well as
> providing the below repro code, and let's revisit your old series... but on
> Monday :)

Sure, and no worry, take your time :)

> 
> I should really not be looking at work mail on a Saturday (mea culpa, once
> again... :)

I hope your remaining weekend be calm and uninterruptable.  Keeping you not
burned out is important for the community :)

> 
> One small nit in the repro code below (hey I'm a kernel dev, can't help
> myself... ;)

To me, being a kernel programmer rather than a user-space c code programmer is
a good excuse for asking to be generous to my user-space bugs ;)  Thank you for
your kind comment below, anyway :)

> 
> Cheers, Lorenzo
> 
> >
> > Attaching my test code below.  You could simply run it as below.
> >
> >     gcc test.c && ./a.out
> >
> > ==== Attachment 0 (test.c) ====
[...]
> > 	ret = syscall(SYS_process_madvise, pidfd, vec, NR_PAGES,
> > 			MADV_DONTNEED, 0);
> > 	if (ret != MMAP_SZ) {
> > 		printf("process_madvise fail\n");
> > 		return -1;
> > 	}
> 
> To be pedantic, you are really only checking to see if an error was
> returned, in theory no error might have been returned but the operation
> might have not proceeded, so a more proper check here would be to populated
> the anon memory with non-zero data, then check afterwards that it's zeroed.
> 
> Given this outcome would probably imply iovec issues, it's not likely, but
> to really assert the point you'd probably want to do that!

Good points!  I once considered making this test better and posting to be
included in mm selftests, but found no time to do that so far.  Above input
must be very helpful in a case that I (or someone else) find a time to write
such process_madvise() selftest.


Thanks,
SJ

[...]
