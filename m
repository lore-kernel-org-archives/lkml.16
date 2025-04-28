Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB838BF8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745800498; cv=none; b=W/keWrpPRkgM6cKwBaKCH2+3SLR4YjAeQ9y35+pCdbt/dpaSyuhFJ7MxvT1sqcPgeUgYRhqxdTPsBLWrsmlWUkDUg4YoaprhSYvEOjlKp1nHt+p6o7jFEVU771wQfvL51EwzZEdlNXxQ29yfqjEX4d8pp0MxF6xbg1KM3YOBXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745800498; c=relaxed/simple;
	bh=U0PCGX0LkHuJdJA3tqVgvghEi79nAtIOgo4xexwYPfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDCG0KVMUp7wJw8X9EUtdo2cva6Gzc+t8ckK4wtcY/CXxmULv/+ZGXQ/7sEN32pkcaSnX3YD5wst+SKZCDLoblH75S3tQpDIEHD794XXjsqvOc02jXYI+WJqsm0dYBz1A1OKu312uhCJqZU2AAT+kxL51QYyd6V0STaEDxMNXhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OWsHx8oe; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OWsHx8oe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+ohg2r1VBieAEnu8IhniUM/lCTz2XNcoEngopih93fU=; b=OWsHx8oenb7Ey+keHkr/mXePLl
	BAcaYFrmwYgT7MmqQTsuhRKOLk9Dd/uuk0NPegKhmwbsgu+NWwyHHRdpZBeQe9JBNkzebKuNGQSzn
	LJwMTd4/CDOd+JxS8ZwLrsAVhef8V3X93SdG2VBfQqkmvs2gGMA5Pgdx7W6AdApRPER3Qd7MXlBWJ
	iW+vFpROMXxNuPk2ePNsZdHUnZaqcKi8qezG/XUOiKuhFOytdfVLpborXT/hgQTuUqw/PRiBpEWIL
	z9p+VrMdyvX79DD5p1UmJfvLXdvVIIX/Gb4ES4O07mKj5cuscVmfddEfQ/GVuZDFmvkCaK8SmplWn
	UQL+mAoQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9CSG-00000004bdn-1wjs;
	Mon, 28 Apr 2025 00:34:40 +0000
Date: Mon, 28 Apr 2025 01:34:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] mm, swap: clean up swap cache mapping helper
Message-ID: <aA7NIOumlu4d6HgX@casper.infradead.org>
References: <20250427185908.90450-1-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427185908.90450-1-ryncsn@gmail.com>

On Mon, Apr 28, 2025 at 02:59:02AM +0800, Kairui Song wrote:
> This series removes usage of folio_index usage in fs/, and remove swap
> cache checking in folio_contains.

Thanks.  I've been removing them as I've come across them (eg
fcd4904e2f69), but I haven't gone all out to try to remove it
from all filesystems.

