Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F162D46AC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632256; cv=none; b=swHj2KMIGQXccsaeivMi6vlJov106esGCV9aIH0CtmGr7923uDRFwhkyRQ7q5577Oh0df8Yn7Pq4Bee/Yxs3fTaWl+2SZlBmylolzhADyNt1g4QdP5r2UqZx02O7EY2cd/W4Dq7/uO4D4WFVz0MYH5AciMHHBKPjTEIyleZZW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632256; c=relaxed/simple;
	bh=K2d10XQLTG7Ul5SDwI/aJTOW6i7f7ldw3wQqMDGme4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRIB9iQyG26idCqicvhW2Xbv/SjKPMbTY7mmeIM0yX8l8Pu9ctcEmlm2CIKzXxCltvEKKyoSQE5fdDkWzMsVYj0hN6+fe6r5cMUtG2tWaLyxULQADkKMZeI91H+sPqBxqL9WkE72AuSErE5j079Ju6e0Xz7wWYffuFPFd9zq93U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMDea8ey; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMDea8ey"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so1796097a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751632253; x=1752237053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3eL7ggN4EThqkSufl95lxEu7wvlLi27XNgIMFlyQ+U4=;
        b=CMDea8eyITN8Zy/7mqknUU590ksH5V2B1A752XAFWZe04ivpj1b3kAaNFYAjDj0oZZ
         nzDSSSYXY/WHxA+TmaebzbDOe36byZBvolIC6NpWXQhadYwT22d1N1eioIyb5p1eTaAC
         bV39mKM2bw280ICv2kOAZETNB3FItQznBkeBUxTgvpG926zSIlSgIp0JQ+Ix6ZPqstkD
         7IAD3bcFjc9WsHNL6XG9JSuSphGcNqybo4B+qutxqS/zrl41ZASh6iGGI7W4EcHC3oKh
         KtZqL0+2UAstB0MStPvoYda8ytPw5a43lE3FUKXTw1IxHO7caUScjhSuCvA21hlQXYTd
         f+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751632253; x=1752237053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eL7ggN4EThqkSufl95lxEu7wvlLi27XNgIMFlyQ+U4=;
        b=uDvYftXJSP/TBQJl+jkkUyUTsUXKM3NNpUyBYA+8RGWLrAzTpCd7VQJpYTutbAPrJp
         gAwoX8UR2SPJ0oE2j7nCBMKy81J69DHDPjEfrhGTWsihr31Q/8G9cxu+nbl74cDc2UAl
         jwZCbaasQRrTpQJSUl1vMf8VvPXgNgeE/qmXlX8n6Wx5nU4/UHoD/5h5p0JUpMmtHUgK
         S3y2aVFWnFlo8xp4g4e1WLaEflCSYDO6j3AHnL3z35pwt/iMgZka0dGwqnqIy+9sMULp
         XQhWKZJQOKbJqB0jSyZ1zVFmB1YrFjNN1+AafdOONyJIc0UDR/hgyIuraPB1f63z7tlh
         w7rg==
X-Forwarded-Encrypted: i=1; AJvYcCVAza/G2Ws69oM/Gkbj27E3xEUJ4oq8sp/J9vak3JbUql7lpnpZDFC4wJ6Ln203VxfKT6pZ1LAhhZBPHJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23BapUOkVT+/4xZgb2CBbTARci6WR8593DhexblT6F5dd5KE4
	vCzt+zL7b7BstVbNi+lHQBB16ygcb4H3PZ9y2Vl5qsKWSpf0XZAqt+qpvoRwPIVOiKU=
X-Gm-Gg: ASbGnct8lJ+aDjWZRjWuG31684Wr4JaVgSYypO9DkvCPS3AWZj6ZfO8dECc63b9jQbm
	Of+HbkSRnNdgMMh7BqD21XKHMe++kfU2IEVA1Rl4yRB14h2JXlOseRVTCcEmWQ+qGJaAeKZHb0w
	l7KU7xYO0GQKANagjs++Aa21ANcFWyHK2xMmW3PmThPJZ8EdkY4eOhqpmY7MjkcBl5yhU21YsvF
	GmtFV8+Px+rNi3rgiUE6C5LxWBKwN5x0EaJ9esHSNdRpP18tVoIrjaKsK4xrGHGJ0bOmVhllabY
	oUW5HSv9aLD1TrFicJ7GDlkeg/Sfry/XnEjnz7KZBRVJQLt4/JQlGOsXdLVivsTS1f3tqrCo
X-Google-Smtp-Source: AGHT+IENYDx1S+W/IKOLqqR+xnsrF1ri83aQkOzSqUBrg7yPi6OXV2SVSRqeMh1z0BCCs7zVMQSi2A==
X-Received: by 2002:a17:907:7213:b0:ade:7c6:498a with SMTP id a640c23a62f3a-ae3fbc4b041mr251129566b.10.1751632252576;
        Fri, 04 Jul 2025 05:30:52 -0700 (PDT)
Received: from [192.168.0.251] ([188.27.86.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e6f25sm164849066b.20.2025.07.04.05.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 05:30:52 -0700 (PDT)
Message-ID: <fac9a5fb-7a39-4c12-9dca-d2338b6dad8c@linaro.org>
Date: Fri, 4 Jul 2025 13:30:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: stop the release and reacquire of the chan lock
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org,
 willmcvicker@google.com, cristian.marussi@arm.com, sudeep.holla@arm.com,
 kernel-team@android.com, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
 <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Jassi,

Sorry for the delay, I was out for a while.

On 6/23/25 12:41 AM, Jassi Brar wrote:
> On Fri, Jun 6, 2025 at 8:41 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> There are two cases where the chan lock is released and reacquired
>> were it shouldn't really be:
>>
>> 1/ released at the end of add_to_rbuf() and reacquired at the beginning
>> of msg_submit(). After the lock is released at the end of add_to_rbuf(),
>> if the mailbox core is under heavy load, the mailbox software queue may
>> fill up without any of the threads getting the chance to drain the
>> software queue.
>>         T#0 acquires chan lock, fills rbuf, releases the lock, then
>>         T#1 acquires chan lock, fills rbuf, releases the lock, then
>>         ...
>>         T#MBOX_TX_QUEUE_LEN returns -ENOBUFS;
>> We shall drain the software queue as fast as we can, while still holding
>> the channel lock.
>>
> I don't see any issue to fix to begin with.
> T#0 does drain the queue by moving on to submit the message after
> adding it to the rbuf.

The problem is that the code releases the chan->lock after adding the
message to rbuf and then reacquires it on submit. A thread can be
preempted after add_to_rbuf(), without getting the chance to get to
msg_submit().

Let's assume that
T#0 adds to rbuf and gets preempted by T#1
T#1 adds to rbuf and gets preempted by T#2
...
T#n-1 adds to rbuf and gets preempted by T#n

We fill the mailbox software queue without any thread getting to
msg_submit().

Thanks,
ta

> And until the tx is done, T#1 would still be only adding to the rbuf
> because of chan->active_req.
> 
>> 2/ tx_tick() releases the lock after setting chan->active_req = NULL.
>> This gives again the possibility for the software queue to fill up, as
>> described in case 1/.
>>
> This again is not an issue. The user(s) should account for the fact
> that the message bus
>  may be busy and there can be only limited buffers in the queue.
> 
> Thanks

