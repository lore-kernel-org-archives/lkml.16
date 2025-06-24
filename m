Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666235948
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750725494; cv=none; b=J7zklDuym1a02IRG++uMS2T2HNVnQU40nIRWNc47wfPx7ErI90x2l7rULEwA0rzlgXg1FzhawsD4F8jz6LWWILgBTD2JU/FEDliXjYeslqMQBt0fUCpA3SM2zUHSd2me0twuaL/SZA9IR4+vPTRXpjYTtrAWlWb72yuOn2e6hts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750725494; c=relaxed/simple;
	bh=JQs9gz/NFvI8N4HhUMBLmxyBxTQKG4fUiQcyMBmCzas=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=He4ihjRYRQ073qm23Cm8dfqQYyaq36vlTM84GSK+bAAnhzmc0uYnkq1hJTRqz/YOVfJsxxjznL2mtL2KbswuZPybXSRkBBavNEI+tEP1kzcGBe+A+vWERkBskFZTufqGyCePBjx5C11z3JWpw6B3Fr0asmdHQysZfV2bRuAa5JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U5TIj9ev; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U5TIj9ev"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso686012f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750725491; x=1751330291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZlvEXovKxyFzMFNSWh0wIgJwy0g694LXaxz7gWWKKs=;
        b=U5TIj9evSZBVFbH8EIur+4DD3tor1k5JuDYikwTHo3jQbCUT0uaydgTAq4Hcnc+AZv
         /j26shZdL7WCPW67WBMFiBLr1X7X9xe83rt4seRZyum3J9K5zvbc22YnWTcdxuSW6IPl
         30Kpn3Tiq3K0lIb4YMMOP2F5Xsogop8QV4AcLdZvtRlCzI77UGZY7VFMqh5jvZIR3Xu2
         2DVaAr3ylfb5h0ArohZ/mPwiLp+AufjuZ5nmkHaz9XmlJx5+yOqX/TVwqP9j1nLoKB2L
         Q46DolIXD3POQR2d0VJiRssJswGfBhhZJnVXfC0eSTsXFUahSC8mYpYM2GFke+ECXnTx
         GfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750725491; x=1751330291;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZlvEXovKxyFzMFNSWh0wIgJwy0g694LXaxz7gWWKKs=;
        b=anZESJZsONHG8IMdsycCNqcPCH4YMK9vRGEDeOri9Obprrw8jCIcNybKD/0sqOP7ll
         Ar0O3LhmZpcXWgV9tEnIbdchsBbc3kETi5bzYhwC9qKoKgCeqyT6AYyCDHPu9+T+1XZn
         gMb3o6Evu0OjFfTZ9vA57D0Gzkh/DlaaJWk+ghaz6aArKs+2BbMA+WQs0H/7lMpIj1Dw
         Nlkg7JI9NpvEkR9bPCxlGwFM6fCUHhmq7cBOrwNWYuuGsgGRxSnbI0RuhylYDSirZdzi
         DX5x9Iz4HQXPDyiFczMrwFFKR6lPKRbzFDNFs2VhS/Yk8zz8vtffBkNIZIlmBoYhRdBB
         zedQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8dElAyJS29FlVmPiAmvMbXB7trALiKSE1JzFjeAH5alqzQiJSf/ML6K0MwUVzO2xv5brFFVXD46u0gg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOPOtm1xfXXXqnlxDq8mcfQmKxlrDywRiOTlnQhPUFyqbiKKbO
	qHCS2nZj6rEizWDZlkE03moMSbVUDmkguUjGruqzYABwvON8ku4qNSJ3VeX2a6wdEYQ=
