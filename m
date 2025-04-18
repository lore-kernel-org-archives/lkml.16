Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C07A26FD8C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970835; cv=none; b=mwET6ejIkoMeoC9Zz+x2uu5k8YQQYlcuWjonkwQEexYsqjjeYXArY2/1c9G4zMm/apo+fR2YMQaBoNt9WMsGr19jd/PzEdSKV/gfpWjY/2B+O+6LcYjAnOUbcGSN3F9yc/U5xfTLYjMc2ZAgDW69FV7omOeadUeadiPS7r/nyEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970835; c=relaxed/simple;
	bh=9ztD5QEKbZyDUWbK+PqKwSOd4E+kH7gk1b2fzZmLKYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPFZ8RxcwyJERhVVRgTIWLrLUEroZIp6SCYGtUL5o660O8wQAuRsCxqMiyK5C9XIr/RzvS9QqM4dpskpSuNvrabYM6xL0OaXcz/LdXdzCwoy3WTmYe7PVbuVCpcTAprj/KvjzwHHPYcj4QjJMFPDANSuc+Buhjw0XflP/XMzsUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X6Lgzb87; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X6Lgzb87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744970833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9G5521K43w3dmM/mpU0zbZYMYOFcRmDMx1FAdvTmU0E=;
	b=X6Lgzb87OJL/uwBjzW3DX6k9zFRWJMTs1rDnMe2PYz80vRfBTgpl4g1d4inmjAAH1r3tOL
	T3hfwqdJUJgsx8PZjD8hGCBpGhbVlKG4NJNU3Yuz56CnoiGoY8Ya0jiTQ4a8AzGe8RPraY
	ct1hw1aLHxu3yqsr3XQPQvANMWB8K2M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-bPFpMLOiPYSeRfQc0as27Q-1; Fri, 18 Apr 2025 06:07:11 -0400
X-MC-Unique: bPFpMLOiPYSeRfQc0as27Q-1
X-Mimecast-MFC-AGG-ID: bPFpMLOiPYSeRfQc0as27Q_1744970831
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5f62fb80999so213325a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744970830; x=1745575630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9G5521K43w3dmM/mpU0zbZYMYOFcRmDMx1FAdvTmU0E=;
        b=b+yVeddKxYKwb0GRp+PNg7Mozcr5k6afvGRZFK7z0iOwtnh5609vy2JZsGxjkfqbyX
         cwtFf+GAGzByK+hCsAiu57ZEYOYc+tacGk2VfLb6/Uty3QKRX9NqveGcpvm48TTydaMD
         dUhyOpHXxL/G0S4xraCOPeGO9/w1vR91qHvOleLbUSkPN+pBAhyjgNkDmrW7+Ytj3ReJ
         izvcQ/Rx0i4KgWHtlgwLfjIHJULJ5Wk8u0vzw76Z6QCGB5kX9+qc/Av9JaD20jJCRDks
         XrchIHd382TNUldI4m5Sj57M+XiDUFDaqUvTO0gluJdYoVXCBWFGZ3YRWy7FBjP7lqac
         tEaA==
X-Forwarded-Encrypted: i=1; AJvYcCWpc/+QiOgWpbUG/GhxSRZ1VyZ4hYgv8IBgnc19Vo2BI3OswQlQA7JCc/UetFlY3Cvh5o1/txQxhnu0EgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3cTgmf7iupxKVt4OAAQAX9DrJckc+nqgFMX8jGf+R1NT0Z7DJ
	dxiz99TVKx053SIzPM/YOH3Q98GPA7xtf4zD12b7KDCG2D+pVEqIxS7nzluAUxQdGW0pmUTjDtR
	p1Z41pYS705QTDpLqUHJdiDij3cRdCLzbfxkhNTEv4Gd6sAAQrgB7RqMAkOuyoQR2dC1PDw==
