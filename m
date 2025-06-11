Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68F21B8EC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634255; cv=none; b=hGLzqs1vJuNjRT/q9BEK2TkD3iuUYbYHQQW9peweHOOmnNireaOaK2wpuZo/WDIqbFbRCDhoQJ+v3we62iLZFe4R+1OQsRH2fVxh2OqXfBC5ueZLJ8WCpmQAAyQMAOjjbufbY1KbBvg9Uv/ek4/I7XrhaT7VAnzxrdSfcHsaTAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634255; c=relaxed/simple;
	bh=cOgg6lgUEFyEcbnuu0dGxi33Q451rEg1KMhORQ9NOrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lp4EwrgWQ4MyffCvSO3l2CjqOTo//ip311ZDaPk8MsG6V24icNL2JQuABG+6rvAItHgW0N5etGKaGMiXC7TXr+KCTSbFNhTUunThjpPfdbj0EVFgy3OkANvSBmjiflqWxodpJjHM0J25mIaE4ZuV41M4ICgiOF+KLJq7FK3Vt84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8EXLgY0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8EXLgY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C82C4CEEE;
	Wed, 11 Jun 2025 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749634254;
	bh=cOgg6lgUEFyEcbnuu0dGxi33Q451rEg1KMhORQ9NOrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8EXLgY0os1ciSmYdYccnRrocKIZhcauR/+N6/zk9jHx6M4ktKWEupjt5VVLnCHms
	 qoMAdEgjR2Nu8aFQoAZfPqukuivAWisRUOekKy8v10lubTD62JRMZtyomIPuQsqBER
	 xRw952Jcs7n6/HL9/6x1ID/mQrieAHaaOZEpGXpFHGttdnUlkhphm9Jq04ZIhVN93X
	 uSflwDAXO/Fhs2OBGOBIY0bbNp4tLA53UGj/Sn0hyCdtqWWvQefYpdAe5Eu5nDuWe8
	 JkTl5DmPKGDOUX36hVOWOeZq7qiMlEwKO2aTdFI5noS40x6Gx2o7hNw69Gb86qSNLR
	 JPO8pfPD067iA==
Date: Wed, 11 Jun 2025 10:30:49 +0100
From: Will Deacon <will@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v2] arm64: Enable vmalloc-huge with ptdump
Message-ID: <20250611093048.GA10885@willie-the-truck>
References: <20250610160048.11254-1-dev.jain@arm.com>
 <e10d0c8f-c86b-4e26-8006-f38734993796@arm.com>
 <1cf5e639-dcf8-492b-9164-493ee45cc0ac@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cf5e639-dcf8-492b-9164-493ee45cc0ac@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jun 11, 2025 at 08:32:51AM +0530, Dev Jain wrote:
> 
> On 11/06/25 12:30 am, Ryan Roberts wrote:
> > On 10/06/2025 17:00, Dev Jain wrote:
> > > arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> > > because an intermediate table may be removed, potentially causing the
> > > ptdump code to dereference an invalid address. We want to be able to
> > > analyze block vs page mappings for kernel mappings with ptdump, so to
> > > enable vmalloc-huge with ptdump, synchronize between page table removal in
> > > pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> > > use mmap_read_lock and not write lock because we don't need to synchronize
> > > between two different vm_structs; two vmalloc objects running this same
> > > code path will point to different page tables, hence there is no race.
> > > 
> > > For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> > > 512 times again via pmd_free_pte_page(). Note that there is no need to
> > > move __flush_tlb_kernel_pgtable() to immediately after pud_clear(); the
> > > only argument against this would be that we immediately require a
> > > dsb(ishst) (present in __flush_tlb_kernel_pgtable()) after pud_clear(),
> > > but that is not the case, since the transition is from
> > > valid -> invalid, not vice-versa.
> > > 
> > > No issues were observed with mm-selftests. No issues were observed while
> > > parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> > > sysfs in a loop.
> > > 
> > > v1->v2:
> > >   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> > I thought we agreed that we would use a static key and some rcu synchronize
> > magic? What was the reason for taking this approach?
> 
> As I understand it, the RCU magic won't work, I had replied here:
> https://lore.kernel.org/all/6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com/

Regardless, it's still not acceptable to penalise the common code because
of a debug option so I'm not going to merge this as-is.

Lemme go reply on the other thread.

Will
