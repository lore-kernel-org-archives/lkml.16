Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E41D2F42
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267772; cv=none; b=OPmmFVGSzcl1NuhkVe0SFTJnPr/EkpFj6wDs4HV8Xg4/K1clCTHzTx1ARMpQMa2utclwXvdxHAFVi9vY/MQ/xEwyq1QFTZK4RSZ6uEQKGpAlYeveeDC5uPLNezdF7Rd9eAhs8dY3Mj8y2y1R3uN+DeZT5oIbKm5NDh4cSBoexL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267772; c=relaxed/simple;
	bh=8/rgdMR7ZxeHT7lcm2WF5v/murhX9m6bqlwpbwbmYXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwLBNnvWuS2n39dMcU6ZNy3siu9xl/VV/k6AxgpUC7accZgueVS9tMY8jqysoeizcAJYpUUzAgpvbC9RG+fLtOe7qgKSw1yoi3QfLmdyy2OB+XChN3o6Zn2KctjeXuWRf7TK9Dx0yCNeL0yTvnszRVHZLQKf1zq2X/FosbcjPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etoqA2Oq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etoqA2Oq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748267769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHjg19p96sdYw4xDXVkvX1Jw1LT1R8JNp7/yMvD2jYc=;
	b=etoqA2Oq/tD7MVKlvvCj+8J5BXsKMFUHDbm7Ayk393SbUVjtrUATCKwF2eBJs3+bxRSAwJ
	EBb2Y44qxj7iS35z8sKF/H7FVEyQv+nOtAQ94ltkFf5fP05b/PyDKfdYpCEn6nZNW28fQu
	39Sg9ngN5UquwEti9TEpfzL8TsudqhU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-thO0TCC0Ms-qaVVPbZzmrw-1; Mon, 26 May 2025 09:56:08 -0400
X-MC-Unique: thO0TCC0Ms-qaVVPbZzmrw-1
X-Mimecast-MFC-AGG-ID: thO0TCC0Ms-qaVVPbZzmrw_1748267768
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e7d9a27bdf0so2271199276.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748267768; x=1748872568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHjg19p96sdYw4xDXVkvX1Jw1LT1R8JNp7/yMvD2jYc=;
        b=FPkL+OoYZ481u9fkEkii6BhcglhK/OyNP0OZg+D13Hs/DzVrPcqd6Wj5koY3PoIb7q
         zld8rPsiRz5AwibRSnq6qJbxpvBHlTuOtDFZOeVYkMC5hurTHFB+fnfPU9Aqyy43QOpV
         AlYY2SWBAiVLrxTSDxXYTHK7ojS4tmPCys3WOql5HnHNFycV3U0u/gcq6evycPWFRA/3
         rBENB4y0X/hNy1HBWDnUSw9RL1ZXYAuGGSVr1FZg9R9emRfKANmOJZUfVOR426kwQsKb
         UtALMnz5JdVf/uPF62Kt3SbsXfCDpW9jnQ1nHuQHXZfJTC38AJLfGgZ7mo9nmd5MhyIy
         SBug==
X-Forwarded-Encrypted: i=1; AJvYcCVvdTsxk/XiNxyOr2qg7Ry7KBMstXOthR+Efc5tnvcz42Xq7St9UqWGxhWILHYC66cpwiczWewMZbbN7Fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxayxTA838IAk4e82tHg74yB4BQMAXIiH9Yux4CkBViw8v3Kd
	I056s7jRBdWP2Mb1f1xtQYCHUUzHRkZBNDQimUOBRTTLVqujLfmzQ/BMzT0O9/3eEwusQbtu/aU
	RMTpClKfMTIdcpr+qp8JeESiYe9Tez0SfBxD6pLzBeXzKplx4rLw6dmuKzzXuBtkVvpk7v6NNP9
	0ImW5a3qDX4gSr33dVrNdL8eKDKqBAu4SBwENY5mm1
X-Gm-Gg: ASbGnct/qCpezHIQC6eKMCXMSupZrHYorj0507e5okeSHy1dbMV7qHlY3rxniLh1Iz9
	AaIHlMvyLVsMuY1c4QxklNCRjlte2ihZ89QGiYH85GplziMZXeQso1xsKUVwWPJ/aMHU=
X-Received: by 2002:a05:6902:726:b0:e7d:9926:8bfa with SMTP id 3f1490d57ef6-e7d992698bamr7492106276.40.1748267767946;
        Mon, 26 May 2025 06:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6/c9lr+TAbVpG6J4lomzrC+5Fqw+cD9liLOLTj4YHysZUc3zSZfIwwilBGPgcyufFRQ1Bu826/aDBdCJ/pfU=
X-Received: by 2002:a05:6902:726:b0:e7d:9926:8bfa with SMTP id
 3f1490d57ef6-e7d992698bamr7492081276.40.1748267767587; Mon, 26 May 2025
 06:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526134949.907948-1-kshk@linux.ibm.com>
