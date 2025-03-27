Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A420CCF1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066912; cv=none; b=pgOv6X9olRQiwOzt28Xk9B+y8Ivjj+Ujg8aejzYv/u86jffKHsCt6hSEUj7EimJroiwWCHIRcr7Sa64qwdjibGUPNgCBvp9ywSX+v120+DZlwRgQK7FCNqLxuBhtUWVTodYimRXeLGQ2CdeT52eImXWzj006ecU7xk/i2fGL/KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066912; c=relaxed/simple;
	bh=54HKEDtFDLh4IFn4peAyaMx3n68MNsVlNAvR4SWRk0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiqZmw0kqKjsZJs2hF3dzZQkfo5g01SrHjYZ0GzlIyCdJvinuMxBmFDDGQFhS0pReDNYGefakiuXsBsbHD68/t0+RIaX7Fy0nTXEBZQi/sBx8CXwe4G925jwPo4DonxJYUgLXTI+GFQc5q7yDMacx/PAXVRTfgvb2KXJ9Y+aKMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5w1tWRy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5w1tWRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743066909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yf+kBjYifcomTwCXfumXhiLWiiEWa8vvr8UjeDev7tQ=;
	b=F5w1tWRy0L/+No27XVp0qwpV98B0a7D0OybcaOwrBmy6WW3EaiHowMC15BW5HYZsoDTC1o
	qFn42JR8KNt4xYC4vKitw5Pt/+DMWNRGxgS1eza58CAyCXL7Nh4K8A0V9TXcHmymbDLYQA
	y3Hibh+3b6BwQ1JKV7BaJctGMcTtMsA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-uiujjbpONhiXWAaRRbq8jQ-1; Thu, 27 Mar 2025 05:15:05 -0400
X-MC-Unique: uiujjbpONhiXWAaRRbq8jQ-1
X-Mimecast-MFC-AGG-ID: uiujjbpONhiXWAaRRbq8jQ_1743066905
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac31adc55e4so65249166b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066904; x=1743671704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf+kBjYifcomTwCXfumXhiLWiiEWa8vvr8UjeDev7tQ=;
        b=Ta+IBFQtk4bHR7koK3hi9HOuATBH5bTIDzYB8nCxaDW+xraEeXGWrvTzSBkjWrnZ27
         K73A5uQuy547BKf1MXF4tNF0GlKZMRLISKifJcfNI47K19ReCHRkPLqcNBCd429m1GAd
         A/pg1C7OtiiBs28RVx8DnNmXlsyp5cD5eWXbp/Mca/IR22R7XIyoBHZW3fsAru2tD7/v
         mfeSvt/OUFQqAZmRCLeF9kXkR3Tzw/sKPJmhe2YeGpyFrp0yIjLp7KGBZWaMqlbEe7Gc
         mBAr7FF9Yzixf9gwe+JqTrvfPX7p2LbR9imr/22sYfKb/Vs33jI0ByQHSvyCGY0uBtqD
         b8tw==
X-Forwarded-Encrypted: i=1; AJvYcCUxr3t5wKbzF08hreIe3/ra3IG+5MErUS3etPB2GiQGicOWtVScG8YUVjZCmRbt/+bxxsaQ/Auq6TlW3Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUg91PlpuBtQ5W8/1i+DTHcxoweWmpor+coiCDhlurlu9++RL
	kcrNYll8f2M/f33myBcat2X3frzjZNtwV3R15AxFuUTqEyElwtpt0egJIFAHJiaOnfq6P/dvTKf
	Ebw+QorUmcol3g2fMXjXQ0X7vLvHsTX0a9XKoEYVhhC8L3NX7oGhE7NXgH+HdUQ==
X-Gm-Gg: ASbGncs6vhDgmXRbiNeoSCMs/zCM6Zx+wZjCc+dARb8ygmddvoB6dCccfF/AGWMzekv
	B+ku7HlrXuBrIp/sTGtelU8VxzpQmYMp/kEvJbNzTr07r53V0UjpwANF24OxtDDbNbm35Er1xFI
	N42KUPsLzS69r/OlOSJAJvnVb9kdAVZJ/GgYcQX74ILyeVcbe53nVmpTRDoe6IBTo9V3NPIA+au
	TdSoi9QB9Y2JYpq2JEpI2RUUwg2iiDJZQIw5bTgWJLjGGda2obd8CA0v6MmIzKMW32bu8fWIdYI
	Xi2D1O/sn3LihgFmbueHOvYjrxM4BFjYhi9IwYIEkSFlPhBlcf1da6AJQqt9D9nh
