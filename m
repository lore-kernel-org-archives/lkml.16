Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED102576
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328916; cv=none; b=YT2m/CmLWnxfByjwQ92u+E8kUnpgZOoIDcMJ0QwGZLa2mRH14z/ClGjeKjo/7Im/Q2Tjd7F88tbi6wcNuZRsLIGkZRIPyjXnHLej33i5fZsjOEXpOKyYr1MeNgx3D36sqjJalQX+gzNIY+P0OaMg11ucVg5sukBEjpuqM1Jb8e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328916; c=relaxed/simple;
	bh=ku90VFfylAoMLWqTj/QMTIzfueRufunLQSXYhHf56S8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=k+up3WDlqhcFAnyd7n8jS/gKFh3A1Nx17sPBc7TwFV04jbUQCcszwdJ94f8Efnp0JfeF8r62zMYfJMxh9/0ySK/0aLYLzapblJ4NCQAbrf3WGx8jL6TxtrkIW3QwJvChN5foJ+UywWN0ZmG6NL1lbjaarxrs1wgJquADk4Bt4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LLv4oFBr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LLv4oFBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18655C4CEE3;
	Tue,  1 Jul 2025 00:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751328915;
	bh=ku90VFfylAoMLWqTj/QMTIzfueRufunLQSXYhHf56S8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LLv4oFBrgJbFl6AYbTuI9dWMfMThbxv+4JyBHOS067X0azzyM9P/qDe98vnNq9tbH
	 7b+xjqhR96pLIFezeQql06VfFZNU6Ezm5f5FEzFxVhewOtSncIvPcDcfcYwUYDm0M7
	 I20c80mGv7lVoGEU3IqHeKBaW+m9y1Hl+oIwAXuA=
Date: Mon, 30 Jun 2025 17:15:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, Suren
 Baghdasaryan <surenb@google.com>, Muchun Song <muchun.song@linux.dev>, Mike
 Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>, James Houghton
 <jthoughton@google.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Andrea Arcangeli
 <aarcange@redhat.com>, Oscar Salvador <osalvador@suse.de>, Axel Rasmussen
 <axelrasmussen@google.com>, Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/userfaultfd: modulize memory types
Message-Id: <20250630171514.62e447f8890ad01577a9f00a@linux-foundation.org>
In-Reply-To: <92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
	<92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Jun 2025 11:29:30 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> > It also means this series does not depend on anything.  It's a pure
> > refactoring of userfaultfd internals to provide a generic API, so that
> > other types of files, especially RAM based, can support userfaultfd without
> > touching mm/ at all.
> 
> I'm very concerned that this change will simply move core mm functionality out
> of mm and into drivers where it can bitrot and cause subtle bugs?
> 
> You're proposing providing stuff like page table state and asking for a folio
> back from a driver etc.
> 
> I absolutely am not in favour of us providing core mm internals like this to
> drivers, and I don't want to see us having to EXPORT() mm internals just to make
> module-ised uffd code work (I mean I just will flat out refuse to do that).
> 
> I think we need to think _very_ carefully about how we do this.
> 
> I also feel like this series is at a really basic level and you've not fully
> determined what API calls you need.
> 
> I agree that it's sensible to be incremental, but I feel like you sort of need
> to somewhat prove the case that you can jump from 'incremental version where we
> only support code in mm/' to supporting arbitrary file system code that might be
> modules.
> 
> Because otherwise you're basically _guessing_ that you can do this, possibly, in
> the future and maybe it's just not the right approach but that's not clear yet?

Thanks, this is pretty fundamental stuff so I'll push this series back
into mm-new while we think about it.

Soon, please - I don't want people to be basing new work on something
which might go away,

