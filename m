Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A030E830
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443047; cv=none; b=Am8Z36wVsTKcma0aQcafGmBa9mCY9t6EAlrZs+Jt+VF0gkhVi8IjUContw/MM2OnHkEESFEE13xI/mio7nFkCs7JgAOt1/ewjgGdGCrBSNo+b9SuE8Hm3NEoY7WkglZ2BImIthY7RxiT8FgsnOpeOD/fyoX6NTymyIbrYgCR5Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443047; c=relaxed/simple;
	bh=J8Nl1w3Bz4qNvS66v1+AAKgiyqE2IyU1rywepTjaUug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CIvyXx/n4fJavN/OqSjY23lJ+tukDZt/MsA8eb9PWqCSpBvzBryeeWPNiQHfXvwAl6a8pJ/6Vf9mXHCT/naalj1rcshC7euGPmZIK62LjdJD4dAhllDKcK3QHMnxwM6znr6zYBm03qBHSfpImTAzET1UuI1q3cIisqIRNo/qOmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKOPja0W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKOPja0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0423AC4CEE3;
	Fri, 20 Jun 2025 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750443047;
	bh=J8Nl1w3Bz4qNvS66v1+AAKgiyqE2IyU1rywepTjaUug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SKOPja0WBwkiJLxWLGFy579v5Nb+o5AceZhAJqVD7Rhgj8k5cgNZp4i3+KG72WMmp
	 sZ3WgxQOeb+40SjTYlQlrNLWUg5paqBEyVdkTjgf2/u3uIdDyJ7vBdnHUNV1PBzfLm
	 6TIxswvB8MLjBFqCmnMVHqOnF3K7hRoHZryx/76TioYT0V35jGqud3XBvuehzzkY2d
	 q3UC3z4+6x0RuLVDuYeED9L9aO+IZxA/ME1Jbn/ZaG5gkae16HfX0qaLhMKktugf72
	 6so3S03wC9+ijwSatL7kDsAKZHwEi10ODUlUvjopGPcArLP02Ihxi7xvtTds7flNg4
	 iHMxBKgGsnVMw==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <ioworker0@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 5/5] mm/madvise: eliminate very confusing manipulation of prev VMA
Date: Fri, 20 Jun 2025 11:10:44 -0700
Message-Id: <20250620181044.96643-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <63d281c5df2e64225ab5b4bda398b45e22818701.1750433500.git.lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 16:33:05 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> The madvise code has for the longest time had very confusing code around
> the 'prev' VMA pointer passed around various functions which, in all cases
> except madvise_update_vma(), is unused and instead simply updated as soon
> as the function is invoked.
> 
> To compound the confusion, the prev pointer is also used to indicate to the
> caller that the mmap lock has been dropped and that we can therefore not
> safely access the end of the current VMA (which might have been updated by
> madvise_update_vma()).
> 
> Clear up this confusion by not setting prev = vma anywhere except in
> madvise_walk_vmas(), update all references to prev which will always be
> equal to vma after madvise_vma_behavior() is invoked, and adding a flag to
> indicate that the lock has been dropped to make this explicit.
> 
> Additionally, drop a redundant BUG_ON() from madvise_collapse(), which is
> simply reiterating the BUG_ON(mmap_locked) above it (note that BUG_ON() is
> not appropriate here, but we leave existing code as-is).
> 
> We finally adjust the madvise_walk_vmas() logic to be a little clearer -
> delaying the assignment of the end of the range to the start of the new
> range until the last moment and handling the lock being dropped scenario
> immediately.
> 
> Additionally add some explanatory comments.
> 
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
