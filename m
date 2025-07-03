Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827BFBF6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564158; cv=none; b=l8S9LeA53Ms8WjCTUTQ7QNSZFUkffhBXCYcMr4y5RkFFqhn75pD8qZl8LL8BuRVihv9JeSkbm93v81oKbNj1LsmJsiwCEtegj4LKUAVp3Vri1BTjX0izH9/2WtUiTFr7+xdRU4uhjsny727c3HKdbaeORu4y6Xvsb8LKJfcEwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564158; c=relaxed/simple;
	bh=QPjE0tU2Dius03JDG9NS75jvx9O7C8YaZBCejK06Abc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLbk8OAvczarCLdHCCUYfalK4keS7f3prB564SmUsaDhUx9SHnzZTpU2FDk0eUsm9gS/LoD3bJdZePjZSKrs3MqaE3Vzj4/fUnqX/GDcumbAt/x9AyWiSh7LRQPWG72zHE4VHZataf0atHngsoZEc9trIEQkNuou8Et47egllyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=gRDGE1nZ; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gRDGE1nZ"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XNqjuxFR98jLiXNqjuUJqz; Thu, 03 Jul 2025 19:35:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751564153;
	bh=ZQ0aSIIkruxyS5VG7Wq7+L5vmBZtmZ6PRQHg4mDtPZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gRDGE1nZ3NNDO66Ct/nhWmX+978ORto8+Ecj/OeVwD8Ajs2VkL6vgEf76ddx+KLtU
	 rujymNj2t1Qp6gkEYnn3E0RzfqyuAXVN2ZrP8y5/CZ/qS3TrguHTkuE3CsuLqUSduk
	 kpzEmxZ0Sx3fSrogpq+FTtOeNlvRbjjl+ObtVadsa278//bHLXRR+PwrBwOf3z/ftT
	 NUrJRVu12MYz1yRTAYOZm06MPJ2bNhBKcglF8epcZ996boshAtkbARg6G3Z2Zr5QI7
	 YnMTijBeneFqJwb1SZHlBlQBO0x9KEqv5LycitMqqu7irSUs1mNlz64v6lp5RpIKsP
	 4hDILbnKXosNw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 03 Jul 2025 19:35:53 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <f1c68345-a511-46b8-964c-a00bb62274ba@wanadoo.fr>
Date: Thu, 3 Jul 2025 19:35:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Tu Dinh <ngoc-tu.dinh@vates.tech>, Abinash <abinashlalotra@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
 <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
 <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
 <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
 <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 07:22, Jürgen Groß a écrit :
> On 03.07.25 00:42, Tu Dinh wrote:
>> On 01/07/2025 23:53, Abinash wrote:
>>> Hi ,
>>>
>>> Thanks for pointing that out.
>>>
>>> I haven’t measured the performance impact yet — my main focus was on
>>> getting rid of the stack usage warning triggered by LLVM due to
>>> inlining. But you're right, gntdev_ioctl_grant_copy() is on a hot
>>> path, and calling kmalloc() there could definitely slow things down,
>>> especially under memory pressure.
>>>
>>> I’ll run some benchmarks to compare the current approach with the
>>> dynamic allocation, and also look into alternatives — maybe
>>> pre-allocating the struct or limiting inlining instead. If you have
>>> any ideas or suggestions on how best to approach this, I’d be happy to
>>> hear them.
>>>
>>> Do you have any suggestions on how to test the performance?
>>>
>>> Best,
>>> Abinash
>>>
>>>
>>
>> Preallocating may work but I'd be wary of synchronization if the
>> preallocated struct is shared.
>>
>> I'd look at optimizing status[] which should save quite a few bytes.
>>
>> Reducing GNTDEV_COPY_BATCH could be a last resort, but that may also
>> impact performance.
> 
> IMHO the most promising way would be to dynamically allocate the struct, 
> but
> don't free it at the end of the ioctl. Instead it could be put into a list
> anchored in struct gntdev_priv, so freeing would be done only at close() 
> time.
> 
> Synchronization would be minimal (just for taking a free struct from the 
> list
> or putting it back again), while memory usage would be basically just as 
> needed,
> depending on the number of concurrent threads using the same file 
> descriptor
> for the ioctl.
> 
> This approach would even allow to raise GNTDEV_COPY_BATCH, maybe 
> resulting even
> in a gain of performance.
> 
> I'll write a patch implementing the allocation scheme.
> 
> 
> Juergen

It may be an overkill, but sometimes we see pattern that try to keep the 
best of the 2 worlds. Something like:


static struct gntdev_copy_batch static_batch;
static struct mutex my_mutex;

static long gntdev_ioctl_grant_copy(...)
{
	struct gntdev_copy_batch *dynamic_batch = NULL;
	struct gntdev_copy_batch *batch;

	...

	if (mutex_trylock(&my_mutex)) {
		/*
		 * No concurrent access?
		 * Use a shared static variable to avoid an allocation
		 */
		batch = &static_batch;
	else {
		/* otherwise, we need some fresh memory */
		dynamic_batch = kmalloc(sizeof(*batch), GFP_KERNEL);
		if (!batch)
			return -ENOMEM;

		batch = dynamic_batch;
	}

	/* do stuff with 'batch' */
	...

free_batch:
	if (!dynamic_batch)
		mutex_unlock(&my_mutex);
	else
		kfree(dynamic_batch);
  	return ret;
  }


Just my 2c.

CJ


