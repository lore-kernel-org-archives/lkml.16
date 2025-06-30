Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7C053365
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322903; cv=none; b=tn1aKQjks1126g1lfHPPjRuxLC1Tj3CouHpeiKytLlCkmcsf5y/1rrbecwkRYCmGPSpZRT3YwdIvoubtYQSPhgKy/j5PwjOLe0YrwbJc1KXDv5eqL3CMp4Gru3d9xCCaRkhYjWPHoYJ0GJGdyO8xc3MW9SeJIG1uV3NIJaFbdlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322903; c=relaxed/simple;
	bh=ce8Cwit0P9uvsqHgJ2VoewpjioHRndHSgnVlcFV7jiM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oeSbzo+zCMu/659xPNA02LIGvsSiGCNTarik+fIjU5b3QCBvPLOh705PKiQdyVG0RpfhlO6b44QkrDqMbIbF9QJ6jlq73NU+3h6CigMa63SrH8+S9LsV8g+uRJZBntTxtAjLeGqtjt4l+zm1X5im1j0HO0D1b6fy33d+PcBthRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aLNA9Hmy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aLNA9Hmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7CDC4CEE3;
	Mon, 30 Jun 2025 22:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751322902;
	bh=ce8Cwit0P9uvsqHgJ2VoewpjioHRndHSgnVlcFV7jiM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aLNA9Hmy6i1HvsFiv0tFkbY/H3/yEd2uBGmAQM07lNmJ8qgbr6KfAwK0zKjQYkNkz
	 rVUXKSwhL4nlHKfnIoicDp4zEF1BZOfhX79llchH3d1hIHMOg/YFZaCpvcOuQo7oQb
	 YXb8+EKzroNuWdJ5IDZ/7ZpmT0pSJUg1/ePVoLFU=
Date: Mon, 30 Jun 2025 15:35:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Kees Bakker <kees@ijzerbout.nl>, Gregory Price <gourry@gourry.net>,
 Alistair Popple <apopple@nvidia.com>, Byungchul Park <byungchul@sk.com>,
 David Hildenbrand <david@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>, Rakie Kim <rakie.kim@sk.com>, Ying Huang
 <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip extra call to __alloc_pages_bulk
 in weighted interleave
Message-Id: <20250630153501.64160f386faa541c93344e48@linux-foundation.org>
In-Reply-To: <20250630202115.1439224-1-joshua.hahnjy@gmail.com>
References: <7c1180f4-923c-4138-b756-618cb5d597ac@ijzerbout.nl>
	<20250630202115.1439224-1-joshua.hahnjy@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Jun 2025 13:21:14 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:

> > This is a goto into the middle of a for-loop.
> > What do you think is going to happen at the end of that loop?
> > 
> > I think (only tested with a small C program) it will go to the start of
> > the loop, do the i++, check i<nnodes, and possibly do the loop again.
> > Variable i is uninitialized at that point. In the loop it hits several
> > uninitialized variables.
> 
> >From what I can see from my code, I think the only the goto statement leads
> to a second iteration of the for loop is if allocation fails.
> But otherwise, it should be ok since we always hit
> 
> if (total_allocated == nr_pages)
> 	break;
> 
> within the loop. For the branch that takes the goto, we set
> node_pages = rem_pages, then jump to the label and allocate.
> So nr_allocated = node_pages, and total_allocated = 0 + nr_allocated
> so total_allocated = node_pages
> 
> total_allocated == node_pages == rem_pages == nr_pages, so we will break. Phew!
> 
> To cover the case where allocation fails, I think we should be breaking
> anyways, so I can definitely add a new check for this.

I do agree, that goto is a "goto too far".  That we can do a thing
doesn't mean we should do it!

> > Even if this is legal C code, it is pretty obscure.
> 
> I agree that it not very clean. I did this to reduce the amount of repeated
> code there is. Even if this code works, it could definitely be written
> better to make it more readable and maintainable. As I noted in my second
> response to Gregory, I'm not planning on pursuing this version anymore,
> so if I decide to send a second version, I'll keep this in mind.

Cool, I'll drop this version from mm-unstable.
