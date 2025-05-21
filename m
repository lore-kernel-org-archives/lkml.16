Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B9B238C1E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818061; cv=none; b=tBRaI2XlABJGPe2qqQ3UF4JUpW2dNR9OmnIIErEP0znD6179OhjKOanFbbOJ66g87AcXjF0jrN4ZJKe2p/RseCMCsIwbQHSmOGZ12mB9ysUgVCsEjwAIldmZ+ek9wS29ernpgloLhahxH/30v9vu539RrV+Dic9GyifjRNamlTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818061; c=relaxed/simple;
	bh=zxqlcCHjn9DECK7D2DJ+PZqC71mdqOI3OEgJbzwKaWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ST+5db8CTRssqGoJnzma2Nyx/Ugn94NquX/ZwcTR5TUdGLdHTo216kiH/jUMNHa2sW0mBkMh6bqvr4kwtwWzGXbp3ctzBkmgiQw9KVonz5w4QE4PQ0bc1iFVDTDh91qsYSEcCYLh52GRsaZPv8SlYKLLe8bxcu/WS42K48l3B3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ubsl7cuR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ubsl7cuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747818058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AD4EK4fumuor3MaeEitkMqyIxHlSc7zrFrRly6wc7pM=;
	b=Ubsl7cuRN7860gWq4f1c7SVx5aNUB4ZpoXFYGuL1ahg+Sz+IB9mx24DIbTWtIp6FRew53k
	0WcsuiUBHFflFUNB/e7kE50t2HXuxs8Yr6JEzcUz4K+cpPfOenQl3v5k/xLPENophrnUt0
	/AIhbW5BwaOD6xLdem24V3Xc1Ygsn+E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-jPMz8e5HNOGZfvC2NFnuNg-1; Wed, 21 May 2025 05:00:57 -0400
X-MC-Unique: jPMz8e5HNOGZfvC2NFnuNg-1
X-Mimecast-MFC-AGG-ID: jPMz8e5HNOGZfvC2NFnuNg_1747818056
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso412048466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747818056; x=1748422856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD4EK4fumuor3MaeEitkMqyIxHlSc7zrFrRly6wc7pM=;
        b=VqXFapf4a4WsJR7/U+7RTrZ28IIqc+SbA+9T/l8olDjtYHynPBO01/2Gxcq5hdTDZ1
         0H8NTSMOEn4yuXqqqiUfu65uBodqCl4+VdjIQNcqt9T3SkiANPoDXzoLam6RV7BU2wam
         ezcyvWNYMz1+TxFm4f/bNVgIqErAPtLNrROCLkLbGPkdDdgjZG/vlcnWGFUYDz3cw9wt
         LCbZl08608k+akcx3RPDu4bUWgvjRVAcyAtzPQvzR3AOX8LJAfGJkUJTYNwSTkkLu5tT
         ORjjH4Jeus99zzGlGJNDMb3vsusnEJRhbBnyl4k5yMVHzKqy46VBcymZbmgRjTUsoDxo
         cfog==
X-Forwarded-Encrypted: i=1; AJvYcCUXYifVDM0Ktkgp7Gv/tqgvD4L1ecWbz1UbekFokCswyedbHiPgiCGQcZI5LqBmStPACHYAfeTC8EHPXGU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP9Z6o75qozHtLZdL49+8/MtShkvco8dS9oDTD7F24Ukqx7909
	C52E/r/zcvFa/by7ABCnFYxRalECpL55qYSqREPz11vvxTOpilPQ/XFmpwDZhdKIUn3HqnMnBFc
	XUFkBN5h+G4qnsaGHMK/8nnKvqhBDFRVRSRlWZ4B4feDH+C9d492pVY5gF1Ay4wSZ9g==
X-Gm-Gg: ASbGncuXm95UltQoku2ukx2AR1+4ulek6Bdt+y0tyfKftNJXu3cE7HpbtnBb7HCF3CD
	7zzYh3fkUpnoT0UMTdopgtc5EkItGZK/rI1E5zUkw0FxGPIU4x2hH9jIm+i/8Jgsmx+IxxkVGrt
	TCU4ptfR4kspIxegLtJ0nHhQZF/EQ5w97YNNLuoc0u34MYyto3h7/9cmhDOIL1/U0csmxHiaV7P
	Hownmoc4/hPtcYhs643IRJtvPbtSzq4zyPZf115I9zHmmLZWcEkKJ2SLOyALUwHjOZmE57lgHqj
	MWzbpB/VVFmMVEKoBYS7/NqgmN3aU7u1FsmZUojfx66eyU3+WJmzgWMSwS43
