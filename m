Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14AD1EDA11
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048102; cv=none; b=nfD9pr9g2BfG/fvNNlunKyQ90LN8OYHyQT4ijCfouEISUAq8pJVz31FSzdRMGiwlnigklYvPQOoZPgkBcHrgkrUEdDRP9r2HHdbGYEx8ATYb7WQRZglb6Eas0GESVotFgkIgxi1LweH3M2LhRDL1txAygarFbDQ7U6Bm7Zw8mgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048102; c=relaxed/simple;
	bh=D+CfDT9wAoO6bnY9uzXeEDaa8NmhSoGRGgHb17XWCj4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZhHRCGqzMzyEyLfC/YQMnAmbI2NSGkceL5GeLPJl+O2/GbE7hImdG4Ng3c+iUoLMwlrX7tFIhHHkb81HL1fp6GojvevoNEKzGfcujzT8ubKV0MWDKqP8MmB9yxl+CCHBeq+YpEWMBQm5fXxK3RDHXznPHlg4LEkHaKHPRcEwpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gxb9jZ47; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gxb9jZ47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF854C4CEE7;
	Wed, 30 Apr 2025 21:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746048101;
	bh=D+CfDT9wAoO6bnY9uzXeEDaa8NmhSoGRGgHb17XWCj4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gxb9jZ473ZU7zsOxhj3AeB1R1+hcEzaw+WBrOkaV71F/6AYOXIoPnUQAURPyiS0wX
	 odbTKvysLOYr/srKd4hBz62+o39XO1dO+g8yJMFAOrMIpK1HMWaqssOPvNM5NGthJK
	 wKB0aDHCt0mA1MAk64td4x7vJ6cP1u/s5v+Tm/Tk=
Date: Wed, 30 Apr 2025 14:21:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shivank Garg <shivankg@amd.com>
Cc: <shaggy@kernel.org>, <willy@infradead.org>, <david@redhat.com>,
 <wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
 <donettom@linux.ibm.com>, <apopple@nvidia.com>,
 <jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>,
 <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: Re: [PATCH V5 0/2]  JFS: Implement migrate_folio for
 jfs_metapage_aops
Message-Id: <20250430142135.099ecfa33963f0895b0f2c1d@linux-foundation.org>
In-Reply-To: <20250430100150.279751-1-shivankg@amd.com>
References: <20250430100150.279751-1-shivankg@amd.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Apr 2025 10:01:49 +0000 Shivank Garg <shivankg@amd.com> wrote:

> This patch addresses a warning that occurs during memory compaction due
> to JFS's missing migrate_folio operation. The warning was introduced by
> commit 7ee3647243e5 ("migrate: Remove call to ->writepage") which added
> explicit warnings when filesystem don't implement migrate_folio.
> 
> The syzbot reported following [1]:
>   jfs_metapage_aops does not implement migrate_folio
>   WARNING: CPU: 1 PID: 5861 at mm/migrate.c:955 fallback_migrate_folio mm/migrate.c:953 [inline]
>   WARNING: CPU: 1 PID: 5861 at mm/migrate.c:955 move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
>   Modules linked in:
>   CPU: 1 UID: 0 PID: 5861 Comm: syz-executor280 Not tainted 6.15.0-rc1-next-20250411-syzkaller #0 PREEMPT(full) 
>   Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
>   RIP: 0010:fallback_migrate_folio mm/migrate.c:953 [inline]
>   RIP: 0010:move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
> 
> To fix this issue, this series implement metapage_migrate_folio() for JFS
> which handles both single and multiple metapages per page configurations.

Thanks, I'll add these to mm.git for some testing while discussion
proceeds.

Do we think these patches should be backported into -stable kernels?

Or maybe we should simply remove the warning from -stable kernels then
re-add it when we're confident that all in-tree filesystems are good?
