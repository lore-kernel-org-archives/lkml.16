Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB341E0DFE
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126003; cv=none; b=UzsjNQv2N+y//nmRTo9cU0dC+fBoINf1C/+kyrgC9il7NwqMM4BQKq8sR8XEwmf3pWU4/7eyzAlZPX0SbRXFQlo2utdnUWdWSifwUSBmAVNqaeETkDuFp8BUwj6utLIn9QDJrX608pVgh7aHa1b2IWNSBS2PCZgx3X0ichGmKjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126003; c=relaxed/simple;
	bh=0GuB8YSQVYr0KabdMIst+G/9Rpiw1lRZH38yOGphJQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIHOQe6+1HMC+w7AFdz35HJ/FxyfiLZx+3LJZIYW6IqGRrwK/I2EJkqTxeDcTj2W3oCPUeYdEjnqWcws6d0TqbR0gfXVNEYBetOH5n4WZGJOxDmfeQ4ItsZiGVfArXeMlI69yHP3L3EwL7vAwO3jcRxRSnElHDfZXDk5Xcnr85A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FuHxBhBn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FuHxBhBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747126000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8xs4ZKnWv12yh+gYHNpynmUdUuOUulNWlTmGaOn+wA=;
	b=FuHxBhBnqjChLEzB8f3p6iqbXYOCzF//VNwPhVW0DHiMqCGKXlxxF67Wzvm29sDrx3M1T4
	bv0B5dSbs/+SU0moazOQCOfRg41Z3Mr7kmS6Y3XTcrB3yNr8e3gtRqvbRmrXN12dEf9/7d
	XxeOv7EFN/0qlG+/f/VcravhP6ARkXI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-Git2fMzxNlSRk2XwedJj5g-1; Tue, 13 May 2025 04:46:38 -0400
X-MC-Unique: Git2fMzxNlSRk2XwedJj5g-1
X-Mimecast-MFC-AGG-ID: Git2fMzxNlSRk2XwedJj5g_1747125998
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a1fa8742a8so1352076f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125997; x=1747730797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8xs4ZKnWv12yh+gYHNpynmUdUuOUulNWlTmGaOn+wA=;
        b=WLE0VpDBOBn7KksIz90HyrQpPH2Ehc/bx0mbkKTe7wPsd9VxHli/PN//EIbhf/E/t5
         rZodK5RpUd+ocRvWsqGvHNDo+psuin7D/rejtvTYW4DCP9wbMtq77kzUwl1ZFFnAQbw/
         AkNvknCm9iE0AfaASEB0/nQKI2fODHgulOvLXqhC3OvBydfkMc/9/wEOirp5MzB8r++v
         uSN/Xy7srpYs5+U/IzPhF3W3Egzb59rMdsVw+u0PNMO04d5AXW6p3f9tIssMsITjiteY
         CwFy8dztF6/2iqrVehnhttDw6+ZsIWHgjnVpD7i8rybQ32hKMpYwWC4Os1qRtx3rx3OC
         shbA==
X-Forwarded-Encrypted: i=1; AJvYcCUVk+HRLIUkN/iiSp81sLMRJv3mh/eXLfkZiAY6z9VLAjhPkzVzS2xz9nrXQYh6Mr0i+nUNUig2WhjKgzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0XfpjGKLtjPfk2JSFBzoPuTAO9lRgZ1Ecc38QFCgTCOnlOya
	7TcIf54zVJFLGipkqDIKRfHnWcF8p71UY9OYryiPTMuMFYGAzL0zfs+P5t5y7aL5Myg1i4RJ8zF
	SPoRaSEYz0AFJmDtYYTnbCf/NrgTpGHPDyBFAiZZrve+PnSk3HvMthLC+8XGokaHJCK0k8UUK
X-Gm-Gg: ASbGnctwXjzuPuFhB2dXtNRzItvZviOVgKuQvxtWp99X3CUBqTdFSf2KbrX1gB56Ptg
	KYKOZ3O+whJsiCNNyYFW+kNillLtDsPFEUUtPpZBW3aAt3KcUrSDkHNB3oOVTkdJ5yTZztHJBWi
	EvoChBaarwufC62K0CJXVps2y9gy+jh6jatJQnEUL4B8q9B8rBpegXld5qemQdQXFCOjHjICISU
	sWnXW5Bl4MO0gwcv5zViPOt1j605Iccx90KvMQH4vJQ7+YTeu5mt4af3SvBZ4MSnibvVSJQZYCq
	lmOLKaQ5QNAg7/lv/O0=
X-Received: by 2002:a05:6000:240d:b0:3a2:3b9:5c97 with SMTP id ffacd0b85a97d-3a203b95dfcmr6727879f8f.10.1747125997344;
        Tue, 13 May 2025 01:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDSttFe6Jwez3R7wkedD9iVeYiW0wRrmLZ9nP6Bo/A7PDTZwr6SDdFpC1d8B773hGd0wePnw==
X-Received: by 2002:a05:6000:240d:b0:3a2:3b9:5c97 with SMTP id ffacd0b85a97d-3a203b95dfcmr6727864f8f.10.1747125996972;
        Tue, 13 May 2025 01:46:36 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cc59:6510::f39? ([2a0d:3341:cc59:6510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c804sm15585138f8f.95.2025.05.13.01.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:46:36 -0700 (PDT)
Message-ID: <2d2a92d2-1844-49de-a869-4caf2677b099@redhat.com>
Date: Tue, 13 May 2025 10:46:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] vsock/test: Fix occasional failure in SIOCOUTQ
 tests
To: Konstantin Shkolnyy <kshk@linux.ibm.com>, sgarzare@redhat.com
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mjrosato@linux.ibm.com
References: <20250507151456.2577061-1-kshk@linux.ibm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250507151456.2577061-1-kshk@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 5:14 PM, Konstantin Shkolnyy wrote:
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

Could you please provide a suitable fixes tag?

No need to repost, just reply here.

Thanks!

Paolo

