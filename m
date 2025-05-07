Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFAA28B7FD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634711; cv=none; b=gyPHHfar5ROagw+8xDm3OGDz23jyp7YroMazMJ6GEhsWGSoVk2zOm+2BzDj6x5jzxxzmtybW6eK5TRSAArB4qRnTCLJNKhlT8R0nJ7PBbLhO5TaPAqxdxyOdOG4pq6WKkGX1Il1igGZ1llCAc1NY/3XJOlN61rLzOJYyUtNmgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634711; c=relaxed/simple;
	bh=bWVXWi6FNTmsC6XQcQl5QLoeoLqMPPpdOvDyzqsEHVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldnCWgA/sLG9CsTgfFJl2uwZARjQ+Om9U72GKjVC+drmP9nTFB123GWUOSGBSi31rKjy90s0Xv1EnxCkcl02SEnX5iVNSRdHzqsBXABLLGRY+TQ742yU1sEfYtqphk0IhGf8Ri9qLDvBLbeA2KhxAgmPnnTGZ7O1ixbZ2bQXqDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V4MrBsKG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V4MrBsKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746634708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39nLFDBfyFezv/758tbb1M4Ol4SxY7Fer6M45n6qLAM=;
	b=V4MrBsKGEzA/JXkwmIriaEobILPU6owR40TRq+d2rI3oYsXLmT4QOC491l+nEZK1O9o24U
	50oi5tazsafmI+YmElUbngNn9B6ZvvQlQEHkHVBC9Khy60OANEMbtuTqzqReUGxYpYszOe
	HdmGDUOw3ONvrKyIQKrzIvYbYEiK4fQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-It4LFln8OAaLfxJa4E24ng-1; Wed, 07 May 2025 12:18:26 -0400
X-MC-Unique: It4LFln8OAaLfxJa4E24ng-1
X-Mimecast-MFC-AGG-ID: It4LFln8OAaLfxJa4E24ng_1746634705
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac28a2c7c48so664458466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746634705; x=1747239505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39nLFDBfyFezv/758tbb1M4Ol4SxY7Fer6M45n6qLAM=;
        b=wkI2RFKH6OnHGFCpBEm+a8+s18Y3rxuEZ2/E41iWEIV1Dw3OyeSL0Qk2G/InJr9oaD
         O5aSk1JcpxVX/RkxrJRdYhqSTosb/5xN3/mj9sRx4jzueF4mEibGPvNsdQTNvK1nB1gc
         Qmgrh4H0vv5h1Kkd52PPQ5wgSZGrb4Y0p5Q9BN2wx2e17h63LM2GTsCC6mz0azIiceQS
         ut/LD5fnF2twN9DY5xKSMDDDRcFHo5VVcAxfIZP5bP/nd8CmMROVznXDUHkKUR2in5Co
         +7D0Y0yh10honjuwpKGxUoNxGF2+tfAHdn9Sri+uNNOjwaMc7/w+1aBI5704JUbRLVWb
         iLGA==
X-Forwarded-Encrypted: i=1; AJvYcCVorQ8kQuIJEaBuuEW6s6JKybcK7wpHcAwIaLOn1EB2xe+cZPYAl7mxa9u4pG36xERWTwYDFMg9MKUYNTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lcr5ThyFieLVExhmoepMmGsgjzvxo06/93qQ3CEiHpbZRTCS
	T/q4gRO4s0VvQmhb+hKD9pyLTPrOjusDlHrR+7nnQ0LShm74pbVlB7zTkvSlwFwvXReuHdS80br
	NwxUeI75PYgsOVnERVCHhsRj2qJNYY3mqm1FazLX4uitAS2weSxOLdZjITD5RucSw9jHhsA==
