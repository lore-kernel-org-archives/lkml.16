Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E840218AB7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695384; cv=none; b=jWA8tjEESGeDYVd8E0I51t14FE5mgdnfiuaRQ2qi5zK1TAO0416BxPLB2IRH6eldPx/+23cvi12Rqt1wu4UCOuLnWwfYTxLAIafJVscnu7oM4AWdC5cFCnlRdq5KFImkGEqtBMcsA6Fuby+0neEtUs+d6tbCj6hDavRZgwRAblw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695384; c=relaxed/simple;
	bh=caEGT4elt1SHAMsy7JXR43OhY3cX9tXPn5PzzCPAheA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ENOV1iU9UlWwyaiQCnK7nkYeGHMUo5JUIWj+xOxfGlOCNpvyIvQ5k6eaIkUfAlt2/BkpgPwfljuixrpHzEyW+oyWKTMn2bl1UyA89d46XWo2xU/vcQSxrdww0sQn5wOmzWfDXWFfR5/5dNah3g29V96pgniSOd3jpzMLk26aVN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StCO5zNU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StCO5zNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4389AC4CEDF;
	Tue,  4 Feb 2025 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738695383;
	bh=caEGT4elt1SHAMsy7JXR43OhY3cX9tXPn5PzzCPAheA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=StCO5zNUL05c6eVpQzojHrRkgc5ouUfv5IpiTssi/rVOK42X9iXn3d9h4miPtNi8P
	 ajJn4OTjLDaPn/TPYKotpWevNRR6XcqqE0uVvAqjXQHzChzDb/LNJbAE+aRyzCfmQx
	 GCNwXD8G0TZmq6QohSv6EK+88hgAEfVyfa0RBDrxuofwgcY4Rfv9Vjx/i4fXUxBFAs
	 tSQtduXTVjSR6umO53axmTnte52GtqoLLFoN1iGolrHMRF7b0mgWMSjM7VFaB/3q2M
	 xM7PUAJSE8Q3Z8jggFA8tDy5PvErAB9jr8IZbmB4EROmofXuC5X2ld1xNjnD8CYW6Y
	 3Sl3MZ8pu4h2w==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Tue,  4 Feb 2025 10:56:20 -0800
Message-Id: <20250204185620.15928-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 31 Jan 2025 16:53:17 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > Optimize redundant mmap lock operations from process_madvise() by
> > directly doing the mmap locking first, and then the remaining works for
> > all ranges in the loop.
> >
> > Signed-off-by: SeongJae Park <sj@kernel.org>
[...]
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -1752,9 +1752,26 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
[...]
> >  		/*
> >  		 * An madvise operation is attempting to restart the syscall,
> >  		 * but we cannot proceed as it would not be correct to repeat
> > @@ -1776,6 +1793,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >  			break;
> >  		iov_iter_advance(iter, iter_iov_len(iter));
> >  	}
> > +	madvise_unlock(mm, behavior);
> >
> >  	ret = (total_len - iov_iter_count(iter)) ? : ret;
> 
> So I think this is now wrong because of the work I did recently. In this code:
> 
> 		/*
> 		 * An madvise operation is attempting to restart the syscall,
> 		 * but we cannot proceed as it would not be correct to repeat
> 		 * the operation in aggregate, and would be surprising to the
> 		 * user.
> 		 *
> 		 * As we have already dropped locks, it is safe to just loop and
> 		 * try again. We check for fatal signals in case we need exit
> 		 * early anyway.
> 		 */
> 		if (ret == -ERESTARTNOINTR) {
> 			if (fatal_signal_pending(current)) {
> 				ret = -EINTR;
> 				break;
> 			}
> 			continue;
> 		}
> 
> Note that it assumes the locks have been dropped before simply trying
> again, as the only way this would happen is because of a race, and we may
> end up stuck in a loop if we just hold on to the lock.

Nice catch!

> 
> So I'd suggest updating this comment and changing the code like this:
> 
> 		if (ret == -ERESTARTNOINTR) {
> 			if (fatal_signal_pending(current)) {
> 				ret = -EINTR;
> 				break;
> 			}
> 
> +			/* Drop and reacquire lock to unwind race. */
> +			madvise_unlock(mm, behaviour);
> +			madvise_lock(mm, behaviour);
> 			continue;
> 		}
> 
> Which brings back the existing behaviour.

Thank you for this kind suggestion.  I will update next version of this patch
in this way.

> 
> By the way I hate that this function swallows error codes. But that's not
> your fault, and is now established user-facing behaviour so yeah. Big sigh.
> 
> >
> > --
> > 2.39.5


Thanks,
SJ
