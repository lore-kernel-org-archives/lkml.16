Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203723E32D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270311; cv=none; b=orZRTXOY1jt6efaXsUeaAJlZK751a64zm+Wvrhs3S5sT2TJftkwcWBluLkhaT5+RnIsbs01HH37uT7Ur5O1aMyaO5S7QyNZDOH3UVtkFAo1dmOFv0X7Q0FnBCwSZsd3GnqIGc6HcnCH05d0klHDiCv6TKvwSRlQz8BkebOJBSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270311; c=relaxed/simple;
	bh=cIWLQj7tWvL2O1cLTwZUfAKHg4ehQSOPXhaj0k60wmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQWwkxU7PXwWToojnY5B3iLwa8CAxNiTBqbTje5SnptFEg2O0ITq1xQw7eKKBNJYoIDktFKqPM4B2+SaYFpXqBYjUqnWauEIgLsFnkd9CxdlHyEctFZAR4IfD4VvxwIkN9YHdjsSSpXAyVeE8agnoEAm5X0lH7LhNCl+DiFrQOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y4XJUUPa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y4XJUUPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751270308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgEWcWVX6y9scJKOQscqFoJ6thnfYTOA+0wFODJOjNQ=;
	b=Y4XJUUPas0e5H3XTlOJL/qmtdeANAWX9XKTit0wLMD2kLwc5Z2lxZdOhlYcvy7d7v4b3j9
	Z9yYYDnEErncpoojo0AJK17YJN/JgophLyzcVbUxnu2/zeB4vKibmJ7wWO7DLD2u4gT4F6
	kgWe4B3xwgGPaEF8gFma1IuvxWozp58=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-rwOg6yLBMu6i9wWdiYjvcw-1; Mon, 30 Jun 2025 03:58:21 -0400
X-MC-Unique: rwOg6yLBMu6i9wWdiYjvcw-1
X-Mimecast-MFC-AGG-ID: rwOg6yLBMu6i9wWdiYjvcw_1751270301
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-703d7a66d77so54359307b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270301; x=1751875101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgEWcWVX6y9scJKOQscqFoJ6thnfYTOA+0wFODJOjNQ=;
        b=eQwAirCi1V7iaX1cdSftCViXsLAUcB8peDNzupC7EsmvMYWGFu9u2PQv4joi+gEsAF
         +UPxJU1Ji1KpDQ+eG65tvLm7EdSpHaAheZv/JdP8fvent/TZ0S4jvvuqOU+znAbAq6Aj
         yF22wmk09RoRXpxJ8P569hK7uP/EmZQQeyUOBQ9O8WBLQfRULTPMvv1Vr3/LYUtiW5D+
         MLYyMILu2zVn7jMvnLfP3wPuhbDVpFeSohouOG1sJB9okdQuPKDOuUdRk1wVB2wybVag
         jnCv/diuSeVElUDFApCESvwl9NjEY0wo2Qrwp3RQyLaBc9Qzj/EhjuJDLLOTZqs2dVVQ
         wQsA==
X-Forwarded-Encrypted: i=1; AJvYcCUAqJz8vrxfQee6BTVKEVbemk4MMaQig/2YWzg1mwYToGVQKmxRpcTM+XV5dlqZTp/MMX5xNA/prjK7SqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbFYgiKKBOrdtklO/81bfCyrrcrpB9LfwUfpjzwjMUw+mjDt4
	oz4IRkIwTNUldKsyB+dcQL510htQIrrSAm4dbxxc1kqXV4zhAX/sblvpzgoXXZfA4lbb/1V0YbS
	Dzw7+O4cA4r65VoYaLM+2l6doAQ+yFL9J9o9c/N2NXAArtwHyaR4yuxHpFFlXNBdE6QngHBwKBR
	sdPRusxL8VoVdmceqrmXurwhJu41v7hg9w4ElEn3U39FQtarKBAIt5ww==
X-Gm-Gg: ASbGncsaVMWkY4ibKZp4awVsuiuXVOQH1n9z+0Q2KVU+oARnvXju/Q/0avluNP8ICZU
	4LAThq4GipW7pqy66t9uxVAr9tOWxD3IuJULoonUOTLGwWPGvHpPEF50OgThxleNo28tLmb9cYo
	3QZu8gvA==
X-Received: by 2002:a05:690c:388:b0:712:d7dd:e25a with SMTP id 00721157ae682-7151756eb18mr172064557b3.6.1751270300712;
        Mon, 30 Jun 2025 00:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9hk4iM8gEid0K715PQkHr7wTuzImJqjNS2fyvGLxyh0PAObiNySZ92qlNHU9LEDZn5W6cNeMfqE7U/ldpN9U=
