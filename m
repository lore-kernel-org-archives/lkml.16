Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08B1213256
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743994476; cv=none; b=PYGGxRsi1j+fP29ckeOGyHx63UFfRE6EEVfEfsZLCx/ysW638wknADn345Hmm8cSZGHfYSH6YONi5Frr8RSyIKmqRSeeTt9t4pVxzpFKgsztnnzlyspj7GPZtTsJJcwoLNT//fJwAk8EkqbFxQvrAFAdB3sHe0CJ3HYvAVMUYmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743994476; c=relaxed/simple;
	bh=78VYBtVNDDMVcqLfVurU2jzF/nks381crfP8S6661CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j8aO7FJ1R9bbm0i7iigiaS5xMjv3+qIcxk/r6EyD0RMMeYfy2R8CoYLgpUnsXHNgC53kwXUAk/MexZ7Fy94jZMJJ9mopsF1jcvZgu8OXoqscYdEZvgpPo4pFH7waJYLpO183KYA0OnED/zeIXhZIRWZtEx3OLX3/+HEdOV+kaCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TezK+/F6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TezK+/F6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743994473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fRYTVXsNSGpfzKQctOT6faNFmutksfxmob0Nbhsev3k=;
	b=TezK+/F6SlOQiPO1wRxWxNzQv3/qrQ2FNMFsCmhqtvelALQ8p4VK+4dWsQLMI/wuVNYaLl
	GmMTaNkdRrxoStJe2FOFQZLPVDcF17a5rhclf96+TWKpDsZgcyMEpecseGSRltOopAArmP
	yfxNb24t/PV1Lk6qotP0TfDmXt/Vuho=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-EKWClaMnM4CF4doG9xVNyg-1; Sun, 06 Apr 2025 22:54:29 -0400
X-MC-Unique: EKWClaMnM4CF4doG9xVNyg-1
X-Mimecast-MFC-AGG-ID: EKWClaMnM4CF4doG9xVNyg_1743994468
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-306b51e30ffso1001726a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 19:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743994468; x=1744599268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRYTVXsNSGpfzKQctOT6faNFmutksfxmob0Nbhsev3k=;
        b=B7Yh7tX+KY+LHV6znuQRnzpQm3+FkzxGxPWG2xtgR14y0DRAkKb9FcvaJmLPD9sKQ+
         n1mQCJermvBmoJgYaghLBBx6d7+A35TU8xkRO4+sVKfqbBblFswe+xzhyblzsion0VWN
         ZnisIReLUDMjWbOZ/dkkl18o6ii3li3K+fXw6nwHrLLwygAjvKUZjFY9J/eq/Q39aJzR
         3nS5Q/b2JFGv1AhKiKNDrSEjHzcjtkSm5cI5TRP05cQ0tNKUxqvrDIU/VUE3M7uBBhTi
         ae7FuqRWjUuEvmF3xLGBV241IuyiUmXkcDF6JBaJVDQlrBZlzIoARWC4HJTMwRbcUp1R
         c8kg==
X-Forwarded-Encrypted: i=1; AJvYcCXoKCtf/nbYjwZHtGm6IHXoagYaJbAa5b/nGzaTaBAI8aAITLzQ5GpvUIo4B12btDgVaRLHtJAHfQgwE7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwY/R2UXODtGnl9wAVFddFBhFdJw6goONjK9scnht1JNlHOg7b
	zHKBkbLPOREecSedB1NCc5cef4YSKRDACym5LiZrpHAYPXOPg7Y8IzLmetun2iFjfFgyrHk/ROH
	EbwwqA1v2nXcpvu7suUtxpjLnEDfzn/VaRER2TYQisx1g+gHGpzjxP6f/t/ch09wvcyzxmVxJDG
	UB7dTqj7zn4Q2f5rj0VXEXtRXmWpFATzKdZT4Q
X-Gm-Gg: ASbGncuLV6XWr+FtbXmLrjSORm1rSSpD/9B4wMQwr68kXPGzZLHRZmCxaPPwV4Rhc+W
	Bym7Q5QVp1lfWlDKglD7HWQvNeG5yfKXCr9nF0JdZ2lowXmSfwLvQllW5riXoISezffxwuQ==
