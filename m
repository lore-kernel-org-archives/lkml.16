Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F8E17736
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747188221; cv=none; b=nZcl7NduZG0ONzN3secMjAWlBCepjnYmdg2PNxCiEjNWjTdgU3cehs19/iTqH8Qs7Q5RyMn/h24nDgMwsxIGjJM3aIl6NRWawWFj/e2RVRa3XKPtkh3dXXgVgqra/ViCJ7ygsqaKwLLHlVLDdz6LxE53/5HbXPMaofCqiX37nHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747188221; c=relaxed/simple;
	bh=Mag2Qt50i6+C+tN7rbbRWDI5IBPcNobhhFsAgSE1gKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hlej0aVGsR3KbAW2pIZUEcrbniHSJ05zTxCaWgcwVfbvDwroMfN8YX8erLF5POdYoVOpBMcAL4jmJWxKikeNnBtKg52GefslZwMDn9n1yXnLSrx4umzJONLD0aWHca6OHaGBfnqTzIKQQ8g6+V9hzYqy67sRZ7slvHRW7x5ZD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-54-6823f9f336fc
From: Rakie Kim <rakie.kim@sk.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Date: Wed, 14 May 2025 11:03:18 +0900
Message-ID: <20250514020325.314-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKLMWRmVeSWpSXmKPExsXC9ZZnke7nn8oZBrtO8VnMWb+GzWLXjRCL
	r+t/MVsc3zqP3eLyrjlsFvfW/Ge1ODlrJYvFtz5pi9lH77E7cHrsnHWX3WPxnpdMHps+TWL3
	ODHjN4tHb/M7No+PT2+xeLzfd5XN4/MmuQCOKC6blNSczLLUIn27BK6MFQ+nsBUs5q9Yf3ky
	awPjKZ4uRk4OCQETiUsz3zHB2Gf2HAKyOTjYBJQkju2NATFFBAwkrp6LAKlgFjjEJLH3jAuI
	LSzgJHHo8kVmEJtFQFXiTVMHI4jNK2AssebdahaIiZoSDZfugU3nFHCUODP/F1hcSIBH4tWG
	/VD1ghInZz5hgZgvL9G8dTbQTC6g3i1sEj2bHzFDDJKUOLjiBssERv5ZSHpmIelZwMi0ilEo
	M68sNzEzx0QvozIvs0IvOT93EyMwsJfV/onewfjpQvAhRgEORiUeXgtd5Qwh1sSy4srcQ4wS
	HMxKIrzXs4BCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY2+lacICaQnlqRmp6YWpBbBZJk4OKUa
	GJmP/Fgb7jXhh6x2U4HRgZtvTn2W51vH8r/e5qPoYz+LhdkbnhopuE00dtPaG3DGqiMpY+W8
	bN9POWrxXcsncTyq5pZorOKv23v09ByD5zHpwXJb5h1ebmC75OKz6Hvby44GZq68/DJsuluB
	rsqLK0sXzPrqURyyVv3CTcWMzUmdGiWtcpVOL5RYijMSDbWYi4oTAaTIIKJoAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsXCNUNNS/fTT+UMgx3fbCzmrF/DZrHrRojF
	1/W/mC2Ob53HbnF51xw2i3tr/rNanJy1ksXiW5+0xaFrz1ktZh+9x+7A5bFz1l12j8V7XjJ5
	bPo0id3jxIzfLB69ze/YPD4+vcXi8X7fVTaPb7c9PD5vkgvgjOKySUnNySxLLdK3S+DKWPFw
	ClvBYv6K9ZcnszYwnuLpYuTkkBAwkTiz5xBTFyMHB5uAksSxvTEgpoiAgcTVcxEgFcwCh5gk
	9p5xAbGFBZwkDl2+yAxiswioSrxp6mAEsXkFjCXWvFvNAjFRU6Lh0j0mEJtTwFHizPxfYHEh
	AR6JVxv2Q9ULSpyc+YQFYr68RPPW2cwTGHlmIUnNQpJawMi0ilEkM68sNzEzx1SvODujMi+z
	Qi85P3cTIzBIl9X+mbiD8ctl90OMAhyMSjy8FrrKGUKsiWXFlbmHGCU4mJVEeK9nAYV4UxIr
	q1KL8uOLSnNSiw8xSnOwKInzeoWnJggJpCeWpGanphakFsFkmTg4pRoYD7i+T+aXVvyk7qPa
	btVk2aDy9USVm6n6B4ObbcfyN+95wiy4OeqEKrPd+fwVEZumC3L8tG/5smWJusdXOxa9XVME
	dxubp5+Z+HDJmR+HPt3cVt9nuCVVi/vT5F9PvqxMPGbL/eFdtcuq0B1sngYM+k2/J0371vKz
	zHiBaKye2htu0W+Ls41XKrEUZyQaajEXFScCAOfygWNOAgAA
X-CFilter-Loop: Reflected

On Tue, 13 May 2025 17:00:07 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> 
> REVIEWERS NOTES:
> 
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)
> 
> David has kindly already agreed to be co-maintainer for this section.
> 
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..29d73593038c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Alistair Popple <apopple@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>

I'll do my best review in this area.
Thank you.
Reviewed-by: Rakie Kim <rakie.kim@sk.com>

> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0
> 
