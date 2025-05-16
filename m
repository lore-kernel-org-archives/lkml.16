Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D31635
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 04:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747369969; cv=none; b=s5U+5lhThscYzN8A+bVgdGc3Q6VcCR8/KD/J7qPNemCIhlDx9QhAzq24h4pDLKZYEFwiHSVq3scRnxixmo9OY1gd8nNDnoJYuW13AbAhIntJ0vguUgEDdH3Qe/qkFhaNQVcJnVuXBZCJT16tz6peEhKjO+eU1nUe1aOBkgmdBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747369969; c=relaxed/simple;
	bh=11Ajc14WG+PRd3VSIyjchaaFNjwic5pzElA8xYz+TCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofbl+eSxtM4EqfRrZ3i94tC841im0HBQ04F95SjYuFfx9kvKiXS0W4YCyEMkkX/kV7zAcuyicuKXQlABGzGN7Ec5jwRpLUjJGKwQwKxAIIzrwWLIymk1ZEXans7zIw0LskXN8g8cClBcQKaawDMNcMKlmbbhigYKc5sPU6L3GJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-b9-6826bfe2e9f5
Date: Fri, 16 May 2025 13:32:29 +0900
From: Byungchul Park <byungchul@sk.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Gregory Price <gourry@gourry.net>, kernel_team@skhynix.com
Subject: Re: [PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <20250516043229.GA49002@system.software.com>
References: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsXC9ZZnke6j/WoZBh8W6VrMWb+GzWLXjRCL
	r+t/MVv8vHuc3eL41nnsFpd3zWGzuLfmP6vFyVkrWSy+9UlbzD56j92By2PnrLvsHt1tl9k9
	Fu95yeSx6dMkdo8TM36zePQ2v2Pz+Pj0FovH+31X2Tw+b5IL4IzisklJzcksSy3St0vgypj5
	sZOt4IRgxc9pT5gaGK/ydTFyckgImEg82XqZCc7u3sAIYrMIqErcm/QfzGYTUJe4ceMncxcj
	B4eIgIHE1XMRXYxcHMwCv5gk3p9/ywxSIyxgJ7GyYS+YzStgIXHhznGwXiEBB4lnP64zQsQF
	JU7OfMICYjMLaEnc+PeSCWQms4C0xPJ/HCBhTgFHicW/HrKC2KICyhIHth2HOu09m8TUb8YQ
	tqTEwRU3WCYwCsxCMnUWkqmzEKYuYGRexSiUmVeWm5iZY6KXUZmXWaGXnJ+7iREYG8tq/0Tv
	YPx0IfgQowAHoxIPr8N11Qwh1sSy4srcQ4wSHMxKIrzXs5QzhHhTEiurUovy44tKc1KLDzFK
	c7AoifMafStPERJITyxJzU5NLUgtgskycXBKNTDO3u6zdc+ZTWn/LkhYTt4Wtk5esGmxs4Ny
	wYm2lkyl7/8/LZketUvN1VHt8stHDy2u/GhZFRiUf8WTb2mn1P8zE4K2lckk+Tu8v7TZosHl
	5cWve/gWGi14qKwYPts49p7QRcn7KXZFy0UKTgjEPGKYqVa2bpOphN70IB5DjtMiv9bK2RtP
	V3ihxFKckWioxVxUnAgAxHnjLYkCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsXC5WfdrPtov1qGweYFChZz1q9hs9h1I8Ti
	6/pfzBY/7x5ntzi+dR67xeG5J1ktLu+aw2Zxb81/VouTs1ayWHzrk7Y4dO05q8Xso/fYHXg8
	ds66y+7R3XaZ3WPxnpdMHps+TWL3ODHjN4tHb/M7No+PT2+xeLzfd5XN49ttD4/FLz4weXze
	JBfAHcVlk5Kak1mWWqRvl8CVMfNjJ1vBCcGKn9OeMDUwXuXrYuTkkBAwkXjSvYERxGYRUJW4
	N+k/mM0moC5x48ZP5i5GDg4RAQOJq+ciuhi5OJgFfjFJvD//lhmkRljATmJlw14wm1fAQuLC
	neNgvUICDhLPflxnhIgLSpyc+YQFxGYW0JK48e8lE8hMZgFpieX/OEDCnAKOEot/PWQFsUUF
	lCUObDvONIGRdxaS7llIumchdC9gZF7FKJKZV5abmJljqlecnVGZl1mhl5yfu4kRGPzLav9M
	3MH45bL7IUYBDkYlHl6H66oZQqyJZcWVuYcYJTiYlUR4r2cpZwjxpiRWVqUW5ccXleakFh9i
	lOZgURLn9QpPTRASSE8sSc1OTS1ILYLJMnFwSjUw2jxbGf5prm37kmjuz/UTPtw6M/VFwe91
	BSE1bauvFAfuZJ4019+BqfTfu9QlWtx9vLfK1Qvl25rk5A/d2HDWg0mO8fGymOC0k0whWzSe
	fXh0hXXTmf7yAytUm7hE36z7eHWz7NaGRZr9LA98pmsyrQkQYZnXXTNNSuToVwsGhxkPL3w9
	y3PmhRJLcUaioRZzUXEiAMbwg4R6AgAA
X-CFilter-Loop: Reflected

On Thu, May 15, 2025 at 08:13:58PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Reviewed-by: Rakie Kim <rakie.kim@sk.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> v1:
> * un-RFC'd as there seems to be consensus.
> * Added Gregory and Byungchui who kindly offered to be reviewers also!
> * Removed Alistair as he hasn't been active on-list lately. Alistair - hope
>   you don't mind, We can very easily add you later, just don't want put you
>   here without your positive consent :)
> 
> RFC:
> https://lore.kernel.org/all/20250513160007.132378-1-lorenzo.stoakes@oracle.com/
> 
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 314007e2befd..17403329d76f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15577,6 +15577,25 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +R:	Byungchul Park <byungchul@sk.com>

Acked-by: Byungchul Park <byungchul@sk.com>

	Byungchul

> +R:	Gregory Price <gourry@gourry.net>
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
