Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2476A1FAA
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738311428; cv=none; b=Im4Hu6FD07KePvyfdhvgmMRJ5ZZGn0n6ikRnfehkiFTA+IgL3QOIK9OqemM/fjQ9IWm8qpBjxLFrCBz14/Q4lvK/dKSmdXx5eyG77a1S0K/jWLdvwjXqhZrSiOgVbdRovh/oAa0Dw6iyb1JVrMDf5yHp/+EQXAbrdvme+wtOhTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738311428; c=relaxed/simple;
	bh=eEICYceBnxUsglQpj4kBo9pR0UZv5Dh3Y9WhkQTVNuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfZcO+CWJDcCjYCnBEcoHU/ot4n172dayH3C18zpAb7ov2xpi8bdJu8FFEG8hugZiBtndpvW02k/nEGQYgTVWehqPFtU+kYWVp6NC05UT5p+db6w5BHjc+dFxhxtdPxSdsuepiZ0Nb0LpLWlzMJb3LJta0F+dbD1ZkHlqPcJ0Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43690d4605dso11511335e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738311425; x=1738916225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs+y/H49ZYpstA/B6kj1edFZvc3ilw64ChimuGOqo8I=;
        b=rMD8kA7HAGoy6P2ri549Kq89axo6jQUQmH91hIGQbxgx9xxAe2Q/rE5EEFk1wi+qB0
         /LRLpFWzTdwC7MLVKoqbqAFgnL1wax97uZVvepVsb5NZrBLRNxBkV3aPG2dH11yQlohk
         7T8cuvrcThS54VvZU4a375ih0LwrvJZrDT6ZYTL/ahmpd+KSpeYtT2QC/H+QjVhYivm1
         zCn6f28byL1OfJYxvO3esszUZXb16c4Iiu6YFfTnl6tzT2BZFKbjO+o75BqVFbS+Xd+f
         MPEi+QWwXU7Y+i85ivtOngKur967Il0bjyF52iR8vSCEIsT7A9JOCh87sXDAeoQwmniB
         gDZw==
X-Forwarded-Encrypted: i=1; AJvYcCW9J19u29ZMwFGMVzkfQ6gLBuGfb9pC6B76XprY3n7dcoNRyKbW3dEIPSD+hpTYSQjFc0SGicZJHOjFIDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJiBXq4YzHpFzRY7rgyhbIjyp2UCakEUXyq7ZwSJD/wUQLKyP
	o5dYK96trGnbYUZfIJhFFf/KEJtKPqi+n6wSRmL07Pip7Iuao2s5
X-Gm-Gg: ASbGncupWEOOAAq0eSnNtwu0+gYFBFeZ3icuyHekm7dwRQmh136TEfu5n7F1nqPTRda
	dyEIxIneO6BegfHst3gpzlM1WfMuxMk9IEsZcvOD6/w4ckflCbKdw0dxMAbFykBJEWKLqXJ+jnA
	gq9wzDXBD/g3YFUTAMk+mJ0SbNjj6iLWm/FJxGwYkkqM8NMp0lmQq7s63eVpcA2L7a69chzFYzf
	D7NemoaXrrO/5dR8gnbEXqXBE3YEH85EB8aYklbMARnZt4dT3MKLdXOecEppbHZ2hXr36yNFeZu
	ClQ2jjtt5tB/q5DITG10wSH+eY+nXCcwB5YjrUkSkGxSatnUxzc=
X-Google-Smtp-Source: AGHT+IF1OpcgJDoHfSd3dhQkUQD+i80JnH4gDdzqTVCiryEFOtuQTWcP2Iub7pMlPll9uNC1B2SB7Q==
X-Received: by 2002:a05:600c:1d27:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-438dc429771mr97301215e9.29.1738311425237;
        Fri, 31 Jan 2025 00:17:05 -0800 (PST)
