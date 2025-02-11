Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280726BDA6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264711; cv=none; b=hUkct6C2ThvOJLvxhGInn31Aj7UEAUfHKN+SSha2O7dhaMOv7lxc6oKoQyZD9Px/2jfG1Ij4Dzo7w5owpLVtTD9IPIOElnApy2gvgF5g7PHvJFHPp99fFkwFViBnNc3dzAJ4ZY9vKW1psXpSoVS3+c0kKLuoRKKW9mZAQsGPR8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264711; c=relaxed/simple;
	bh=MC0xDxE3zxsnBUT6vWQCyFh+aE4Oe2A3mRkbvvdEADs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j74Br0zALcL2s2Bb4dNV/YX9axs7RcJZq3kgteelMHlahx7nk8343zpgx9OknoOxqWXPJ98hY3tXHSIH2nY/ZYvkDhfvXsNqv/aIIid1osXJtHvVkZRK4U6iSC23NpYjoIOgUY3I4dmjNH6xcobc5sdSOxujbhpovg9XxzSrMoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gbjWGL+B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbjWGL+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739264708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R52S0pM56ji3OUzPg669DDE8ybmrvxfzODSRXp5vTsU=;
	b=gbjWGL+BzWZzIvUYb7echdxm7srjA3FVLEP2LQllpq873Gdecv73lJoNG0Jcay3UrlL6d5
	23o1TZ/2ibG8O7H/8I4Px2gkef5Hlk6jR/lNbVWI87KGNz7Rebq+ArdSNUQ0TH48ixL41/
	BNZeqId2zCo6VGc9MkDy1Mxkq/Strio=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-WjpHED7wNCqcjHuvxE-E3A-1; Tue, 11 Feb 2025 04:05:06 -0500
X-MC-Unique: WjpHED7wNCqcjHuvxE-E3A-1
X-Mimecast-MFC-AGG-ID: WjpHED7wNCqcjHuvxE-E3A
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4392fc6bd21so12150415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264705; x=1739869505;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R52S0pM56ji3OUzPg669DDE8ybmrvxfzODSRXp5vTsU=;
        b=eOFGRGkg+Fn/ZPwYA4bJFbTLpgalCSbBxVtWRTDwSDGlhKDw6/M+GAub40T9ojeCau
         eJCFztgn2eosDSM1BJ+LeMY+eRPTXqL7BWqeMsULmqOh6xap8IJN6YCNPTLZe35sqR7n
         YUIlyLKhRl9/rJ2Znu2AdBSnQpaqf1r9yutKM1xYmOfrbdXnRujP9ZxW0EYwIR4J/rx4
         ssAkmRTLQ/+F2mYyD0Sa34KLk4wxI/hGKxxOwNKNW3bOSnzb/e3wxz0MWlPRdNvuWd8V
         ZyoVA9Z0gx9PJxlEtGp2XIOX5gf0kaDXansMAI5bd5NVcCyhhcY5UooTfVydjiwCtC5z
         p2AQ==
X-Gm-Message-State: AOJu0YyUN1/s4CMk8n5LyjLbEqtOCHfIjR197tIcrLDZjQ0wOTA55Zlp
	SdhI3pGglcF8VMpYVGzJlz5cPSqZBTlj5813nlRc2zSscGKD7sxAPa3daMeyf9bzG/NAlZz/Q4T
	dPwD9Bp5ZnUsfji8DSogug1ctqjySmXwGNLwS9qWWLydikBgztmyt3fvQ4VM07g==
X-Gm-Gg: ASbGncvq/tbMjTtbWwjT5NvVtBEefq5SHpf3NGETDN5wITy/ahmEa/0bns5TJQdoW7p
	6VIAuEmYO6qHFhQtVGaHgA8sml/EN+73MkRJrKtKI3ZcQF823tCAPh+xnQscRr6dcZ3LtQ7Ocwy
	2Z+exFsZIwuMMSrVpQRuOucZ5zu+0otxvL6x0Hoc+9jcU/CKjCIoviJTvhN9tP0yo//QfymuBiq
	RFLEm45Yfr8tA6c3yiqn6rwFbzOc9HZzezXr4OXJc5CpFLq86hHmCNC63HXBvCH8ag6vTFr+0dk
	FcvzSFSRQIRrBXdvIXt9op207jxr0oMIWoaufEQ=
