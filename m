Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FF326C389
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524602; cv=none; b=K4ZhDj0jTiWHlyU3yAMqFG1BcfhvNCgn/7lQjhkaHtpNDgnZ2shXMiGevysqmb/2SwmnjVHShH9QQCBqbU2JdKvoGOoxFJP5nqNOLYUfczsCCwUro315TdBCSeKEF32auVFdyng1u+T8Hn7/zXmW47zme1j8Nsso8nCMC723YwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524602; c=relaxed/simple;
	bh=OdYxdf2NS9wIbAV3ovwDZCL2iMe9F3X5Sqi4us7Hjcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AImNcVqNeLlM1/f3fAGDWqX+S7XXqjrh/mpMbURozV9xucUbf213OYVBTuYC+OCqA2mlYNZLLV3YRdCAG8jpw4K1YVMTr52h2MLYrMWf5X4sJVnEc9mDH+Wmu1bdi9pKFeX9AHUahQx8qBpXALsqRXtewyHExG9nDvH7sFD9mnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wj23g8UW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wj23g8UW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746524599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DXoAgnolhnIWon+GSP4Yh+No5sQktwbAsoZby2qJ9Oc=;
	b=Wj23g8UWerKGFt/Klh4jxybrIGdIQgYalp64TlKG9UZEtEPF5zmhfHTDHJAnEECDHoPkjK
	AjEnKRZJ28xh44YOQY36c21Hx04wNAsaxd73/Fsit7UBFHicKSEiZYEXjDzXuhRDBSqj14
	4SIWCMlGzM8xwp9ST7eLD3E2od/TBFs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-Ju9gPbeRPSS_462iCtrNNA-1; Tue, 06 May 2025 05:43:16 -0400
X-MC-Unique: Ju9gPbeRPSS_462iCtrNNA-1
X-Mimecast-MFC-AGG-ID: Ju9gPbeRPSS_462iCtrNNA_1746524595
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ace99fe4282so594993966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524595; x=1747129395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXoAgnolhnIWon+GSP4Yh+No5sQktwbAsoZby2qJ9Oc=;
        b=TqjkXpFNHPRSjMeC3ozgixbyPCXUmgHMRj2pWImf92v66Wp/y/+3Uf4Ueq0v1CDMKv
         F+ALrbjroA2il+eGrQvLqvyJm90t22Z0Oaq74QIJ7zdiRKIl3UfZEwgRzCcpsgImiPk+
         PQnmanTGSb9oT5EC5IE4WERElMhHiAd+FbYgM9tHZju5YaJ+rksFYLxPDF3/mCQTCJdW
         MLPVXPaN2MYj99BgUTEiyShT/g+iHFUqkPipU1p5Tge65MFuok7nbuC2UCpBLJF7pZKm
         9CYFVRnnvc4qX42iW6dVvpuVd2tE4Eb8xfAllB8fHCSiiL/CwJGFhsW6Yv3pvPV8iy/d
         r2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSvYDBSfyIq0g5rH8vVD5o5JuHmvqyKLFzkPorcWq3UFDgamD1PvpMKNiWq5r1ZVpCSa9XGoAjxx0ST+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJEhgdDK1BG5gTTTLvOR2Z9N/LOv84q1mh6K7rne4z/a9FF1f8
	02rbsWDLSYiVyeDY6n8DFiOtuRqkk4X6YQSTyifnw6kOEAnaG8I+IrH+bNSC3V+galGLHeZpOoa
	Yxas/67shUM7Iw5YDfwhnxu/Ucu/X1GoPkCW+8eQSl0PE6k/BGQB69D72OmMOpQ==
X-Gm-Gg: ASbGncvyD7BnqqTu9izwNpMZo0ZI+Q9P/vYfq22gMEggqV+izR7D0rHw+uUa1gDiQ2p
	7wFxA9ZZh5nqGqG3kAkHEboSS33tGzj8M2N76F5uU/1jerJNTmvyYUyHhz5TrYAQwLoQjbyshP6
	dUQI1Jlbr/xhi1HpJzS+i7HOAnQp9B+bnIgV9JM/py7mzLjOQVvFMXhMvu2S/eOvQyvz0jG2hku
	MXzZhRW8Zj3bTIpB1xmrXIYU3A60y1UisccmwRXyxXuqbu2Q0sghMdjZRLD+nzKEx1a8KX58A7q
	ZoBazQ5oQTymjGG0rg==
