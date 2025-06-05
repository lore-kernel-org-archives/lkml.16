Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA53C17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120584; cv=none; b=VoKf+oq8wpyI7XTPQWrH8u0kYrxm+8ukawPngK6Y6auSiW7di9wjZudvhC5veBeoneVlKBYooDzYQ74HvLqcvj5+wgSw/M96s0f+LhCp39OpQHVIGNvHt20+NNHLpSm5+FzW+i+mgKHovWNL6cT6P4pUJ9feODuFpY84KEANqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120584; c=relaxed/simple;
	bh=v6xtrxLxYH2hT45AwJwhvKFFiSUu0RR5YURtbwGRkts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmNya/eAsgdTyp7QIPT9wKrtYeb7TafPKpn786/nPxPvasAVpsM0xM4Agg/bLH8nc4O6252uUidUj9sG4rRC1xZN8vXsJk4OBl1ivaBpZ/yQk0M4ZrmufKWg9QxoQfG1KsQln5VNRDZP28OLAQFgcvJGm5p8dsauWdFE4EG4YNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J3pmxSuV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J3pmxSuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749120581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFCw24n0s12QidmEWqSONjnqNtdgJB5XvQGER4+bs+o=;
	b=J3pmxSuVNbf38IVFexS3ncxv/qwuN4/ASviy7RnisqNJ2gPQPDA5w5OfIptVfVwHNwmFrL
	EHu32n3XOfZa9MCD+x2/EG1vjLxsl9Kwbr56a0167HmbFiimdcoDgamOQw8j+wiG/2MMs+
	lkesWsQCY4tiRuaGxzlf9XQ5gbgUhmo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-7qp4MUyXO9qC00LGOizzzQ-1; Thu, 05 Jun 2025 06:49:40 -0400
X-MC-Unique: 7qp4MUyXO9qC00LGOizzzQ-1
X-Mimecast-MFC-AGG-ID: 7qp4MUyXO9qC00LGOizzzQ_1749120579
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a58f455cdbso7583001cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120579; x=1749725379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFCw24n0s12QidmEWqSONjnqNtdgJB5XvQGER4+bs+o=;
        b=kuJKZs9HXDVUu+4NHOMmhrE4BGSH/tqI2XDNv/9rFxG+/zHD3eNcmfPkeM3WVpYtfG
         xbSxUlxmjPhG5JwO7MBYPy9WETcH/FWe3XVW/PMHpuFVg7dz2A5W2QqkdeQm4XOq5gOH
         ow3HmRwBSYe5Z93SOakoiFIlOp2PAlpVKzOw4WNFPld3lR5lWzVFib/bGd87yUEk7C0C
         vkP5JZ1g23pkwjncYGKoSWZrg6xHW/J1qs1isyBZiOyf8bNsn0KXIiC+3kskiw8qCLS3
         wCO/sjsrEHwPme30a/UxX1OZO/tsfOmWTHzysVoTcOWyp2FbnPvVwMv13hSSigybCiBo
         76Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWovLgf7bMGG3PVUNl6eyOL4H/lQznaorxoFDglr3d6Ltsw0E7QON6mMsW0eaQeulxQMO2CikQ8Ln6RtEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbUXD3pZ3wtslpJpJbWwjvccHtqDlnICL/8FV48VZ0cPeEVVzI
	cmypv2u108lwpZLk+o5vwQdZhWxbs0GVFhAD6zydQM8O91mU0jfybGrnoxuo2zZi4nF5NbB1Ey2
	TZjMF/SG6DJY+CCVd1gFhELasOvVlS2j4vLpvVJR6IH4g5ILfp28ngBa1lcQ9m0j2u7UCD2yKit
	WD
X-Gm-Gg: ASbGncuYI18YOrtZqj3pS2BDFB/dXY5CZTGk38tb6PQrTTnk6x+dGn1OgiOCYTtW68a
	DUnJ4mF3h1Axk9vKXPgwSM8CPIbVioc/lmM9cVoE8DjTkmPnUGaonFY/ZYF1QaEqWEeuxnB2twh
	RYx4PhvPKpumzqbB92EIdUt1hDMqd0HTFZVV14UR74gufwJHxV5J1QI89GmYAQyArvyzRaJo5y3
	JLDJYz1+6u8fnx4AGn/IiN+kSUbmmSvU6HvNI5Fc2PyA3IznUp//r9CXWf3tUg8Qtt3l6yhDzs8
	z/GhLSwNWG2wL7/buFmUhsBbC1d+L5weqsyTAZyj
