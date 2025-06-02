Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BA5227E90
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748886785; cv=none; b=RYE/bVosc7P8VDv5BFcenFT7lLzW49ps/lgw5Ua6PCwb94JmMBSwpIQa0V/DUbjrOiAidkYA2gOmhgYw6GH8gWr5oxvIxuehG2kE2uciuY/Gn2ebRzo4sTH6a9JwZajDQizcokXjZN/g2v9k79FJWjCv+e7vKnRCfMOMvq1n6lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748886785; c=relaxed/simple;
	bh=uWEBc01E7ixIW/R/wWSVu1frd6MhrO1U98CFMR1JsWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PyRrL3/FD4khY39gkxVyBOMM8Nw7SE4Lw09czf4PdAsy7NzM9+KivwuwO5Ed4r299jJILYjvNjC6/laBD+9rCH+xmPThCGvUJknwLVSa9zlXuiFGOyIZY4FXhfDWGDWu05xP6qhlGgEGcksV0wAMhGf5u6uL1zCYfQl0hIBNxWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf7BcB0G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf7BcB0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519C7C4CEEB;
	Mon,  2 Jun 2025 17:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748886785;
	bh=uWEBc01E7ixIW/R/wWSVu1frd6MhrO1U98CFMR1JsWs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kf7BcB0G/EghBA7aJQqJ78fZV6+3cp1SAPb3EiuiBYg9mT1x/J4txPOWT7erPPPxC
	 V18UoD7KJJtVotJWD9rLCOnytXGiuP2m6DTN0bGgWl5AOSh0KEEXK9icrZ+gvzGZA3
	 6jORp1p6RcDpIcs5NLjX19Rjd/KqCTR2AHXXY1vCwg/NvxxH+vcaKMV670K0c3nMh7
	 ipG1/Ajv7uIJuWN52wWTo5oS/SeAn5YQNZbxore++/qT28y3DennLsaRBtXZv0h0YQ
	 qkdOWXwml5vTtfIAdhCwNtUF/bTCCVRdh6JEoa5M62G4BIAJ9kqko9Q7lQvb8XCgd8
	 bY7fkm73xUXIQ==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Barry Song <21cnbao@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Jann Horn <jannh@google.com>,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Date: Mon,  2 Jun 2025 10:53:02 -0700
Message-Id: <20250602175302.1115-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602173519.37005-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon,  2 Jun 2025 10:35:19 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Sat, 31 May 2025 04:17:51 +0800 Barry Song <21cnbao@gmail.com> wrote:
> [...]
> > BTW, I found vector_madvise doesn't check the ret value of madvise_lock(),
> > it seems also a bug?
> > 
> > static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> > {
> >                         /* Drop and reacquire lock to unwind race. */
> >                         madvise_finish_tlb(&madv_behavior);
> >                        madvise_unlock(mm, behavior);
> >                        madvise_lock(mm, behavior);  /* missing the ret check */
> >                         madvise_init_tlb(&madv_behavior, mm)
> > }
> 
> Thank you for finding this, I will post a fix soon.

The fix is now available at
https://lore.kernel.org/20250602174926.1074-1-sj@kernel.org


Thanks,
SJ

[...]
