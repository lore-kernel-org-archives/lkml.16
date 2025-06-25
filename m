Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64A2D1907
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867140; cv=none; b=E6v2q+6+GXQTvG6H0tnnXXqZBt7ic4OT87OxCIabLyGqryVAD4S/1TXhjYzfODHjKaHy41AKn2bOVAh3GHCIb5ln4Q08REII7yugq5gEE/WRb40VAuDtvtOpKNXcp5eA5ec5xKQwd9NZJj8oII1I/y/oei8W3s4t8yRbA1tJvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867140; c=relaxed/simple;
	bh=LPL1xdFf7TjMGIdcHzjdLSxsMZuwQjjs/kYsbb7wZfw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jBi1sUQhcrQvCPM7Tl5RqYsO+nYyWIoPqrkQITpZYGuduubu9bpvFNKbZQijbrdtI+fEiYhVyFatzw64kfoRi2SjIk0gZKnwgftbuLRl5ElqU6N6KU41pN/rICgS5CTP9+AC0drZFG4QGdwmZh9foCbuO/r/bVsXdzXkgVFvBuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lU/X1j/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lU/X1j/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF66C4CEEA;
	Wed, 25 Jun 2025 15:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750867139;
	bh=LPL1xdFf7TjMGIdcHzjdLSxsMZuwQjjs/kYsbb7wZfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lU/X1j/C82h2JRK5G0v831pfPhY0UVu2lYM3pQ+/4UKbStrXaPuDSwyqTPVTyWgyk
	 CfPfXZYHd3WJ4D7ctlCMbtCfhNlQ48AXEOHCGw0ENLx943fBcwIe8DxobjqKX6Ya5O
	 EEHTkps/RhBIHUWpjDLZqB9EyU7Qd4ox2oobpz6M=
Date: Wed, 25 Jun 2025 08:58:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan
 <surenb@google.com>, Matthew Wilcox <willy@infradead.org>, David
 Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>, Rik van
 Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>, Wei Yang
 <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-Id: <20250625085858.5cb126abc03fea7fb3c3e0ed@linux-foundation.org>
In-Reply-To: <31635396-1fce-4222-9d56-6893089902e4@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
	<31635396-1fce-4222-9d56-6893089902e4@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 16:44:32 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Hi Andrew,
> 
> I'm doing a significant respin of this based on feedback, I was hoping to get it
> out to you earlier, but it's turning out to be stubbornly tricky (rmap was a
> mistake ;).
> 
> Dan's found a couple bugs that are addressed in the respin, so for the sake of
> stability can we drop this series for now and I"ll get the reworked one out
> asap?
> 

Gone.
