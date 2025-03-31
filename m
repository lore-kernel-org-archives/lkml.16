Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6D17A2E2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430781; cv=none; b=dG3PYEFVT83WvubeP+eUIparA6LvtOaAxyPXTf1ZGrx66N9Ho3exSwQltllRGNTpR4zrHFgAoEmHI7tUZN/nPh4+PUrBvDaOsebxjnicLV4sivxi2+bWVyKKdezy4bGs/kKp0PNAavJj/GXc+XXFo/rgLRmcAW2sFQ2AcAcH3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430781; c=relaxed/simple;
	bh=+t488dEmHQJAO3jFfrt8V7/UCzMav5WFnaBdBdPDxaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihSrMejVbLCBSJ84sXYkt+LO9V6RpxG3h57HZy1Gh2sE6C7YLGlHm49Rkyu3A7k5wGHNtsktiE2FTf1j/kZhcooc+1VYAUYChnOLSPwJfE+KroT0+3v4JtOeA8ktAC+5Um7bdhUhzM2iDSyADbBZ1+OMz4gx8+Ad8qgyMYr8la0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iwFgbnJg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iwFgbnJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743430777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYj0pUIwEANUtr1SIrZWSom30G8/htq+S+uugiq5mDU=;
	b=iwFgbnJgar5bzwW8j95xrx4SsjO+XKyAt4+GTFsooKx2f03jqHuDzCin4L0pD7M6lhOe0Z
	onc6gjgLyVvMvch8UXQsHnbzy2iP8ZS8rKdKjPoiHEkJSVZhCfyAKGAEN5ukcVi93MsZ9o
	r9e5WiE7j0H3Iqv+Ad91CP1SXqGFiQk=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-zc6tEHiyPV6MR8QLrmZKPw-1; Mon, 31 Mar 2025 10:19:36 -0400
X-MC-Unique: zc6tEHiyPV6MR8QLrmZKPw-1
X-Mimecast-MFC-AGG-ID: zc6tEHiyPV6MR8QLrmZKPw_1743430776
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85e15e32366so448547339f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430776; x=1744035576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYj0pUIwEANUtr1SIrZWSom30G8/htq+S+uugiq5mDU=;
        b=ZknTzsGh4DltuThwU3PORbzZ6iK5GvjqC8addCKrBNB8WXalbqkWOWcNUhcXqALErm
         FzaMtPOhJe+g4Cli3q9zj51YfumVqhZJbo54XTUOlo3+HYllbks291Zvcqly2xqqx0Wk
         Fu6VBJREXGa0BZtRl6oM0KWjHetm//nxoaYVmwwxwHoW1Z0jQGf3qzQYbgqe8ZG/p/In
         yz0nS2T5vHtLdTmxo8dmgvKoSTSLdETSAM+DMPYV1vCBfTZtNKO/+UuS6TNgDDwtee+6
         WlhT8RpHFZ5G9NuLwN7zrlzdF3Pltpavcvh7reXpGlvNducQCsbWJ0iX+NeEs74ndylO
         w/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCViJm2a1NTpoCxMhjPpLz42TJ/SEjAvE5c0XPvC2Ux9XCaO1jMmZgReJO8Yg81FPlw7KRTRHQTKE4XorOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTBEx53szp7cVAxK5w+pkcxJH0m2SZD9tPXCtHcfml7JMN7Oc9
	pusebUyQhsZ4FxWL+0fa08ydafKGcImxBVZ+3Tk7bOwa12ASq9+ZaaHjQ14TGHYZdeMJoqa4jyb
	+enxIny3NIJQzyDFV2raP6isgjVKwZxFgp8BaIMtihZYbi+QeE+pBCNUUsxKCxJbglyRdarA1
