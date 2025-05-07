Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5BB28A70A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632530; cv=none; b=nG0np9v76b1gWm7AOiq6aLaJ9q37TYK35kCCI4uamDCKgZd6GjO0ulL8IrbLnavylMkQXu/HbkZdWsnh7pK9gAMWq/d1uJmEZwgCiTsuEmzSBaeZUj9nVaEhHTSZWFIfCLMgoGLKl5rUw4HLJbKzqN8IbUJGJ52lvrRzzv6u6CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632530; c=relaxed/simple;
	bh=kNco2fCmuCqlZLOuCofYzSrVlJqJQWrGuA4zIfOv1wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFhhXckp/DGUyVqNfPnfk0YmTRnKqZk4KTX+pZEuVpW+yMmKgHLpvyM1UN6OLTrG6HUVFkEyFtf4x/AXJw/2XFiXU5QE14b+r3sTQtdNctQqg3WG9D/K9ROGM4U/MJOksbeL0/1KH3xign4JcgOygSnWv5bkKfhe3L9h8JgFVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZCbUFM7B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZCbUFM7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746632527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lio/+Ao1S9W+X9/4Leo17kpbIzqZzZSZhwzb8sw/wo=;
	b=ZCbUFM7BUiI9dAfcbh+RK/Le+9z3iXKXtSxHSgZImUuX7XoYPwkCSfOhUSHP1zuExq6th+
	CaynI8NOA3wxaaFHohhiPJI0tHWPLpibFqjYBk849lzAtK/IbXOVNcLFWSp5oNyFoN7YCd
	Y4A9KlLSNYEwTu4V0fcRK6zpgfFavLQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-zhGPWbnzOtmbCeFdR0ARfQ-1; Wed, 07 May 2025 11:42:06 -0400
X-MC-Unique: zhGPWbnzOtmbCeFdR0ARfQ-1
X-Mimecast-MFC-AGG-ID: zhGPWbnzOtmbCeFdR0ARfQ_1746632526
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-708aca58513so92637747b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632526; x=1747237326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lio/+Ao1S9W+X9/4Leo17kpbIzqZzZSZhwzb8sw/wo=;
        b=R2TQiJy/iwZNv+VcrdWxEwkoOPj59i9Z2tbDYXMP3K6LgAYSEo+YZa0U5pN0tCPu80
         b5ViKoFM0lxL3kqRp3SENarn9OVy1Q7SqR/dzxzAfhlz85cwksMYwkv3JztpnIKxqS1X
         g+ScDGnIn+XnbAiOnZ0dkB8QMnh6plUfReTIp+WKKIT/Dvb5/E+Y8Zw+ayEZb2Uoo14U
         pjPFlsOLfW/mtHCzwak9A7Gws8uGY4a3HVQGEX07hlQfzwQq1JqKBltpjFtCwUY79vRB
         u3Vho9cDPx5OEy9gWKgHleR+SqmQk8ySIJCa88TDaz0ZKhdNGNcWZ0fDzyO/4DR/U6QU
         2iKw==
X-Forwarded-Encrypted: i=1; AJvYcCV9JbT5/4YuFILoDtQwFUuPA831rAGhxNb/vHkvP/cAnzxh0PvUqEgWzBOjm1vXJG6HNGBESL+dJcoSZVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFkrt/JV0fneV70pHfBXcBbwvjm2Nvkr73nt+T9MLBUT1xT8M
	HuLUxekudn2IzMO5nLujrJakmHC0yP4wjVkv2+y4DidABuUQcdDIEZwk4a7VrwmJYccxr5RfpCK
	8gY122sGksXG1sbP7/7ot0iTigfrNjbaDzIXeg0+pMQymtRYPq9OR6aR7ETFMsyPCPpPt4C/fEN
	SGnOcj6YHDhtJlKaOd/SW5hth/ofQImM49dzHB
X-Gm-Gg: ASbGncvE0uPVdMTVwfJ/tPnWNMIWS6th2GSiFeS/kP2Og+m5K8btmbkCJQUrcIz4CPL
	xED8Al0I3i7DYmPBOwWeGNZXBuAvdwBAjBfmUFbSSCFs0BjTKAVPaSKgqtad3h41QIw4reA==
