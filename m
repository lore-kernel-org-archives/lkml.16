Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC7317A300
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251359; cv=none; b=DGH05ZD0PW27MxMdx+9PUDUEp1r9Opj3gRlq1+ZQvlmUOvxOtqNESXHcBgSuivhpJSrq8JC1r6JBgJ+0qO2lpTYsHY+wHrllYawRTPnGLO4KvYLLwq0SmA6MR1cw0puKq378ywiOdKoIAZeaDSdwn4tkYWd44auHMCInv3OnZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251359; c=relaxed/simple;
	bh=5Z9KyRUVm84surKnziWOlPcfo5hvLqWFepD2MD5F2uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iAfL6vgB4TM7RAE3PgPqTqISMskcRFrt5uyzKjFntV/u+rMkZJuDcqOavvlsoqo73qCPoTDkb2Xv023+5Q420oO5jCKfbYRlKzbHRAOFKH5y3fZoBb4WzLaHh4aVMFFG2kKvvPZ0SGc+GunGdd7UWMDY3dc6y37rrUxUSA2+djM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PNaAf94L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PNaAf94L"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso4742805e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751251355; x=1751856155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Alw9qrycqIrCL8CKseCQMJxxf18iqOrQKvaGUMvOZFc=;
        b=PNaAf94LgjB5SbRecaP0HBjW8ZKLPbUFGgvzgabv0rq10XK5qxb0rVLHhA3URgyfHr
         /lox6+7NSzXyDIT3r34aan2QYu9/W0p9FbEtNM5G9KI5vMTC6cZNXk+xvEX0fNgxjrw9
         XdBA4YrdxNLOqtRkxwt8KOBuv/jnaBDXdhoop1luJPx5DOLo38glnG30+p7LUmUHfgzh
         WmazoKdPh/JRXLrqsGaEzpN0bvov9NK7pRsCQvktEAyLfSTcu0JQ9MrQmnW7M/LnAiyS
         KaWAmDmPJiDZCQ7GD+qPw8Hav9Iaxkjz851c40HIZgTxQCTKWRvt5/Lc0h5GIM2NCUuB
         14Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751251355; x=1751856155;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Alw9qrycqIrCL8CKseCQMJxxf18iqOrQKvaGUMvOZFc=;
        b=hle8aotsE81arOAKW3XrKb4UEWAvnLSF6yKcU9TYXJ/dpMseVz9nXcMT110Bwwa/es
         SoYDkDK16XQ8BTzN0PBydb8wvHFmK7gd4mWSYfZ9lxc2msLH+qeOJ9Q2MqyH05dEzFoJ
         LMnzCN2UPsoM7pHhi9aeSusbo6JA8oL+xQEY4vvIyMh1OjpwrVc7e+408VsFcazWwwHV
         X0b6RHEZJkSFNRxApZoSIKYfRZO1ZcmzVPb8uCv75l7xvxdS/fizIes4KKwi06Hrb8xG
         ONlXsL1+sdLFEZtX60DoGll72AWzSj094R4fuFjQrv9fHHZZtwQIrNPtZVy0UcGIQzZn
         U0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCURIHWSgYxZ8dzk4v8/Hi+QjnzYJA/DYZuYw6V0nMmPrOIARij/C1sXBGLHLJa5jFyt02p/Kfi3nxP+934=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDao4OZRYjROCtE5kcuT3nQLq/arL1xZ6PU1995Tj9LmdIW1j
	w09/VjkAleZ72fZptslzPgpEJcePLtAT9FC18Za7Dl6wkh534pyJVsMApgi3orG+SRFqbAls+/p
	2jdi2
X-Gm-Gg: ASbGnctPNYOCjO5vaSfNZYesmRm6NmV2JYN32N+lP4Y/63Dy3xnBUgBY5tUsqoJv5HA
	DQaBDv0OhRHhATNtPlP/vFJdEvk09mu+wpEOhu2EWIheUvbchsFuwXDZNCdGOrXZFgxUHRlL2f5
	cjQ1WlnSbprtSliTYvQ8S9bwRIZJGYJEsG+sD9XMoVDxJqkGuqMsRIE7s2whDC084QLr7fiWgNm
	dMfS3Gop7tGHacnrLoxryaT2OfqbXo7mLVr8OtDv5K3RevDFx6VIxQIafr5xlcfZ5A1W2fX9L4O
	Psu5INw515WToGddQqJvFSgFiuqKSSw6RVdKYjyXPXg4CbCaZf5So4K85qWUeD4vdROw
