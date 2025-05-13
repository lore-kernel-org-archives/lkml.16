Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA99257AE4
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143986; cv=none; b=dZCxhiWJIWHuIYIr0DVEnNd2cBYI0cwlSs7d91Bpxz4HRCiNfZORe/vscypo1jkNW5y1rXiPiVgunsLg3RKzN1U7NN/Hx91l5DR320W24Iju9/nXjnMp30+Opdplr1unMS71GyL7fkjo3aSfr3x/2eRF9Y3XBN6Xzsi5aKqPhVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143986; c=relaxed/simple;
	bh=0sH/Zz5U3ejyb7A/1UoukQjUMw+jDmh2HmotW9IgiF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmAkos8Qf/SJZndTNvDWaqmQGuvkzoBsPGt08KqXnIauWcbiQq5oWYWplKwA2/NBGD4WyCl4/JgHqFUBKe7bjkx6mdNxC2STyLdgOeKqZ5zqDuC482pg5pU4c5CW2POYRFg97Z0NG+xT1rPfyf42fSmEtJn5g0JBiUZoQfNqzuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g29h2C8M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g29h2C8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747143983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N/70FQOGYyD+dIqipphYHr/s8Vpxiqi+lh5GlyAwZuY=;
	b=g29h2C8MUve9U3FMF98r050TGHo1TF71rNubBXwve6Y029SiJaPZxRRG8PQPfQxA91XNYc
	XMqJWYCY0Sw0E54XqDMAtBe13gXrmzEy370JjEl3K4ghBEFVYz38TY+jjUkKy4CKeOWiU9
	1FPn0l0zIwpaG8Yo7sSjZP7fxOuKaZc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-819OaRdONfKTlHEbGo6eig-1; Tue, 13 May 2025 09:46:21 -0400
X-MC-Unique: 819OaRdONfKTlHEbGo6eig-1
X-Mimecast-MFC-AGG-ID: 819OaRdONfKTlHEbGo6eig_1747143981
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0bd4b4afdso1648016f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143981; x=1747748781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/70FQOGYyD+dIqipphYHr/s8Vpxiqi+lh5GlyAwZuY=;
        b=ap2pj05TeCDOBInf8r4k9SA1Udg9ttm49mxoqsDxllBEaNMeBu7mOyp26WuPd5YDXJ
         mfsg5lwiGLokajV+o01/Wqrgay0BP0zUVO8EpoTT3KtaFHBd1ncJ2pRUu2Bqt8EpTmlE
         xZbnKCUFzSPF+x1W8CnaZMATUDXoOGdVIFDs40TJITk3owyLC5fYbP7yT+1GcyCHEUop
         pJeW8FQF7bgPSYTsNklx1pGmo+1lSCvYbUvTMfM5qCTHFbBUxMLgPuSpinTWJzzvFXW+
         ASX99IwHen5+qsOxRYjVcjryzz6eb+oyIEkDriUzOX/UzEJJZOql1SX7v+kmEoRHJaCc
         3JeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI0X9Za/shz2cdsAoQYA8S+fjHabGAHJXf8z3lsZAb1/FYpQc3XK9w0+K8wZIgUY/GXxQpvUtcs5vOf/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzFUElBvNPVfHi1X80SJLVZyRKb4QpnezTEXTaqz3RHlchuHw
	707cN6UwHkdmtfSP0kB2YurJNJUk2O6w/+zcvYVWhASojxwzgLIJ9/3n3535uEVFOukLh/+mvdV
	beezn9Hpfmt0J/Yrp8M5CyPEG/STjcHPjTiqzR2JfnzOsZyoJlCpfy+vLOaZxcg==
