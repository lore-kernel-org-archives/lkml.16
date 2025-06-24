Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685DE3398A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731433; cv=none; b=B9vmCqlqd0RudE83gde8Y2zAxcP1QeIn0lbj713nmVePQOoR10qXdUCirT7MuFroN7KWr3OZ7MB9jtU3Cz6lGjL97rNEDj8owk/SLYnjeC7mHPgeMMbG5HW/MuS/cA7NQCUTq/lQ3sNfkWbNIASCUa/79RrS5BBNPrvib6nDIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731433; c=relaxed/simple;
	bh=aCc8bsAkjQYdVRheiUTB3DBXq/DyOIV/EGkjk16hu4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0XiDy0mtOjsMdP9gET/T1vl8TQQNuUxcIV/fNc+xbUx7dQLkkvO37pS22RqCU8V56s7ViAlT+O5/OWauMcuDpPrurDBx2Esfj4sBWmWd/WeEbx8i4EEiOY9myjKADB9yyMXWbMky7wagAZq6Fikfil1qULSExv+TEgD2i77Asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55O2HAWr070810;
	Tue, 24 Jun 2025 11:17:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55O2H9Zr070806
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 24 Jun 2025 11:17:09 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <675ea747-5c05-410c-888c-fe6dd2b48d87@I-love.SAKURA.ne.jp>
Date: Tue, 24 Jun 2025 11:17:09 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: kill osb->system_file_mutex lock
To: Heming Zhao <heming.zhao@suse.com>, Mark Fasheh <mark@fasheh.com>,
        Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>,
        jiangyiwen <jiangyiwen@huawei.com>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        ocfs2-devel@lists.linux.dev,
        Diogo Jahchan Koike <djahchankoike@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <934355dd-a0b1-4e53-93ac-0a7ae7458051@I-love.SAKURA.ne.jp>
 <faf70481-09dd-4c7a-bd43-f1e8bec877cb@suse.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <faf70481-09dd-4c7a-bd43-f1e8bec877cb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav104.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/06/24 10:33, Heming Zhao wrote:
>> @@ -112,11 +110,10 @@ struct inode *ocfs2_get_system_file_inode(struct ocfs2_super *osb,
>>       inode = _ocfs2_get_system_file_inode(osb, type, slot);
> 
> In my view, the key of commit 43b10a20372d is to avoid calling
> _ocfs2_get_system_file_inode() twice, which lead refcnt+1 but no place to
> do refcnt-1.

My understanding is that concurrently calling _ocfs2_get_system_file_inode() itself
is OK, for the caller of ocfs2_get_system_file_inode() is responsible for calling
iput().

The problem commit 43b10a20372d fixed is that there was no mechanism to avoid
concurrently calling

  *arr = igrab(inode);

which will result in failing to call iput() for raced references when
ocfs2_release_system_inodes() is called.

> 
>>         /* add one more if putting into array for first time */
>> -    if (arr && inode) {
>> -        *arr = igrab(inode);
>> -        BUG_ON(!*arr);
>> +    if (inode && arr && !*arr && !cmpxchg(&(*arr), NULL, inode)) {
> 
> Bypassing the refcnt+1 here is not a good idea. We should do refcnt+1
> before returning to the caller.
> 
>> +        inode = igrab(inode);

We do refcnt+1 immediately after cmpxchg() succeeds, for
ocfs2_release_system_inodes() which clears *arr is the place for
doing refcnt-1.

>> +        BUG_ON(!inode);
>>       }
>> -    mutex_unlock(&osb->system_file_mutex);
>>       return inode;
>>   }
>>   
> 