Received: from [10.100.102.74] (89-138-75-149.bb.netvision.net.il. [89.138.75.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6de7csm84088275e9.32.2025.01.31.00.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 00:17:04 -0800 (PST)
Message-ID: <3bcc6e3f-5172-40d4-a4d4-b0f914b9406b@grimberg.me>
Date: Fri, 31 Jan 2025 10:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] nvme-tcp: fix connect failure on receiving partial
 ICResp PDU
To: Caleb Sander <csander@purestorage.com>, Hannes Reinecke <hare@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Maurizio Lombardi <mlombard@redhat.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250124184311.1642797-1-csander@purestorage.com>
 <9ea74200-7cbc-4a30-9503-864dcec9b45d@suse.de>
 <CADUfDZoT7JW+d+j6YNmWJ3CKZ45gbvcUSsE6boZwE1C3iXw2_g@mail.gmail.com>
 <f75c62ce-04a7-4bc0-ae77-8ed80842bf37@suse.de>
 <CADUfDZrvHmYQgqu5GiQDrAg_MOEiRigCLCmBSO6jeyd1z+Q-JQ@mail.gmail.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <CADUfDZrvHmYQgqu5GiQDrAg_MOEiRigCLCmBSO6jeyd1z+Q-JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit




On 29/01/2025 0:02, Caleb Sander wrote:
> On Tue, Jan 28, 2025 at 12:28 AM Hannes Reinecke <hare@suse.de> wrote:
>> On 1/27/25 18:38, Caleb Sander wrote:
>>> On Sun, Jan 26, 2025 at 11:37 PM Hannes Reinecke <hare@suse.de> wrote:
>>>> On 1/24/25 19:43, Caleb Sander Mateos wrote:
>>>>> nvme_tcp_init_connection() attempts to receive an ICResp PDU but only
>>>>> checks that the return value from recvmsg() is non-negative. If the
>>>>> sender closes the TCP connection or sends fewer than 128 bytes, this
>>>>> check will pass even though the full PDU wasn't received.
>>>>>
>>>>> Ensure the full ICResp PDU is received by checking that recvmsg()
>>>>> returns the expected 128 bytes.
>>>>>
>>>>> Additionally set the MSG_WAITALL flag for recvmsg(), as a sender could
>>>>> split the ICResp over multiple TCP frames. Without MSG_WAITALL,
>>>>> recvmsg() could return prematurely with only part of the PDU.
>>>>>
>>>>> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
>>>>> Fixes: 3f2304f8c6d6 ("nvme-tcp: add NVMe over TCP host driver")
>>>>> ---
>>>>> v4: keep recvmsg() error return value
>>>>> v3: fix return value to indicate error
>>>>> v2: add Fixes tag
>>>>>
>>>>>     drivers/nvme/host/tcp.c | 5 ++++-
>>>>>     1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
>>>>> index e9ff6babc540..56679eb8c0d6 100644
>>>>> --- a/drivers/nvme/host/tcp.c
>>>>> +++ b/drivers/nvme/host/tcp.c
>>>>> @@ -1446,15 +1446,18 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
>>>>>         iov.iov_len = sizeof(*icresp);
>>>>>         if (nvme_tcp_queue_tls(queue)) {
>>>>>                 msg.msg_control = cbuf;
>>>>>                 msg.msg_controllen = sizeof(cbuf);
>>>>>         }
>>>>> +     msg.msg_flags = MSG_WAITALL;
>>>>>         ret = kernel_recvmsg(queue->sock, &msg, &iov, 1,
>>>>>                         iov.iov_len, msg.msg_flags);
>>>> But won't we have to wait for a TCP timeout now if the sender sends less
>>>> than 128 bytes? With this patch we always wait for 128 bytes, and
>>>> possibly wait for TCP timeout if not.
>>> Yes, if the NVMe/TCP controller sends less than 128 bytes, we need to
>>> wait for it to send the remainder of the ICResp PDU. That's just how
>>> the NVMe/TCP protocol works. If we want to protect against
>>> buggy/malicious controllers that don't send a full ICResp, we need a
>>> timeout mechanism. That's the purpose of the existing
>>> `queue->sock->sk->sk_rcvtimeo = 10 * HZ;` in nvme_tcp_alloc_queue().
>>> Note that recvmsg() timing out was already possible in the original
>>> code if the controller didn't send anything on the TCP connection
>>> after accepting it.
>>>
>> Hmm. With checking the code 'rcvtimeo' is only evaluated if MSG_WAITALL
>> is _not_ set. Makes me wonder why we do set it...
>> But that's beside the point.
> I am not seeing where sk_rcvtimeo is ignored when MSG_WAITALL is used,
> can you point me to the code?
> It is certainly ignored for *non-blocking* recvmsg() (MSG_DONTWAIT),
> but I don't see why it would be ignored for MSG_WAITALL. man 7 socket
> also suggests it applies to all blocking socket I/O.
>
> static inline long sock_rcvtimeo(const struct sock *sk, bool noblock)
> {
>          return noblock ? 0 : sk->sk_rcvtimeo;
> }
>
> In tcp_recvmsg_locked():
> timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
>
>>>> Testcase for this would be nice ...
>>>>
>>>> And I need to check if secure concatenation is affected here; with
>>>> secure concatenation we need to peek at the first packet to check
>>>> if it's an ICRESP or a TLS negotiation.
>>> Are you saying that with secure concatenation we don't know in advance
>>> whether the connection is using TLS between the TCP and NVMe/TCP
>>> protocol layers? Wouldn't the host already need to know that when it
>>> sent its ICReq PDU?
>> No, the host doesn't need to know. TLS is enabled by the lower
>> layers.
>>
>> But upon further checking, I guess it'll be okay with secure
>> concatenation.
>>
>> Nevertheless, I would vastly prefer to have a receive loop here
>> instead of waiting to receive the full amount as per MSG_WAITALL.
>> The entire tcp code is using nonblocking calls, so I'd rather
>> keep it that way and implement a receive loop here.
> The driver uses non-blocking socket I/O in the I/O path, but not the
> connect path. nvme_tcp_init_connection() is already using blocking
> socket I/O to send the ICReq PDU and receive the ICResp. I suppose we
> could change the connect path to register poll interest and use
> non-blocking operations, but that seems like a more involved code
> change and orthogonal to the issue of receiving the full ICResp.

I agree. the driver blocks on ICResp rcvmsg, there is no reason to
use async interface.

Caleb, can you please make sure to test this patch with TLS?
Do you have a reliable way to reproduce this?