X-Gm-Gg: ASbGncsyJZUtso8lgembwmg1s+4Vf0Tiq65fadaQOHGX71FvoedPjToPumwtg3JSuLA
	CQxh8tit9j7vR0jWY7n18dcWI+4CsdZF7eCyk75x6x5OuemLVDXlcaYPpCUKEeupt6eLGURlbKs
	IPpvIAbPemC27BjlB1RFcsGsS7jaDTrOnJSZvdeDe7muwrJEhqpUvcRgSzl8Pd947MBtD7Rz/fq
	6G9dMCD1GFqjMDlUFkuD/ZxUKN3GjglDJU4/s6wg0kZ2CoZxTGvK1Pe6CTjDjeNM3tkd8I51bwe
	X7sUWUl0QSV901fIR8UPFiyotgwZu9Rf+8OeQy8tw2OYFGbmnWMRRf2rBD3NQcq6VbA=
X-Google-Smtp-Source: AGHT+IHxEy9DDw/+nEJmttPoKno5HQNQCaSpkN5KhFruKdgujErU45jroQo5ctCLDze/KEon8/VKFw==
X-Received: by 2002:adf:9d8e:0:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3a6d12eb506mr3667961f8f.13.1750725490712;
        Mon, 23 Jun 2025 17:38:10 -0700 (PDT)
Received: from [10.202.32.28] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b32075895f6sm6135371a12.21.2025.06.23.17.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 17:38:10 -0700 (PDT)
Message-ID: <8f689011-4f35-41a1-a4cb-b81c833533f7@suse.com>
Date: Tue, 24 Jun 2025 08:38:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: embed actual values into ocfs2_sysfile_lock_key
 names
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, ocfs2-devel@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <29348724-639c-443d-bbce-65c3a0a13a38@I-love.SAKURA.ne.jp>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <29348724-639c-443d-bbce-65c3a0a13a38@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Just from your code logic, the switch is unnecessary, and converting the input parameter into an "unsigned int" type is sufficient.

e.g.: (not test)

unsigned int type = args->fi_sysfile_type;

if (args->fi_sysfile_type != 0)
         lockdep_set_class(&inode->i_rwsem,
                 &ocfs2_sysfile_lock_key[type]);

Thanks
- Heming