X-Received: by 2002:a05:690c:7204:b0:703:d0b5:7abc with SMTP id 00721157ae682-70a1d9f796amr52747567b3.9.1746632525919;
        Wed, 07 May 2025 08:42:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8lPZotZaA5SL3FWz6OPzfNFbWEJ+cXzbhHRMG1e8KklFqxYBqaKjznxq7FTFilMNXTgNWtfPjnZtzwsZAvl4=
X-Received: by 2002:a05:690c:7204:b0:703:d0b5:7abc with SMTP id
 00721157ae682-70a1d9f796amr52747237b3.9.1746632525562; Wed, 07 May 2025
 08:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507151456.2577061-1-kshk@linux.ibm.com>
In-Reply-To: <20250507151456.2577061-1-kshk@linux.ibm.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 7 May 2025 17:41:54 +0200
X-Gm-Features: ATxdqUEJ8STQu0YGygVRKeGWq1W_9YLNgZZxTRzXDHhASTqBwvXiIOk6Dpf4Fis
Message-ID: <CAGxU2F6ssoadHjCH9qi6HdaproC3rH=d-CdYh2mvK+_X4-C4nw@mail.gmail.com>
Subject: Re: [PATCH net v2] vsock/test: Fix occasional failure in SIOCOUTQ tests
To: Konstantin Shkolnyy <kshk@linux.ibm.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mjrosato@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 17:15, Konstantin Shkolnyy <kshk@linux.ibm.com> wrote:
>
> These tests:
>     "SOCK_STREAM ioctl(SIOCOUTQ) 0 unsent bytes"
>     "SOCK_SEQPACKET ioctl(SIOCOUTQ) 0 unsent bytes"
> output: "Unexpected 'SIOCOUTQ' value, expected 0, got 64 (CLIENT)".
>
> They test that the SIOCOUTQ ioctl reports 0 unsent bytes after the data
> have been received by the other side. However, sometimes there is a delay
> in updating this "unsent bytes" counter, and the test fails even though
> the counter properly goes to 0 several milliseconds later.
>
> The delay occurs in the kernel because the used buffer notification
> callback virtio_vsock_tx_done(), called upon receipt of the data by the
> other side, doesn't update the counter itself. It delegates that to
> a kernel thread (via vsock->tx_work). Sometimes that thread is delayed
> more than the test expects.
>
> Change the test to poll SIOCOUTQ until it returns 0 or a timeout occurs.
>
> Signed-off-by: Konstantin Shkolnyy <kshk@linux.ibm.com>
> ---
> Changes in v2:
>  - Use timeout_check() to end polling, instead of counting iterations.

Why removing the sleep?

Thanks,
Stefano

>
>  tools/testing/vsock/vsock_test.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
> index d0f6d253ac72..613551132a96 100644
> --- a/tools/testing/vsock/vsock_test.c
> +++ b/tools/testing/vsock/vsock_test.c
> @@ -1264,21 +1264,25 @@ static void test_unsent_bytes_client(const struct test_opts *opts, int type)
>         send_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
>         control_expectln("RECEIVED");
>
> -       ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
> -       if (ret < 0) {
> -               if (errno == EOPNOTSUPP) {
> -                       fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
> -               } else {
> +       /* SIOCOUTQ isn't guaranteed to instantly track sent data. Even though
> +        * the "RECEIVED" message means that the other side has received the
> +        * data, there can be a delay in our kernel before updating the "unsent
> +        * bytes" counter. Repeat SIOCOUTQ until it returns 0.
> +        */
> +       timeout_begin(TIMEOUT);
> +       do {
> +               ret = ioctl(fd, SIOCOUTQ, &sock_bytes_unsent);
> +               if (ret < 0) {
> +                       if (errno == EOPNOTSUPP) {
> +                               fprintf(stderr, "Test skipped, SIOCOUTQ not supported.\n");
> +                               break;
> +                       }
>                         perror("ioctl");
>                         exit(EXIT_FAILURE);
>                 }
> -       } else if (ret == 0 && sock_bytes_unsent != 0) {
> -               fprintf(stderr,
> -                       "Unexpected 'SIOCOUTQ' value, expected 0, got %i\n",
> -                       sock_bytes_unsent);
> -               exit(EXIT_FAILURE);
> -       }
> -
> +               timeout_check("SIOCOUTQ");
> +       } while (sock_bytes_unsent != 0);
> +       timeout_end();
>         close(fd);
>  }
>
> --
> 2.34.1
>

