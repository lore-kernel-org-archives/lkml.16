Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177702AE72
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744339030; cv=none; b=knagHLqPWGevEom5Bwf3nFJMKUB8bIAtQXxFxuN+jnXOlMGelQRPnop7eb/bLKgSZxxFEGsFYQgPXSk7GZvX6guGPt6vVQMFjjAloU8OJp+eBywMQP9sN4Twdov4BTvA+yugOmc3GThG0Kg0pnVeLjOi/Yw4KCQIzXXcXydEit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744339030; c=relaxed/simple;
	bh=rWYUs/9cmDIh7jIXt9l9AsY7E+gqj9c4f9wefjB6rkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZ2LlIVBgIeMCEAvlShhd8Y7pFBvBCuhBVdYEnTlmlyqEgLBiyoxjiURPccxFaITlPyOfyI1XofR9kXiTMUz1pxS3m2bBGy4RcQN0ngn664KEPl7PrhaGX8hEmuFtI894Qp/OqxmVDl9OnDkLXy5GFdYrqerJQBudgOVNRPL3Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dlKBtv4Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dlKBtv4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744339027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3/ZamE7dZcORRHzRlCdHfFpdrTX0B5Dwgu/nJ11or8g=;
	b=dlKBtv4Z0bSyMlBrRgNdPyOo9izD5RZyBbXFB9ciCXp8SBEo2sxeUkVLmYBfctiBluQZq+
	E/MWKFRyod0ZASnf7m0UTKZikKJ3UJSrIE+zpArb5lHpKFIOUk5lQvjbSumUtNkOPh1yEj
	Ny2oz3Xo9lXui3rIZvRJIO3MOtsxQ3M=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-SQ9XdS5QM8ylKY18KCI9mQ-1; Thu, 10 Apr 2025 22:37:06 -0400
X-MC-Unique: SQ9XdS5QM8ylKY18KCI9mQ-1
X-Mimecast-MFC-AGG-ID: SQ9XdS5QM8ylKY18KCI9mQ_1744339025
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410b910b0so10722645ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744339025; x=1744943825;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/ZamE7dZcORRHzRlCdHfFpdrTX0B5Dwgu/nJ11or8g=;
        b=ARohG55njxIDtq+y7jq+IsUo3Huge3n+/3UPS1N5fXUJ9H8RODVv4rPeGNHCcnOGNm
         20zwc/7wA9Z9A0tBe9DHdBer0XHOJjqTtl93K5E7qPfao4delbsGXwqSMMt/8+19+18b
         crV85YrX3RgZJ3xocz7dhowomWC6vD9DCVgfPkm3Wi3anOViBw+9J73Mn+RXt+Okwj2G
         3s5bK2wrehVG2IPZZQtOduqSPx0oE11MuaH+DuRJqNLc/afQqxbGDVetngy37GxRk1rq
         7RCdojf2S2nK4PJ2VdqxF4ZKeZB/AGkX9oa2ABk8U3ue11iPCDdm4QQtW3pWmvSrEvg+
         b/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK4GNL2LScsEoLsqydVeZHTpDjUQYxvH3Ls/dFWHpRM/3Dlgg+Nii0FY4YRwIl9erLrRBi65deTU++1pQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEQDBfSYdU0it7wpfnASgkBYnMgJVQMmERSrCVlJY2kZvkDqy
	bio0HpEaLCnyzvd+oltq5E0WDnBHsX7J0QNPM7FxtdoEwJru5DrClptura6IkIVBjLhhUrBpKOz
	8qaUfmsQEyKP2NBIJfXOPPJHlOzXNwcGAHrGaYjUIiiE6HmWWzlfoepFKFuJKwg==
X-Gm-Gg: ASbGnctrFVS8Hq94TpQEmm1lhWyTNdRx/2lnkW/O0M7z7GOt3Dd65yHNyncLAJtE8d4
	NGr/V/6q22GTYENA4ekVsJje+pbPJFQNCzRWw9azDriy6OyBiOIpaqiSkmS70n9dutzaOgott8O
	46i7sQ69iRLggR9b78lwxb7oB/YbkX7nK1/K0ailHOX87Mms39gA6InlSbNnQLqOPHdckYLSIDl
	zuh8IDOHaFEihyC85xFLYj+YID/xElsyJR/5wJKJKycggBgHy2OIymHB4B0guw8g4erlfQMNONc
	aGF12/f1hyVUn7DosuoxOigXX3pe45xGU9X3IaF7tzUdBHlVEeeW9w4sFQDTL/6V
X-Received: by 2002:a17:903:32c9:b0:223:2cae:4a96 with SMTP id d9443c01a7336-22bea50267amr14865065ad.42.1744339025419;
        Thu, 10 Apr 2025 19:37:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcW698n+7Dt96hdxc6YK/SglbEgK3MbiE/DJmopg+MwzVB+8B+QoDHQBDJI4PLoOrwH6M9nA==
X-Received: by 2002:a17:903:32c9:b0:223:2cae:4a96 with SMTP id d9443c01a7336-22bea50267amr14864815ad.42.1744339025056;
        Thu, 10 Apr 2025 19:37:05 -0700 (PDT)
