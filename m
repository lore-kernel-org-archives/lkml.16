Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490D278E5D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367562; cv=none; b=ZJy4Z3Z4GiDZ1cb8O02mJkvXYrpHabtHPu3gI09h3vWFOyABdzE24bcaUZ7P5+oXIE68pIwnv234cwcHYGMwhXo/k7krcbFeY3hgbCgWhVqVG+n6cDqNpsOhM+tkYS8lWxz582Dg5pUZv6cDPFbgvgKrfJyqQXcXQAkhXSTeL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367562; c=relaxed/simple;
	bh=dZAp+0aFkf7MK8MICOzGUOv26hrZwzczT8o2iMxm/5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Utz+IedmYXAo025BtOTPEJdgM+5ZBj7Km7yUbiLpfeuSI+lpEWAf4mRRtPlW8VAm+WI2gk4yPxAMXU2Yiql3GmF1RvVrXswfpJJcIQHD0OFWQwrOCWiUjC07FpF6vJ56K5PBbWa4g6LUIPwzFnBRmLGaCaw8bBQriTK+niwyp3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hU5nJAaI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hU5nJAaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744367559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Y+9d61eT9fS3Nx5t35n8P/kCjRV2k1+1b7KNobnOYs=;
	b=hU5nJAaIQaJNWI75mBI1kKDJRG2IS8FVrAiZ+2OHFVY/XMZUJYcoyPwpwgibeaG3LlwPER
	V6LG++kTMiuUJjWjPZMK6B/HYxUCqxpcaCwMsPeYibiGv5fkYlquTRA20Gvs+0SeBNv9V2
	hLWo3NHmGZ+lNIW6Q2Jo6J12FcfhgEE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-ics3rMmcMOWkC3EIzg9BOA-1; Fri, 11 Apr 2025 06:32:38 -0400
X-MC-Unique: ics3rMmcMOWkC3EIzg9BOA-1
X-Mimecast-MFC-AGG-ID: ics3rMmcMOWkC3EIzg9BOA_1744367557
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e82ed0f826so1776808a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367557; x=1744972357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y+9d61eT9fS3Nx5t35n8P/kCjRV2k1+1b7KNobnOYs=;
        b=md58m2hut1jqL6uX/EHgcq0OW/IkewzXeHDvaOHY+5gRMZBVgKDDrz3ZJ7QiM+JsGj
         i5gt+f0Z3oCLtvsklR3TB81GPPvZ0zlpQo9UBgpZcXjKVlDYFNkWAXjnhFNNzi9HHiGF
         E0+3vaQHpyrqSN+VDMigPi74tqQ7Z9RVRxAeCgkrxBuz/e1f1Z4NhEZ+TbbFmaT5gGXb
         31/NVtdyGcqvqUHfYPFlSm5a0qO0FnvLHLMxnvrAbQ/+COvQCWSTytG7VpJKWtMfKU7u
         z4ZKyV6fDIzvrVc0xd84/Q6XsF6pmsXnt6KkXvoqjb9n991KwDgXumh6/M9JMuUQ9m/e
         X33w==
X-Forwarded-Encrypted: i=1; AJvYcCVRwN4wxakm1yhr+EdVh46tgAlDJFHknkDVflvIErJPfyqM4C5sk6WeiwSSqVX+/vB19QAJZvg/lvYKTfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcO/3y2ki8vIRYvWvxbdStDt/o3rjoMwD36dPRvLFCMh3cHhpo
	xiH8xOauQD/VF9yPD+fevexZ6QpN+kXbB0L9kRho+8pewnpkCWxR532cTwZjGkv4hMG0Zu6Mksc
	rE58vub2/ZuEII0XzCmNIvAQVCttjrjcgK3nSuEWIGpZcVuwH3Z3RV8Kx3ZaukA==
X-Gm-Gg: ASbGnctbDihoAICALAx1PcBxNbHmdI+58tCwYSvpUT6CNKYZy8atIAaXqxbEoRdut3t
	sKGLR8eV2AqsXOukK4XT02qnnGxeiGkGdbaZ789V/fBAuycjIZulS/sYjsxMM/oP7f//gSZCiJ0
	Jep6wONWxFa44maVNJ8jBxhVncad6zy3eE82oawyYSCSadBsavT0zsfQvyaTfPTYbL1nr/kmesx
	4brWaIOoCAUnl7l0Ooz/ulP/mWSceLMLThniyl3GrMvLhWIxffIGRhQ4jIYDvdhp77gbpxEIB10
	CBA+qk4AQSX+RTLQi9fnZNZLXLJfT9B+I2W4xcZmbkOhUgqsKpoyZikME4JN
X-Received: by 2002:a05:6402:5106:b0:5ec:cd52:27c9 with SMTP id 4fb4d7f45d1cf-5f370298d8dmr1508109a12.31.1744367557233;
        Fri, 11 Apr 2025 03:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+YAD1Ckz71pvCMRdEbnpWp0EQ9xGd4Ocngq4UiSw7duGE/YHv0R0ZgCt/NsMlKk+AEHR8Kw==
X-Received: by 2002:a05:6402:5106:b0:5ec:cd52:27c9 with SMTP id 4fb4d7f45d1cf-5f370298d8dmr1508083a12.31.1744367556669;
        Fri, 11 Apr 2025 03:32:36 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee54e11sm789475a12.2.2025.04.11.03.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:32:36 -0700 (PDT)
Date: Fri, 11 Apr 2025 12:32:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Michal Luczaj <mhal@rbox.co>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Simon Horman <horms@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] vsock: Linger on unsent data
Message-ID: <hu4kfdobwdhrvlm5egbbfzxjiyi6q32666hpdinywi2fd5kl5j@36dvktqp753a>
References: <20250407-vsock-linger-v1-0-1458038e3492@rbox.co>
 <20250407-vsock-linger-v1-1-1458038e3492@rbox.co>
 <22ad09e7-f2b3-48c3-9a6b-8a7b9fd935fe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <22ad09e7-f2b3-48c3-9a6b-8a7b9fd935fe@redhat.com>

On Thu, Apr 10, 2025 at 12:51:48PM +0200, Paolo Abeni wrote:
>On 4/7/25 8:41 PM, Michal Luczaj wrote:
>> Change the behaviour of a lingering close(): instead of waiting for all
>> data to be consumed, block until data is considered sent, i.e. until worker
>> picks the packets and decrements virtio_vsock_sock::bytes_unsent down to 0.
>
>I think it should be better to expand the commit message explaining the
>rationale.
>
>> Do linger on shutdown() just as well.
>
>Why? Generally speaking shutdown() is not supposed to block. I think you
>should omit this part.

I thought the same, but discussing with Michal we discovered this on
socket(7) man page:

   SO_LINGER
          Sets or gets the SO_LINGER option.  The argument is a
          linger structure.

              struct linger {
                  int l_onoff;    /* linger active */
                  int l_linger;   /* how many seconds to linger for */
              };

          When enabled, a close(2) or shutdown(2) will not return
          until all queued messages for the socket have been
          successfully sent or the linger timeout has been reached.
          Otherwise, the call returns immediately and the closing is
          done in the background.  When the socket is closed as part
          of exit(2), it always lingers in the background.

In AF_VSOCK we supported SO_LINGER only on close(), but it seems that 
shutdown must also do it from the manpage.

Thanks,
Stefano

