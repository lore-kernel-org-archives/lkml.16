Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCDA221550
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 21:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749244069; cv=none; b=blITZSQlMieNjsvob4Q/gjhWDFiZI77+NFL5W2esCOw92IHAEUSwW79HvmhIdL53YylJrCNT2T1PCNcM1dRaQdBRDTmc/vYwG65EheSxGUG66CenlWCYT7pBTGSXQXkA83TTDw4OqSTbBcjJEnjZzxs6Ac/XVD9Acj9CTyfr3Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749244069; c=relaxed/simple;
	bh=oYvImI87ZwK1+8Epiw2C+eaTq7mhyhmpSEcpLdClPlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpMBZkl6llU5I6j3gESSlVhbv8f1ypJCy9P6KXehbzIIvifZ8CR3RAQbnRSUfTGAR20Xhr44zhuAfXY6u9pwasAkAWv8MpA5nA5WHmnHMfiAh6H2ZclB6gGaIt9yIOmUR98fvKjKmp7O6KLgdPurOfZrAx2tB7obaEAeVrooEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=rjshIgDG; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="rjshIgDG"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86d0c598433so77626539f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 14:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749244066; x=1749848866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cp7UGG+KTG1wD09K844XDRVXwMgGVHgZtytJ6OGTY2s=;
        b=rjshIgDGzFhwHmr6x1XgNKLnUVTIjI+Ud8QKjs4CVlvBED+PdkQEltq7q2T4BTBmj1
         L0B/hwCgCoR3FEdkDr1vn5fvJvF++0R29XxB/anKLVkbDJ9iFOYT0nJdttj9yYXdG/yO
         38MzsldLvANODC81jbBw9wbTSu+9HQT8tuJFtjKah/1EbliWakGVftGoQvtY17EvfZUL
         Lyyt8nbZNPfAkoTM9acnkT7daVkypAIjJwYsr2I1Jkh2Oe8ngHAbsTtB9+n+yNDcPqZn
         pl4dZDBAaHV+fv6jMrko7+SlPri6cjCpvUeF0WSi7DfU0DdsrTsGiYC7SdROgkqWvsxk
         VBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749244066; x=1749848866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp7UGG+KTG1wD09K844XDRVXwMgGVHgZtytJ6OGTY2s=;
        b=Mfx233CVrJ5kVwLL0qpBcwjIb0EZWOxJMCQeq0GG6OexVixDJQ2Ki/c8MFXOEpBXKp
         5E6mcxWOMDcoqx9MhF+B0iimy9KsRHomAU4GCnBJVwD//L5KV9pEIW45+OWXX7HNCym+
         FsHK0ThbZXB6O8w+Na2jCVH5+S/qBzEKXmGZmfKa7MHT9sbnuZokXXGpswjWsSFOI3F9
         R9jN4Uukcz59jSg4fchXOp0t/nK5JyanQxIjCR6dycaLf8+HiA/IZNe02GYReLDvp+G4
         pPUqyzstYyOm6uVrD6eB/4jGuXIFhvMUT2O1gSINoBebJVbzfHAHCodUyJqK5UWKI93+
         VCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlAYc8nLGIZl7xVRkZsPCVu7XSm8fDng/bLu9Gan01hYtVRo78apdBZls6iIcar8gFb9CcMGV07jh+62c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/0UwF/sEFgo2/06Zkg/LqiM5AjFN7xUzu8NbOIebAMB6NoY4
	JJCbWUj/7Y3b0W2w+keYjwUo2KB7q/vCTrUhjvdkqKRclz6OtJ2Q6pwjxIon+Seuecdkrk99b/+
	+86eK
