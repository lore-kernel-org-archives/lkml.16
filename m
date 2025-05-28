Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E7286D69
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456662; cv=none; b=pjs2GtwJOiFTnTcL3p1lg5JO3a9RHQn3gn6UmZJFnnd1dbPOs10sU+b2lgh+C1OJLIjDt5NU/bSga8PvaFIW76qBF6GXM/J/BvRvoi417RyRqL2Olfqr0F2o0n7o0+2MixOBCiLVsMtUsvDOu2dxuscRX5ELsqHvr36J4pk3Ukc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456662; c=relaxed/simple;
	bh=WLFHdokIEiKAduh/NqbqXIeup1v2VNaeRhhmYuC35/c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=isanSaC1Kkuzfdlmio75zwm6Nc+mTdFNQDmC6VrZso4/hMhqHxnwVDBsWgBinks2S/AaCp/Ng+0U4c5kJ+QzQPCsmccc0upsFBWZ/srQv1gYMXl66TTKsH/eMOLawSVNU2l/cTTJWQHVrYIb4AKh7hfPiaiflgCJA/DHCzU1P8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hPQQXk/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hPQQXk/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DE1C4CEE3;
	Wed, 28 May 2025 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1748456661;
	bh=WLFHdokIEiKAduh/NqbqXIeup1v2VNaeRhhmYuC35/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hPQQXk/YGUcpo9h7DrJc4gpim2zo0jIW6pdigAYLBQXwe75OVG5RhWK4TWM9jot01
	 y6KwGDQzIvXKETbFYAgg17f6PuE6lU6xN4O0DRWcFd6oQZy2zm5duMfuAfWH4w2dF1
	 ZSzncBUnuZWx4q8ngqHenMmrnNd4Inwz7Qlnbhpk=
Date: Wed, 28 May 2025 11:24:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Juan Yescas <jyescas@google.com>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Zi Yan
 <ziy@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 tjmercier@google.com, isaacmanjarres@google.com, kaleshsingh@google.com,
 masahiroy@kernel.org, Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v7] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Message-Id: <20250528112419.cac43a6abff2c0e005764a79@linux-foundation.org>
In-Reply-To: <77f9dd55-fc5c-44c8-b7ac-eac68c1d378f@suse.cz>
References: <20250521215807.1860663-1-jyescas@google.com>
	<77f9dd55-fc5c-44c8-b7ac-eac68c1d378f@suse.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 May 2025 10:21:46 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:

> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Great, thanks.  I'll move this patch into mm-stable.  I'll be sending
two MM pull requests to Linus this cycle.  The below patches will be in
the second batch, next week.



#
m68k-remove-use-of-page-index.patch
mm-rename-page-index-to-page-__folio_index.patch
#
ntfs3-use-folios-more-in-ntfs_compress_write.patch
iov-remove-copy_page_from_iter_atomic.patch
#
zram-rename-zcomp_param_no_level.patch
zram-support-deflate-specific-params.patch
#
selftests-mm-deduplicate-test-logging-in-test_mlock_lock.patch
#
selftests-mm-deduplicate-default-page-size-test-results-in-thuge-gen.patch
#
memcg-disable-kmem-charging-in-nmi-for-unsupported-arch.patch
memcg-nmi-safe-memcg-stats-for-specific-archs.patch
memcg-add-nmi-safe-update-for-memcg_kmem.patch
memcg-nmi-safe-slab-stats-updates.patch
memcg-make-memcg_rstat_updated-nmi-safe.patch
#
mm-damon-core-avoid-destroyed-target-reference-from-damos-quota.patch
#
mm-shmem-avoid-unpaired-folio_unlock-in-shmem_swapin_folio.patch
mm-shmem-add-missing-shmem_unacct_size-in-__shmem_file_setup.patch
mm-shmem-fix-potential-dead-loop-in-shmem_unuse.patch
mm-shmem-only-remove-inode-from-swaplist-when-its-swapped-page-count-is-0.patch
mm-shmem-remove-unneeded-xa_is_value-check-in-shmem_unuse_swap_entries.patch
#
selftests-mm-skip-guard_regionsuffd-tests-when-uffd-is-not-present.patch
selftests-mm-skip-hugevm-test-if-kernel-config-file-is-not-present.patch
#
hugetlb-show-nr_huge_pages-in-report_hugepages.patch
#
#
mm-damon-kconfig-set-damon_vaddrpaddrsysfs-default-to-damon.patch
mm-damon-kconfig-enable-config_damon-by-default.patch
#
mmu_gather-move-tlb-flush-for-vm_pfnmap-vm_mixedmap-vmas-into-free_pgtables.patch
#
mm-rust-make-config_mmu-ifdefs-more-narrow.patch
#
kcov-rust-add-flags-for-kcov-with-rust.patch
#
#
selftests-mm-deduplicate-test-names-in-madv_populate.patch
#
mmu_notifiers-remove-leftover-stub-macros.patch
#
mm-add-config_page_block_order-to-select-page-block-order.patch
#

