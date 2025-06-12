Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712FD223704
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720625; cv=none; b=UE3ksmbAAT+esmUbrNtNTHJ5yuzPz+Aa3P0RM30EMU1Qd8w7s9863wBOGLv+q10n71NmX1t2x87ZsMBUCewo52cQAJhIuk02x1BdcK4DXVnjXkPVv6JUfP93mpk4tRwkVkyq4wg5vUZdU3L6r/7QKDXNT9OHKCZa2Xwwkz2VRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720625; c=relaxed/simple;
	bh=4ygq9Ksz0EzPSaZG9OKYAVE1YdwDPmeAsjiGh8gvFqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gys8p6qSkZ73Qpr6Q7VrPsVED6854Eu8vMsuo2Mna/rBdV4M+/ad6qfiTfLudREBEftj8NhJ8JNC9kAHG7Fg7hI4eU0yqMC73t4rE2QaH5Shpl5pfhzCGcyTCOTMmcWeVEirkowdmDovuztdpUp+kCwKjjPs8bepkljHioAG4IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BtA1Y01P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BtA1Y01P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749720622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ygq9Ksz0EzPSaZG9OKYAVE1YdwDPmeAsjiGh8gvFqo=;
	b=BtA1Y01PE7MeB1UAU535WWh6fBVD13Ahwyi3/LS1WyNb/oV6F4wj/fNNTl6QDt21JDuSDn
	JcoXsFbPZLAHCcPAHbb//4iA1KZexgQ4BcDSzKkTCsJn5GcGrsXK0u2+VCDr7rqnFvT/lk
	eSEctaAdvOURFXisq3WzzJyz0xrZdmg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-tdPL7uvCOs2cxFUFvNQNSw-1; Thu, 12 Jun 2025 05:30:21 -0400
X-MC-Unique: tdPL7uvCOs2cxFUFvNQNSw-1
X-Mimecast-MFC-AGG-ID: tdPL7uvCOs2cxFUFvNQNSw_1749720620
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ade57fec429so68091166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720620; x=1750325420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ygq9Ksz0EzPSaZG9OKYAVE1YdwDPmeAsjiGh8gvFqo=;
        b=TWpe/QX73iZdvxlCvRKrEFoO1VVF9e+REE0Kn9UFhUGhS1pSaHrL/wkot9g9gMDw8G
         mat4/nq4z8V0qKC2M67Xw6tDS3AgUQIBYmdUi6336+3axBlIbBgH6VsVD7yM8JRDO9oj
         7saDsKeyGwkAmqyM0ncJtPRErtIyb7X99Bu5ld+7aQ+Y0R2xY0hmFv0E+UddnW/e7p7A
         xBEmPLp4f25K6R/D9Dk072+ADtKM9fkCEIdFMd60c4dh9/Iudh6ZFc2BSpE8ggmIM46H
         hefxbXyZKbWHYMLVtCoaJ/ygnMz//QKqPA7XTcrluqUGy36lkzf4uPNSbkajOVItj9Bi
         fxVg==
X-Forwarded-Encrypted: i=1; AJvYcCVgWCncODVNs1g7f0vprFAHWNNlvvCGwhHadN4dBkpZie0+FErnvz9D6MX+of0Zl1c7Kma5GEYvhXH14Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqDt3i/r4xqhhE5HakKWQvip6zCqBKN8JEJ2WPCaUoU4JClFqm
	9HIR0UPL1ttFhC0AKUtOJ8/lw4avF44SMWm0Yi/wcdpHmi8MDlJr/7JdO17hWDVshtZ5amvvqgR
	91dZB7yAEfjIIuki0gGU+A6s7PcuFp2T7mp+4Qnu/D/ZLGsSV6WGygHtztlgVn+3Kmw==
X-Gm-Gg: ASbGncsOEdN7UiSfcpr9v4GT+9fDDq4cfp/N+M+Qt2NAHN23U9bmwhutRK7Enb0T1yo
	xar0ozrdyDqTLEST6D4UDBcka4UAfhM8zXbMFASNYfcq6TDPDtPNsUNHivmm6snfdDE7UnSHa1H
	mS6HQu5YZ3NeJYl6mkHPzt8e7Byz7XOmU2WDoAs/DgrPupMxFdTMJ8vUbdA/eQttj6eLe9Gq0Ah
	ugf4QVgON/6MTZkw+OqqUqzBE9kH7QHZx6oS0FeKrxZ5gsvnP6cMToTYrIYkJPlMguf4ku+RB9o
	yL+ynp4uXtuVds0J877krlHtfX+p
