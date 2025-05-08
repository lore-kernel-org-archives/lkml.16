Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE78615B102
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684604; cv=none; b=M8d21W3y3HA9bEYxAyDRC3wZjMlhgdGDEbj1dwlp/AadOytxepiOYA4AN0kCx3/AtEQ0MLKJzIs/AhkPrBaAhyfCJWuTYEfPtFn2yQuc4WFYFPuWqSKcDfGnbjH/YFN7NP19fYFXZB/EE6ZjTGrJhDVubUUvzYpXQ1YMblO7YJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684604; c=relaxed/simple;
	bh=LCn61LKFn2NcODa4bEjBVzTx3BUMcbOJY2k9EXdfpS8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FEnKUeowNMNFGJ66CcZMGL5iL0RTr+yvdlUqR4k+VrobIdG7sw2GyYUyBlmdKJUrDaEdYMF1yvV0wiUoezF2H/l5hnZPVly2lhlzSzzvQPXmN+UlCNhhFbpDZlfjdpchAnngtAQYTkUz/Rha0NG8m+/vkpu+j3d+i6qk00/Bhf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xJC5jZSx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xJC5jZSx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E76FC4CEEB;
	Thu,  8 May 2025 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746684604;
	bh=LCn61LKFn2NcODa4bEjBVzTx3BUMcbOJY2k9EXdfpS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xJC5jZSxJpc84c6uTHTuPGCtjLz+A3eh6kFi2fL63mJkYJZ/xyHhbqrVYrQF5No1s
	 4RJNYRIvBsyLMpfcSWSQjf6BVWfzYf3mFxkkqDqSSscDb2qsY2eLEAUzQ9KXuHocue
	 Nh+bdoine9g3TkKVOIDVDDLLDKfs4g8YrOY0+QWI=
Date: Wed, 7 May 2025 23:10:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: fuqiang wang <fuqiang.wang@easystack.cn>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Dave Young
 <dyoung@redhat.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Coiby Xu <coxu@redhat.com>
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-Id: <20250507231003.c11c4b90d6a2b1f6ddce792e@linux-foundation.org>
In-Reply-To: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  8 Jan 2024 21:06:47 +0800 fuqiang wang <fuqiang.wang@easystack.cn> wrote:

> In memmap_exclude_ranges(), elfheader will be excluded from crashk_res.
> In the current x86 architecture code, the elfheader is always allocated
> at crashk_res.start. It seems that there won't be a new split range.
> But it depends on the allocation position of elfheader in crashk_res. To
> avoid potential out of bounds in future, add a extra slot.
> 
> The similar issue also exists in fill_up_crash_elf_data(). The range to
> be excluded is [0, 1M], start (0) is special and will not appear in the
> middle of existing cmem->ranges[]. But in cast the low 1M could be
> changed in the future, add a extra slot too.
> 
> Previously discussed link:
> [1] https://lore.kernel.org/kexec/ZXk2oBf%2FT1Ul6o0c@MiWiFi-R3L-srv/
> [2] https://lore.kernel.org/kexec/273284e8-7680-4f5f-8065-c5d780987e59@easystack.cn/
> [3] https://lore.kernel.org/kexec/ZYQ6O%2F57sHAPxTHm@MiWiFi-R3L-srv/

So.

When I merge this ancient fix against mainline, it goes OK.

When I merge Coiby's "x86/crash: pass dm crypt keys to kdump kernel"
on top of this fix,  things do not go OK.

Here is what I did:

int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
{
	unsigned int nr_ranges = 0;
	int i, ret = 0;
	unsigned long flags;
	struct e820_entry ei;
	struct crash_memmap_data cmd;
	struct crash_mem *cmem;

	/*
	 * Using random kexec_buf for passing dm crypt keys may cause a range
	 * split. So use two slots here.
	 */
	nr_ranges = 2;

	/*
	 * In the current x86 architecture code, the elfheader is always
	 * allocated at crashk_res.start. But it depends on the allocation
	 * position of elfheader in crashk_res. To avoid potential out of
	 * bounds in future, add a extra slot.
	 */
	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
	if (!cmem)
		return -ENOMEM;

	cmem->max_nr_ranges = nr_ranges;
	cmem->nr_ranges = 0;

	memset(&cmd, 0, sizeof(struct crash_memmap_data));

Please triple check this, I changed a few things.
