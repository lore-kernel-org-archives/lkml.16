Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D2621CC71
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551499; cv=none; b=D4lsIgzjn1rHpmsbodYxF93HlO0T+8yV+wgXt/n2s6Pu7Fh173ziilFX5VsHxcFsgmKoeQpAmeQ5MUCJ/bjbS1nvkbTU4cK1mBRfsEyiBIz0UaBjwV2hUz/vW7h1Lw1qlz1zWKJCPiYcxzbdcEN8x9jxn7dRsu2Ph5nV283ulqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551499; c=relaxed/simple;
	bh=LOqe1RLdwEyzMY3A0yfvtChRFDkRw9QBcQz7Tw0jUdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMzaMM3SfNVLUm4xZmBmPERYtqiwoPO6t93JBv8YfBpVf+h6EMqx4QmtHkMR9dWL+3x996svWGBlTX96muBRyNgaiZdoFsycqccYp2j7NfouFt/DWybcA862SJxj0+VDU6QaETRisKMaUvivM+n1VAtZf7VfbeD9/MsshjZqxsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bvyta0Ed; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bvyta0Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749551496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N1iMTIMQ7+7DUjp8KDqPoWh+KLZ78KCNqt1HLSEYoGw=;
	b=bvyta0EdrfdvBdCuz1plkEH0lLOUSQ4y9cuwzy2WhU8S2RB6OKj7AKynH70C/qwVSQrGCr
	mLq0SR76R9XPCYc1CVLmc4vNyj37aoojEAHXJKXT0GAAcEYwV5E4EoS86XXKMldD17AW0H
	7kAxKVaOawBYU5ZRz69G6xjRrQIcMJQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-lkGAw1GOPwmfKrQz9ykjEA-1; Tue, 10 Jun 2025 06:31:35 -0400
X-MC-Unique: lkGAw1GOPwmfKrQz9ykjEA-1
X-Mimecast-MFC-AGG-ID: lkGAw1GOPwmfKrQz9ykjEA_1749551494
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso2995829f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551494; x=1750156294;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N1iMTIMQ7+7DUjp8KDqPoWh+KLZ78KCNqt1HLSEYoGw=;
        b=APLC5k12mW9FrTQzITEsK1a9gOCzRGyOg+2ENnh2oO6vmVH/AZcX/9hp/R+WbLNa31
         +f1O8IFCcHFONYXGoBwny2sJPuLmPJLIEjOXmb3Gkxe1rj1vvRwppKXEsdz2DZmB+1QQ
         SBWPWWmfVBTMcEgTItqZjvPtky1K/Ah2VRe/dUt2p4XGAqGoH7V1xB9C+6TxrLGrk5Fd
         8OoZ49Bb44KrZAfgvvaSfqi3Xl3C9envRAqIsIcZGLWihH7XwmrWQ2Fye2B+sX8zuF/L
         W7EVOHVvQWc0bjQ1YyuE+bt3ZIYYc+txQ/R9+7fng8kwztdgydW2abMyL9YBNiJLdbav
         Q47A==
X-Forwarded-Encrypted: i=1; AJvYcCUSiZEPsNUC+DK5zP+8gXNa22O1WUfri4+mDrKFnuvPwe1cElOkMHxrrhG+VDAYQRaA2Xj8UzmkXbU6hzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwAw+p6/yEAe136b1K0Y9M/JddwQtKLQu3r1ZcsxV6DBGuil5
	oBALls3VqkJpoOhcWkr9e2r2D1yuZhHSWDxjbBkh6PBl7MktmJcLZR4pmU9ptWkTxyFW1zYtxpH
	4ZHNteDfoTlK6HKA6uzJZqZuILzjFHgFfjzPXKySzhvTQra9sM4bsHTVcD6VpYcpqcQ==
X-Gm-Gg: ASbGncvaYuh9g3R+FHeRMiaW3Ef3AXFWJJfK2ZurOTW1LkfQlM4zFjVxYWfmfjaMxV5
	1xdkhYKwCKA/aGdQClvlscteAcpaavuKFjHCqeOVvQKJ4z0caIrrnU6eEWp9YzHM9fhVmeHBEhZ
	PulUt6v8Um2eZCf3jleKg+OOet6QqmIMoC9P+7idY91IgkU1QBuyExeSgyll4oSu5TquhVgxWeQ
	21QmJTBo/+DRCe5DI1sQN7S61ssRDECQcAsgo41hA0jV484gM/dZOhs5BQPTtAB3teB0OIzrpqy
	U370ZI5I+Y8wc5RmdyKSpOyeAPPJs+DbUXC/QeiC60IQaMK27Tj8CfA=