X-Received: by 2002:a17:906:4789:b0:ad5:4cd4:5bfd with SMTP id a640c23a62f3a-ad54cd46015mr1406566966b.12.1747818055846;
        Wed, 21 May 2025 02:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjCfNk8+hZJGGzRrIjNaK7ckU8gBwZmBkU+v/X6tNeZwj/R7jjaFqDeo7WbqVCQp/yENzVvA==
X-Received: by 2002:a17:906:4789:b0:ad5:4cd4:5bfd with SMTP id a640c23a62f3a-ad54cd46015mr1406563166b.12.1747818055228;
        Wed, 21 May 2025 02:00:55 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e665sm862194666b.5.2025.05.21.02.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:00:54 -0700 (PDT)
Date: Wed, 21 May 2025 11:00:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: davem@davemloft.net, fupan.lfp@antgroup.com, jasowang@redhat.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, mst@redhat.com, 
	niuxuewei.nxw@antgroup.com, pabeni@redhat.com, stefanha@redhat.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH 3/3] test/vsock: Add ioctl SIOCINQ tests
Message-ID: <k6vzt5brosmomqzb7ibripcxh4pauz4juwqvhv77sv7vbywglq@m4bpb3hpoc3n>
References: <66nlxrh4spcyhp666gqhovnevnnarq2a56fxgkffijnwiartrt@622gumoesmde>
 <20250521021547.3219644-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250521021547.3219644-1-niuxuewei.nxw@antgroup.com>

On Wed, May 21, 2025 at 10:15:47AM +0800, Xuewei Niu wrote:
>> On Mon, May 19, 2025 at 03:06:49PM +0800, Xuewei Niu wrote:
>> >This patch adds two tests for ioctl SIOCINQ for SOCK_STREAM and
>> >SOCK_SEQPACKET. The client waits for the server to send data, and checks if
>> >the return value of the SIOCINQ is the size of the data. Then, consumes the
>> >data and checks if the value is 0.
>>
>> We recently fixed the SIOCOUTQ test, see:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7fd7ad6f36af36f30a06d165eff3780cb139fa79
>>
>> Should we do the same here?
>
>Yeah! Indeed, we have recognized this issue before. I think it is better to
>wrap this ioctl operation in a function in "tools/testing/vsock/util.c" and
>make it reusable.

Yep, if that helps to reduce code duplication, it's fine.

Thanks,
Stefano

