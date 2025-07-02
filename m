Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1951BD035
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480200; cv=none; b=mwRcnCO/3y2ZfatWZsA7ITMFp6j6zgaxjnWfd2pTPcRALC0tOym+ucNmvkteUvUv7EYkF1QPrZPqG8Vey9A0xX8/wKkbvCI6CWnT4oXzZh8RtXyRYMGayEpxmIOmk6AQc9vSXooSOVzWxOpeX1egyk78Uf6kI6ud3xnJ1K01QPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480200; c=relaxed/simple;
	bh=mo/coVNz2exJHdqFowDYNra/bNpVUtQBGFYebIEfbIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXr1xYY2lExJB3NFIVaYn0bGIWNoJwoCzVvc1NO0O3r7NL0K3F9fIWlR8Ha6WppMryUhiP5PZUgNmkrbc4psb2/d1UNqKOtjL7Bhd1cwheZRajnfs5wZJEJWqCD2/il1xLzqwSHySprFHml5CKSD2VQDfYNkcusFjqKuZaqwPMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUGrthuu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUGrthuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AFDC4CEE7;
	Wed,  2 Jul 2025 18:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480200;
	bh=mo/coVNz2exJHdqFowDYNra/bNpVUtQBGFYebIEfbIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUGrthuu99We5h4+ZEH6Ob8quGIahQ5SCVVrjASu51OjQi83kL1wxo1J6JWYiVxzC
	 Crkj7Ldl2ZokOjE0lcb4kcof2sxN7ic98Ue4Aw7gFpFfHuj3mfZ8DUuYVJjud2KJ/c
	 Lb5/rYriNHSIe47ldXwVkg00YWmJhZxGkfCzc5EanVVGca9QcpduGIVzWuXIuTu/Xh
	 hlb6JkCfwQ7QGDd3P6CSrxuS+3SKhZfnAOcxZedDmswKpWOFv7sir+4uiY+ZL4+5Xw
	 R7q34YAdz2LEtGV/my6lu/zCTxOk3mmeDio3lliOviv8IL7y/i1RGn1jGKyfBEfL9S
	 N3y0TiltKehLQ==
Date: Wed, 2 Jul 2025 21:16:31 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGV3fyZ0eGAt7Wag@kernel.org>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>

On Tue, Jul 01, 2025 at 10:04:28AM -0700, Suren Baghdasaryan wrote:
> On Mon, Jun 30, 2025 at 3:16 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > It seems like we're assuming a _lot_ of mm understanding in the underlying
> > driver here.
> >
> > I'm not sure it's really normal to be handing around page table state and
> > folios etc. to a driver like this, this is really... worrying to me.
> >
> > This feels like you're trying to put mm functionality outside of mm?
> 
> To second that, two things stick out for me here:
> 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> levels. uffd_copy is almost the entire copy operation for VM_SHARED
> VMAs while uffd_get_folio is a small part of the continue operation.
> 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> last patch is quite a complex function which itself calls some IMO
> pretty internal functions like mfill_atomic_install_pte(). Expecting
> modules to implement such functionality seems like a stretch to me but
> maybe this is for some specialized modules which are written by mm
> experts only?

Largely shmem_mfill_atomic_pte() differs from anonymous memory version
(mfill_atomic_pte_copy()) by the way the allocated folio is accounted and
whether it's added to the page cache. So instead of uffd_copy(...) we might
add

	int (*folio_alloc)(struct vm_area_struct *vma, unsigned long dst_addr);
	void (*folio_release)(struct vm_area_struct *vma, struct folio *folio);

and then use them in mfill_atomic_pte_copy():

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bc473ad21202..6bad0dd70d3d 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -247,8 +247,11 @@ static int mfill_atomic_pte_copy(pmd_t *dst_pmd,
 
 	if (!*foliop) {
 		ret = -ENOMEM;
-		folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, dst_vma,
-					dst_addr);
+		if (uffd_ops(dst_vma) && uffd_ops(dst_vma)->folio_alloc)
+			folio = uffd_ops(dst_vma)->folio_alloc(dst_vma, dst_addr);
+		else
+			folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, dst_vma,
+						dst_addr);
 		if (!folio)
 			goto out;
 
@@ -307,6 +310,8 @@ static int mfill_atomic_pte_copy(pmd_t *dst_pmd,
 	return ret;
 out_release:
 	folio_put(folio);
+	if (uffd_ops(dst_vma) && uffd_ops(dst_vma)->folio_release)
+		uffd_ops(dst_vma)->folio_release(dst_vma, folio);
 	goto out;
 }
 

-- 
Sincerely yours,
Mike.