X-Gm-Gg: ASbGncsIJ6oDsGwrqrNRDDHYarlL/A/Yfwp620Lfa2gd5rJzs7TfuizqGlX8yITBwjG
	DT7pGjYBL3BSP7Zz7J6rnoQ8jrOhP69vVMQ76PdLX7L0AYOKwKlf7v54SfYdauz2dbWeK3CWwB7
	h3toOOsVqUkoyaSxM0lyoc4OgjLXxfD9JG26aYGCthwJ6cTHAK/b8+kE3ieyMnuwJRicTeuwzyS
	Y4eV8ZfdPJq0hcDwdvrzh9iqdufuYyWpmIpiVYs3qTaHJktSMAFPfhG5sOAgB4BPudPZUT81pUH
	df1WwNP4CBolxcNz0+JGYgzd+xv/C+ddfjcQJDBmma8x/WAC7FyfMD1sSZLjakqPU4FDZlhcGs7
	QoDK9hg==
X-Received: by 2002:a05:6602:7510:b0:85b:3f8e:f186 with SMTP id ca18e2360f4ac-85e9e86ba74mr916824839f.6.1743430775807;
        Mon, 31 Mar 2025 07:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5pTCoJhS0f0R2nEGIYPWp4mq7Cak4xheeVR+42CL4J7sT1W2wZ0prBJdDzgXZr37+OQwcbg==
X-Received: by 2002:a05:6602:7510:b0:85b:3f8e:f186 with SMTP id ca18e2360f4ac-85e9e86ba74mr916821639f.6.1743430775499;
        Mon, 31 Mar 2025 07:19:35 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-20-70-53-200-211.dsl.bell.ca. [70.53.200.211])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ea2sm1831919173.52.2025.03.31.07.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 07:19:35 -0700 (PDT)
Message-ID: <7e816e0f-19af-4ef2-bf84-fc762ecbae26@redhat.com>
Date: Mon, 31 Mar 2025 10:19:34 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the bpf-next tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 bpf <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250311120422.1d9a8f80@canb.auug.org.au>
 <20250331102749.205e92cc@canb.auug.org.au>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20250331102749.205e92cc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-30 19:27, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 11 Mar 2025 12:04:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the bpf-next tree got a conflict in:
>>
>>    mm/page_owner.c
>>
>> between commit:
>>
>>    a5bc091881fd ("mm: page_owner: use new iteration API")
>>
>> from the mm-unstable branch of the mm tree and commit:
>>
>>    8c57b687e833 ("mm, bpf: Introduce free_pages_nolock()")
>>
>> from the bpf-next tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>>
>> diff --cc mm/page_owner.c
>> index 849d4a471b6c,90e31d0e3ed7..000000000000
>> --- a/mm/page_owner.c
>> +++ b/mm/page_owner.c
>> @@@ -297,11 -293,17 +297,17 @@@ void __reset_page_owner(struct page *pa
>>    
>>    	page_owner = get_page_owner(page_ext);
>>    	alloc_handle = page_owner->handle;
>>   +	page_ext_put(page_ext);
>>    
>> - 	handle = save_stack(GFP_NOWAIT | __GFP_NOWARN);
>> + 	/*
>> + 	 * Do not specify GFP_NOWAIT to make gfpflags_allow_spinning() == false
>> + 	 * to prevent issues in stack_depot_save().
>> + 	 * This is similar to try_alloc_pages() gfp flags, but only used
>> + 	 * to signal stack_depot to avoid spin_locks.
>> + 	 */
>> + 	handle = save_stack(__GFP_NOWARN);
>>   -	__update_page_owner_free_handle(page_ext, handle, order, current->pid,
>>   +	__update_page_owner_free_handle(page, handle, order, current->pid,
>>    					current->tgid, free_ts_nsec);
>>   -	page_ext_put(page_ext);
>>    
>>    	if (alloc_handle != early_handle)
>>    		/*
> 
> This is now a conflict between the mm-stable tree and Linus' tree.

What's the best way to resolve this? Should I post again or can we just use your fix?

