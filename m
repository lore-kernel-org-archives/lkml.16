Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C12459D6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745737474; cv=none; b=f+WifPGBAZDJ1p7qh73YOHO+G1HqGHWD9nz0EjmzMAgO12lzTvFUu93ctBdv4+SUc4z+I/XDJbNiPo1z1i951TACw+YA8cy51IKESmSVzykm1DZqH8oGooKkrv5+9yU27LVKJ8OVYZ6jKxIKCo1vvs6kAf8CHqfjv9fHslsRdU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745737474; c=relaxed/simple;
	bh=I+FMqLGP2njKKr6hpYVQWfkEmg4vSomx6dn0yjfqwek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ut7zHD9R84wbxIWBLDDyfoq87NMMcqwplpa6C/JT68Nl80T325aW62kMPq2ZyeCSo+3s3y+s6sgcPg+WGW+/XQ3eSZ+4W0qVDr1pBP3vzdl2Urj6CYoIb1MRFywyRCQHD3/k9G8M+5lQtxCIag44noIFWkebJz+ItifL/KfwzHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YFD7joa2; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YFD7joa2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oNVgcV2D/i50bdbrOKL+Yrwbb1dU1QMnzPhX949KPh0=; b=YFD7joa2GDec7UrsXBqvvJ2uaw
	TR+vvyX/xG0h8LUhpVaJayhMoxEfG516XONlPbPziqWtmzYorOt1DQDGX6KS/ZIxMbaXfgE6sD1gP
	p2H6UYDWxnglYT4SiDh+LW2YbrLNoXhW8fopfMGJoNfMfWE7CUFkAVj7cVJu0XcdADEGTjq5NpFAC
	9ckqytMYJHCqUDH4BojyLLhtvCx62MS0gua6RFQwsIs3FLhSNqUT3kuzagBsWm0YtQpPUpuzYkHF3
	PQxHjtz+Bvw5DylFbyJtM9AyJv2n/sxj2wMRImU4kQZLXDcbKD0eoxLG4EOIz6cf41icM19nm2jSg
	nChexPdQ==;
Received: from [175.114.83.198] (helo=[192.168.45.92])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u8w3k-00971l-FX; Sun, 27 Apr 2025 09:04:16 +0200
Message-ID: <cff9a7a4-2a8c-4434-bbf4-cfcc96c76d6d@igalia.com>
Date: Sun, 27 Apr 2025 16:04:08 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHSET v2 sched_ext/for-6.16] sched_ext: Introduce scx_sched
To: Tejun Heo <tj@kernel.org>, void@manifault.com, arighi@nvidia.com
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
References: <20250425215840.2334972-1-tj@kernel.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250425215840.2334972-1-tj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tejun,

Besides what Andrea found, everything else looks good to me.
I tested it with the scx schedulers on github.

Regards,
Changwoo Min

On 4/26/25 06:58, Tejun Heo wrote:
> v[1] -> v2:
> 
> - 0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch updated to store
>    scx_sched pointer in sched_ext_ops->priv so that bpf_scx_unreg() can
>    determine the scx_sched to destroy regardless of where initialization
>    failed. This will also help with supporting multiple schedulers.
> 
> - Minor updates to 0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch.
> 
> In preparation of supporting multiple hierarchical schedulers, this patchset
> packages the states which are currently global but need to become per
> scheduler instance into the new struct scx_sched.
> 
> Currently, the only supported scheduler instance is the system-wide root one
> (scx_root) and the code assumes scx_root in many places. A follow-up
> patchset will introduce multiple scheduler support scrutinizing and updating
> each such occurrence appropriately.
> 
> There's significant amount of churning but most changes are straightforward
> if not trivial, and no user visible changes are expected.
> 
>   0001-sched_ext-Introduce-scx_sched.patch
>   0002-sched_ext-Avoid-NULL-scx_root-deref-through-SCX_HAS_.patch
>   0003-sched_ext-Use-dynamic-allocation-for-scx_sched.patch
>   0004-sched_ext-Inline-create_dsq-into-scx_bpf_create_dsq.patch
>   0005-sched_ext-Factor-out-scx_alloc_and_add_sched.patch
>   0006-sched_ext-Move-dsq_hash-into-scx_sched.patch
>   0007-sched_ext-Move-global_dsqs-into-scx_sched.patch
>   0008-sched_ext-Relocate-scx_event_stats-definition.patch
>   0009-sched_ext-Factor-out-scx_read_events.patch
>   0010-sched_ext-Move-event_stats_cpu-into-scx_sched.patch
>   0011-sched_ext-Move-disable-machinery-into-scx_sched.patch
>   0012-sched_ext-Clean-up-SCX_EXIT_NONE-handling-in-scx_dis.patch
> 
> and is also available in the following git branch:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx_sched-v2
> 
> diffstat follows. Thanks.
> 
>   kernel/sched/ext.c      |  892 ++++++++++++++++++++++++++----------------------
>   kernel/sched/ext_idle.c |    3
>   2 files changed, 496 insertions(+), 399 deletions(-)
> 
> --
> tejun
> 
> [1] http://lkml.kernel.org/r/20250423234542.1890867-1-tj@kernel.org

