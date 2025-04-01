Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CE74207F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542568; cv=none; b=KOLVuQz0RpxgVLdPcgyQE1AoOaOBh1hoy5i4T59d0cO2Xm+WJ+Sbzjk2tJmad+8B88ByDSgw8fjW7gXG7ilj9dCGVDGP5RQXApGVrFSRXrmI9xUsqcAQvWWx5slWzGCqgN2D+og2l9bqsdaQZwxv4b6pGXGxucItoXQ+/936VL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542568; c=relaxed/simple;
	bh=iJ5hAt4ZYrZ1lmIKjC7eupI+Cemp/nML+Ih+V2zVXKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GWNliUeEGQWiHoRxVB7XBGUXj07zpTEt2+jXr0x4xmAVoTeBk/Yh3zPwTiKsh4jxfDU6FKhYPrv1UdwLVCspktFoDDAGbyoNekCWKxoJqPbV9pH5H2SWAtLzrHiDLZQO2AkuDPdJVVD7uHRsSz5se4sYyXifdlobY2XaLmxGEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJB+chDP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJB+chDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD17C4CEE4;
	Tue,  1 Apr 2025 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743542567;
	bh=iJ5hAt4ZYrZ1lmIKjC7eupI+Cemp/nML+Ih+V2zVXKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJB+chDPpAmSfykBaIMX1hLiu5kcwVjLIIP6Gn3XuY+KhyJsJ0CA8wNb04kdOo1CO
	 t/i5PorgsnPZ631Kx0kSGLDibLuD71UHPPUNlBqgOryMCfX4YJa/EvenscnigbKdnV
	 hGeXjioheuyhvWpkMg9VSQkJLoBvw7cHOHDs4YTx6khrCr6YxKxWuRUvrBMGibyCTO
	 2Dl3Zre375bh49V1mY1mla+TZhnB/XVXQFrJ0hkcEpI3HxN5+aGcvwqSc8+Zu+wKR/
	 BkvZv2PyzpZ27zJZk9iBDCOMvIHhL+4bH+w/eRwIsBb2/aRgPcUQHCfMasA4sBf1Vv
	 RQFD31Dvtlx0g==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 9/9] mm/madvise: remove !tlb support from madvise_{dontneed,free}_single_vma()
Date: Tue,  1 Apr 2025 14:22:44 -0700
Message-Id: <20250401212244.81644-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <9891d4a4-954f-42f2-b60e-d42796627c7e@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 12 Mar 2025 13:46:38 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Tue, Mar 11, 2025 at 02:02:11PM -0700, SeongJae Park wrote:
> > On Tue, 11 Mar 2025 14:01:20 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> >
> > > On Mon, Mar 10, 2025 at 10:23:18AM -0700, SeongJae Park wrote:
> > > > madvise_dontneed_single_vma() and madvise_free_single_vma() support both
> > > > batched tlb flushes and unbatched tlb flushes use cases depending on
> > > > received tlb parameter's value.  The supports were for safe and fine
> > > > transition of the usages from the unbatched flushes to the batched ones.
> > > > Now the transition is done, and therefore there is no real unbatched tlb
> > > > flushes use case.  Remove the code for supporting the no more being used
> > > > cases.
> > > >
> > > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > >
> > > Obviously I support this based on previous preview :) but I wonder if we
> > > can avoid this horrid caller_tlb pattern in the first instance.
> >
> > I will try, though I have no good idea for that for now.
> >
> > Maybe we could simply squash patches 7-9.  I'm bit concerned if it makes
> > changes unnecessariy mixed and not small, but I have no strong opinion about
> > it.  Please feel free to let me know if you want that.
> 
> Yeah, though maybe try to make things as incremental as possible within
> that?

Now I think we can make entire batching change for MADV_FREE first, and then
make another change for MADV_DONTNEED[_LOCKED].  In the way, the caller_tlb
pattern will not be introduced at all and changes in individual commit would be
small and dense.

Please let me know if you have any concern about it.  If I don't hear some
concerns about it, I will format the next spin in the way.


Thanks,
SJ

[...]
