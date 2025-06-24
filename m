Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F947F4A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799755; cv=none; b=pEZag4lMyvfpbPWqFdkTEF42eAJT/RXy4512WbBZJGnqDq/uB0sY1M/EwrKVGprGfgLxHN5JvRBqK92bzoVFhfiV+XjAUxwWyH6RSv4L4DXNqBr6YiEaHCu0b87+hyXMK4meri7/TpeqJ3aYbjfFkfmhFDjcjAdZ85gSVWQr+bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799755; c=relaxed/simple;
	bh=W5s1IFYyVhSSY9SrWIviBul/iZkSfkZeODC+rQMFddc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=j2vMGyFvoHpmGdFIhhZKmQ0zz4BVQ09Qh16lnhn73XDzcWQ2L/g8aVjuOjTltU80mEuX92qf1ROqfV0IfyjOslpaFFzbLDaI3QDTz9zK2E1kbxZz9kG5QQSNIckBrwNezUuQbT6QzBM274F/szxH7kTvZMfaglnrk5iDe3ZiKdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2Xj89RYb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2Xj89RYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D244C4CEEF;
	Tue, 24 Jun 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750799754;
	bh=W5s1IFYyVhSSY9SrWIviBul/iZkSfkZeODC+rQMFddc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2Xj89RYbZEENGcDHm4sbgJ/U8audnpKjKK6tmNfMxq92zVbw7ZNWkizFpNIzlaQ82
	 UEmLaCiaqjrnDqRPamVI5YPwQVJ0H45/YECUiYSXn/+ED4VWhHFTWSE4anr6ZZ7hDZ
	 Hd4IARd52a5ZB1htmQr1x24Kzxn+z/Ud9DjEd180=
Date: Tue, 24 Jun 2025 14:15:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xavier Xia <xavier.qyxia@gmail.com>
Cc: ryan.roberts@arm.com, will@kernel.org, 21cnbao@gmail.com,
 ioworker0@gmail.com, dev.jain@arm.com, catalin.marinas@arm.com,
 david@redhat.com, gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, willy@infradead.org,
 xavier_qy@163.com, ziy@nvidia.com, Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant
 operations of  contpte_ptep_get
Message-Id: <20250624141553.17afe765c0f692b7a7ec007a@linux-foundation.org>
In-Reply-To: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 23:25:49 +0800 Xavier Xia <xavier.qyxia@gmail.com> wrote:

> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.

Thanks, I added this to mm.git for some testing.  But perhaps the ARM
tree would be a better merge path - more testing, at least.