X-Gm-Gg: ASbGncuGIbAJHYAAPvyxJYXCwZz0XYoRwTFZEL5MG9MVXENaz3pqVtkRgTQDXNwFx7Y
	PDzC9GX2R0prXsDdnVeJv+dpuaMRWQWm66t+lftD+NC0InwejSHjpUvyj0bKR+PnABFeBl6lqWY
	mQxRIo7xZNPaQN3Pru5dYO2tMZKhZYlMSoZyrMRGgYK+hoKtJWm6543FXg9rlElCx/4+M0tG5+v
	xYRDbnQI2zCY0cf3t7ZYnQTREmxlfRviQq4Jm+ufBQYKT1ZGSXxPj/1b5P2Cz8Vps/w1NJRs6cp
	yHkoUQTVsfuLUsoJ2eJoDRlAzXrVxvrlWKOUA+mI4buxXGYyGZb/TYQ4TVs=
X-Google-Smtp-Source: AGHT+IE69PpGWrIKfyhUPVdTEvtXRbHnKXqo21mxoAqyj1x89jdHRK1iXq5VkzfQ7maktedb60dqBQ==
X-Received: by 2002:a05:6e02:156c:b0:3dd:cacd:8fd3 with SMTP id e9e14a558f8ab-3ddce4c2e56mr61684385ab.22.1749244066532;
        Fri, 06 Jun 2025 14:07:46 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddcf253162sm5782575ab.48.2025.06.06.14.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 14:07:45 -0700 (PDT)
Message-ID: <3f3e1bb3-70cd-4e7c-b217-373f5c18e0db@kernel.dk>
Date: Fri, 6 Jun 2025 15:07:45 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/5] io_uring/bpf: implement struct_ops registration
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1749214572.git.asml.silence@gmail.com>
 <f43e5d4e5e1797312ef3ee7986f4447bddac1d3c.1749214572.git.asml.silence@gmail.com>
 <9b9199f0-347b-42fb-984a-761f0e738837@kernel.dk>
 <4efddaee-3d1c-4953-a64d-bbe69f837955@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <4efddaee-3d1c-4953-a64d-bbe69f837955@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/6/25 2:00 PM, Pavel Begunkov wrote:
> On 6/6/25 15:57, Jens Axboe wrote:
> ...>> @@ -50,20 +52,83 @@ static int bpf_io_init_member(const struct btf_type *t,
>>>                      const struct btf_member *member,
>>>                      void *kdata, const void *udata)
>>>   {
>>> +    u32 moff = __btf_member_bit_offset(t, member) / 8;
>>> +    const struct io_uring_ops *uops = udata;
>>> +    struct io_uring_ops *ops = kdata;
>>> +
>>> +    switch (moff) {
>>> +    case offsetof(struct io_uring_ops, ring_fd):
>>> +        ops->ring_fd = uops->ring_fd;
>>> +        return 1;
>>> +    }
>>> +    return 0;
>>
>> Possible to pass in here whether the ring fd is registered or not? Such
>> that it can be used in bpf_io_reg() as well.
> 
> That requires registration to be done off the syscall path (e.g. no
> workers), which is low risk and I'm pretty sure that's how it's done,
> but in either case that's not up to io_uring and should be vetted by
> bpf. It's not important to performance, and leaking that to other
> syscalls is a bad idea as well, so in the meantime it's just left
> unsupported.

Don't care about the performance as much as it being a weird crinkle.
Obviously not a huge deal, and can always get sorted out down the line.

>>> +static int io_register_bpf_ops(struct io_ring_ctx *ctx, struct io_uring_ops *ops)
>>> +{
>>> +    if (ctx->bpf_ops)
>>> +        return -EBUSY;
>>> +    if (!(ctx->flags & IORING_SETUP_DEFER_TASKRUN))
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    percpu_ref_get(&ctx->refs);
>>> +    ops->ctx = ctx;
>>> +    ctx->bpf_ops = ops;
>>>       return 0;
>>>   }
>>
>> Haven't looked too deeply yet, but what's the dependency with
>> DEFER_TASKRUN?
> Unregistration needs to be sync'ed with waiters, and that can easily
> become a problem. Taking the lock like in this set in not necessarily
> the right solution. I plan to wait and see where it goes rather
> than shooting myself in the leg right away.

That's fine, would be nice with a comment or something in the commit
message to that effect at least for the time being.

-- 
Jens Axboe