X-Received: by 2002:a05:622a:1e09:b0:494:7e12:3af1 with SMTP id d75a77b69052e-4a5a57d78c9mr86480671cf.36.1749120579343;
        Thu, 05 Jun 2025 03:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuytOkkTXaF9171ida68ClPpKBp0qePtAr6diOEmKuDIQGiXedMTQ5nJki//BunkRdWpInWg==
X-Received: by 2002:a05:622a:1e09:b0:494:7e12:3af1 with SMTP id d75a77b69052e-4a5a57d78c9mr86480401cf.36.1749120578921;
        Thu, 05 Jun 2025 03:49:38 -0700 (PDT)
Received: from sgarzare-redhat (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a371bcsm109556211cf.52.2025.06.05.03.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:49:38 -0700 (PDT)
Date: Thu, 5 Jun 2025 12:49:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net-next v2 3/3] vsock/test: Cover more CIDs in
 transport_uaf test
Message-ID: <dth7n7nahmfzbiymldaxmlir64o2ck5iqo2zldppiukfpwdiqh@u6342kxtih4c>
References: <20250528-vsock-test-inc-cov-v2-0-8f655b40d57c@rbox.co>
 <20250528-vsock-test-inc-cov-v2-3-8f655b40d57c@rbox.co>
 <ocuwnpdoo7yxoqiockcs7yopoayg5x4b747ksvy4kmk3ds6lb3@f7zgcx7gigt5>
 <77c48b6d-4539-4d01-bd7f-7b5415b7b995@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <77c48b6d-4539-4d01-bd7f-7b5415b7b995@rbox.co>

On Wed, Jun 04, 2025 at 09:11:33PM +0200, Michal Luczaj wrote:
>On 6/4/25 11:37, Stefano Garzarella wrote:
>> On Wed, May 28, 2025 at 10:44:43PM +0200, Michal Luczaj wrote:
>>> +static bool test_stream_transport_uaf(int cid)
>>> {
>>> 	int sockets[MAX_PORT_RETRIES];
>>> 	struct sockaddr_vm addr;
>>> -	int fd, i, alen;
>>> +	socklen_t alen;
>>> +	int fd, i, c;
>>> +	bool ret;
>>> +
>>> +	/* Probe for a transport by attempting a local CID bind. Unavailable
>>> +	 * transport (or more specifically: an unsupported transport/CID
>>> +	 * combination) results in EADDRNOTAVAIL, other errnos are fatal.
>>> +	 */
>>> +	fd = vsock_bind_try(cid, VMADDR_PORT_ANY, SOCK_STREAM);
>>> +	if (fd < 0) {
>>> +		if (errno != EADDRNOTAVAIL) {
>>> +			perror("Unexpected bind() errno");
>>> +			exit(EXIT_FAILURE);
>>> +		}
>>>
>>> -	fd = vsock_bind(VMADDR_CID_ANY, VMADDR_PORT_ANY, SOCK_STREAM);
>>> +		return false;
>>> +	}
>>>
>>> 	alen = sizeof(addr);
>>> 	if (getsockname(fd, (struct sockaddr *)&addr, &alen)) {
>>> @@ -1735,38 +1746,73 @@ static void test_stream_transport_uaf_client(const struct test_opts *opts)
>>> 		exit(EXIT_FAILURE);
>>> 	}
>>>
>>> +	/* Drain the autobind pool; see __vsock_bind_connectible(). */
>>> 	for (i = 0; i < MAX_PORT_RETRIES; ++i)
>>> -		sockets[i] = vsock_bind(VMADDR_CID_ANY, ++addr.svm_port,
>>> -					SOCK_STREAM);
>>> +		sockets[i] = vsock_bind(cid, ++addr.svm_port, SOCK_STREAM);
>>>
>>> 	close(fd);
>>> -	fd = socket(AF_VSOCK, SOCK_STREAM, 0);
>>> +	fd = socket(AF_VSOCK, SOCK_STREAM | SOCK_NONBLOCK, 0);
>>
>> Why we need this change?
>
>It's for the (void)connect() below (not the connect() expecting early
>EADDRNOTAVAIL, the second one). We're not connecting to anything anyway, so
>there's no point entering the main `while (sk->sk_state != TCP_ESTABLISHED`
>loop in vsock_connect().

I see now, please mention it in the commit description or a comment in 
the code (maybe better the latter).

