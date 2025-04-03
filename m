Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222223F413
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664775; cv=none; b=qSb0Tvp8Xilb+ARfKvK2j/ldaETUOsboinsYQYcLEORjwtQrBd1YqBhbloFvMrdB59qC8u3CCnRmPVZyG5dKdaBn5tof3r/1nbADMHIdVVppRg+Kf7eo6xcNa4U4PBC9JAw3u3wGrO2aHE0SWiwQzIWBiVaU/93ajqqgc3vWVDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664775; c=relaxed/simple;
	bh=2Gg7mQPZtQqIRFP+YKqKdJbYQPk/kewlGHSkoZ4su5M=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OArXF01sZSE3FL5cUpawFXyt5cqcQr0fpc/GrZ0x1KnmwLlhHTyMk+lZ3T6F8nX+rl1/2fUOTuRbGyUmx3/9gyXYO3WFql6ObAcS+I1fV5LWroYsRTFdLGdgmcWTaHh8FZrfaJ00XB1n0zOe+JWf+4faR9Mf4+vvWRj1AS5fUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AilQEb4R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AilQEb4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB76C4CEE8;
	Thu,  3 Apr 2025 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743664775;
	bh=2Gg7mQPZtQqIRFP+YKqKdJbYQPk/kewlGHSkoZ4su5M=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AilQEb4R9jSeMvaqJoefZhNtprms7+crlL5CFepBDG2tOgsZKvtJYzhzFwsPYAL1l
	 6tgZnEsBpC/UXED1XuO08XspimgruR+eNUXs4MDoNiRsuqJMgcJt07qReq6qFYXQGl
	 gGPGHXd/1mDnt0O2uJ7OuNI2HeQ7aniiuqjw0yezB5swTIbIpEtSW5z1bD+N3dhqRh
	 pq4uS0blHrY3c71K8Ru/7Y9Hz/XKmgL+BysGAZ70nA7pJnM+vAeFN232ZBba+H8vH6
	 iFb0j4XkGNPbpXgtROscNjIfiYXOTeGx9NJ7BHcT6gb9JJvj7ozBthSY8Ooq0JRAmj
	 qpNt8k0xsPaMQ==
Message-ID: <d8dc7ba9-a46c-473c-aabf-90a417a300cc@kernel.org>
Date: Thu, 3 Apr 2025 15:19:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Subject: Re: [PATCH v4] f2fs: prevent the current section from being selected
 as a victim during GC
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250403071016.2940-1-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250403071016.2940-1-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/4/3 15:10, yohan.joung wrote:
> When selecting a victim using next_victim_seg in a large section, the
> selected section might already have been cleared and designated as the
> new current section, making it actively in use.
> This behavior causes inconsistency between the SIT and SSA.
> 
> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> Call trace:
> dump_backtrace+0xe8/0x10c
> show_stack+0x18/0x28
> dump_stack_lvl+0x50/0x6c
> dump_stack+0x18/0x28
> f2fs_stop_checkpoint+0x1c/0x3c
> do_garbage_collect+0x41c/0x271c
> f2fs_gc+0x27c/0x828
> gc_thread_func+0x290/0x88c
> kthread+0x11c/0x164
> ret_from_fork+0x10/0x20
> 
> issue scenario
> segs_per_sec=2
> - seg#0 and seg#1 are all dirty
> - all valid blocks are removed in seg#1
> - gc select this sec and next_victim_seg=seg#0
> - migrate seg#0, next_victim_seg=seg#1
> - checkpoint -> sec(seg#0, seg#1)  becomes free
> - allocator assigns sec(seg#0, seg#1) to curseg
> - gc tries to migrate seg#1
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