X-Received: by 2002:a17:907:86ac:b0:ac3:25d7:6950 with SMTP id a640c23a62f3a-ac6faec918amr233580966b.20.1743066904549;
        Thu, 27 Mar 2025 02:15:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9TEdGEiJU8XChL/roZ9oFLUORJvGK9UhKTl0IMh8XLgAXK5tF7SuMvemJlvPj64pT1hjqfQ==
X-Received: by 2002:a17:907:86ac:b0:ac3:25d7:6950 with SMTP id a640c23a62f3a-ac6faec918amr233576966b.20.1743066903811;
        Thu, 27 Mar 2025 02:15:03 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef85c731sm1185185866b.24.2025.03.27.02.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:15:03 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:14:59 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, "David S. Miller" <davem@davemloft.net>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] vhost/vsock: use netns of process that opens the
 vhost-vsock-netns device
Message-ID: <apvz23rzbbk3vnxfv6n4qcqmofzhb4llas27ygrrvxcsggavnh@rnxprw7erxs3>
References: <20250312-vsock-netns-v2-0-84bffa1aa97a@gmail.com>
 <20250312-vsock-netns-v2-3-84bffa1aa97a@gmail.com>
 <09c84a94-85f3-4e28-8e7d-bdc227bf99ab@redhat.com>
 <nwksousz7f4pkzwefvrpbgmmq6bt5kimv4icdkvm7n2nlom6yu@e62c5gdzmamg>
 <Z9yDIl8taTAmG873@devvm6277.cco0.facebook.com>
 <aqkgzoo2yswmb52x72fwmch2k7qh2vzq42rju7l5puxc775jjj@duqqm4h3rmlh>
 <Z+NGRX7g2CgV9ODM@devvm6277.cco0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z+NGRX7g2CgV9ODM@devvm6277.cco0.facebook.com>

On Tue, Mar 25, 2025 at 05:11:49PM -0700, Bobby Eshleman wrote:
>On Fri, Mar 21, 2025 at 11:02:34AM +0100, Stefano Garzarella wrote:
>> On Thu, Mar 20, 2025 at 02:05:38PM -0700, Bobby Eshleman wrote:
>> > On Thu, Mar 20, 2025 at 10:08:02AM +0100, Stefano Garzarella wrote:
>> > > On Wed, Mar 19, 2025 at 10:09:44PM +0100, Paolo Abeni wrote:
>> > > > On 3/12/25 9:59 PM, Bobby Eshleman wrote:
>> > > > > @@ -753,6 +783,8 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
>> > > > >  	virtio_vsock_skb_queue_purge(&vsock->send_pkt_queue);
>> > > > >
>> > > > >  	vhost_dev_cleanup(&vsock->dev);
>> > > > > +	if (vsock->net)
>> > > > > +		put_net(vsock->net);
>> > > >
>> > > > put_net() is a deprecated API, you should use put_net_track() instead.
>> > > >
>> > > > >  	kfree(vsock->dev.vqs);
>> > > > >  	vhost_vsock_free(vsock);
>> > > > >  	return 0;
>> > > >
>> > > > Also series introducing new features should also include the related
>> > > > self-tests.
>> > >
>> > > Yes, I was thinking about testing as well, but to test this I think we need
>> > > to run QEMU with Linux in it, is this feasible in self-tests?
>> > >
>> > > We should start looking at that, because for now I have my own ansible
>> > > script that runs tests (tools/testing/vsock/vsock_test) in nested VMs to
>> > > test both host (vhost-vsock) and guest (virtio-vsock).
>> > >
>> >
>> > Maybe as a baseline we could follow the model of
>> > tools/testing/selftests/bpf/vmtest.sh and start by reusing your
>> > vsock_test parameters from your Ansible script?
>>
>> Yeah, my playbooks are here:
>> https://github.com/stefano-garzarella/ansible-vsock
>>
>> Note: they are heavily customized on my env, I wrote some notes on how to
>> change various wired path.
>>
>> >
>> > I don't mind writing the patches.
>>
>> That would be great and very much appreciated.
>> Maybe you can do it in a separate series and then here add just the
>> configuration we need.
>>
>> Thanks,
>> Stefano
>>
>
>Hey Stefano,
>
>I noticed that bpf/vmtest.sh uses images hosted from libbpf's CI/CD. I
>wonder if you have any thoughts on a good repo we may use to pull our
>qcow image(s)? Or a preferred way to host some images, if no repo
>exists?

Good question!

I created this group/repo mainily to keep trak of work, not sure if we 
can reuse: https://gitlab.com/vsock/

I can add you there if you need to create new repo, etc.

But I'm also open to other solutions.

Thanks,
Stefano

