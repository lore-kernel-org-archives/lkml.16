Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4948B221268
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717890; cv=none; b=QjBi7nLKBAdd2XosfhGMairbXNEUuh3WibjilgrfaQ0beseBYD7ZrOeTfCL+XbCP6aBsRAycGgh87wWU0vbLugI3SCUaLAmMQW47tWsnUC7a5Mv0DSzgRBO+wfuCF17aGJNgANp2aYpI+VxLnq++9Bf/8X9GF0U6GkQ81eKxWms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717890; c=relaxed/simple;
	bh=rNTbSvQjmtm36dJjYb+8KYjVtBDjiIzJsQLY4I9jU7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETdU/nBgHEMOysdtUm6uLZrn/78wqJAfhORoTDOk14jFT8Dw6rrxa9mbppVPd3E6nQ4RjaD7MAHKkIRfQmAEzkWXqK0ighhsCykksO1XNru++agy8SHIqgrb4VlWA63IeRFz1ngtLLCRJXEFW8VoZ5uoN43Ti7o2wXQm1mUS+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EM6ptQYw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EM6ptQYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749717888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rNTbSvQjmtm36dJjYb+8KYjVtBDjiIzJsQLY4I9jU7k=;
	b=EM6ptQYwg4gUF//fntFrYJGlMRGSVRTXYCgZhe/tcCyYS+1jSOSpZKfYRklSOXLplibMkm
	syC6NF+z4iV24E9zq0sHRBalOWSnm5Kdy3ObhQqEOcREnc+YPjQ0fxT/F9Wnb99CZgaYLS
	7BJ7/qnakzp5WVHcexGsfbtTN0Wh0Jc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-uzeOKAQcOXiNxEckCInngQ-1; Thu, 12 Jun 2025 04:44:45 -0400
X-MC-Unique: uzeOKAQcOXiNxEckCInngQ-1
X-Mimecast-MFC-AGG-ID: uzeOKAQcOXiNxEckCInngQ_1749717885
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e73290d75a8so1004287276.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717885; x=1750322685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNTbSvQjmtm36dJjYb+8KYjVtBDjiIzJsQLY4I9jU7k=;
        b=Qv11bUMVRejqwqxry1gkPbL3ljMuv1eLljaKtaH5odWvx3nhfAJZtSna6S1D0kAKbZ
         dant9x8hoqTgFZ4+oYmHuJF7O2oKBjvgZ9aFS4OQqGOfuEhJvhGrEqKHaLyokonvY0kN
         h4s55n10d25NSh1NkpM7aNdvnMBhkCpn+9d2Y8C/Eq0/CTzy78vDnKnrM3vsYLDFvrhh
         eodKSsaG5HJejyOyRnr9HeSLXSiAb/5unXrFG3YdZVKd091MMNRkX7UCciBuHekexRKk
         bpNeTVRO/sjFNxqSo/Qr3uSC/NTS7+mmWKbSJFv7UFnYGu+lB+lA6VA4Npe4nPldGAad
         +Ttg==
X-Forwarded-Encrypted: i=1; AJvYcCWw1iNnCHL/TvttgkcdnguoUXeWTzi1nF6YeYz5xyOef740Xa5/USCEXRb9tBxCcf/q5GllQuGeoWxgQMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNAEAq5ZfF5LXcDewlzChvpp8soP1mV6BdYH5JCgqRcUzIW4oD
	9wUnVivXEZxgKsaWwgNcT1pf4VndS6bBAV88l2WarPi8jtJt2ja/oLeWROlWEV562cxgBCyyzaI
	DpszTlQzhWAnpXjbG0YG+ei90xKrBmd/gCWKekPaGMzv6uZKjXqWemJo3GavIWD07rZp/xPxy0f
	6oTs2IegM+woq0CS46wGUbZxpSfRrlw50lc+AxvKyt
