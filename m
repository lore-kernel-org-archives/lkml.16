Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E22F22
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057932; cv=none; b=LVLCvSlMJD87Y6N3D9akg8JLrfWLBcTG49RMAE8ghLZrjUdUo6WN+R9+9dHrCKdpSyvRBpkHyuw191VZ7S/HKr5hm5M9kcC7UvdqdE3EAVWSVP5CpB1JmmVjnAdDN9xKnajq0MEpsQTZ6IQ39y9c2C845xgkNjutJvwy99+ZK7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057932; c=relaxed/simple;
	bh=SD9ZtYC8DZGJPnmggzhoPOkgEH8ofRd+R865IgSmohQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X43eCnm5LEx9JAml/+P4oPlRkzDA6evcqXxsz8l5peF1I3QIQPGdcc+UNyIqL0Z0w73Meayibwm6SDeMtNYBW51Y146hM9QlVp/BKAd4XYDDe3o5FnZbQzr5g9xjNN8XnrVJvaZLN0i16NMxPwfkj/HI2FsgQn9ENlFMpRCvsTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqbCR5rZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqbCR5rZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD34C4CEE4;
	Wed,  4 Jun 2025 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749057930;
	bh=SD9ZtYC8DZGJPnmggzhoPOkgEH8ofRd+R865IgSmohQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gqbCR5rZgMbTFYPVMyb5Cw07NuruYy+eiQkUGkBbqRSXm6w/RtrfJFw9Tsz0fvxhO
	 imtpwSf67o4rLqv2Ziol8cZMvdRDOabPPP3lyJ9xLp/d9q41eSs0OYmEc5SG4gJuIe
	 HoL4TYD4wXBGk/w6+9yjRwrQSIJhSvQZ3xbg3EKJZi4KFA23lQTkEjSBvj9xfdrDCh
	 vKhGTLywOFVin0aybWxPmQGof+zXi4J0OwIujl6Qpn500QwZoehdb5iNVTPcQeh/Kl
	 IUtyw05TmdcqmB8wrPKLtHeChJwwo+8+t5sB9POIzWH3p8kG9cp2S5pioZe365+Ybc
	 Y21Z0IXNUQSnw==
From: SeongJae Park <sj@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Date: Wed,  4 Jun 2025 10:25:27 -0700
Message-Id: <20250604172527.7245-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604140544.688711-1-david@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  4 Jun 2025 16:05:44 +0200 David Hildenbrand <david@redhat.com> wrote:

> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.
> 
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.
> 
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> happen", but more reasonable to check for during early testing.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
