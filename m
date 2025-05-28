Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A1247283
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423335; cv=none; b=oOBL6EjzPx2quqgn4K+AwKvXHzI5QL/td53ByfG5a1Y+fcGky0O9Y8yFgHex6uYV97eS+4ZALaJME3TC5LmxH0DOycrR6B7aGlnCmH7vgRIUUzfZIZkS6P4pnFwvL7UIK/88Jge9K43QHFyeza8K2n2OnhN5Wy7SPphuXxrxeh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423335; c=relaxed/simple;
	bh=HeRntkvpjTLIxIK7T/7PBTHCgMLMpgZe/nO0/0LPjDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPI5oaxh/7VNWegHGLxWv8159Erf7fw6isS3F2wH5HohboNaYLAQzQcNZzjnHH2gpLCXYbSXR0xQ6Y4b3VPFb8Gi8ihiBZ5DGJdZ2g11VSwUsWspFw86kTa7zz9G6huDXSfePUCk9+/q+NwusKeoJhjoY+bjvyrkLGraMbfH3Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dmx1OJXt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dmx1OJXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748423333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6fOjoths9BP+7g43cHI3UErFOLHs1REkE1Ir6J/HUc=;
	b=dmx1OJXtsrMmP2j0NZe11qfMhrxKVJJMk9Lk51XmPi8+zhF2mhRGD2bmGgEbrzWbIXluFh
	jthkop4QEixr4ez8pCEBKp56i74DES0Cnh3BERRTWS/51+5gE9bSqcXPRK2nGuagNiNp3f
	nb6+GH9e9UJjjtIFwLL3a6szLURp4bo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-I80m1O3YMQOkNsFovhJAQA-1; Wed, 28 May 2025 05:08:51 -0400
X-MC-Unique: I80m1O3YMQOkNsFovhJAQA-1
X-Mimecast-MFC-AGG-ID: I80m1O3YMQOkNsFovhJAQA_1748423330
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cd12d151so36689185e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423330; x=1749028130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6fOjoths9BP+7g43cHI3UErFOLHs1REkE1Ir6J/HUc=;
        b=lj7oLixR+7vy/AuGwxPtlZJd0W7Rv9qa08OgXkYFTVyvh6DfzTF8rdH/czdQ3KfzSx
         Tf0uUH99Dl+meltOnTQTW40ASgM47n+JAngiD08MmCe3nkn+b4FPkLQbgZrX6l6f1zR6
         ogh2uFzyCgiv06Ta7Z5a/xIXHPw9SW8tXs63BZDjXsbg0+t7ty0WyGUKI+sCg9oDzYS/
         0XsB3buJ7xS4EOyJKg74/kOzQ2Mx5FQi9BR1fISgGpVMq1hHnJLh8ARjV5oHjqI+lpph
         5vRCSewMoT1dYtH+nAAginbFNg1DYRm6+7/XqQCwXhcgsJ6iT2urYx5x7ONjBdAuvXta
         J5CA==
X-Forwarded-Encrypted: i=1; AJvYcCUSam//W/RY5mbimPtAkrS4maiGTgpRPHyyOt+OI5NGCMS6HTjrxlpz+ARtfh0RYTi8e0UEEbcFHrv6AV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEdGGpOTxKuXTpHeXe//RU6cg1WbhBuTE8CY7nKOkbUiIVacE9
	Bl2pMj6e9gdZoxGQADPkCaO6s3GEg7TSHhgM8Xnl8wMi2+r0xwu1MfQmZhRnZwHSjGq4Jl0Dnwr
	OdVPa2ce9Orlb2PeDpubqG8sqTBeMFbSGEzwV087Zkhn5gTCcC3ao1p7YOYfe7RcQ1g==
X-Gm-Gg: ASbGncuBi2y/K/rbfMgw8RIxQc9yh441dfDHj8EFxs5Yr73HalkhT4mXwbavra697AL
	ZULbzdZa2EDuVeVaN/nSccvsoDPUhdtfuxZmm6UKadZi6njdAT0gLuW8Ss6O/oshxQce6hxWNOw
	/dIerZGEY7pAKnLwshTpDXhkvolUMUt7D7rlZR6CnFgdwnclDT3Z/KVk2VaT1oyWbNzwnjUBcbE
	ZuauKxS84Auhz/jCgRjvNpQORgqB6nkZXNKpUcggLknHmpYcyU6Ur/yNfCfeZ0AbBGHiln3heL9
	B1oySdvxMAyM9FZ0vJSZjde5FF28C2mKT8vMyE3YhoayIMmeZiuBNV4eWUoc
X-Received: by 2002:a05:600c:64c6:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-44c937d125amr158521955e9.31.1748423329750;
        Wed, 28 May 2025 02:08:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSUDpB7MCB0r+KZHQbLDKkjrX6HPTl91hhU9m2/A027cB52iPz1nlOjL0WRytjQ2mFsWDovg==