X-Google-Smtp-Source: AGHT+IHY8ujAk+fL2MXP/Rs3N1Xth55HJlztHL+lk12CWLUGIau3enA3BMSlMhI+5kI8/QF0mOPMLw==
X-Received: by 2002:a5d:5f48:0:b0:3a5:7991:fee with SMTP id ffacd0b85a97d-3aaf503a36dmr2262476f8f.14.1751251355112;
        Sun, 29 Jun 2025 19:42:35 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8ddsm71032555ad.140.2025.06.29.19.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 19:42:34 -0700 (PDT)
Message-ID: <d76672e5-0d69-42b1-a9d3-b70439c194b5@suse.com>
Date: Mon, 30 Jun 2025 10:42:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: embed actual values into ocfs2_sysfile_lock_key
 names
To: Joseph Qi <joseph.qi@linux.alibaba.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 ocfs2-devel@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <29348724-639c-443d-bbce-65c3a0a13a38@I-love.SAKURA.ne.jp>
 <d490a3ad-6309-42f3-9774-91871fbf7330@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <d490a3ad-6309-42f3-9774-91871fbf7330@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am not familiar with lockdep, and just have two questions regarding
the lockdep in ocfs2.

1>
there are three global "static struct lock_class_key" definitions:
- fs/ocfs2/inode.c  : ocfs2_sysfile_lock_key[NUM_SYSTEM_INODES]
- fs/ocfs2/dlmglue.c: lockdep_keys[OCFS2_NUM_LOCK_TYPES]
- fs/ocfs2/sysfile.c: ocfs2_sysfile_cluster_lock_key[NUM_SYSTEM_INODES]

why did you env only trigger the ocfs2_sysfile_lock_key[] warning?

2>
It seems the existing CONFIG_DEBUG_LOCK_ALLOC is incorrect, it should be
replaced with CONFIG_LOCKDEP.

- Heming

