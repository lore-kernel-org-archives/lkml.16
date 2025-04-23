Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DA2701BC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439724; cv=none; b=r0hG/PAQxqD89h4eLHI3YU/pfvlOF3eYFWp3NgEcr/IEb+tfRjVnn1dPJ8u44vupZO91/gB1GjHHWp4zYGzl7+v8ELbYOPIMpRbqSKGeHOTA1Wz4FsSdj9SqK77JUkWm/2lBr5kruj0GE++whEkGPfpr9Q4wSJMhMVEMkoHdKbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439724; c=relaxed/simple;
	bh=IZnu6wdyPtClzTpUQpTWkf4YSITWNNs3ibqRNmz2PFA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kTzDeqnm8ALCUNlknyCRxfIOLi/VV8x2OJEJyZGOdLXR2kUXPcjArBPpmqtYYCc1E8R/LSgtsi3p8+Cf5gXBr+45w0ypkPwRXrT8TX3sJKh9m5Vk1rhRmq00JmNpmEnaLVBGFg3T/4N0EYo9XH+cuKLnk4FKI70nsyRGoDBYfdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hHQqEXr9; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hHQqEXr9"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736c7df9b6cso221424b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745439722; x=1746044522; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lb5Hj4079cmmz08gkncfU6HRHYwb2cTW68BpAu1pjpA=;
        b=hHQqEXr9+PCQ4471VW3+obysjcFBHCpHjIV3G5mc7ikxmkVFgjbFw0kd6heprsAb5E
         4SpRiAMULhDilLQdu5wJZpoGZrGz14err+IAB+Cg+9YjHzAQWuh9TEBAKM6ScOiGhQiV
         xyfd123JGEHSExNY+Zc4dNGUwQOlQ/AvV+mkiP0r1CP7Nolv+ugWrJsSmMaN2Zz/mRlt
         LbN6JuQ9354SJozUlEo3yqvZLR80idSITei1f0wBs3JlL0WOerfdZc1PKIMJrthWDXPY
         2NY6sRGVQRD9cHHYt2YbAv0vc8qS9wFxAdsZZXsglKMujjAAF9Q2RNrl/UMvPSaTRs0M
         TvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745439722; x=1746044522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lb5Hj4079cmmz08gkncfU6HRHYwb2cTW68BpAu1pjpA=;
        b=APEs6wRGKoqW2UwisMm5zOY+/blCqQUtaY5XtGNqBikjsZQPlOXY2JbLmlmvsQeNpq
         5dD9xvh1eBSdEwGnhS3sJNyR/soVh2O5B/ddP6cQTNsjmu+AIpNEAdAZzTlzxpbz98XO
         ydgfTmT96XR1hxP+tkH3XAvRhy7YOqQrf2O3nUC6tUokiiM60BmpT4tXoJaKxQbJxKoO
         G0X96tIMku4AD4UeO65+XI7c2WA0okDfdmVfCjc1JqAJierfJqeHbm1YDcSxEWwVXfLc
         6ylUDAS4QY21ybhpb6EZPnStA2/LcgCNj+KcyBR3i/62WxLM59s+ZAr1fJC1J2bptMpg
         /0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZsH15+B88lAIJm0IYSbgOtuvtdhWT83wJTdNzyY9ljJ97b570qDGT5PzSds0evsAPfsposJsx6m8Idg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR68fTCJhiYSnmWQyJHDtl2uTQ5CkZEL0/Z50yWLzcTcncnoHZ
	AfFhaOr77aNDTrQSYVan16WfprBIweiisY13JZoNQ7UlusQfe/CYHC/VPuue7xnrn9MH/uqo6li
	e55uGh6D/2/6gGk2acyG/bg==
X-Google-Smtp-Source: AGHT+IEZQzaRzavelSAVxJna7z3rzv2eWOXWrhC8lNuigMph7H21lihWm3EaY9BgIQuvCBgTk8eHqn8ZKABOoog4TQ==
X-Received: from pglc21.prod.google.com ([2002:a63:d15:0:b0:b14:9718:f939])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:ce48:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-203cbd418efmr30504920637.42.1745439722591;
 Wed, 23 Apr 2025 13:22:02 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:22:00 -0700
In-Reply-To: <Z+y2nU7KDmRpuISM@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1726009989.git.ackerleytng@google.com> <d1940d466fc69472c8b6dda95df2e0522b2d8744.1726009989.git.ackerleytng@google.com>
 <Z+y2nU7KDmRpuISM@yzhao56-desk.sh.intel.com>