X-Received: by 2002:a17:90a:fc4d:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-306a612a138mr15338037a91.9.1743994468413;
        Sun, 06 Apr 2025 19:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXA7LEkfeKj+UJM3EgBo9JimsT+EXs1f53vLTWxMaMpQ0p3dYoCeDfB1sKILY75A1/XhDlE0eb1/3ARXiXCQg=
X-Received: by 2002:a17:90a:fc4d:b0:2fe:80cb:ac05 with SMTP id
 98e67ed59e1d1-306a612a138mr15338003a91.9.1743994468043; Sun, 06 Apr 2025
 19:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401043230.790419-1-jon@nutanix.com>
In-Reply-To: <20250401043230.790419-1-jon@nutanix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Apr 2025 10:54:16 +0800
X-Gm-Features: ATxdqUFts7q2N1G290I9w5fzC7i8BKP_qVhbpym_CyiIkKmnXdbijEE_7p0Hj9Y
Message-ID: <CACGkMEty2SC--kiq64yfgWQ-q6Fg8b0+Le-dUGMaJgcOFhosRw@mail.gmail.com>
Subject: Re: [PATCH] vhost/net: Defer TX queue re-enable until after sendmsg
To: Jon Kohler <jon@nutanix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 12:04=E2=80=AFPM Jon Kohler <jon@nutanix.com> wrote:
>
> In handle_tx_copy, TX batching processes packets below ~PAGE_SIZE and
> batches up to 64 messages before calling sock->sendmsg.
>
> Currently, when there are no more messages on the ring to dequeue,
> handle_tx_copy re-enables kicks on the ring *before* firing off the
> batch sendmsg. However, sock->sendmsg incurs a non-zero delay,
> especially if it needs to wake up a thread (e.g., another vhost worker).
>
> If the guest submits additional messages immediately after the last ring
> check and disablement, it triggers an EPT_MISCONFIG vmexit to attempt to
> kick the vhost worker. This may happen while the worker is still
> processing the sendmsg, leading to wasteful exit(s).
>
> This is particularly problematic for single-threaded guest submission
> threads, as they must exit, wait for the exit to be processed
> (potentially involving a TTWU), and then resume.
>
> In scenarios like a constant stream of UDP messages, this results in a
> sawtooth pattern where the submitter frequently vmexits, and the
> vhost-net worker alternates between sleeping and waking.
>
> A common solution is to configure vhost-net busy polling via userspace
> (e.g., qemu poll-us). However, treating the sendmsg as the "busy"
> period by keeping kicks disabled during the final sendmsg and
> performing one additional ring check afterward provides a significant
> performance improvement without any excess busy poll cycles.
>
> If messages are found in the ring after the final sendmsg, requeue the
> TX handler. This ensures fairness for the RX handler and allows
> vhost_run_work_list to cond_resched() as needed.
>
> Test Case
>     TX VM: taskset -c 2 iperf3  -c rx-ip-here -t 60 -p 5200 -b 0 -u -i 5
>     RX VM: taskset -c 2 iperf3 -s -p 5200 -D
>     6.12.0, each worker backed by tun interface with IFF_NAPI setup.
>     Note: TCP side is largely unchanged as that was copy bound
>
> 6.12.0 unpatched
>     EPT_MISCONFIG/second: 5411
>     Datagrams/second: ~382k
>     Interval         Transfer     Bitrate         Lost/Total Datagrams
>     0.00-30.00  sec  15.5 GBytes  4.43 Gbits/sec  0/11481630 (0%)  sender
>
> 6.12.0 patched
>     EPT_MISCONFIG/second: 58 (~93x reduction)
>     Datagrams/second: ~650k  (~1.7x increase)
>     Interval         Transfer     Bitrate         Lost/Total Datagrams
>     0.00-30.00  sec  26.4 GBytes  7.55 Gbits/sec  0/19554720 (0%)  sender
>
> Signed-off-by: Jon Kohler <jon@nutanix.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