X-Gm-Gg: ASbGncumHVDgqIyXmSA84F7MXWxL/ySEfxtqBvbTbcJvi8XcL0iVGXzL9nwBWEtIko6
	83mlPpZbUWWi09GVWvsC2Jb+pMNA8IFmFDGULTCgNXMs871ag9Zv6p6YjxTxrwNw9bKbrDKiTrz
	IS+3pfUJRg6JXvsRmuYepFhPHcEMsxMxZksGrBISjVQQH0YIJ0BQ3lsv7knOCQY+WzTDR28UyBk
	rFb43jAa37GfqC7GhPFCw7g42mNA+fpLigrDIg6TiWpgDlGy7uhVK+It+XlKdxJNEcHUM/DKjMB
	the9UyuDV/jbZ8o=
X-Received: by 2002:a05:6000:2410:b0:3a0:b294:cce9 with SMTP id ffacd0b85a97d-3a1f643a796mr12918282f8f.23.1747143980624;
        Tue, 13 May 2025 06:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWY7T39rW0AdmPAPBxdBlGBZlPcJ8Npi8waB/6mxTKr0KbpuEtniEFJdEonFVvK7Xgsw8DFg==
X-Received: by 2002:a05:6000:2410:b0:3a0:b294:cce9 with SMTP id ffacd0b85a97d-3a1f643a796mr12918246f8f.23.1747143980005;
        Tue, 13 May 2025 06:46:20 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2af7sm16485601f8f.52.2025.05.13.06.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:46:19 -0700 (PDT)
Date: Tue, 13 May 2025 15:46:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev
Subject: Re: [PATCH net-next 1/2] vsock/test: retry send() to avoid
 occasional failure in sigpipe test
Message-ID: <vheia3vqebshkzajzb6qhxppjvj7onvtjezw5pddfl6qqrnrma@h3dpvkla2pco>
References: <20250508142005.135857-1-sgarzare@redhat.com>
 <20250508142005.135857-2-sgarzare@redhat.com>
 <2c5581b9-c0a4-4620-ac82-0a98abfd4d0d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2c5581b9-c0a4-4620-ac82-0a98abfd4d0d@redhat.com>

On Tue, May 13, 2025 at 12:37:36PM +0200, Paolo Abeni wrote:
>On 5/8/25 4:20 PM, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> When the other peer calls shutdown(SHUT_RD), there is a chance that
>> the send() call could occur before the message carrying the close
>> information arrives over the transport. In such cases, the send()
>> might still succeed. To avoid this race, let's retry the send() call
>> a few times, ensuring the test is more reliable.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  tools/testing/vsock/vsock_test.c | 28 ++++++++++++++++++----------
>>  1 file changed, 18 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>> index d0f6d253ac72..7de870dee1cf 100644
>> --- a/tools/testing/vsock/vsock_test.c
>> +++ b/tools/testing/vsock/vsock_test.c
>> @@ -1064,11 +1064,18 @@ static void test_stream_check_sigpipe(int fd)
>>
>>  	have_sigpipe = 0;
>>
>> -	res = send(fd, "A", 1, 0);
>> -	if (res != -1) {
>> -		fprintf(stderr, "expected send(2) failure, got %zi\n", res);
>> -		exit(EXIT_FAILURE);
>> -	}
>> +	/* When the other peer calls shutdown(SHUT_RD), there is a chance that
>> +	 * the send() call could occur before the message carrying the close
>> +	 * information arrives over the transport. In such cases, the send()
>> +	 * might still succeed. To avoid this race, let's retry the send() call
>> +	 * a few times, ensuring the test is more reliable.
>> +	 */
>> +	timeout_begin(TIMEOUT);
>> +	do {
>> +		res = send(fd, "A", 1, 0);
>> +		timeout_check("send");
>> +	} while (res != -1);
>
>AFAICS the above could spin on send() for up to 10s, I would say
>considerably more than 'a few times' ;)
>
>In practice that could cause side effect on the timing of other
>concurrent tests (due to one CPU being 100% used for a while).
>
>What if the peer rcvbuf fills-up: will the send fail? That could cause
>false-negative.

Good point!

>
>I *think* it should be better to insert a short sleep in the loop.

Agree, I'll add.

Thanks,
Stefano