Received: from [192.168.0.229] (159-196-82-144.9fc452.per.static.aussiebb.net. [159.196.82.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cbdfe7sm38271855ad.207.2025.04.10.19.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 19:37:04 -0700 (PDT)
Message-ID: <52f5a8a0-7721-45c0-92f9-38b87afb62d3@redhat.com>
Date: Fri, 11 Apr 2025 10:36:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] fs/namespace: defer RCU sync for MNT_DETACH umount
To: Ian Kent <raven@themaw.net>, Christian Brauner <brauner@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, Eric Chanudet <echanude@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Alexander Larsson <alexl@redhat.com>,
 Lucas Karpinski <lkarpins@redhat.com>
References: <20250408210350.749901-12-echanude@redhat.com>
 <20250409-egalisieren-halbbitter-23bc252d3a38@brauner>
 <20250409131444.9K2lwziT@linutronix.de>
 <4qyflnhrml2gvnvtguj5ee7ewrz3ejhgdb2lfihifzjscc5orh@6ah6qxppgk5n>
 <20250409142510.PIlMaZhX@linutronix.de>
 <20250409-beulen-pumpwerk-43fd29a6801e@brauner>
 <64fb3c80-96f9-4156-a085-516cbaa28376@themaw.net>
Content-Language: en-US
From: Ian Kent <ikent@redhat.com>
Autocrypt: addr=ikent@redhat.com; keydata=
 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
In-Reply-To: <64fb3c80-96f9-4156-a085-516cbaa28376@themaw.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/4/25 21:58, Ian Kent wrote:
>
> On 10/4/25 00:04, Christian Brauner wrote:
>> On Wed, Apr 09, 2025 at 04:25:10PM +0200, Sebastian Andrzej Siewior 
>> wrote:
>>> On 2025-04-09 16:02:29 [+0200], Mateusz Guzik wrote:
>>>> On Wed, Apr 09, 2025 at 03:14:44PM +0200, Sebastian Andrzej Siewior 
>>>> wrote:
>>>>> One question: Do we need this lazy/ MNT_DETACH case? Couldn't we 
>>>>> handle
>>>>> them all via queue_rcu_work()?
>>>>> If so, couldn't we have make deferred_free_mounts global and have two
>>>>> release_list, say release_list and release_list_next_gp? The first 
>>>>> one
>>>>> will be used if queue_rcu_work() returns true, otherwise the second.
>>>>> Then once defer_free_mounts() is done and release_list_next_gp not
>>>>> empty, it would move release_list_next_gp -> release_list and invoke
>>>>> queue_rcu_work().
>>>>> This would avoid the kmalloc, synchronize_rcu_expedited() and the
>>>>> special-sauce.
>>>>>
>>>> To my understanding it was preferred for non-lazy unmount consumers to
>>>> wait until the mntput before returning.
>>>>
>>>> That aside if I understood your approach it would de facto 
>>>> serialize all
>>>> of these?
>>>>
>>>> As in with the posted patches you can have different worker threads
>>>> progress in parallel as they all get a private list to iterate.
>>>>
>>>> With your proposal only one can do any work.
>>>>
>>>> One has to assume with sufficient mount/unmount traffic this can
>>>> eventually get into trouble.
>>> Right, it would serialize them within the same worker thread. With one
>>> worker for each put you would schedule multiple worker from the RCU
>>> callback. Given the system_wq you will schedule them all on the CPU
>>> which invokes the RCU callback. This kind of serializes it, too.
>>>
>>> The mntput() callback uses spinlock_t for locking and then it frees
>>> resources. It does not look like it waits for something nor takes ages.
>>> So it might not be needed to split each put into its own worker on a
>>> different CPU… One busy bee might be enough ;)
>> Unmounting can trigger very large number of mounts to be unmounted. If
>> you're on a container heavy system or services that all propagate to
>> each other in different mount namespaces mount propagation will generate
>> a ton of umounts. So this cannot be underestimated.
>>
>> If a mount tree is wasted without MNT_DETACH it will pass UMOUNT_SYNC to
>> umount_tree(). That'll cause MNT_SYNC_UMOUNT to be raised on all mounts
>> during the unmount.
>>
>> If a concurrent path lookup calls legitimize_mnt() on such a mount and
>> sees that MNT_SYNC_UMOUNT is set it will discount as it know that the
>> concurrent unmounter hold the last reference and it __legitimize_mnt()
>> can thus simply drop the reference count. The final mntput() will be
>> done by the umounter.
>
> In umount_tree() it looks like the unmounted mount remains hashed (ie.
>
> disconnect_mount() returns false) so can't it still race with an rcu-walk
>
> regardless of the sybcronsize_rcu().
>
>
> Surely I'm missing something ...

Ans I am, please ignore this.

I miss-read the return of the mnt->mnt_parent->mnt.mnt_flags check in 
disconnect_mount(),

my bad.

>
>
> Ian
>
>>
>> The synchronize_rcu() call in namespace_unlock() takes care that the
>> last mntput() doesn't happen until path walking has dropped out of RCU
>> mode.
>>
>> Without it it's possible that a non-MNT_DETACH umounter gets a spurious
>> EBUSY error because a concurrent lazy path walk will suddenly put the
>> last reference via mntput().
>>
>> I'm unclear how that's handled in whatever it is you're proposing.
>>
>