X-Received: by 2002:a5d:6d0a:0:b0:38d:d79a:f82a with SMTP id ffacd0b85a97d-38dd79afae6mr6666472f8f.7.1739264704819;
        Tue, 11 Feb 2025 01:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPJ2MbS2TKPOm/lo1+0vOk/6bqxeYZP9/VSyGTG0w/hi9zGjyG499COIoZ2brGrQT2ceAtfw==
X-Received: by 2002:a5d:6d0a:0:b0:38d:d79a:f82a with SMTP id ffacd0b85a97d-38dd79afae6mr6666444f8f.7.1739264704416;
        Tue, 11 Feb 2025 01:05:04 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcf35b15bsm10762186f8f.64.2025.02.11.01.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:05:03 -0800 (PST)
Message-ID: <a38f547a-355f-4050-83bf-ddfb4af5f71b@redhat.com>
Date: Tue, 11 Feb 2025 10:05:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/migrate_device: don't add folio to be freed to LRU
 in migrate_device_finalize()
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>
References: <20250210161317.717936-1-david@redhat.com>
 <snlfl6ewz6u4fqdjjfo7nlqjemdcl3snk3vxt6ta4wee23bxps@nmdwftkjijsa>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <snlfl6ewz6u4fqdjjfo7nlqjemdcl3snk3vxt6ta4wee23bxps@nmdwftkjijsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.02.25 06:23, Alistair Popple wrote:
