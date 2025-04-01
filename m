Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF1C147
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743475694; cv=none; b=bOg62atneZWSIgbM6xLRC3gfc+xh/+52ocbtOPC4F3XGEBVIfa1HH7inzL6SHa4gTa1oNU69B9gAoTBVN84g2bFEQ4ZutIS2mETv4y10F9rWkeftdTvd9QjIfjF/d9QoHkfLRuAYB+ol0Uf86POFJ9xqB6xh095hpbWo18QmuXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743475694; c=relaxed/simple;
	bh=fHO1nL3dUgznetfKSdC3szi72wLred2lzovoU+DBAxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WPOGBlFUfq3d6pIeEqWjT0JiNtHe/QXC8skfPGvizVq7zCZ15Itu0Ar9pxj4lTYKbVQnpbNtWHkeru+lJKf7tt7a7E43NRO5sa0rP9ar3ZaVpTvzMYpaW11frOnxgBBYV7LTaxVfuGbIoArHr0RjFwelp3bgplnM2EA4lKwdoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhqZmFID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhqZmFID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91A6C4CEE3;
	Tue,  1 Apr 2025 02:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743475694;
	bh=fHO1nL3dUgznetfKSdC3szi72wLred2lzovoU+DBAxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hhqZmFID+a5Fp0W3d3Mys3tpRMaW84LHGaIs9PphxCnb5NcPw5WCeKsYyW1Zpa6Nm
	 J2Al7krcJidZGSb/2nKOBNK55ExCumrm7I4tw1CIF2tz5TrR7xItBDBe8yZ5R96eaq
	 EVdJ1kyu7qHsvqrHyWHYW/dux3ieCLgk8LaXcvgs38X/9DXtrG0dWAwk1xG2aM7Y16
	 1jb++X2TVl99bfJuoL0N6Zs/k7C5LDDlWmZ4x6vXr76VdGSZIfZKArt6Tf3n6ZZdeH
	 kec/CamdaFptlDw1CHSotIclsBoQwpujoU76VU/Qjh1Ymj4mMfdqiQGiappVQoFbh5
	 abcXS2A8ubrRw==
From: SeongJae Park <sj@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 6/9] mm/memory: split non-tlb flushing part from zap_page_range_single()
Date: Mon, 31 Mar 2025 19:48:11 -0700
Message-Id: <20250401024811.4285-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <maypa4pf2fp7zcee5dazgeoowaxl4n4vnqhnfhck3yscchp5vj@dz2mmunbvm5j>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Mar 2025 21:45:40 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> * SeongJae Park <sj@kernel.org> [250310 13:24]:
> > Some of zap_page_range_single() callers such as [process_]madvise() with
> > MADV_DONEED[_LOCKED] cannot batch tlb flushes because
> > zap_page_range_single() does tlb flushing for each invocation.  Split
> > out the body of zap_page_range_single() except mmu_gather object
> > initialization and gathered tlb entries flushing parts for such batched
> > tlb flushing usage.
> > 
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> > ---
> >  mm/memory.c | 36 ++++++++++++++++++++++--------------
> >  1 file changed, 22 insertions(+), 14 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 78c7ee62795e..88c478e2ed1a 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1995,38 +1995,46 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
> >  	mmu_notifier_invalidate_range_end(&range);
> >  }
> >  
> > -/**
> > - * zap_page_range_single - remove user pages in a given range
> > - * @vma: vm_area_struct holding the applicable pages
> > - * @address: starting address of pages to zap
> > - * @size: number of bytes to zap
> > - * @details: details of shared cache invalidation
> > - *
> > - * The range must fit into one VMA.
> > - */
> > -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > +static void unmap_vma_single(struct mmu_gather *tlb,
> 
> I could not, for the life of me, figure out what was going on here until
> I realised that is is a new function name and not unmap_single_vma(),
> which is called below.

Agreed, definitely the name is confusing, especially given the existence of
unmap_single_vma().

> 
> Can we name this differently somehow?  notify_unmap_single_vma() or
> something better?

notify_unmap_single_vma() sounds good to me.  I'll use the name in the next
revision unless we find a better one.

> 
> Also, maybe add a description of the function to this patch vs the next
> patch?

That makes sense.  In the next revision, I will add the kernel-doc comment
here, but not as a valid kernel-doc comment (maybe wtarts with /* instead of
/**) since this function is a static function as of this patch.  On the next
patch that makes this non-static, I will make the comment a valid kernel-doc
comment with a minimum change.

I prefer not having a valid kernel-doc comment for static function, but that's
just a personal preferrence and I have no strong reason to object other way.
Please feel free to let me know if you prefer making it valid kernel doc
comment starting from this patch.

Thank you for nice suggestions, Liam.


Thanks,
SJ

[...]