X-Gm-Gg: ASbGncuPTFsbLOqgTaoMDhfq2EKrKoR6J709Pns38p8A0RqzGNL7L8QZmU70mUigDPk
	N2UtQ7XvfFo6Vy0OaUmMRf/g/xs8xC3HZZFTtoCDROzFUmsE0sEGfYJrrHbVwDOiPzJpzfUtO3s
	f8QXtN
X-Received: by 2002:a05:6902:2611:b0:e81:4e9d:9e79 with SMTP id 3f1490d57ef6-e81fe6b8b7amr9216276276.40.1749717885015;
        Thu, 12 Jun 2025 01:44:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpO7imw7/y6hUBA3+X+9+644bvWl/2xN24NgD0/xASJ+Z1iQt0UZZ7qIi1/vJ8aGKQCfn0PwMZVX01PvmLRPE=
X-Received: by 2002:a05:6902:2611:b0:e81:4e9d:9e79 with SMTP id
 3f1490d57ef6-e81fe6b8b7amr9216251276.40.1749717884673; Thu, 12 Jun 2025
 01:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGxU2F6c7=M-jbBRXkU-iUfzNbUYAr9QApDvRVOAU6Q0zDsFGQ@mail.gmail.com>
 <20250612082102.995225-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250612082102.995225-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 12 Jun 2025 10:44:33 +0200
X-Gm-Features: AX0GCFs5PNoVhHhHZsKNXS6ADWJpjexmyZKqj4oyHShXjy9f_WC9YKjQLjFGOUk
Message-ID: <CAGxU2F4JkO8zxDZg8nTYmCsg9DaaH58o5L+TBzZxo+3TnXbA9Q@mail.gmail.com>
Subject: Re: [PATCH net] vsock/virtio: fix `rx_bytes` accounting for stream sockets
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: Oxffffaa@gmail.com, avkrasnov@salutedevices.com, davem@davemloft.net, 
	edumazet@google.com, eperezma@redhat.com, horms@kernel.org, 
	jasowang@redhat.com, kuba@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org, 
	niuxuewei.nxw@antgroup.com, pabeni@redhat.com, stefanha@redhat.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 10:21, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Thu, 12 Jun 2025 at 08:50, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > > On Thu, Jun 12, 2025 at 01:32:01PM +0800, Xuewei Niu wrote:
> > > > > No comments since last month.
> > > > >
> > > > > The patch [1], which adds SIOCINQ ioctl support for vsock, depends on this
> > > > > patch. Could I get more eyes on this one?
> > > > >
> > > > > [1]: https://lore.kernel.org/lkml/bbn4lvdwh42m2zvi3rdyws66y5ulew32rchtz3kxirqlllkr63@7toa4tcepax3/#t
> > > > >
> > > > > Thanks,
> > > > > Xuewei
> > > >
> > > > it's been in net for two weeks now, no?
> > >
> > > Umm sorry, I didn't check the date carefully, because there are several
> > > ongoing patches. Next time I'll check it carefully. Sorry again.
> > >
> > > It looks like no one is paying attention to this patch. I am requesting
> > > someone interested in vsock to review this. I'd appreciate that!
> >
> > Which patch do you mean?
> >
> > Thanks,
> > Stefano
>
> I am saying your patch, "vsock/virtio: fix `rx_bytes` accounting for stream
> sockets".
>
> Once this gets merged, I will send a new version of my patch to support
> SIOCINQ ioctl. Thus, I can reuse `rx_bytes` to count unread bytes, as we
> discussed.

As Michael pointed out, it was merged several weeks ago in net tree,
see https://lore.kernel.org/netdev/174827942876.985160.7017354014266756923.git-patchwork-notify@kernel.org/
And it also landed in Linus tree:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=45ca7e9f0730ae36fc610e675b990e9cc9ca0714

So, I think you can go head with your patch, right?

Please remember to target net-next, since it will be a new feature IIRC.

Thanks,
Stefano