>
>>> 	if (fd < 0) {
>>> 		perror("socket");
>>> 		exit(EXIT_FAILURE);
>>> 	}
>>>
>>> -	if (!vsock_connect_fd(fd, addr.svm_cid, addr.svm_port)) {
>>> -		perror("Unexpected connect() #1 success");
>>> +	/* Assign transport, while failing to autobind. Autobind pool was
>>> +	 * drained, so EADDRNOTAVAIL coming from __vsock_bind_connectible() is
>>> +	 * expected.
>>> +	 */
>>> +	addr.svm_port = VMADDR_PORT_ANY;
>
>(Ugh, this line looks useless...)

Yep, agree.

>
>>> +	if (!connect(fd, (struct sockaddr *)&addr, alen)) {
>>> +		fprintf(stderr, "Unexpected connect() success\n");
>>> +		exit(EXIT_FAILURE);
>>> +	} else if (errno == ENODEV) {
>>> +		/* Handle unhappy vhost_vsock */
>>
>> Why it's unhappy? No peer?
>
>It's the case of test_stream_transport_uaf(VMADDR_CID_HOST) when only
>vhost_vsock transport is loaded. Before we even reach (and fail)
>vsock_auto_bind(), vsock_assign_transport() fails earlier: `new_transport`
>gets set to `transport_g2h` (NULL) and then it's `if (!new_transport)
>return -ENODEV`. So the idea was to swallow this errno and let the caller
>report that nothing went through.
>
>I guess we can narrow this down to `if (errno == ENODEV && cid ==
>VMADDR_CID_HOST)`.

I see, yep I agree on this new idea.

>
>>> +		ret = false;
>>> +		goto cleanup;
>>> +	} else if (errno != EADDRNOTAVAIL) {
>>> +		perror("Unexpected connect() errno");
>>> 		exit(EXIT_FAILURE);
>>> 	}
>>>
>>> -	/* Vulnerable system may crash now. */
>>> -	if (!vsock_connect_fd(fd, VMADDR_CID_HOST, VMADDR_PORT_ANY)) {
>>> -		perror("Unexpected connect() #2 success");
>>> -		exit(EXIT_FAILURE);
>>> +	/* Reassign transport, triggering old transport release and
>>> +	 * (potentially) unbinding of an unbound socket.
>>> +	 *
>>> +	 * Vulnerable system may crash now.
>>> +	 */
>>> +	for (c = VMADDR_CID_HYPERVISOR; c <= VMADDR_CID_HOST + 1; ++c) {
>>> +		if (c != cid) {
>>> +			addr.svm_cid = c;
>>> +			(void)connect(fd, (struct sockaddr *)&addr, alen);
>>> +		}
>>> 	}
>>>
>>> +	ret = true;
>>> +cleanup:
>>> 	close(fd);
>>> 	while (i--)
>>> 		close(sockets[i]);
>>>
>>> -	control_writeln("DONE");
>>> +	return ret;
>>> }
>>>
>>> -static void test_stream_transport_uaf_server(const struct test_opts *opts)
>>> +/* Test attempts to trigger a transport release for an unbound socket. This can
>>> + * lead to a reference count mishandling.
>>> + */
>>> +static void test_stream_transport_uaf_client(const struct test_opts *opts)
>>> {
>>> -	control_expectln("DONE");
>>> +	bool tested = false;
>>> +	int cid, tr;
>>> +
>>> +	for (cid = VMADDR_CID_HYPERVISOR; cid <= VMADDR_CID_HOST + 1; ++cid)
>>> +		tested |= test_stream_transport_uaf(cid);
>>> +
>>> +	tr = get_transports();
>>> +	if (!tr)
>>> +		fprintf(stderr, "No transports detected\n");
>>> +	else if (tr == TRANSPORT_VIRTIO)
>>> +		fprintf(stderr, "Setup unsupported: sole virtio transport\n");
>>> +	else if (!tested)
>>> +		fprintf(stderr, "No transports tested\n");
>>> }
>>>
>>> static void test_stream_connect_retry_client(const struct test_opts *opts)
>>> @@ -2034,7 +2080,6 @@ static struct test_case test_cases[] = {
>>> 	{
>>> 		.name = "SOCK_STREAM transport release use-after-free",
>>> 		.run_client = test_stream_transport_uaf_client,
>>> -		.run_server = test_stream_transport_uaf_server,
>>
>> Overall LGTM. I was not able to apply, so I'll test next version.
>
>Bummer, I'll make sure to rebase.

Thanks!
Stefano