> On Mon, Feb 10, 2025 at 05:13:17PM +0100, David Hildenbrand wrote:
>> If migration succeeded, we called
>> folio_migrate_flags()->mem_cgroup_migrate() to migrate the memcg from
>> the old to the new folio. This will set memcg_data of the old folio to
>> 0.
>>
>> Similarly, if migration failed, memcg_data of the dst folio is left
>> unset.
>>
>> If we call folio_putback_lru() on such folios (memcg_data == 0), we will
>> add the folio to be freed to the LRU, making memcg code unhappy. Running
>> the hmm selftests:
>>
>>    # ./hmm-tests
>>    ...
>>    #  RUN           hmm.hmm_device_private.migrate ...
>>    [  102.078007][T14893] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x7ff27d200 pfn:0x13cc00
>>    [  102.079974][T14893] anon flags: 0x17ff00000020018(uptodate|dirty|swapbacked|node=0|zone=2|lastcpupid=0x7ff)
>>    [  102.082037][T14893] raw: 017ff00000020018 dead000000000100 dead000000000122 ffff8881353896c9
>>    [  102.083687][T14893] raw: 00000007ff27d200 0000000000000000 00000001ffffffff 0000000000000000
>>    [  102.085331][T14893] page dumped because: VM_WARN_ON_ONCE_FOLIO(!memcg && !mem_cgroup_disabled())
>>    [  102.087230][T14893] ------------[ cut here ]------------
>>    [  102.088279][T14893] WARNING: CPU: 0 PID: 14893 at ./include/linux/memcontrol.h:726 folio_lruvec_lock_irqsave+0x10e/0x170
>>    [  102.090478][T14893] Modules linked in:
>>    [  102.091244][T14893] CPU: 0 UID: 0 PID: 14893 Comm: hmm-tests Not tainted 6.13.0-09623-g6c216bc522fd #151
>>    [  102.093089][T14893] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
>>    [  102.094848][T14893] RIP: 0010:folio_lruvec_lock_irqsave+0x10e/0x170
>>    [  102.096104][T14893] Code: ...
>>    [  102.099908][T14893] RSP: 0018:ffffc900236c37b0 EFLAGS: 00010293
>>    [  102.101152][T14893] RAX: 0000000000000000 RBX: ffffea0004f30000 RCX: ffffffff8183f426
>>    [  102.102684][T14893] RDX: ffff8881063cb880 RSI: ffffffff81b8117f RDI: ffff8881063cb880
>>    [  102.104227][T14893] RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
>>    [  102.105757][T14893] R10: 0000000000000001 R11: 0000000000000002 R12: ffffc900236c37d8
>>    [  102.107296][T14893] R13: ffff888277a2bcb0 R14: 000000000000001f R15: 0000000000000000
>>    [  102.108830][T14893] FS:  00007ff27dbdd740(0000) GS:ffff888277a00000(0000) knlGS:0000000000000000
>>    [  102.110643][T14893] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>    [  102.111924][T14893] CR2: 00007ff27d400000 CR3: 000000010866e000 CR4: 0000000000750ef0
>>    [  102.113478][T14893] PKRU: 55555554
>>    [  102.114172][T14893] Call Trace:
>>    [  102.114805][T14893]  <TASK>
>>    [  102.115397][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
>>    [  102.116547][T14893]  ? __warn.cold+0x110/0x210
>>    [  102.117461][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
>>    [  102.118667][T14893]  ? report_bug+0x1b9/0x320
>>    [  102.119571][T14893]  ? handle_bug+0x54/0x90
>>    [  102.120494][T14893]  ? exc_invalid_op+0x17/0x50
>>    [  102.121433][T14893]  ? asm_exc_invalid_op+0x1a/0x20
>>    [  102.122435][T14893]  ? __wake_up_klogd.part.0+0x76/0xd0
>>    [  102.123506][T14893]  ? dump_page+0x4f/0x60
>>    [  102.124352][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
>>    [  102.125500][T14893]  folio_batch_move_lru+0xd4/0x200
>>    [  102.126577][T14893]  ? __pfx_lru_add+0x10/0x10
>>    [  102.127505][T14893]  __folio_batch_add_and_move+0x391/0x720
>>    [  102.128633][T14893]  ? __pfx_lru_add+0x10/0x10
>>    [  102.129550][T14893]  folio_putback_lru+0x16/0x80
>>    [  102.130564][T14893]  migrate_device_finalize+0x9b/0x530
>>    [  102.131640][T14893]  dmirror_migrate_to_device.constprop.0+0x7c5/0xad0
>>    [  102.133047][T14893]  dmirror_fops_unlocked_ioctl+0x89b/0xc80
>>
>> Likely, nothing else goes wrong: putting the last folio reference will
>> remove the folio from the LRU again. So besides memcg complaining,
>> adding the folio to be freed to the LRU is just an unnecessary step.
> 
> Agreed - I had always wondered why we did that instead of just dropping the
> reference but figured it was something to do with the LRU batching and never
> looked too closely.
> 
>> The new flow resembles what we have in migrate_folio_move(): add the
>> dst to the lru, remove migration ptes, unlock and unref dst.
>>
>> Fixes: 8763cb45ab96 ("mm/migrate: new memory migration helper for use with device memory")
> 
> If this was introduced by the above I was trying to figure out why I hadn't
> seen it, because whilst I don't religiously run hmm-tests and similar users
> with CONFIG_DEBUG_VM I do run them often enough that I'd expect to have seen
> the above. It turns out that prior to 85ce2c517ade ("memcontrol: only transfer
> the memcg data for migration") you can't hit this, probably because pages were
> double charged during migration so old->memcg_data remained set. So perhaps the
> fixes tag should point at that, but maybe it was always wrong, I'm not familiar
> enough with memcg to comment.

That would likely explain why we haven't sen it on the "migration 
succeeded" case when dropping src.

However, not so sure on the "migration failed" case, when we would drop 
dst. I would assume that the new folio (dst) would not be charged until 
we reached mem_cgroup_migrate() -- IOW, migration succeeded?

Thanks for the review!

-- 
Cheers,

David / dhildenb

