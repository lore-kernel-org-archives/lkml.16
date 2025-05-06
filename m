Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039ED21B9F4
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521389; cv=none; b=ZeW/k+e/6EFyMUea+sm4OgPAe4ee4Ud8m+evQIBtfPOjRWlzcY77hHXnvqEk1IQu4zJRF+13awWIh3rc33fxxnEQ8H22mGIV5K/xMa/VHZVrcEYgOJu9UYocU54uny3/Lil+2mwaJawU9/zB/Bws+/jZbUe65bUeZXler9UpwCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521389; c=relaxed/simple;
	bh=IkiVXT+PKsh4llC2LahuhaCyBWw4ngnV5q8E2WfJgNk=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cpHBmtp4ZBCv9m9ifc+ecVYA41pNN+QsJvM4XYkseiyC1jmpLKzr9vz3Q1YSHMfrcjsDcqDRi8JZScXjIFVCXQoBHdaKhj7rH7JJoD3MTukLxuExG4n98qnhryamw7A923nXLL0sA4f5JvnsZIXXDJsrelZrs754YLvjNWLsb60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7TA1r1e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7TA1r1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C005C4CEED;
	Tue,  6 May 2025 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746521388;
	bh=IkiVXT+PKsh4llC2LahuhaCyBWw4ngnV5q8E2WfJgNk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=t7TA1r1eekcd4AQUTFcIYbnAof8tnisy+NVn6hS2z0jBl9iSKZfdYtJUQ5P06BQEb
	 grmXkBwPOfgtj+bQp2ntSwbIU4vfGRKcR8r9Oud16BqipjOSr8+iJTxIjzUQyh82CP
	 RxhL8VFHoXELpVV1VTDQo9vohCCuvsiAwzrymewqW35nFu2/IEDbn0xD26GwMFRIDM
	 20vSvdnl6l6RHDomCJJth11nQj2x8JsYjKWubCKEac5Q9wS80KP6G67s5TuW0JJPwe
	 ZjvsOm8A1l4ehn7qsdVIsXBWqFOMJbHZvQi72BS+2mep106XFSoLztEoEWXuaXGjK9
	 4G/Ku4VKDn7Ig==
Message-ID: <45f54805-b357-4391-8a43-5825e8dcbd56@kernel.org>
Date: Tue, 6 May 2025 16:49:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>,
 Chris Li <chrisl@kernel.org>, David Hildenbrand <david@redhat.com>,
 Yosry Ahmed <yosryahmed@google.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v3 3/6] f2fs: drop usage of folio_index
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
References: <20250430181052.55698-1-ryncsn@gmail.com>
 <20250430181052.55698-4-ryncsn@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250430181052.55698-4-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/5/1 2:10, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
> Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