On 6/23/25 22:54, Tetsuo Handa wrote:
> Since lockdep_set_class() uses stringified key name via macro, calling
> lockdep_set_class() with an array causes lockdep warning messages to
> report variable name than actual index number.
> 
> Change ocfs2_init_locked_inode() to pass actual index number for better
> readability of lockdep reports. This patch does not change behavior.
> 
> 
> Before:
> 
>    Chain exists of:
>      &ocfs2_sysfile_lock_key[args->fi_sysfile_type] --> jbd2_handle --> &oi->ip_xattr_sem
> 
>     Possible unsafe locking scenario:
> 
>           CPU0                    CPU1
>           ----                    ----
>      lock(&oi->ip_xattr_sem);
>                                   lock(jbd2_handle);
>                                   lock(&oi->ip_xattr_sem);
>      lock(&ocfs2_sysfile_lock_key[args->fi_sysfile_type]);
> 
>     *** DEADLOCK ***
> 
> After:
> 
>    Chain exists of:
>      &ocfs2_sysfile_lock_key[EXTENT_ALLOC_SYSTEM_INODE] --> jbd2_handle --> &oi->ip_xattr_sem
> 
>     Possible unsafe locking scenario:
> 
>           CPU0                    CPU1
>           ----                    ----
>      lock(&oi->ip_xattr_sem);
>                                   lock(jbd2_handle);
>                                   lock(&oi->ip_xattr_sem);
>      lock(&ocfs2_sysfile_lock_key[EXTENT_ALLOC_SYSTEM_INODE]);
> 
>     *** DEADLOCK ***
> 
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>   fs/ocfs2/inode.c | 70 +++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> index 12e5d1f73325..14bf440ea4df 100644
> --- a/fs/ocfs2/inode.c
> +++ b/fs/ocfs2/inode.c
> @@ -50,8 +50,6 @@ struct ocfs2_find_inode_args
>   	unsigned int	fi_sysfile_type;
>   };
>   
> -static struct lock_class_key ocfs2_sysfile_lock_key[NUM_SYSTEM_INODES];
> -
>   static int ocfs2_read_locked_inode(struct inode *inode,
>   				   struct ocfs2_find_inode_args *args);
>   static int ocfs2_init_locked_inode(struct inode *inode, void *opaque);
> @@ -250,14 +248,77 @@ static int ocfs2_find_actor(struct inode *inode, void *opaque)
>   static int ocfs2_init_locked_inode(struct inode *inode, void *opaque)
>   {
>   	struct ocfs2_find_inode_args *args = opaque;
> +#ifdef CONFIG_LOCKDEP
> +	static struct lock_class_key ocfs2_sysfile_lock_key[NUM_SYSTEM_INODES];
>   	static struct lock_class_key ocfs2_quota_ip_alloc_sem_key,
>   				     ocfs2_file_ip_alloc_sem_key;
> +#endif
>   
>   	inode->i_ino = args->fi_ino;
>   	OCFS2_I(inode)->ip_blkno = args->fi_blkno;
> -	if (args->fi_sysfile_type != 0)
> +#ifdef CONFIG_LOCKDEP
> +	switch (args->fi_sysfile_type) {
> +	case BAD_BLOCK_SYSTEM_INODE:
> +		break;
> +	case GLOBAL_INODE_ALLOC_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[GLOBAL_INODE_ALLOC_SYSTEM_INODE]);
> +		break;
> +	case SLOT_MAP_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[SLOT_MAP_SYSTEM_INODE]);
> +		break;
> +	case HEARTBEAT_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[HEARTBEAT_SYSTEM_INODE]);
> +		break;
> +	case GLOBAL_BITMAP_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[GLOBAL_BITMAP_SYSTEM_INODE]);
> +		break;
> +	case USER_QUOTA_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[USER_QUOTA_SYSTEM_INODE]);
> +		break;
> +	case GROUP_QUOTA_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[GROUP_QUOTA_SYSTEM_INODE]);
> +		break;
> +	case ORPHAN_DIR_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[ORPHAN_DIR_SYSTEM_INODE]);
> +		break;
> +	case EXTENT_ALLOC_SYSTEM_INODE:
>   		lockdep_set_class(&inode->i_rwsem,
> -			&ocfs2_sysfile_lock_key[args->fi_sysfile_type]);
> +				  &ocfs2_sysfile_lock_key[EXTENT_ALLOC_SYSTEM_INODE]);
> +		break;
> +	case INODE_ALLOC_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[INODE_ALLOC_SYSTEM_INODE]);
> +		break;
> +	case JOURNAL_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[JOURNAL_SYSTEM_INODE]);
> +		break;
> +	case LOCAL_ALLOC_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[LOCAL_ALLOC_SYSTEM_INODE]);
> +		break;
> +	case TRUNCATE_LOG_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[TRUNCATE_LOG_SYSTEM_INODE]);
> +		break;
> +	case LOCAL_USER_QUOTA_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[LOCAL_USER_QUOTA_SYSTEM_INODE]);
> +		break;
> +	case LOCAL_GROUP_QUOTA_SYSTEM_INODE:
> +		lockdep_set_class(&inode->i_rwsem,
> +				  &ocfs2_sysfile_lock_key[LOCAL_GROUP_QUOTA_SYSTEM_INODE]);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unknown sysfile type %d\n", args->fi_sysfile_type);
> +	}
>   	if (args->fi_sysfile_type == USER_QUOTA_SYSTEM_INODE ||
>   	    args->fi_sysfile_type == GROUP_QUOTA_SYSTEM_INODE ||
>   	    args->fi_sysfile_type == LOCAL_USER_QUOTA_SYSTEM_INODE ||
> @@ -267,6 +328,7 @@ static int ocfs2_init_locked_inode(struct inode *inode, void *opaque)
>   	else
>   		lockdep_set_class(&OCFS2_I(inode)->ip_alloc_sem,
>   				  &ocfs2_file_ip_alloc_sem_key);
> +#endif
>   
>   	return 0;
>   }

