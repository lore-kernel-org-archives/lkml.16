Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532BC42A92
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738184967; cv=none; b=bS+KrvoCeOgO0aUd+TBdyUw4a3kuE54xXUVzXrPLH0SW6FmQhZCrBi2HZ3NVTRGGEMr1AfFxP4I8srDtrqftETTFk8qCcrBA4HqBOS/uTUa6xr8Eus7oQzbKq0qTSbVurUR8/Ajx5VeSXroZX455GN6NCXN5eVRXFdxkPiZM2hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738184967; c=relaxed/simple;
	bh=TQTIBWYLRPxqyD893pnd2s42NyRI4UfYRTS8Gad1wik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WsJB17BFl2zfIKicZLy9L/zES0LxZ/DEgfUh2sBRxDlLawxL9t7iTHPpkz8vwdvJNZt8aFgjwL7JWc0wbkxb/rthoN0EUu5NWuv28x8gN5pyZJnPmtmBuEDvydrZ5DtWNtaCtMmiR0zSzHzyIj+PvbDpKMnYQSNbBORw9g9Vtwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPVd0D0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPVd0D0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F249C4CED1;
	Wed, 29 Jan 2025 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738184966;
	bh=TQTIBWYLRPxqyD893pnd2s42NyRI4UfYRTS8Gad1wik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HPVd0D0Y4Wtuu39XDsPx0nToqlQkIbkBr72RYBBhQpVeRC/FWIEmmfwjPRmVNHskt
	 9ayUJDkvHMfeuj2yV+ni1jgOhmZ71FP7RdDNicPw9OHSp42WEeE9dNZKQNc+WEQBD1
	 8Gx76rKSYP0XraqB5W+ezbPLPm9YdK3PC09S2Rca74K/foXOLbCLvNzHfGJTDM23dh
	 C1LY+1tS/nACMRSG7hnGcs50kgruXMbNc/A13ANWRLdGgJ7MOe3YGsnoG8xSCpYIV1
	 //CpSWpsLKoMVcn02/E6cKP1cLqBJlNBSioidFcF7IuPFC/W7zfAAdbYKpVBCw0z+P
	 m0tFP9sfYV4BQ==
From: SeongJae Park <sj@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 0/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Wed, 29 Jan 2025 13:09:23 -0800
Message-Id: <20250129210923.1861-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <y6xr7cpka4mvd7kwn7ajvacwby6rs6xj2o3zrkbcufkslcjqxn@ju7hi6ty4tnf>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Shakeel,

On Wed, 29 Jan 2025 11:22:29 -0800 Shakeel Butt <shakeel.butt@linux.dev> wrote:

> On Thu, Jan 16, 2025 at 05:30:54PM -0800, SeongJae Park wrote:
> > process_madvise() calls do_madvise() for each address range.  Then, each
> > do_madvise() invocation holds and releases same mmap_lock.  Optimize the
> > redundant lock operations by splitting do_madvise() internal logics
> > including the mmap_lock operations, and calling the small logics
> > directly from process_madvise() in a sequence that removes the redundant
> > locking.
> > 
> 
> You skipped the evaluation section which was present in the v1. If you
> decide to post a new version, please include that otherwise we can ask
> Andrew to pickup the evaluation section from the v1 [1].
> 
> [1] https://lore.kernel.org/all/20250111004618.1566-1-sj@kernel.org/

Sure.  I will run the evaluation again on the new version and include the
result on the next version.

Also, thank you very much for reviews :)


Thanks,
SJ
