Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966921E5B66
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446030; cv=none; b=lkJ5OUc3JShrrK9Zn6bSMsAUEGrDOZb52g+j0Lhas4gw9sa9lHkXB4WHLcTwUPAyBq+yzkEQPQ9pW4V2vFhahrRJTyctu27E5JupugmWnCJs3wIksQZwQiBa0qOvc3XIkD1zw28snM5sH7nL5wvfvW82mgbFQj0oFjORJbOFOJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446030; c=relaxed/simple;
	bh=bp28noHFXI39rusqUs8gwSpotivluw23XX7A5HKSIyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=otyrIxIAIeksNcGrsLFLo9VJ1R7M8puUhuKg/oHzNqUwkX9wNy4qVN8/nIOW0RSjZykkl/+KZwfoBZRwGQCHri6WyL0Pv4IWiCPdfHroZBRQu+Y6Gh0ZEQ90uEjyHizq7OmDOar9Y+jEPfE7G5xfYRvnvpXHTqQdbV+zcscRVR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j7gins0y; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j7gins0y"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so292942b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745446028; x=1746050828; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=utY/3ZiZMMWfdAOVaunsuvsNTPOFiHttGwR5vylAKHw=;
        b=j7gins0yjzcNXk2k7aYPdxq5dLq+fcHbYDtm944oh6TIvVs4R5h7S+4qj0XOde7EKx
         9YqoUoQbUjtp3oc27Lsd0UKN0/WD3hiauZ6GqblzkPZ37dH+jI785SVuAJko0NxyBwSk
         nU6pG4bPxxZuatrKWE8LLww11QQZpS4jCuYYQ6I32eBafBVQ0Z32jf85Isk6LWbOMOf/
         BT/jdgH77gxvyJKF6TFv2F6g8MKEzfT2+X2GOOye568qXeUUBGEHOXocpwf1IQmry5I4
         u4sSrq85/NqcuLCOVDPoegVkeACP1HN1LXVXslqbS5fZ6hghVX/VZiAfM+TsIKA3WS9h
         VJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745446028; x=1746050828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utY/3ZiZMMWfdAOVaunsuvsNTPOFiHttGwR5vylAKHw=;
        b=GKDPhTAsnvUOEutHfZctYtChGb1odMUqXXfvrq5Bu9RNmnBfm40tMI/ki6JYMhXR5d
         y/qa945z8YZqmRFMZ6j/lLxiF83x58OQjpEdFCikkDO736NuumuynMJwubs650015Jqv
         gdNalK1m+agKRCYZlhAWfOpzQN6eOEI5eCKmTYwvi+C0Xjv6+knazwvwk9J5i4mH0ODu
         PjdOkFM/KaOPeXYH48+yzoxuhfBWCwgSwC69WC7DxiRO0V/Xam1ld8DD5N/gA+24E8kb
         Mu/cukhwJ6iE1ZRy0RI0zGpy/NdIMLh9X0beOGwT04DCrgdTQZccpnvRO54O7MLqNu0U
         U76g==
X-Forwarded-Encrypted: i=1; AJvYcCVvz1rOZ96DO71+HOgIzA2WRckMxzbbAks5SyTH5ZiR45Z9t5P9uoyjMt/b39TqDvSKPXjM65sGqmQi93M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJK1wYxyO/GOV8VIFlVL0vX31N4d/G4XHPkLOUF8eWW/3fKjU
	VhYjCSC/M8Trl08YgwJh/WULMAeu7e1Xo3JfsNvvZ26x2SyEVZ6Pvj+sivubLZANtnWcW9IupSQ
	lLYaZSKNsZjc3HI+BgERWqQ==
X-Google-Smtp-Source: AGHT+IGY+pnHq2DQX/HQySosr6MoIfIEbH4ov9YBubqcg0pcHfTCmXDOga+QBFHTjyVSBCstaBHNJFn3Q1wqnKPotg==
X-Received: from pfx55.prod.google.com ([2002:a05:6a00:a477:b0:736:4ad6:1803])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3018:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73e245e3bc0mr500238b3a.9.1745446027829;
 Wed, 23 Apr 2025 15:07:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 15:07:06 -0700
In-Reply-To: <Z74p8-l6BhOmR1B_@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1726009989.git.ackerleytng@google.com> <bd163de3118b626d1005aa88e71ef2fb72f0be0f.1726009989.git.ackerleytng@google.com>
 <Z74p8-l6BhOmR1B_@x1.local>
Message-ID: <diqzecxizg51.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH 26/39] KVM: guest_memfd: Track faultability within a
 struct kvm_gmem_private
From: Ackerley Tng <ackerleytng@google.com>
To: Peter Xu <peterx@redhat.com>
Cc: tabba@google.com, quic_eberman@quicinc.com, roypat@amazon.co.uk, 
	jgg@nvidia.com, david@redhat.com, rientjes@google.com, fvdl@google.com, 
	jthoughton@google.com, seanjc@google.com, pbonzini@redhat.com, 
	zhiquan1.li@intel.com, fan.du@intel.com, jun.miao@intel.com, 
	isaku.yamahata@intel.com, muchun.song@linux.dev, erdemaktas@google.com, 
	vannapurve@google.com, qperret@google.com, jhubbard@nvidia.com, 
	willy@infradead.org, shuah@kernel.org, brauner@kernel.org, bfoster@redhat.com, 
	kent.overstreet@linux.dev, pvorel@suse.cz, rppt@kernel.org, 
	richard.weiyang@gmail.com, anup@brainfault.org, haibo1.xu@intel.com, 
	ajones@ventanamicro.com, vkuznets@redhat.com, maciej.wieczor-retman@intel.com, 
	pgonda@google.com, oliver.upton@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Peter Xu <peterx@redhat.com> writes:

> On Tue, Sep 10, 2024 at 11:43:57PM +0000, Ackerley Tng wrote:
>> @@ -1079,12 +1152,20 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
>>  	if (err)
>>  		goto out;
>>  
>> +	err = -ENOMEM;
>> +	private = kzalloc(sizeof(*private), GFP_KERNEL);
>> +	if (!private)
>> +		goto out;
>> +
>>  	if (flags & KVM_GUEST_MEMFD_HUGETLB) {
>> -		err = kvm_gmem_hugetlb_setup(inode, size, flags);
>> +		err = kvm_gmem_hugetlb_setup(inode, private, size, flags);
>>  		if (err)
>> -			goto out;
>> +			goto free_private;
>>  	}
>>  
>> +	xa_init(&private->faultability);
>> +	inode->i_mapping->i_private_data = private;
>> +
>>  	inode->i_private = (void *)(unsigned long)flags;
>
> Looks like inode->i_private isn't used before this series; the flags was
> always zero before anyway.  Maybe it could keep kvm_gmem_inode_private
> instead? Then make the flags be part of the struct.
>
> It avoids two separate places (inode->i_mapping->i_private_data,
> inode->i_private) to store gmem private info.
>

Weakly-held opinion: I think the advantage of re-using inode->i_private
to store flags is that in some cases, e.g. non-hugetlb, we might be able
to avoid an allocation (of kvm_gmem_inode_private).

Does anyone else have any thoughts on this?

>>  	inode->i_op = &kvm_gmem_iops;
>>  	inode->i_mapping->a_ops = &kvm_gmem_aops;
>> @@ -1097,6 +1178,8 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
>>  
>>  	return inode;
>>  
>> +free_private:
>> +	kfree(private);
>>  out:
>>  	iput(inode);
>>  
>> -- 
>> 2.46.0.598.g6f2099f65c-goog
>> 
>
> -- 
> Peter Xu
