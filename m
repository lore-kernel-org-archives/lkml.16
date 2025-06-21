Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD721FF5B
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521810; cv=none; b=K4ASC1Fdt8W+ef3BA0Fp2C7WvYaHHb1KBLGCmp0vDdv3EfQmtkeotBMWqTiD6RcuM8JhGs7RmsGlAy2ehaXq7TKGQPuARw5sOv0p2rSehx/uMtxQxvq5izgze6CC1vJH85TVuoolCr3VmBzNjuFW5MUui3Rh75ObLRwTSX4ahIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521810; c=relaxed/simple;
	bh=oSnFoN+N7w66nD+KjqSKxdPCFEF6xaf5UhcwUxiVNDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=JeMXMXgdmKBjvS4kihQQnHoFtqcvBwKh6BRaNkl+NqdgrDM1ZlQ1Tst5xJ4aGGYZ5bLRhtWImjwSa+gP0uzbZfKlC2OI3sJq5AchR3Pu4MbbSiDoPIOq0bV4UBYbZz7oAAhRrCCwT9SxYSr9o2MvZvozSevFfopR41yp8FFiKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55LG3PwP033330;
	Sun, 22 Jun 2025 01:03:25 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55LG3OS2033327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 22 Jun 2025 01:03:25 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <fe9d1d9b-c156-4e98-abe4-80997edc8828@I-love.SAKURA.ne.jp>
Date: Sun, 22 Jun 2025 01:03:21 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] possible deadlock in ocfs2_try_remove_refcount_tree
To: Diogo Jahchan Koike <djahchankoike@gmail.com>
References: <00000000000032dd730620055fde@google.com>
 <000000000000fe6097062037e361@google.com>
Content-Language: en-US
Cc: LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <000000000000fe6097062037e361@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav103.rs.sakura.ne.jp
X-Virus-Status: clean

Please re-submit this change as a formal patch.
You can add

  Reported-by: syzbot+1fed2de07d8e11a3ec1b@syzkaller.appspotmail.com
  Tested-by: syzbot+1fed2de07d8e11a3ec1b@syzkaller.appspotmail.com

lines to this change.

On 2024/08/22 6:04, syzbot wrote:
> For archival purposes, forwarding an incoming command email to
> linux-kernel@vger.kernel.org.
> 
> ***
> 
> Subject: possible deadlock in ocfs2_try_remove_refcount_tree
> Author: djahchankoike@gmail.com
> 
> #syz test
> 
> Acquiring the locks in refcounttree should follow
> the ip_alloc --> ip_xattr ordering, as done by multiple
> code paths in ocfs2; otherwise, we risk an ABBA deadlock
> (i.e in the start transaction path).
> 
> Signed-off-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
> ---
>  fs/ocfs2/refcounttree.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
> index 1f303b1adf1a..32c0249ff253 100644
> --- a/fs/ocfs2/refcounttree.c
> +++ b/fs/ocfs2/refcounttree.c
> @@ -927,8 +927,8 @@ int ocfs2_try_remove_refcount_tree(struct inode *inode,
>  	struct ocfs2_inode_info *oi = OCFS2_I(inode);
>  	struct ocfs2_dinode *di = (struct ocfs2_dinode *)di_bh->b_data;
>  
> -	down_write(&oi->ip_xattr_sem);
>  	down_write(&oi->ip_alloc_sem);
> +	down_write(&oi->ip_xattr_sem);
>  
>  	if (oi->ip_clusters)
>  		goto out;
> @@ -944,8 +944,8 @@ int ocfs2_try_remove_refcount_tree(struct inode *inode,
>  	if (ret)
>  		mlog_errno(ret);
>  out:
> -	up_write(&oi->ip_alloc_sem);
>  	up_write(&oi->ip_xattr_sem);
> +	up_write(&oi->ip_alloc_sem);
>  	return 0;
>  }
>  

