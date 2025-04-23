Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B6B267725
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439952; cv=none; b=Ba3NfXTKENV5E7FCOAS1/1OcNeVrBEZfETgsOGPaOg6wmGp0Udd10DDsQVWdEUzvWxPMY2FxupydpjjiUG2UfKSb4nJJ66k8r2dCw29H4fgbChuy/mZw1mBDVTklE+Otw7iDDv/CAG8cL3paKzuoqc1n0GCHyXACV+GN/BUIDB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439952; c=relaxed/simple;
	bh=FVGAb43n+nj0WTaGxkD+7N48DxDKHF+TEMQjE/V8uF4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oDJHF0F75Mup29t9giduUlySKAGD/oTVUImibb30bIrBFexdeRLZN6GsFpc8i4QjX0kYczXTIEDDD+NpLiYpzIg/Eg5PIHDcBpdpGHCuADUkWi/GSY0t4W9o+rr25hAEWw2IweEmP0mTcxtv7sWHPdvLIr4ll8HFa4QMDyyzshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B6KWxEd0; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B6KWxEd0"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73dff14aa55so157138b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745439949; x=1746044749; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjX2WJaP/+hIZJnKE7ZkAy8ut0H0AnZ+KN3YDGIa+EI=;
        b=B6KWxEd0568908TIWQLQx4k1c+x0CSpZXkE1kYcxVLL81Tt9AN3dr3ltUQGsHM6mmL
         34jEuwT3lO03sF6lEH8EyoEIjz711G+PVcqYO8eqh6o/A2PpqXF3FySQzQGxx41v9Wqr
         yqS806Ds3P/KHbo5eiVSbHOLT4nY1ipeuog0OFyW4De9uwzamEuvQ9Qopbgjwd6qjrrp
         24kNv/QukRbbI9kcg4PBEEnENJRQ0oddSV8CUlmbgv4u+ncGFuFeh25OArs4+PJ3lidk
         UX6aZyAx0WQylgvg6WrqZ6lmaOrpJBfqkxhkI69tiSZRMEP6BHldGEkvesIvb3w6WcdN
         NSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745439949; x=1746044749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjX2WJaP/+hIZJnKE7ZkAy8ut0H0AnZ+KN3YDGIa+EI=;
        b=OipobGVEjA+LXC5WPMsrnqH2cobUgKSrPT4go8nOj9qK5lpjb76t8xibW63MWidchU
         gKov423/VcoKSUGXNGFW9gabFSh80hYUv0LCKkzILgfVctcVL1oQmpv0dYH8edsDVTil
         d72j83K83NIL1DomiUaaB8nl1bKjme9FOxec4kIMhgJWNiu/cxqQsWrMriS8CQSCU9OZ
         HHwRGMCLtenx++HRxAcmr+Lwe/guQmi5QH0Lep18rqXhscPNJmRjA7bdbeuXh9Iw8Bq7
         zVxfVem7bWAai5t0JxQJa0JpK/WkPLTP9StzAmFHbceOKONsyVp3gkIZnT2V8G9wRVfN
         hhpw==
X-Forwarded-Encrypted: i=1; AJvYcCXzi/8l4aT5pirj2dU+C7S5q2F7NUQDZMtCGCOBfaW1QYVhHnsH1CfFPj4O9xNsfpfNarEzZdtN95DOHiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhT0BLfihR9YtnxXt75mhwQUw/gQlhEh7+UNeQKwA68pGdwxLD
	Da++X/76+NuwqQqF+ggzMkKQ6ItoV2ixF2W8qyebTbvKKhWyEx1sh+PLZJXdpy30cwLljYiBae/
	yROj+DnIU/A54124KNh0T/A==
X-Google-Smtp-Source: AGHT+IFLEEtCn1zkdoknKQC40EflQZ5HCAiPFEe4xIPUK0dlv/WJ0C7ai9MKNllw9+iA8ZkUhOs7ih4lNf6hYQC50w==
X-Received: from pfam7.prod.google.com ([2002:aa7:8a07:0:b0:736:ae72:7543])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c889:b0:1ee:a914:1d64 with SMTP id adf61e73a8af0-2044113e9a5mr1184451637.28.1745439949162;
 Wed, 23 Apr 2025 13:25:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:25:47 -0700
In-Reply-To: <Z47RSls2rr-xVqNk@x1n>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1726009989.git.ackerleytng@google.com> <5a05eb947cf7aa21f00b94171ca818cc3d5bdfee.1726009989.git.ackerleytng@google.com>
 <Z47RSls2rr-xVqNk@x1n>
Message-ID: <diqzplh2zktw.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH 27/39] KVM: guest_memfd: Allow mmapping guest_memfd files
From: Ackerley Tng <ackerleytng@google.com>
To: Peter Xu <peterx@redhat.com>
Cc: tabba@google.com, quic_eberman@quicinc.com, roypat@amazon.co.uk, 
	jgg@nvidia.com, david@redhat.com, rientjes@google.com, fvdl@google.com, 
	jthoughton@google.com, seanjc@google.com, pbonzini@redhat.com, 
	zhiquan1.li@intel.com, fan.du@intel.com, jun.miao@intel.com, 
	isaku.yamahata@intel.com, muchun.song@linux.dev, mike.kravetz@oracle.com, 
	erdemaktas@google.com, vannapurve@google.com, qperret@google.com, 
	jhubbard@nvidia.com, willy@infradead.org, shuah@kernel.org, 
	brauner@kernel.org, bfoster@redhat.com, kent.overstreet@linux.dev, 
	pvorel@suse.cz, rppt@kernel.org, richard.weiyang@gmail.com, 
	anup@brainfault.org, haibo1.xu@intel.com, ajones@ventanamicro.com, 
	vkuznets@redhat.com, maciej.wieczor-retman@intel.com, pgonda@google.com, 
	oliver.upton@linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-fsdevel@kvack.org
Content-Type: text/plain; charset="UTF-8"

Peter Xu <peterx@redhat.com> writes:

> On Tue, Sep 10, 2024 at 11:43:58PM +0000, Ackerley Tng wrote:
>> @@ -790,6 +791,9 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>>  	 */
>>  	filemap_invalidate_lock(inode->i_mapping);
>>  
>> +	/* TODO: Check if even_cows should be 0 or 1 */
>> +	unmap_mapping_range(inode->i_mapping, start, len, 0);
>> +
>>  	list_for_each_entry(gmem, gmem_list, entry)
>>  		kvm_gmem_invalidate_begin(gmem, start, end);
>>  
>> @@ -946,6 +950,9 @@ static void kvm_gmem_hugetlb_teardown(struct inode *inode)
>>  {
>>  	struct kvm_gmem_hugetlb *hgmem;
>>  
>> +	/* TODO: Check if even_cows should be 0 or 1 */
>> +	unmap_mapping_range(inode->i_mapping, 0, LLONG_MAX, 0);
>
> Setting to 0 is ok in both places: even_cows only applies to MAP_PRIVATE,
> which gmemfd doesn't support.  So feel free to drop the two comment lines.
>
> Thanks,
>
> -- 
> Peter Xu

Thank you for reviewing and helping me check on this!
