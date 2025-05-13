Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49CEAF9
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747097192; cv=none; b=MhFrZuYnJVuM7Uf82Ua3Gz38DL1juq579Hkqli+JPMThztjSnCcXrdPaFRWDwxDpduahd2pCKOcsB03amPPSTffxWkQm0DFqA6Anb53nF526++Dsu+QGhtoGkWBzHJTr3WzGjr6K/IiG+XUAfLg18nvF49qbqDws4amOgHjxGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747097192; c=relaxed/simple;
	bh=7wt2yTCd9dsQHhWIlJfsXFINsKRBiUVZw6Tsg/rGei4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTos/A6/pCiLKljVf+9UcLx7trdAINZ0D1f4Xljhd4kiU0cJGEn0N4o1LmJWS75IFy0tlWHr/VxkbAPvzjBJGOmbJ+lH+SY1s3MLbg7zLpamLpd9LaFlpqifqRpK1P6nV55OqlWW0AwT57uejc/uqi+u6FFYjjp8LD0yywb/tO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fu3YbAdV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fu3YbAdV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CS34uffoWtUs9g6Ath0ftWhgX6znX/w2g7NTUk/KksU=; b=fu3YbAdVHdwl9dIeA3tEOE+AID
	/KCtFwZwZKO6PWYvXd5Fnn3oOsb9EA7YoSriX645Jbb3as8fstlGxrPDaKFgR8n2loMd8eDfFsyWu
	1sHkgTAWadyGgabfoGp9sydmJq7lU2GIpF3uyUjQZWHLCC/TMYukCah2fQBs17EBAXXFjE/ByjD0A
	k/kIQpywyLL6BWfaGfeZQ2mVYj2Dj3xthKrXaIpFMONcxQJAxDdNH3NZkRziIwGESBZaZv5Yn/4+i
	nN8ouYVtShp9r2n2J3fPKz0vvGn+IYqlsnu8sgjLBCSGo96hC+8kXGVjN6zQ0EEJQSxXLD9DZaC1v
	HdbuOZ+A==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uEdhR-007LrM-DH; Tue, 13 May 2025 02:46:16 +0200
Message-ID: <876b69d7-ea9b-4ccf-8693-96f1b794f7a1@igalia.com>
Date: Tue, 13 May 2025 09:46:04 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH sched_ext/for-6.16 0/2] sched_ext: Extend usability of
 scx_bpf_select_cpu_and()
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>
Cc: linux-kernel@vger.kernel.org
References: <20250512151743.42988-1-arighi@nvidia.com>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250512151743.42988-1-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea,

On 5/13/25 00:14, Andrea Righi wrote:
> Many scx schedulers implement their own idle CPU selection policy, which
> may be invoked from different contexts, not just from ops.select_cpu().
> 
> For example, some schedulers may need to trigger a proactive CPU wakeup
> from ops.enqueue() after enqueuing a task, while others may expose this
> functionality to user space, relying on a BPF test_run call to pick an idle
> CPU.
> 
> To maintain a consistent selection policy, these schedulers often implement
> their own idle CPU selection logic, since the built-in one is only usable
> from ops.select_cpu(), leading to unnecessary code duplication and
> fragmentation.

Besides ops.select_cpu() and ops.enqueue(), do you have use cases in
mind?

Regards,
Changwoo Min

> 
> To address this, allow scx_bpf_select_cpu_and() to be used from any
> context. This gives scx schedulers the option to use the built-in idle CPU
> selection policy in a consistent way, potentially reducing code duplication
> and fragmentation.
> 
> Andrea Righi (2):
>        sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
>        sched_ext/idle: Make scx_bpf_select_cpu_and() usable from any context
> 
>   kernel/sched/ext.c      |  5 -----
>   kernel/sched/ext.h      |  5 +++++
>   kernel/sched/ext_idle.c | 23 +++++++++++++++++------
>   3 files changed, 22 insertions(+), 11 deletions(-)
> 

