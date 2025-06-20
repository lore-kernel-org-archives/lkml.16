Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CFA1F5842
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440071; cv=none; b=m+1bMv22xUbOctRubP2CJldNjcJq2cBQNneEdbGWPPstZUFbRpS+obqApsBVAK1rXjzS1VFXjsxLHUJRnr11G0YWwpL0g59vcEnMinVm9C5QwFpa1HHObJ7R2m3sLJZkL3l+oyop5XT9ojK5qdmdfqVR+maqZX4VvJuz8gX+9yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440071; c=relaxed/simple;
	bh=t6w5g9PHHJ0JICEUNKNQrpwD7Yaeo4JQujpqVDAF6tI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZGy14+53MN3ZmgSNaHIbID8XleXX52aT/e7TUNyVMFMW7Q5f0DNWm0IKYw++IgJ1nA1yWn8S1079uQSe5xwRTNUdkMSy+pfiLKA9dN6+DCHd7MDXBTs2m4FunKyTxYrtk7ZvPZGl2Bw8SjqEOVLvD2bXtSj8ACVrysrSChJqcog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5lbiMfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5lbiMfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A7BC4CEE3;
	Fri, 20 Jun 2025 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750440071;
	bh=t6w5g9PHHJ0JICEUNKNQrpwD7Yaeo4JQujpqVDAF6tI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r5lbiMfDny1QstFlimSGvFGFtKmO3FDPV+hWhclfVN7fGQbsgtAsjr9LewoakZQlI
	 db51yK6ywvkHkjxmPktB8ChBw8oXPZmYF1RVXes/KgiG8p9nqKMNrj5TA248S27zYg
	 z5xr0Fxa4Uu+CXhm2ip8Y3ICqrmHX/0Kc92469agpxveDCO6JgYiqO+GWnCZDc901Z
	 0ln5VdxSoxY+24cuXux7qDbJwATtBto7Y9TNOJLR1RD7U2KJUHPmBVJYl6FDCZYGH7
	 Qw0d6h52zz6hXR+1wP1gWcpeHWstYP+iIgzg/YRojeIXwgeoIoT6TqpkB1kbuPNYop
	 XcQtg7MfAPK0w==
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
Subject: Re: [PATCH v2 0/5] madvise cleanup
Date: Fri, 20 Jun 2025 10:21:08 -0700
Message-Id: <20250620172108.95944-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 16:33:00 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> This is a series of patches that helps address a number of historic
> problems in the madvise() implementation:
> 
> * Eliminate the visitor pattern and having the code which is implemented
>   for both the anon_vma_name implementation and ordinary madvise()
>   operations use the same madvise_vma_behavior() implementation.
> 
> * Thread state through the madvise_behavior state object - this object,
>   very usefully introduced by SJ, is already used to transmit state through
>   operations. This series extends this by having all madvise() operations
>   use this, including anon_vma_name.
> 
> * Thread range, VMA state through madvise_behavior - This helps avoid a lot
>   of the confusing code around range and VMA state and again keeps things
>   consistent and with a single 'source of truth'.
> 
> * Addressing the very strange behaviour around the passed around struct
>   vm_area_struct **prev pointer - all read-only users do absolutely nothing
>   with the prev pointer. The only function that uses it is
>   madvise_update_vma(), and in all cases prev is always reset to
>   VMA.
> 
>   Fix this by no longer having aything but madvise_update_vma() reference
>   prev, and having madvise_walk_vmas() update prev in each
>   instance. Additionally make it clear that the meaningful change in vma
>   state is when madvise_update_vma() potentially merges a VMA, so
>   explicitly retrieve the VMA in this case.
> 
> * Update and clarify the madvise_walk_vmas() function - this is a source of
>   a great deal of confusion, so simplify, stop using prev = NULL to signify
>   that the mmap lock has been dropped (!) and make that explicit, and add
>   some comments to explain what's going on.
> 
> v2:
> * Propagated tags (thanks everyone!)
> * Don't separate out __MADV_SET_ANON_VMA_NAME and __MADV_SET_CLEAR_VMA_NAME,

FWIW.  If this cover letter is added to the first patch, like Andrew usually
does, as-is, checkpatch.pl may warn like below.

   WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)

Obviously no real problem and I don't really care.  I just found this since my
tool (hkml) runs checkpatch.pl after adding the cover letter to the first
patch, and hence this is just FWIW.


Thanks,
SJ

[...]