X-Received: by 2002:a05:600c:64c6:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-44c937d125amr158521515e9.31.1748423329064;
        Wed, 28 May 2025 02:08:49 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45006498c72sm14805555e9.2.2025.05.28.02.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:08:48 -0700 (PDT)
Date: Wed, 28 May 2025 11:08:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] vsock/test: Cover more CIDs in transport_uaf
 test
Message-ID: <7zqv5toj2qjucy7fvaebbpwj6pth53uunsbapwhgrhwbr5pq5t@gp7h6klhr5sj>
References: <20250523-vsock-test-inc-cov-v1-1-fa3507941bbd@rbox.co>
 <limbmrszio42lvkmalapooflj5miedlszkmnnm4ckmy2upfghw@24vxuhgdji2z>
 <1f5cc46a-de4c-4361-a706-fc7fe06a7068@rbox.co>
 <gfmoupl72tjyymhwxcstwpgaabbfaz6f4v6vj4lwwzwssg577c@urkmgn7rapnj>
 <151bf5fe-c9ca-4244-aa21-8d7b8ff2470f@rbox.co>
 <skvayogoenhntikkdnqrkkjvqesmpnukjlil6reubrouo45sat@j7zw6lfthfrd>
 <54959090-440e-49e8-80b3-8eee0ef4582c@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <54959090-440e-49e8-80b3-8eee0ef4582c@rbox.co>

On Wed, May 28, 2025 at 10:58:28AM +0200, Michal Luczaj wrote:
>On 5/27/25 10:41, Stefano Garzarella wrote:
>> On Mon, May 26, 2025 at 10:44:05PM +0200, Michal Luczaj wrote:
>>> On 5/26/25 16:39, Stefano Garzarella wrote:
>>>> On Mon, May 26, 2025 at 02:51:18PM +0200, Michal Luczaj wrote:
>>>>> On 5/26/25 10:25, Stefano Garzarella wrote:
>>>>>> On Fri, May 23, 2025 at 12:31:16AM +0200, Michal Luczaj wrote:
>>>>>>> Note that having only a virtio transport loaded (without vhost_vsock) is
>>>>>>> unsupported; test will always pass. Depending on transports available, a
>>>>>>
>>>>>> Do you think it might make sense to print a warning if we are in this
>>>>>> case, perhaps by parsing /proc/modules and looking at vsock
>>>>>> dependencies?
>>>>>
>>>>> That'd nice, but would parsing /proc/modules work if a transport is
>>>>> compiled-in (not a module)?
>>>>
>>>> Good point, I think not, maybe we can see something under /sys/module,
>>>> though, I would say let's do best effort without going crazy ;-)
>>>
>>> Grepping through /proc/kallsyms would do the trick. Is this still a sane
>>> ground?
>>
>> It also depends on a config right?
>> I see CONFIG_KALLSYMS, CONFIG_KALLSYMS_ALL, etc. but yeah, if it's
>> enabled, it should work for both modules and built-in transports.
>
>FWIW, tools/testing/selftests/net/config has CONFIG_KALLSYMS=y, which
>is enough for being able to check symbols like virtio_transport and
>vhost_transport.

Ok, I see, so let's go in that direction.

>
>Administrative query: while net-next is closed, am I supposed to mark this
>series as "RFC" and post v2 for a review as usual, or is it better to just
>hold off until net-next opens?

Whichever you prefer, if you are uncertain about the next version and 
want to speed things up with a review while waiting, then go with RFC, 
but if you think all comments are resolved and the next version is ready 
to be merged, wait for the reopening.
Thanks for asking!

>
>>>>>>> +static void test_stream_transport_uaf_client(const struct test_opts *opts)
>>>>>>> +{
>>>>>>> +	bool tested = false;
>>>>>>> +	int cid;
>>>>>>> +
>>>>>>> +	for (cid = VMADDR_CID_HYPERVISOR; cid <= VMADDR_CID_HOST + 1; ++cid)
>>>>>>
>>>>>>> +		tested |= test_stream_transport_uaf(cid);
>>>>>>> +
>>>>>>> +	if (!tested)
>>>>>>> +		fprintf(stderr, "No transport tested\n");
>>>>>>> +
>>>>>>> 	control_writeln("DONE");
>>>>>>
>>>>>> While we're at it, I think we can remove this message, looking at
>>>>>> run_tests() in util.c, we already have a barrier.
>>>>>
>>>>> Ok, sure. Note that console output gets slightly de-synchronised: server
>>>>> will immediately print next test's prompt and wait there.
>>>>
>>>> I see, however I don't have a strong opinion, you can leave it that way
>>>> if you prefer.
>>>
>>> How about adding a sync point to run_tests()? E.g.
>>
>> Yep, why not, of course in another series :-)
>>
>> And if you like, you can remove that specific sync point in that series
>> and check also other tests, but I think we have only that one.
>
>OK, I'll leave that for later.

Yep, feel free to discard my suggestion, we can fix it later.

Thanks,
Stefano