X-Gm-Gg: ASbGnctS1j9Q4fQdwGtn6cnQPtN7ckbe+dqHnXicwUOkqjNMrEQALrz/VWQ+6u/+BqL
	E/uamlqKPypbA7Y/UNU2tSaGe9X4WGjvTB8EStBM50N+TNod3RjdQCZv2g2nXTcPCtNSnQsx7vd
	9LkdDHyFGUJt+j6sSr/vXhJBMsGV07P7uEgpVYQVKfT2JJFJm33kN5q3BdkH8qmOPcvVyIghx7m
	uHK//ulELHPKi6Ps6ROgULWz+DUPuw1QNVvPTUNhBd0OHs2MbCiNk+M0TXWptfNX9sU6NpkT3qL
	XLoXli9vgHUWU0v3FA==
X-Received: by 2002:a05:6402:4407:b0:5e5:49af:411d with SMTP id 4fb4d7f45d1cf-5f6285460f7mr1805163a12.17.1744970830038;
        Fri, 18 Apr 2025 03:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTKd6NM4kSkW3Otx/O/66Pab50SH+6TRF4InR2WHUY4N/RGC6Eyk+ZoPTNIfSCaBgzl77j2Q==
X-Received: by 2002:a05:6402:4407:b0:5e5:49af:411d with SMTP id 4fb4d7f45d1cf-5f6285460f7mr1805127a12.17.1744970829477;
        Fri, 18 Apr 2025 03:07:09 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.130.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625592cf4sm820284a12.36.2025.04.18.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:07:08 -0700 (PDT)
Date: Fri, 18 Apr 2025 12:07:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] vsock: Linger on unsent data
Message-ID: <baamf74wjdpk7ji3hmsyzjr6ngu52qq6au6gcnc5vahlacpenx@rccaffrt6vub>
References: <20250407-vsock-linger-v1-0-1458038e3492@rbox.co>
 <20250407-vsock-linger-v1-1-1458038e3492@rbox.co>
 <22ad09e7-f2b3-48c3-9a6b-8a7b9fd935fe@redhat.com>
 <hu4kfdobwdhrvlm5egbbfzxjiyi6q32666hpdinywi2fd5kl5j@36dvktqp753a>
 <a3ed036f-5153-4d4c-bf71-70b060dd5b2f@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a3ed036f-5153-4d4c-bf71-70b060dd5b2f@rbox.co>

On Wed, Apr 16, 2025 at 02:36:52PM +0200, Michal Luczaj wrote:
>On 4/11/25 12:32, Stefano Garzarella wrote:
>> On Thu, Apr 10, 2025 at 12:51:48PM +0200, Paolo Abeni wrote:
>>> On 4/7/25 8:41 PM, Michal Luczaj wrote:
>>>> Change the behaviour of a lingering close(): instead of waiting for all
>>>> data to be consumed, block until data is considered sent, i.e. until worker
>>>> picks the packets and decrements virtio_vsock_sock::bytes_unsent down to 0.
>>>
>>> I think it should be better to expand the commit message explaining the
>>> rationale.
>
>Sure, will do.
>
>>>> Do linger on shutdown() just as well.
>>>
>>> Why? Generally speaking shutdown() is not supposed to block. I think you
>>> should omit this part.
>>
>> I thought the same, but discussing with Michal we discovered this on
>> socket(7) man page:
>>
>>    SO_LINGER
>>           Sets or gets the SO_LINGER option.  The argument is a
>>           linger structure.
>>
>>               struct linger {
>>                   int l_onoff;    /* linger active */
>>                   int l_linger;   /* how many seconds to linger for */
>>               };
>>
>>           When enabled, a close(2) or shutdown(2) will not return
>>           until all queued messages for the socket have been
>>           successfully sent or the linger timeout has been reached.
>>           Otherwise, the call returns immediately and the closing is
>>           done in the background.  When the socket is closed as part
>>           of exit(2), it always lingers in the background.
>>
>> In AF_VSOCK we supported SO_LINGER only on close(), but it seems that
>> shutdown must also do it from the manpage.
>
>Even though shutdown() lingering isn't universally implemented :/
>
>If I'm reading the code correctly, TCP lingers only on close(). So,
>following the man page on the one hand, mimicking TCP on the other?
>

If this is the case, I would say mimic TCP for now.

Thanks,
Stefano