X-Gm-Gg: ASbGncshEKm3VEKn7DwUKjaxC9EV4+QsTxYlTs1IXe/8ECoeAzZrTjeywWxAb0pJ0M8
	uFsEe/FmVf3TB5IFY6Ttj/usRHhpPmm9W55CUFshKDjcVTC30adSHzk+Jq88eP5Cht8NbikVVbW
	2ar092g+xa1efJ8Cevt7qfEiApyMqNaYLTtv381ZHAN5BOfp1SEuqwsXhmGrD+J+YuojsaQFsH6
	47EC7vGg5d1H8jQBuEAN0cdn9EtNuMq/+68HKeKjgb5SCYUzmeHvcQSXOyq7QaOomqg2VXSb2Lt
	n3f9lkopAgdAb2pt
X-Received: by 2002:a17:906:6a21:b0:ac3:5c8e:d3f5 with SMTP id a640c23a62f3a-ad1e8bf2298mr431573966b.27.1746634705142;
        Wed, 07 May 2025 09:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcpsNEPHJMDyuwXMw9YaT6C3LUO/0nHh1kX9E1tgCGACOK+8BvvpnBj9Yg4yGqdZN/AhWgIA==
X-Received: by 2002:a17:906:6a21:b0:ac3:5c8e:d3f5 with SMTP id a640c23a62f3a-ad1e8bf2298mr431569666b.27.1746634704432;
        Wed, 07 May 2025 09:18:24 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.183.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891e980bsm920838266b.76.2025.05.07.09.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:18:23 -0700 (PDT)
Date: Wed, 7 May 2025 18:18:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Konstantin Shkolnyy <kshk@linux.ibm.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mjrosato@linux.ibm.com
Subject: Re: [PATCH net v2] vsock/test: Fix occasional failure in SIOCOUTQ
 tests
Message-ID: <CAGxU2F5XeRs+4Fwrf_LhOjhjxaWOocpZDQanOc+mcDyPFRHCfQ@mail.gmail.com>
References: <20250507151456.2577061-1-kshk@linux.ibm.com>
 <CAGxU2F6ssoadHjCH9qi6HdaproC3rH=d-CdYh2mvK+_X4-C4nw@mail.gmail.com>
 <689ab62a-7800-497d-a9a6-3a81e256f98d@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <689ab62a-7800-497d-a9a6-3a81e256f98d@linux.ibm.com>

On Wed, 7 May 2025 at 18:01, Konstantin Shkolnyy <kshk@linux.ibm.com> wrote:
>
> On 07-May-25 10:41, Stefano Garzarella wrote:
> > On Wed, 7 May 2025 at 17:15, Konstantin Shkolnyy <kshk@linux.ibm.com> wrote:
> >>
> >> These tests:
> >>      "SOCK_STREAM ioctl(SIOCOUTQ) 0 unsent bytes"
> >>      "SOCK_SEQPACKET ioctl(SIOCOUTQ) 0 unsent bytes"
> >> output: "Unexpected 'SIOCOUTQ' value, expected 0, got 64 (CLIENT)".
> >>
> >> They test that the SIOCOUTQ ioctl reports 0 unsent bytes after the data
> >> have been received by the other side. However, sometimes there is a delay
> >> in updating this "unsent bytes" counter, and the test fails even though
> >> the counter properly goes to 0 several milliseconds later.
> >>
> >> The delay occurs in the kernel because the used buffer notification
> >> callback virtio_vsock_tx_done(), called upon receipt of the data by the
> >> other side, doesn't update the counter itself. It delegates that to
> >> a kernel thread (via vsock->tx_work). Sometimes that thread is delayed
> >> more than the test expects.
> >>
> >> Change the test to poll SIOCOUTQ until it returns 0 or a timeout occurs.
> >>
> >> Signed-off-by: Konstantin Shkolnyy <kshk@linux.ibm.com>
> >> ---
> >> Changes in v2:
> >>   - Use timeout_check() to end polling, instead of counting iterations.
> >
> > Why removing the sleep?
>
> I just imagined that whoever uses SIOCOUTQ might want to repeat it
> without a delay, so why not do it, it's a test. Is there a reason to
> insert a sleep?
>

Okay, now that I think back on it, it's the same thing I thought of when 
I did this.

I guess in v1 the sleep was just to limit the number of cycles.

LGTM:
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