X-Received: by 2002:a17:907:9404:b0:adb:14f3:234 with SMTP id a640c23a62f3a-adea8d2a7femr202985166b.8.1749720619710;
        Thu, 12 Jun 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW/Lug4eBXscrw4Su9HuFYOFwJuHPtuXS+7rbCJ7Q+kF4SSqVkab1vunsa/YWLwUrWOIkfLw==
X-Received: by 2002:a17:907:9404:b0:adb:14f3:234 with SMTP id a640c23a62f3a-adea8d2a7femr202981966b.8.1749720619118;
        Thu, 12 Jun 2025 02:30:19 -0700 (PDT)
Received: from sgarzare-redhat ([2001:67c:1220:8b4:edf4:d580:147e:ea8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cde8asm102655966b.7.2025.06.12.02.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:30:18 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:30:16 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: Oxffffaa@gmail.com, avkrasnov@salutedevices.com, davem@davemloft.net, 
	edumazet@google.com, eperezma@redhat.com, horms@kernel.org, jasowang@redhat.com, 
	kuba@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mst@redhat.com, netdev@vger.kernel.org, niuxuewei.nxw@antgroup.com, 
	pabeni@redhat.com, stefanha@redhat.com, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH net] vsock/virtio: fix `rx_bytes` accounting for stream
 sockets
Message-ID: <gqwp3mkdx3uaedmxx4kqvhvbgfvp3dtabm5ciejitk4x573oww@ek4agftt56np>
References: <CAGxU2F4JkO8zxDZg8nTYmCsg9DaaH58o5L+TBzZxo+3TnXbA9Q@mail.gmail.com>
 <20250612085514.996837-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250612085514.996837-1-niuxuewei.nxw@antgroup.com>

On Thu, Jun 12, 2025 at 04:55:14PM +0800, Xuewei Niu wrote:
>> On Thu, 12 Jun 2025 at 10:21, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>> >
>> > > On Thu, 12 Jun 2025 at 08:50, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>> > > >
>> > > > > On Thu, Jun 12, 2025 at 01:32:01PM +0800, Xuewei Niu wrote:
>> > > > > > No comments since last month.
>> > > > > >
>> > > > > > The patch [1], which adds SIOCINQ ioctl support for vsock, depends on this
>> > > > > > patch. Could I get more eyes on this one?
>> > > > > >
>> > > > > > [1]: https://lore.kernel.org/lkml/bbn4lvdwh42m2zvi3rdyws66y5ulew32rchtz3kxirqlllkr63@7toa4tcepax3/#t
>> > > > > >
>> > > > > > Thanks,
>> > > > > > Xuewei
>> > > > >
>> > > > > it's been in net for two weeks now, no?
>> > > >
>> > > > Umm sorry, I didn't check the date carefully, because there are several
>> > > > ongoing patches. Next time I'll check it carefully. Sorry again.
>> > > >
>> > > > It looks like no one is paying attention to this patch. I am requesting
>> > > > someone interested in vsock to review this. I'd appreciate that!
>> > >
>> > > Which patch do you mean?
>> > >
>> > > Thanks,
>> > > Stefano
>> >
>> > I am saying your patch, "vsock/virtio: fix `rx_bytes` accounting for stream
>> > sockets".
>> >
>> > Once this gets merged, I will send a new version of my patch to support
>> > SIOCINQ ioctl. Thus, I can reuse `rx_bytes` to count unread bytes, as we
>> > discussed.
>>
>> As Michael pointed out, it was merged several weeks ago in net tree,
>> see https://lore.kernel.org/netdev/174827942876.985160.7017354014266756923.git-patchwork-notify@kernel.org/
>> And it also landed in Linus tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=45ca7e9f0730ae36fc610e675b990e9cc9ca0714
>
>I misunderstood Michael's point. I am new to this, and not familiar with
>the process. Sorry about that...

Don't worry ;-)

Hope now it's clear!

Thanks,
Stefano

