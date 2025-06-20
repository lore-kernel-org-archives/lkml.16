Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3272630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750439579; cv=none; b=COTw0k/PS89mhhE1vpPBgrFyMlIQjKen1d/2kxXkf5Rs+kv0FAKCTgu+MMjbCEj3AqTaz469gbhpOeCs08n3xaxgELLPKtiM/MgZuUAkgf84EDX2bwS/MwiP3QGCh5xBO+lpPO1U++kcLBqPtmMvB0FYX3gc1e59tjW35Vy1Z/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750439579; c=relaxed/simple;
	bh=jHlMq2FYYEcJOb4AGIUYgpbhEzPJqg2oFMwJvqUlbSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hOf2gjAkQW2tWd3G8+vYEGFF42+80mOfxzGXtbR/g1z5jLOfhKPk3Ohs3JMR6g0ePBFTheNp9rAkhpoax6kvTkD2Qj1QDPwweVOCzUPYbXTtvkyzxif4N9q6QU7ACkqQArUAcM+uravIXWlmY6yQjEBMHzgRSOZKOrt80cBVYIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuts0seH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuts0seH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722CAC4CEE3;
	Fri, 20 Jun 2025 17:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750439578;
	bh=jHlMq2FYYEcJOb4AGIUYgpbhEzPJqg2oFMwJvqUlbSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nuts0seHm9uHjZRrpyeagshZNw3M3G/itBNDAvZTUIA1AUYYdaydnCKrgn3415JXJ
	 1meN7guelE3qjgpJg1TfDJYBpELuW+aNoZWKiZYLnZJOX7Og1l+2GBo8HdA+EmRf0j
	 C2dCM1BRfjxk6Kt71iUgmGFUQdmasf9vXQARNdE9v8RFN2EDyj0qRCdXS1YDNWg1Hx
	 LJeMHIPmwAMseu7LRcKE6eLpznow+hAq6UMYvHWDRjibi7UxNDqWOvRRQxgggjpbvS
	 FEx1djYZSw00hNM0uu6YAkM4mcodmZ6h+/FdC7U0Nnf3mKXN16eoEOGn88q/HgKa6I
	 PAfWzXSuEQY7g==
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
Subject: Re: [PATCH v2 1/5] mm/madvise: remove the visitor pattern and thread anon_vma state
Date: Fri, 20 Jun 2025 10:12:56 -0700
Message-Id: <20250620171256.95735-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 16:33:01 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Now we have the madvise_behavior helper struct we no longer need to mess
> around with void* pointers in order to propagate anon_vma_name, and this
> means we can get rid of the confusing and inconsistent visitor pattern
> implementation in madvise_vma_anon_name().
> 
> This means we now have a single state object that threads through most of
> madvise()'s logic and a single code path which executes the majority of
> madvise() behaviour (we maintain separate logic for failure injection and
> memory population for the time being).
> 
> We are able to remove the visitor pattern by handling the anon_vma_name
> setting logic via an internal madvise flag - __MADV_SET_ANON_VMA_NAME. This
> uses a negative value so it isn't reasonable that we will ever add this as
> a UAPI flag.
> 
> Additionally, the madvise_behavior_valid() check ensures that
> user-specified behaviours are strictly only those we permit which, of
> course, this flag will be excluded from.
> 
> We are able to propagate the anon_vma_name object through use of the
> madvise_behavior helper struct.
> 
> Doing this results in a can_modify_vma_madv() check for anonymous VMA name
> changes, however this will cause no issues as this operation is not
> prohibited.
> 
> We can also then reuse more code and drop the redundant
> madvise_vma_anon_name() function altogether.
> 
> Additionally separate out behaviours that update VMAs from those that do
> not.

Nice work!

> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