Message-ID: <diqzselyzl07.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH 13/39] KVM: guest_memfd: Make guest mem use guest mem
 inodes instead of anonymous inodes
From: Ackerley Tng <ackerleytng@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: tabba@google.com, quic_eberman@quicinc.com, roypat@amazon.co.uk, 
	jgg@nvidia.com, peterx@redhat.com, david@redhat.com, rientjes@google.com, 
	fvdl@google.com, jthoughton@google.com, seanjc@google.com, 
	pbonzini@redhat.com, zhiquan1.li@intel.com, fan.du@intel.com, 
	jun.miao@intel.com, isaku.yamahata@intel.com, muchun.song@linux.dev, 
	mike.kravetz@oracle.com, erdemaktas@google.com, vannapurve@google.com, 
	qperret@google.com, jhubbard@nvidia.com, willy@infradead.org, 
	shuah@kernel.org, brauner@kernel.org, bfoster@redhat.com, 
	kent.overstreet@linux.dev, pvorel@suse.cz, rppt@kernel.org, 
	richard.weiyang@gmail.com, anup@brainfault.org, haibo1.xu@intel.com, 
	ajones@ventanamicro.com, vkuznets@redhat.com, maciej.wieczor-retman@intel.com, 
	pgonda@google.com, oliver.upton@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-fsdevel@kvack.org
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

> Hi Ackerley,
>
> Not sure if below nits have been resolved in your latest code.
> I came across them and felt it's better to report them anyway.
>
> Apologies for any redundancy if you've already addressed them.

No worries, thank you so much for your reviews!

>
> On Tue, Sep 10, 2024 at 11:43:44PM +0000, Ackerley Tng wrote:
>> +static void kvm_gmem_init_mount(void)                                         
>> +{                                                                             
>> +     kvm_gmem_mnt = kern_mount(&kvm_gmem_fs);                                 
>> +     BUG_ON(IS_ERR(kvm_gmem_mnt));                                            
>> +                                                                              
>> +     /* For giggles. Userspace can never map this anyways. */                 
>> +     kvm_gmem_mnt->mnt_flags |= MNT_NOEXEC;                                   
>> +}                                                                             
>> +                                                                              
>>  static struct file_operations kvm_gmem_fops = {                               
>>       .open           = generic_file_open,                                     
>>       .release        = kvm_gmem_release,                                      
>> @@ -311,6 +348,8 @@ static struct file_operations kvm_gmem_fops = {            
>>  void kvm_gmem_init(struct module *module)                                     
>>  {                                                                             
>>       kvm_gmem_fops.owner = module;                                            
>> +                                                                              
>> +     kvm_gmem_init_mount();                                                   
>>  } 
> When KVM is compiled as a module, looks "kern_unmount(kvm_gmem_mnt)" is
> missing in the kvm_exit() path.
>
> This may lead to kernel oops when executing "sync" after KVM is unloaded or
> reloaded.
>

Thanks, Fuad will be addressing this in a revision of [1].

> BTW, there're lots of symbols not exported under mm.
>

Thanks again, is there a good way to do a build test for symbols not
being exported?  What CONFIG flags do you use?

>> +static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,
>> +						  u64 flags)
>> +{
>> +	static const char *name = "[kvm-gmem]";
>> +	struct inode *inode;
>> +	struct file *file;
>> +
>> +	if (kvm_gmem_fops.owner && !try_module_get(kvm_gmem_fops.owner))
>> +		return ERR_PTR(-ENOENT);
>> +
>> +	inode = kvm_gmem_inode_make_secure_inode(name, size, flags);
>> +	if (IS_ERR(inode))
> Missing module_put() here. i.e.,
>
> -       if (IS_ERR(inode))
> +       if (IS_ERR(inode)) {
> +               if (kvm_gmem_fops.owner)
> +                       module_put(kvm_gmem_fops.owner);
> +
>                 return ERR_CAST(inode);
> +       }
>

Thanks, Fuad will be addressing this in a revision of [1].

>> +		return ERR_CAST(inode);
>> +
>> +	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR,
>> +				 &kvm_gmem_fops);
>> +	if (IS_ERR(file)) {
>> +		iput(inode);
>> +		return file;
>> +	}
>> +
>> +	file->f_mapping = inode->i_mapping;
>> +	file->f_flags |= O_LARGEFILE;
>> +	file->private_data = priv;
>> +
>> +	return file;
>> +}
>> +
>
> Thanks
> Yan

[1] https://lore.kernel.org/all/20250328153133.3504118-2-tabba@google.com/