X-Received: by 2002:a05:690c:388:b0:712:d7dd:e25a with SMTP id
 00721157ae682-7151756eb18mr172064347b3.6.1751270300278; Mon, 30 Jun 2025
 00:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <gv5ovr6b4jsesqkrojp7xqd6ihgnxdycmohydbndligdjfrotz@bdauudix7zoq> <20250630075411.209928-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250630075411.209928-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 30 Jun 2025 09:58:07 +0200
X-Gm-Features: Ac12FXzM2abZAiLuWcV3HSuStmkPiQEYR_Hk5CCqlcO4nWGeNMcgQRF0jjd6Ui4
Message-ID: <CAGxU2F41qFrcTJdk3YeQMTwd0CP8nCqTCPpOn3ezQv=tPVx_WA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] vsock: Introduce SIOCINQ ioctl support
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: davem@davemloft.net, decui@microsoft.com, fupan.lfp@antgroup.com, 
	jasowang@redhat.com, kvm@vger.kernel.org, leonardi@redhat.com, 
	linux-kernel@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org, 
	niuxuewei.nxw@antgroup.com, pabeni@redhat.com, stefanha@redhat.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 09:54, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Mon, Jun 30, 2025 at 03:38:24PM +0800, Xuewei Niu wrote:
> > >Introduce SIOCINQ ioctl support for vsock, indicating the length of unread
> > >bytes.
> >
> > I think something went wrong with this version of the series, because I
> > don't see the patch introducing support for SIOCINQ ioctl in af_vsock.c,
> > or did I miss something?
>
> Oh yes. Since adding a patch for hyper-v, I forgot to update the `git
> format-patch` command...

I'd suggest using some tools like b4 or git-publish for the future:
- https://b4.docs.kernel.org/en/latest/contributor/overview.html
- https://github.com/stefanha/git-publish

>
> Please ignore this patchset and I'll resend a new one.

Please send a v5, so it's clear this version is outdated.

Thanks,
Stefano

>
> Thanks,
> Xuewei
>
> > >Similar with SIOCOUTQ ioctl, the information is transport-dependent.
> > >
> > >The first patch adds SIOCINQ ioctl support in AF_VSOCK.
> > >
> > >Thanks to @dexuan, the second patch is to fix the issue where hyper-v
> > >`hvs_stream_has_data()` doesn't return the readable bytes.
> > >
> > >The third patch wraps the ioctl into `ioctl_int()`, which implements a
> > >retry mechanism to prevent immediate failure.
> > >
> > >The last one adds two test cases to check the functionality. The changes
> > >have been tested, and the results are as expected.
> > >
> > >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> > >
> > >--
> > >
> > >v1->v2:
> > >https://lore.kernel.org/lkml/20250519070649.3063874-1-niuxuewei.nxw@antgroup.com/
> > >- Use net-next tree.
> > >- Reuse `rx_bytes` to count unread bytes.
> > >- Wrap ioctl syscall with an int pointer argument to implement a retry
> > >  mechanism.
> > >
> > >v2->v3:
> > >https://lore.kernel.org/netdev/20250613031152.1076725-1-niuxuewei.nxw@antgroup.com/
> > >- Update commit messages following the guidelines
> > >- Remove `unread_bytes` callback and reuse `vsock_stream_has_data()`
> > >- Move the tests to the end of array
> > >- Split the refactoring patch
> > >- Include <sys/ioctl.h> in the util.c
> > >
> > >v3->v4:
> > >https://lore.kernel.org/netdev/20250617045347.1233128-1-niuxuewei.nxw@antgroup.com/
> > >- Hyper-v `hvs_stream_has_data()` returns the readable bytes
> > >- Skip testing the null value for `actual` (int pointer)
> > >- Rename `ioctl_int()` to `vsock_ioctl_int()`
> > >- Fix a typo and a format issue in comments
> > >- Remove the `RECEIVED` barrier.
> > >- The return type of `vsock_ioctl_int()` has been changed to bool
> > >
> > >Xuewei Niu (3):
> > >  hv_sock: Return the readable bytes in hvs_stream_has_data()
> > >  test/vsock: Add retry mechanism to ioctl wrapper
> > >  test/vsock: Add ioctl SIOCINQ tests
> > >
> > > net/vmw_vsock/hyperv_transport.c | 16 +++++--
> > > tools/testing/vsock/util.c       | 32 +++++++++----
> > > tools/testing/vsock/util.h       |  1 +
> > > tools/testing/vsock/vsock_test.c | 80 ++++++++++++++++++++++++++++++++
> > > 4 files changed, 117 insertions(+), 12 deletions(-)
> > >
> > >--
> > >2.34.1
> > >
>