X-Received: by 2002:a05:6000:2582:b0:3a4:eee4:cdec with SMTP id ffacd0b85a97d-3a5513de345mr2353231f8f.6.1749551493741;
        Tue, 10 Jun 2025 03:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELymAnGPTU47bn5imUR1l2ClSyV29BnZs5PUjEk1sVG38IO8kWXeey+NsP5zTE8kHRmyj6VQ==
X-Received: by 2002:a05:6000:2582:b0:3a4:eee4:cdec with SMTP id ffacd0b85a97d-3a5513de345mr2353208f8f.6.1749551493381;
        Tue, 10 Jun 2025 03:31:33 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm135671755e9.10.2025.06.10.03.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:31:32 -0700 (PDT)
Message-ID: <f9155f8d-022c-4341-85da-5b08d6a3aee9@redhat.com>
Date: Tue, 10 Jun 2025 12:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/test_hmm: reduce stack usage
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alistair Popple <apopple@nvidia.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thorsten Blum <thorsten.blum@linux.dev>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250610092159.2639515-1-arnd@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250610092159.2639515-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 11:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The various test ioctl handlers use arrays of 64 integers that add up to 1KiB
> of stack data, which in turn leads to exceeding the warning limit in some
> configurations:
> 
> lib/test_hmm.c:935:12: error: stack frame size (1408) exceeds limit (1280) in 'dmirror_migrate_to_device' [-Werror,-Wframe-larger-than]
> 
> Use half the size for these arrays, in order to stay under the warning limits.
> The code can already deal with arbitrary lengths, but this may be a little less
> efficient.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   lib/test_hmm.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 5b144bc5c4ec..761725bc713c 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -330,7 +330,7 @@ static int dmirror_fault(struct dmirror *dmirror, unsigned long start,
>   {
>   	struct mm_struct *mm = dmirror->notifier.mm;
>   	unsigned long addr;
> -	unsigned long pfns[64];
> +	unsigned long pfns[32];
>   	struct hmm_range range = {
>   		.notifier = &dmirror->notifier,
>   		.hmm_pfns = pfns,
> @@ -879,8 +879,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
>   	unsigned long size = cmd->npages << PAGE_SHIFT;
>   	struct mm_struct *mm = dmirror->notifier.mm;
>   	struct vm_area_struct *vma;
> -	unsigned long src_pfns[64] = { 0 };
> -	unsigned long dst_pfns[64] = { 0 };
> +	unsigned long src_pfns[32] = { 0 };
> +	unsigned long dst_pfns[32] = { 0 };
>   	struct migrate_vma args = { 0 };
>   	unsigned long next;
>   	int ret;
> @@ -939,8 +939,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
>   	unsigned long size = cmd->npages << PAGE_SHIFT;
>   	struct mm_struct *mm = dmirror->notifier.mm;
>   	struct vm_area_struct *vma;
> -	unsigned long src_pfns[64] = { 0 };
> -	unsigned long dst_pfns[64] = { 0 };
> +	unsigned long src_pfns[32] = { 0 };
> +	unsigned long dst_pfns[32] = { 0 };
>   	struct dmirror_bounce bounce;
>   	struct migrate_vma args = { 0 };
>   	unsigned long next;
> @@ -1144,8 +1144,8 @@ static int dmirror_snapshot(struct dmirror *dmirror,
>   	unsigned long size = cmd->npages << PAGE_SHIFT;
>   	unsigned long addr;
>   	unsigned long next;
> -	unsigned long pfns[64];
> -	unsigned char perm[64];
> +	unsigned long pfns[32];
> +	unsigned char perm[32];
>   	char __user *uptr;
>   	struct hmm_range range = {
>   		.hmm_pfns = pfns,

Should we just add a define for the common value (now 32)?

TEST_HMM_NR_PFN or sth like that.

-- 
Cheers,

David / dhildenb