In-Reply-To: <20250526134949.907948-1-kshk@linux.ibm.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 26 May 2025 15:55:55 +0200
X-Gm-Features: AX0GCFu9lGy_XLKzXTOFqdveWLMPIwPqhG0BIVwB-1v6mcjATpC-MDj6A7atdG4
Message-ID: <CAGxU2F40O3xDSwA4m6r+O5bWoTJgRXqGfyMiLH_sMij+YmE5aw@mail.gmail.com>
Subject: Re: [PATCH net v2] vsock/test: Fix occasional failure in SOCK_STREAM
 SHUT_RD test
To: Konstantin Shkolnyy <kshk@linux.ibm.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mjrosato@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 15:50, Konstantin Shkolnyy <kshk@linux.ibm.com> wrote:
>
> The test outputs:
> "SOCK_STREAM SHUT_RD...expected send(2) failure, got 1".
>
> It tests that shutdown(fd, SHUT_RD) on one side causes send() to fail on
> the other side. However, sometimes there is a delay in delivery of the
> SHUT_RD command, send() succeeds and the test fails, even though the
> command is properly delivered and send() starts failing several
> milliseconds later.
>
> The delay occurs in the kernel because the used buffer notification
> callback virtio_vsock_rx_done(), called upon receipt of the SHUT_RD
> command, doesn't immediately disable send(). It delegates that to
> a kernel thread (via vsock->rx_work). Sometimes that thread is delayed
> more than the test expects.
>
> Change the test to keep calling send() until it fails or a timeout occurs.
>
> Fixes: b698bd97c5711 ("test/vsock: shutdowned socket test")
> Signed-off-by: Konstantin Shkolnyy <kshk@linux.ibm.com>
> ---
> Changes in v2:
>  - Move the new function to utils.c.

BTW I think I already fixed the same issue in this series:
https://lore.kernel.org/netdev/20250514141927.159456-1-sgarzare@redhat.com/

Can you check it?

Thanks,
Stefano

>
>  tools/testing/vsock/util.c       | 11 +++++++++++
>  tools/testing/vsock/util.h       |  1 +
>  tools/testing/vsock/vsock_test.c | 14 ++------------
>  3 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/vsock/util.c b/tools/testing/vsock/util.c
> index de25892f865f..04ac88dc4d3a 100644
> --- a/tools/testing/vsock/util.c
> +++ b/tools/testing/vsock/util.c
> @@ -798,3 +798,14 @@ void enable_so_zerocopy_check(int fd)
>         setsockopt_int_check(fd, SOL_SOCKET, SO_ZEROCOPY, 1,
>                              "setsockopt SO_ZEROCOPY");
>  }
> +
> +void vsock_test_for_send_failure(int fd, int send_flags)
> +{
> +       timeout_begin(TIMEOUT);
> +       while (true) {
> +               if (send(fd, "A", 1, send_flags) == -1)
> +                       return;
> +               timeout_check("expected send(2) failure");
> +       }
> +       timeout_end();
> +}
> diff --git a/tools/testing/vsock/util.h b/tools/testing/vsock/util.h
> index d1f765ce3eee..58c17cfb63d4 100644
> --- a/tools/testing/vsock/util.h
> +++ b/tools/testing/vsock/util.h
> @@ -79,4 +79,5 @@ void setsockopt_int_check(int fd, int level, int optname, int val,
>  void setsockopt_timeval_check(int fd, int level, int optname,
>                               struct timeval val, char const *errmsg);
>  void enable_so_zerocopy_check(int fd);
> +void vsock_test_for_send_failure(int fd, int send_flags);
>  #endif /* UTIL_H */
> diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
> index 613551132a96..b68a85a6d929 100644
> --- a/tools/testing/vsock/vsock_test.c
> +++ b/tools/testing/vsock/vsock_test.c
> @@ -1060,15 +1060,9 @@ static void sigpipe(int signo)
>
>  static void test_stream_check_sigpipe(int fd)
>  {
> -       ssize_t res;
> -
>         have_sigpipe = 0;
>
> -       res = send(fd, "A", 1, 0);
> -       if (res != -1) {
> -               fprintf(stderr, "expected send(2) failure, got %zi\n", res);
> -               exit(EXIT_FAILURE);
> -       }
> +       vsock_test_for_send_failure(fd, 0);
>
>         if (!have_sigpipe) {
>                 fprintf(stderr, "SIGPIPE expected\n");
> @@ -1077,11 +1071,7 @@ static void test_stream_check_sigpipe(int fd)
>
>         have_sigpipe = 0;
>
> -       res = send(fd, "A", 1, MSG_NOSIGNAL);
> -       if (res != -1) {
> -               fprintf(stderr, "expected send(2) failure, got %zi\n", res);
> -               exit(EXIT_FAILURE);
> -       }
> +       vsock_test_for_send_failure(fd, MSG_NOSIGNAL);
>
>         if (have_sigpipe) {
>                 fprintf(stderr, "SIGPIPE not expected\n");
> --
> 2.34.1
>

