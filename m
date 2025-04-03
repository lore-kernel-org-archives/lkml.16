Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890A1802B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743641797; cv=none; b=YS/QiEbGg/YXfyPj4Npz0cQ8NCBnmKYxHszj8ptR5d6aSokrIWUOOEhIjoEt9tpi2GZCKsiKMXE/GSKoQ2Tp5twtKAey8uVn9NC6EKPSJcOdJ5cdSVsgxXxvkoHLqiDdmtmd04OPXW9G6N4oFmcF6I2H3TPsJZfWiHCffunjbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743641797; c=relaxed/simple;
	bh=+OXf5M1w46IgUF2uca+d1zmhqoN6pSAXm2BCK9dapO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LP19YPVEFWnISueyPhyHFl0exvCTuTmeipJfwwhF4vCTxtrCWehl1hNrK5fDHHH1BvwjjQLBhEz8mC1DyX4BeQRkk94nFFi2B9IgD+noVGRA7s+G9xZTc/aHW9vfxBBI3mzNDxOmpFVjKG52/l04BfMiZBZRAcxJfcJ7/4PxI0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=gRX4bxZf; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="gRX4bxZf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743641784; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=J8uanV/xeiKDcIDPpPB+muPC63DFete06zJYgy7ARkg=;
	b=gRX4bxZfMRJrr0Lf4sFwoyh5Tq8zO5lELWNnbu6PUCpM02DdwlNSkR3K4Y1QBYBdOFnlKSUb1hCa60H1wcbQhPu6BWG8gpTSg3WLhMH4Qil6XHI9eix5XQ5oSyY3DOBrSLOMsggaWIK7ZWdkxihBTWeBCOF27DHrDkrHzXKpyjM=
Received: from 30.39.168.206(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0WUW-yJ._1743641783 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Apr 2025 08:56:23 +0800
Message-ID: <72e5496c-df00-4b1f-bad0-b211ffaa61cf@linux.alibaba.com>
Date: Thu, 3 Apr 2025 08:56:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ocfs2: Fix possible memory leak in
 ocfs2_finish_quota_recovery
To: Murad Masimov <m.masimov@mt-integration.ru>, Mark Fasheh
 <mark@fasheh.com>, akpm <akpm@linux-foundation.org>
Cc: Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.cz>,
 ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20250402065628.706359-1-m.masimov@mt-integration.ru>
 <20250402065628.706359-2-m.masimov@mt-integration.ru>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20250402065628.706359-2-m.masimov@mt-integration.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/4/2 14:56, Murad Masimov wrote:
> If ocfs2_finish_quota_recovery() exits due to an error before passing all
> rc_list elements to ocfs2_recover_local_quota_file() then it can lead to
> a memory leak as rc_list may still contain elements that have to be freed.
> 
> Release all memory allocated by ocfs2_add_recovery_chunk() using
> ocfs2_free_quota_recovery() instead of kfree().
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Fixes: 2205363dce74 ("ocfs2: Implement quota recovery")
> Signed-off-by: Murad Masimov <m.masimov@mt-integration.ru>

Looks good.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>

> ---
>  fs/ocfs2/quota_local.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/quota_local.c b/fs/ocfs2/quota_local.c
> index 2956d888c131..e60383d6ecc1 100644
> --- a/fs/ocfs2/quota_local.c
> +++ b/fs/ocfs2/quota_local.c
> @@ -678,7 +678,7 @@ int ocfs2_finish_quota_recovery(struct ocfs2_super *osb,
>  	}
>  out:
>  	up_read(&sb->s_umount);
> -	kfree(rec);
> +	ocfs2_free_quota_recovery(rec);
>  	return status;
>  }
> 
> --
> 2.39.2

