Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56492248888
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335279; cv=none; b=b9/CMeQLzkdfAJ7VKjUqUvWafDBYRM6bOE1ApEa+ivl2OZZbchKBnpDEycdjRUTj/q5nFmBODS7uq6RLqc0Lx9uMyM1lt+NsmWLfVvrGzQsM6eOyd+UP9dhKgf/WEy7oghLoM6FFG6jpS+Z0nvuxOWOssGSejpNtAbwcyymbhc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335279; c=relaxed/simple;
	bh=9/4frAyuK+mH4dCPcWolggSSGYIz8T6fceKUO2hSxFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYzLwttM5gx7mVOjOj490ECVlBgdOzuqSEAVl+iL/y2ExYsYcTi3Od/dAhiqpNdKuCL7IxP0P8GSlCZ56LvmxY+jRxddjN4QBLgkKa5lfN//BHylG6SHwMCA6XSCRrwGvCIhHAIIl95d+oKXdVd3dIPLioHpVkN6085qNa5NCPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xt23eMhP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xt23eMhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748335275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=otnLpqmsUXmp5NS65WlS5qhIeAcyrstq9DF1BYfQqbs=;
	b=Xt23eMhPwPfM8er5bW27evrs2OXruqv2ptFvcICkHaWY98OGkyrqBK4/4pWY6lxMu64gWP
	20m0SuYnPGPXR4rCgsdlEAv987NBEyD9/LIuv0nquNgSRLmdHHmy5DSYn2s/+N6J277kYW
	VEGu2eD4bILcHd861vuv7sbrZyykPk0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-dU3dpYdbPUmao5-ycNpF9Q-1; Tue, 27 May 2025 04:41:12 -0400
X-MC-Unique: dU3dpYdbPUmao5-ycNpF9Q-1
X-Mimecast-MFC-AGG-ID: dU3dpYdbPUmao5-ycNpF9Q_1748335271
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad88ac202c0so58639066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748335271; x=1748940071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otnLpqmsUXmp5NS65WlS5qhIeAcyrstq9DF1BYfQqbs=;
        b=QZLLgSWWRQGhPjScL7IjVZWvhlYYATpobldK4TJuyXWctHLkWKPtH5X9I/nUUgDvVl
         ANFlU1uii3OUOm3vXPVNJ92mI9kH2d723j6k9KdHD9FnNnIvOoo+iofdndQxyGm0BeCO
         XgFc9AGAOSSE+8tU3go0HY7nUP/3SEgHSitcFG+R9xaraATuq+A60ubadQfaED/Tsrr1
         PzcXWUukA+6uxfhEQTomjqv0EmYAFTKVTEbGl8K7vhdbzhQjHx1jXmxVe8OIA7MTHlBZ
         DMz7i8O3EKOpAWQwMuOaHCnAJ9ESxC83iFzmhKCrMblwLtGh1zsj0CFNopd0Hkl4Atl4
         t5qw==
X-Forwarded-Encrypted: i=1; AJvYcCXOqd3nSz+Tkysw8ENSz9CZNwE8gyVXaM6h9vYC71qWIcg9zWn+uUgSqSSbpVY2d/n9ZVyvxAl9Pmg3mGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsXIWN+IGTeJLslUzAPJc+N/tc1NijmOab7mxBLrMNNEy9SUE
	keg+owpBxaj/hNDWJ00vMuRDBjJojaQ0RJM9IeytBsAWcbO3nBt9Citc9XoBCo20oZeZ4XuR6fK
	s9lKBItYurouhWymtAkfcN66IYKP9+KFS3WB72zdm3t89XWggXOL1uzttcupfbguKLw==
X-Gm-Gg: ASbGnctEkwGYCyMMWRlbBQi07D2fHqqf0T2yWa1HgAHavRVJa6zxfLAgDK3G3ahtNx6
	YdtQwQt+ad0JDPKkI8SE9PVxDINsYxv3bkh4q+obzNuUY8Kf7+PViMA/M9G/y1NSROtgJlTheWO
	opp6lZ/vCpZWPgNaw7N2T2XASOqEKXaApx8TvifeHZYRxevBmwUbDumV00YPtNC6b0e3y5MOKfU
	lDJ6QrhoZ7a90X0R2jm0Gwp7+fxPizCUHS5DhR9arwm8YFMGUHpqgzH8+peoQayWLX8pDXQ2JEP
	9OFztk0ec/AmT2wNrfucLgGHDQUCrzGxrzL2bd4/5vzzwNnNWtlL1KjtIv+6
X-Received: by 2002:a17:907:3f9c:b0:ad5:d6b3:5cd5 with SMTP id a640c23a62f3a-ad8596d9843mr1170685666b.5.1748335271011;
        Tue, 27 May 2025 01:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMIKp0vFl+Prf74hN6X8U5dcoTMgJ4VBfKwNEdm/vm6CaEpdolph/x3lK/ErbdGrfTaaYqSg==
