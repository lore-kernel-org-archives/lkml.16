Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159191A3169
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 23:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744502172; cv=none; b=fft4pB7Q1c4kxIG22EwwOZWOyBnDHo6GOssTFDCXWSbHWndKJNqTTwXUUMc1WtHn5hC1yAad1nxwju8lQCPprS7N5WAsNgBfIg3FtbTqnQ1HHEv4w4AqXU/xDRBwh7nBkiP3P8g13cCQdPbe0DrEpClHfS/HDW3sp1qKUW8QxYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744502172; c=relaxed/simple;
	bh=MofAOLKemAlW3svYMJFj8CKYvpwVNc87XAq8CJmHPYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQ4x0ATtTGayos63/fFBbcmIaOoAxewWXN/rbn2IbGjhEquZsN7FA7wM3ARjODcr1r10kBquqY49CWRLyVY2yXvLItdudu+zGWeRK+1nTAfAJeNCV5qXY5Z4VouZ81k1YR8yCTth8EOl4QCys+9syHix7oQlXn93Y+BPvMHW79Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=tOdKK1rm; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="tOdKK1rm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744502161; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=iGptI8Sl8PjKv7VS1TUGCCufv2o8mk1ifmHF+BDHMoM=;
	b=tOdKK1rm8maDFJ5wghrYqsueXG28lYWT8R4MDem72k/Sqa2jCkMrB3BCorcE0MIzdpYsp4MhspoTFhvnVrTMpWx6mzUTtW+h+GPuvQ+wvmLOuunqTydjVKJiiEWzIBLYxNNlPm93LVR46z+xZfjzy3gjXGbeljWav9ECsXL0wcw=
Received: from 30.212.138.182(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0WWZSkxW_1744502158 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 13 Apr 2025 07:56:00 +0800
Message-ID: <207bef0c-c26f-49c5-8c08-c89e0eab9c45@linux.alibaba.com>
Date: Sun, 13 Apr 2025 07:55:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: o2net_idle_timer: Rename del_timer_sync in comment
To: WangYuli <wangyuli@uniontech.com>, mark@fasheh.com, jlbec@evilplan.org,
 akpm <akpm@linux-foundation.org>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
References: <BDDB1E4E2876C36C+20250411102610.165946-1-wangyuli@uniontech.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <BDDB1E4E2876C36C+20250411102610.165946-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/4/11 18:26, WangYuli wrote:
> Commit 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
> switched del_timer_sync to timer_delete_sync, but did not modify the
> comment for o2net_idle_timer(). Now fix it.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/cluster/tcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
> index fce9beb214f0..43e652a2adaf 100644
> --- a/fs/ocfs2/cluster/tcp.c
> +++ b/fs/ocfs2/cluster/tcp.c
> @@ -1483,7 +1483,7 @@ static void o2net_sc_send_keep_req(struct work_struct *work)
>  	sc_put(sc);
>  }
>  
> -/* socket shutdown does a del_timer_sync against this as it tears down.
> +/* socket shutdown does a timer_delete_sync against this as it tears down.
>   * we can't start this timer until we've got to the point in sc buildup
>   * where shutdown is going to be involved */
>  static void o2net_idle_timer(struct timer_list *t)