X-Received: by 2002:a17:907:6eac:b0:ac7:b213:b7e5 with SMTP id a640c23a62f3a-ad1d2ecb11emr249438866b.18.1746524595036;
        Tue, 06 May 2025 02:43:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr2idRnebYQGCDDQ8BywfWXGWGiLs9tHDNaPLdjiBxzUREqjzvsHE6e+fFczVT0Qkx8Sxwyg==
X-Received: by 2002:a17:907:6eac:b0:ac7:b213:b7e5 with SMTP id a640c23a62f3a-ad1d2ecb11emr249435966b.18.1746524594435;
        Tue, 06 May 2025 02:43:14 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.219.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540dabsm671051666b.171.2025.05.06.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:43:13 -0700 (PDT)
Date: Tue, 6 May 2025 11:43:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/3] vsock/test: Expand linger test to ensure
 close() does not misbehave
Message-ID: <g5wemyogxthe43rkigufv7p5wrkegbdxbleujlsrk45dmbmm4l@qdynsbqfjwbk>
References: <20250501-vsock-linger-v4-0-beabbd8a0847@rbox.co>
 <20250501-vsock-linger-v4-3-beabbd8a0847@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250501-vsock-linger-v4-3-beabbd8a0847@rbox.co>

On Thu, May 01, 2025 at 10:05:24AM +0200, Michal Luczaj wrote:
>There was an issue with SO_LINGER: instead of blocking until all queued
>messages for the socket have been successfully sent (or the linger timeout
>has been reached), close() would block until packets were handled by the
>peer.

This is a new behaviour that only new kernels will follow, so I think
it is better to add a new test instead of extending a pre-existing test
that we described as "SOCK_STREAM SO_LINGER null-ptr-deref".

The old test should continue to check the null-ptr-deref also for old
kernels, while the new test will check the new behaviour, so we can skip
the new test while testing an old kernel.

Thanks,
Stefano

>
>Add a check to alert on close() lingering when it should not.
>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
> tools/testing/vsock/vsock_test.c | 30 +++++++++++++++++++++++++++---
> 1 file changed, 27 insertions(+), 3 deletions(-)
>
>diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>index d0f6d253ac72d08a957cb81a3c38fcc72bec5a53..82d0bc20dfa75041f04eada1b4310be2f7c3a0c1 100644
>--- a/tools/testing/vsock/vsock_test.c
>+++ b/tools/testing/vsock/vsock_test.c
>@@ -1788,13 +1788,16 @@ static void test_stream_connect_retry_server(const struct test_opts *opts)
> 	close(fd);
> }
>
>+#define	LINGER_TIMEOUT	1	/* seconds */
>+
> static void test_stream_linger_client(const struct test_opts *opts)
> {
> 	struct linger optval = {
> 		.l_onoff = 1,
>-		.l_linger = 1
>+		.l_linger = LINGER_TIMEOUT
> 	};
>-	int fd;
>+	int bytes_unsent, fd;
>+	time_t ts;
>
> 	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
> 	if (fd < 0) {
>@@ -1807,7 +1810,28 @@ static void test_stream_linger_client(const struct test_opts *opts)
> 		exit(EXIT_FAILURE);
> 	}
>
>+	/* Byte left unread to expose any incorrect behaviour. */
>+	send_byte(fd, 1, 0);
>+
>+	/* Reuse LINGER_TIMEOUT to wait for bytes_unsent == 0. */
>+	timeout_begin(LINGER_TIMEOUT);
>+	do {
>+		if (ioctl(fd, SIOCOUTQ, &bytes_unsent) < 0) {
>+			perror("ioctl(SIOCOUTQ)");
>+			exit(EXIT_FAILURE);
>+		}
>+		timeout_check("ioctl(SIOCOUTQ) == 0");
>+	} while (bytes_unsent != 0);
>+	timeout_end();
>+
>+	ts = current_nsec();
> 	close(fd);
>+	if ((current_nsec() - ts) / NSEC_PER_SEC > 0) {
>+		fprintf(stderr, "Unexpected lingering on close()\n");
>+		exit(EXIT_FAILURE);
>+	}
>+
>+	control_writeln("DONE");
> }
>
> static void test_stream_linger_server(const struct test_opts *opts)
>@@ -1820,7 +1844,7 @@ static void test_stream_linger_server(const struct test_opts *opts)
> 		exit(EXIT_FAILURE);
> 	}
>
>-	vsock_wait_remote_close(fd);
>+	control_expectln("DONE");
> 	close(fd);
> }
>
>
>-- 
>2.49.0
>