X-Received: by 2002:a17:907:3f9c:b0:ad5:d6b3:5cd5 with SMTP id a640c23a62f3a-ad8596d9843mr1170682866b.5.1748335270353;
        Tue, 27 May 2025 01:41:10 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad892d47536sm43991366b.12.2025.05.27.01.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:41:09 -0700 (PDT)
Date: Tue, 27 May 2025 10:41:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] vsock/test: Cover more CIDs in transport_uaf
 test
Message-ID: <skvayogoenhntikkdnqrkkjvqesmpnukjlil6reubrouo45sat@j7zw6lfthfrd>
References: <20250523-vsock-test-inc-cov-v1-1-fa3507941bbd@rbox.co>
 <limbmrszio42lvkmalapooflj5miedlszkmnnm4ckmy2upfghw@24vxuhgdji2z>
 <1f5cc46a-de4c-4361-a706-fc7fe06a7068@rbox.co>
 <gfmoupl72tjyymhwxcstwpgaabbfaz6f4v6vj4lwwzwssg577c@urkmgn7rapnj>
 <151bf5fe-c9ca-4244-aa21-8d7b8ff2470f@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <151bf5fe-c9ca-4244-aa21-8d7b8ff2470f@rbox.co>

On Mon, May 26, 2025 at 10:44:05PM +0200, Michal Luczaj wrote:
>On 5/26/25 16:39, Stefano Garzarella wrote:
>> On Mon, May 26, 2025 at 02:51:18PM +0200, Michal Luczaj wrote:
>>> On 5/26/25 10:25, Stefano Garzarella wrote:
>>>> On Fri, May 23, 2025 at 12:31:16AM +0200, Michal Luczaj wrote:
>>>>> Increase the coverage of test for UAF due to socket unbinding, and losing
>>>>> transport in general. It's a follow up to commit 301a62dfb0d0 ("vsock/test:
>>>>> Add test for UAF due to socket unbinding") and discussion in [1].
>>>>>
>>>>> The idea remains the same: take an unconnected stream socket with a
>>>>> transport assigned and then attempt to switch the transport by trying (and
>>>>> failing) to connect to some other CID. Now do this iterating over all the
>>>>> well known CIDs (plus one).
>>>>>
>>>>> Note that having only a virtio transport loaded (without vhost_vsock) is
>>>>> unsupported; test will always pass. Depending on transports available, a
>>>>
>>>> Do you think it might make sense to print a warning if we are in this
>>>> case, perhaps by parsing /proc/modules and looking at vsock
>>>> dependencies?
>>>
>>> That'd nice, but would parsing /proc/modules work if a transport is
>>> compiled-in (not a module)?
>>
>> Good point, I think not, maybe we can see something under /sys/module,
>> though, I would say let's do best effort without going crazy ;-)
>
>Grepping through /proc/kallsyms would do the trick. Is this still a sane
>ground?

It also depends on a config right?
I see CONFIG_KALLSYMS, CONFIG_KALLSYMS_ALL, etc. but yeah, if it's 
enabled, it should work for both modules and built-in transports.

>
>>> And I've just realized feeding VMADDR_CID_HYPERVISOR to bind() doesn't make
>>> sense at all. Will fix.
>>
>> Yeah, we don't support it for now and maybe it makes sense only in the
>> VMM code (e.g. QEMU), but it's a test, so if you want to leave to stress
>> it more, I don't think it's a big issue.
>
>All right, I'll keep it then. Fails quickly and politely anyway.
>
>>>>> +static void test_stream_transport_uaf_client(const struct test_opts *opts)
>>>>> +{
>>>>> +	bool tested = false;
>>>>> +	int cid;
>>>>> +
>>>>> +	for (cid = VMADDR_CID_HYPERVISOR; cid <= VMADDR_CID_HOST + 1; ++cid)
>>>>
>>>>> +		tested |= test_stream_transport_uaf(cid);
>>>>> +
>>>>> +	if (!tested)
>>>>> +		fprintf(stderr, "No transport tested\n");
>>>>> +
>>>>> 	control_writeln("DONE");
>>>>
>>>> While we're at it, I think we can remove this message, looking at
>>>> run_tests() in util.c, we already have a barrier.
>>>
>>> Ok, sure. Note that console output gets slightly de-synchronised: server
>>> will immediately print next test's prompt and wait there.
>>
>> I see, however I don't have a strong opinion, you can leave it that way
>> if you prefer.
>
>How about adding a sync point to run_tests()? E.g.

Yep, why not, of course in another series :-)

And if you like, you can remove that specific sync point in that series 
and check also other tests, but I think we have only that one.

Thanks,
Stefano

>
>diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
>index de25892f865f..79a02b52dc19 100644
>--- a/tools/testing/vsock/util.c
>+++ b/tools/testing/vsock/util.c
>@@ -451,6 +451,9 @@ void run_tests(const struct test_case *test_cases,
> 			run(opts);
>
> 		printf("ok\n");
>+
>+		control_writeln("RUN_TESTS_SYNC");
>+		control_expectln("RUN_TESTS_SYNC");
> 	}
> }
>