>
>Will do.
>
>> >
>> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >---
>> > tools/testing/vsock/vsock_test.c | 102 +++++++++++++++++++++++++++++++
>> > 1 file changed, 102 insertions(+)
>> >
>> >diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>> >index d0f6d253ac72..8b3fb88e2877 100644
>> >--- a/tools/testing/vsock/vsock_test.c
>> >+++ b/tools/testing/vsock/vsock_test.c
>> >@@ -1282,6 +1282,78 @@ static void test_unsent_bytes_client(const struct test_opts *opts, int type)
>> > 	close(fd);
>> > }
>> >
>> >+static void test_unread_bytes_server(const struct test_opts *opts, int type)
>> >+{
>> >+	unsigned char buf[MSG_BUF_IOCTL_LEN];
>> >+	int client_fd;
>> >+
>> >+	client_fd = vsock_accept(VMADDR_CID_ANY, opts->peer_port, NULL, type);
>> >+	if (client_fd < 0) {
>> >+		perror("accept");
>> >+		exit(EXIT_FAILURE);
>> >+	}
>> >+
>> >+	for (int i = 0; i < sizeof(buf); i++)
>> >+		buf[i] = rand() & 0xFF;
>> >+
>> >+	send_buf(client_fd, buf, sizeof(buf), 0, sizeof(buf));
>> >+	control_writeln("SENT");
>> >+	control_expectln("RECEIVED");
>> >+
>> >+	close(client_fd);
>> >+}
>> >+
>> >+static void test_unread_bytes_client(const struct test_opts *opts, int type)
>> >+{
>> >+	unsigned char buf[MSG_BUF_IOCTL_LEN];
>> >+	int ret, fd;
>> >+	int sock_bytes_unread;
>> >+
>> >+	fd = vsock_connect(opts->peer_cid, opts->peer_port, type);
>> >+	if (fd < 0) {
>> >+		perror("connect");
>> >+		exit(EXIT_FAILURE);
>> >+	}
>> >+
>> >+	control_expectln("SENT");
>> >+	// The data have come in but is not read, the expected value is
>> >+	// MSG_BUF_IOCTL_LEN.
>> >+	ret = ioctl(fd, SIOCINQ, &sock_bytes_unread);
>> >+	if (ret < 0) {
>> >+		if (errno == EOPNOTSUPP) {
>> >+			fprintf(stderr,
>> >+				"Test skipped, SIOCINQ not supported.\n");
>> >+			goto out;
>> >+		} else {
>> >+			perror("ioctl");
>> >+			exit(EXIT_FAILURE);
>> >+		}
>> >+	} else if (ret == 0 && sock_bytes_unread != MSG_BUF_IOCTL_LEN) {
>> >+		fprintf(stderr,
>> >+			"Unexpected 'SIOCOUTQ' value, expected %d, got %i\n",
>> >+			MSG_BUF_IOCTL_LEN, sock_bytes_unread);
>> >+		exit(EXIT_FAILURE);
>> >+	}
>> >+
>> >+	recv_buf(fd, buf, sizeof(buf), 0, sizeof(buf));
>> >+	// The data is consumed, so the expected is 0.
>> >+	ret = ioctl(fd, SIOCINQ, &sock_bytes_unread);
>> >+	if (ret < 0) {
>> >+		// Don't ignore EOPNOTSUPP since we have already checked it!
>> >+		perror("ioctl");
>> >+		exit(EXIT_FAILURE);
>> >+	} else if (ret == 0 && sock_bytes_unread != 0) {
>> >+		fprintf(stderr,
>> >+			"Unexpected 'SIOCOUTQ' value, expected 0, got %i\n",
>> >+			sock_bytes_unread);
>> >+		exit(EXIT_FAILURE);
>> >+	}
>> >+	control_writeln("RECEIVED");
>> >+
>> >+out:
>> >+	close(fd);
>> >+}
>> >+
>> > static void test_stream_unsent_bytes_client(const struct test_opts *opts)
>> > {
>> > 	test_unsent_bytes_client(opts, SOCK_STREAM);
>> >@@ -1302,6 +1374,26 @@ static void test_seqpacket_unsent_bytes_server(const struct test_opts *opts)
>> > 	test_unsent_bytes_server(opts, SOCK_SEQPACKET);
>> > }
>> >
>> >+static void test_stream_unread_bytes_client(const struct test_opts *opts)
>> >+{
>> >+	test_unread_bytes_client(opts, SOCK_STREAM);
>> >+}
>> >+
>> >+static void test_stream_unread_bytes_server(const struct test_opts *opts)
>> >+{
>> >+	test_unread_bytes_server(opts, SOCK_STREAM);
>> >+}
>> >+
>> >+static void test_seqpacket_unread_bytes_client(const struct test_opts *opts)
>> >+{
>> >+	test_unread_bytes_client(opts, SOCK_SEQPACKET);
>> >+}
>> >+
>> >+static void test_seqpacket_unread_bytes_server(const struct test_opts *opts)
>> >+{
>> >+	test_unread_bytes_server(opts, SOCK_SEQPACKET);
>> >+}
>> >+
>> > #define RCVLOWAT_CREDIT_UPD_BUF_SIZE	(1024 * 128)
>> > /* This define is the same as in 'include/linux/virtio_vsock.h':
>> >  * it is used to decide when to send credit update message during
>> >@@ -1954,6 +2046,16 @@ static struct test_case test_cases[] = {
>> > 		.run_client = test_seqpacket_unsent_bytes_client,
>> > 		.run_server = test_seqpacket_unsent_bytes_server,
>> > 	},
>> >+	{
>> >+		.name = "SOCK_STREAM ioctl(SIOCINQ) functionality",
>> >+		.run_client = test_stream_unread_bytes_client,
>> >+		.run_server = test_stream_unread_bytes_server,
>> >+	},
>> >+	{
>> >+		.name = "SOCK_SEQPACKET ioctl(SIOCINQ) functionality",
>> >+		.run_client = test_seqpacket_unread_bytes_client,
>> >+		.run_server = test_seqpacket_unread_bytes_server,
>> >+	},
>>
>> Please, append new test at the end, so we will not change test IDs.
>>
>> Thanks,
>> Stefano
>
>Will do.
>
>Thanks,
>Xuewei
>
>> > 	{
>> > 		.name = "SOCK_STREAM leak accept queue",
>> > 		.run_client = test_stream_leak_acceptq_client,
>> >--
>> >2.34.1
>> >
>