On 6/30/25 10:21, Joseph Qi wrote:
> 
> 
> On 2025/6/23 22:54, Tetsuo Handa wrote:
>> Since lockdep_set_class() uses stringified key name via macro, calling
>> lockdep_set_class() with an array causes lockdep warning messages to
>> report variable name than actual index number.
>>
>> Change ocfs2_init_locked_inode() to pass actual index number for better
>> readability of lockdep reports. This patch does not change behavior.
>>
>>
>> Before:
>>
>>    Chain exists of:
>>      &ocfs2_sysfile_lock_key[args->fi_sysfile_type] --> jbd2_handle --> &oi->ip_xattr_sem
>>
>>     Possible unsafe locking scenario:
>>
>>           CPU0                    CPU1
>>           ----                    ----
>>      lock(&oi->ip_xattr_sem);
>>                                   lock(jbd2_handle);
>>                                   lock(&oi->ip_xattr_sem);
>>      lock(&ocfs2_sysfile_lock_key[args->fi_sysfile_type]);
>>
>>     *** DEADLOCK ***
>>
>> After:
>>
>>    Chain exists of:
>>      &ocfs2_sysfile_lock_key[EXTENT_ALLOC_SYSTEM_INODE] --> jbd2_handle --> &oi->ip_xattr_sem
>>
>>     Possible unsafe locking scenario:
>>
>>           CPU0                    CPU1
>>           ----                    ----
>>      lock(&oi->ip_xattr_sem);
>>                                   lock(jbd2_handle);
>>                                   lock(&oi->ip_xattr_sem);
>>      lock(&ocfs2_sysfile_lock_key[EXTENT_ALLOC_SYSTEM_INODE]);
>>
>>     *** DEADLOCK ***
>>
>>
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> 
> Looks fine.
> 
> Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
>> ---
>>   fs/ocfs2/inode.c | 70 +++++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 66 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
>> index 12e5d1f73325..14bf440ea4df 100644
>> --- a/fs/ocfs2/inode.c
>> +++ b/fs/ocfs2/inode.c
>> @@ -50,8 +50,6 @@ struct ocfs2_find_inode_args
>>   	unsigned int	fi_sysfile_type;
>>   };
>>   
>> -static struct lock_class_key ocfs2_sysfile_lock_key[NUM_SYSTEM_INODES];
>> -
>>   static int ocfs2_read_locked_inode(struct inode *inode,
>>   				   struct ocfs2_find_inode_args *args);
>>   static int ocfs2_init_locked_inode(struct inode *inode, void *opaque);
>> @@ -250,14 +248,77 @@ static int ocfs2_find_actor(struct inode *inode, void *opaque)
>>   static int ocfs2_init_locked_inode(struct inode *inode, void *opaque)
>>   {
>>   	struct ocfs2_find_inode_args *args = opaque;
>> +#ifdef CONFIG_LOCKDEP
>> +	static struct lock_class_key ocfs2_sysfile_lock_key[NUM_SYSTEM_INODES];
>>   	static struct lock_class_key ocfs2_quota_ip_alloc_sem_key,
>>   				     ocfs2_file_ip_alloc_sem_key;
>> +#endif
>>   
>>   	inode->i_ino = args->fi_ino;
>>   	OCFS2_I(inode)->ip_blkno = args->fi_blkno;
>> -	if (args->fi_sysfile_type != 0)
>> +#ifdef CONFIG_LOCKDEP
>> +	switch (args->fi_sysfile_type) {
>> +	case BAD_BLOCK_SYSTEM_INODE:
>> +		break;
>> +	case GLOBAL_INODE_ALLOC_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[GLOBAL_INODE_ALLOC_SYSTEM_INODE]);
>> +		break;
>> +	case SLOT_MAP_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[SLOT_MAP_SYSTEM_INODE]);
>> +		break;
>> +	case HEARTBEAT_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[HEARTBEAT_SYSTEM_INODE]);
>> +		break;
>> +	case GLOBAL_BITMAP_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[GLOBAL_BITMAP_SYSTEM_INODE]);
>> +		break;
>> +	case USER_QUOTA_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[USER_QUOTA_SYSTEM_INODE]);
>> +		break;
>> +	case GROUP_QUOTA_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[GROUP_QUOTA_SYSTEM_INODE]);
>> +		break;
>> +	case ORPHAN_DIR_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[ORPHAN_DIR_SYSTEM_INODE]);
>> +		break;
>> +	case EXTENT_ALLOC_SYSTEM_INODE:
>>   		lockdep_set_class(&inode->i_rwsem,
>> -			&ocfs2_sysfile_lock_key[args->fi_sysfile_type]);
>> +				  &ocfs2_sysfile_lock_key[EXTENT_ALLOC_SYSTEM_INODE]);
>> +		break;
>> +	case INODE_ALLOC_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[INODE_ALLOC_SYSTEM_INODE]);
>> +		break;
>> +	case JOURNAL_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[JOURNAL_SYSTEM_INODE]);
>> +		break;
>> +	case LOCAL_ALLOC_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[LOCAL_ALLOC_SYSTEM_INODE]);
>> +		break;
>> +	case TRUNCATE_LOG_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[TRUNCATE_LOG_SYSTEM_INODE]);
>> +		break;
>> +	case LOCAL_USER_QUOTA_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[LOCAL_USER_QUOTA_SYSTEM_INODE]);
>> +		break;
>> +	case LOCAL_GROUP_QUOTA_SYSTEM_INODE:
>> +		lockdep_set_class(&inode->i_rwsem,
>> +				  &ocfs2_sysfile_lock_key[LOCAL_GROUP_QUOTA_SYSTEM_INODE]);
>> +		break;
>> +	default:
>> +		WARN_ONCE(1, "Unknown sysfile type %d\n", args->fi_sysfile_type);
>> +	}
>>   	if (args->fi_sysfile_type == USER_QUOTA_SYSTEM_INODE ||
>>   	    args->fi_sysfile_type == GROUP_QUOTA_SYSTEM_INODE ||
>>   	    args->fi_sysfile_type == LOCAL_USER_QUOTA_SYSTEM_INODE ||
>> @@ -267,6 +328,7 @@ static int ocfs2_init_locked_inode(struct inode *inode, void *opaque)
>>   	else
>>   		lockdep_set_class(&OCFS2_I(inode)->ip_alloc_sem,
>>   				  &ocfs2_file_ip_alloc_sem_key);
>> +#endif
>>   
>>   	return 0;
>>   }
> 
> 

