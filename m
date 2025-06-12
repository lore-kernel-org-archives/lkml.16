Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C322472BD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737255; cv=none; b=EcjJwjQpaGsX5qeNil9qNyPfwO5Czs9lrBwjX3caol7cAi7fKWrSMwJrbjT1Aw5pHtWt/jvQmJ4uEAvKYVy/a9DMF3Od0IELbnf1YbLlxSsRzJYw8zD0F/VfRjXY9JL7Z62LuRuMZMdqANtF0x6BTCfrPrb4ASfOWN/XYr7yUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737255; c=relaxed/simple;
	bh=ZlKxXddzvj0sXC2oFaswxrLnTGaZARGcaCxTzDGh+pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2kCp2eP8dNxVt6ruNa22eVK7yuF48406bq58wpko7CPHTZZF72MRzMhhLtJl7cuH5btCyqo2tFW90bOwljfxTs7x8VbNnz7KbVdjvjcaHg4D1eLEwNo/Ql95CEhslokW1obm6cs9hucJloTI6HCIqEVHBhB4JmHjO34Lq9LWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=DBMv24Or; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="DBMv24Or"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86a55400875so96562239f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749737253; x=1750342053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7BaPEJdKodlX+vyBzolZJORQM5uM4U2VT2SEvpE3y0=;
        b=DBMv24Or1wZgxFXsxBy4W3cO+tfcHwq8bD6gqoN3Pvq93QXz5k52Csdsw1x0m3TjGF
         LKdmf936+LgQHYZaxEcho6VvNSZF6tRISzx72Cy1GF1b7TJP0ZUsUOhguS+RAMHev3Rq
         b6qP2IzoVH8k/9b27+DvTIyV9zYsuWL9n2+iIQXSbQQkNkGBK5deL9xc/Ji9VReHwvj7
         KnPmu8PLQUxC1ar9kmNrdWsBW9n5fjM5AkhYZXx5FVXvJJE6JXh75SNZ0Ka/ve/9YB/F
         4djQZa0YFwX2SN8NIzMo8CA8CAisJlSUFJdaF/rXIo3bjWNiAOWXD3BRDZ9Z9AWaXHnk
         hJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737253; x=1750342053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7BaPEJdKodlX+vyBzolZJORQM5uM4U2VT2SEvpE3y0=;
        b=FU7f++SCUkXPyJXdyZxCJ+z/GIdBIAFsjqJX8WngvP1bT0+JweElR6M0Mv/2TXfTIZ
         ZeujrOayJo0o6egsoKoUCBCoYDY/noaajzzrje5lygqTCj29rvbwrnQzoSeB8a58PXHE
         wpC2mIyV3OoBXRUyUP2V9AR6nR5Gr3+/fNvTGXFL1sXZlaowXz2b1L1tkE8l9o6aNcqK
         LcWhqjpCf42jCvmOa70LQtITaqJPvdsR+wE4lIfs8XeGKJ8M4Q07zRuFowgzZVWeRhJt
         KyjfZpIJgzXCbMLwvOdFBO94TF+rOTikY4Bf9RIFmfhERjeqxShurIPVCzbNdgqj9JgG
         po1w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6Z3Zr+TQiZ5TCLkiwxy+MBBQC9yScMUhRHeQP4cqtG7cYy8z/BpHzWKokPwz4eb5KsFGCNiZaqxf2WU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhhPr1TPSbIgQWJL9mBUqj3GpdDWv6z+/x5Sib0FmeQDiMd2ei
	X0GB/H2pF1/hm73EZ6AlB67p2OsGG32Fab+EpbkMAunvLGDwO+A16eSJLykrbMfvabU=
X-Gm-Gg: ASbGnctyCK2FfLgNjs4zYj0PsEaTfqMlc22doVqw0GX5PFIcFOs0BMlVFMj8WToV99P
	hb/sVoUSrI/rKhYBWORWbBbGD5t38tdwhChHHDAfFvkBwZBqb9YhaElrWFordczRq8jSkF2CUBg
	W2z69OziDUGr8+BuPtxy+aRhhM08xJYWGlDrUKpvqs5TCliicVWO6ENc7WsTNsMEhkEmHqyOlMk
	NERAoebCqudftqYjq+rxNM9ob4pbIcHoLm6ex9PK9gng1wwEtdrAGvAAw4CoLP9u0jEq2QDu2F6
	LtvyNT3DgS55iardyq68ap/jkfWdlAxnu84nwtnrXK739aD1LRlKDkx9Z5E=
X-Google-Smtp-Source: AGHT+IEWCCCjDjSoMklKVcYCB9WmouD1OwKf8Ba8LILdXB0kk8qnSuDBdbKmmY1TIsfRF6uiFQot2Q==
X-Received: by 2002:a05:6602:480a:b0:875:95b6:4666 with SMTP id ca18e2360f4ac-875bc3ce053mr876867639f.1.1749737248018;
        Thu, 12 Jun 2025 07:07:28 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875c7c39bf7sm36016539f.0.2025.06.12.07.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:07:27 -0700 (PDT)
Message-ID: <bf35d09b-e259-46b0-88d5-e950d9ced964@kernel.dk>
Date: Thu, 12 Jun 2025 08:07:26 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/5] io_uring/bpf: add handle events callback
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
 bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <cover.1749214572.git.asml.silence@gmail.com>
 <1c8fcadfb605269011618e285a4d9e066542dba2.1749214572.git.asml.silence@gmail.com>
 <CAADnVQKOmYmFZwMZJmtAc5v9v1gBJqO-FyGeBZDZe1tT5qPKWA@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAADnVQKOmYmFZwMZJmtAc5v9v1gBJqO-FyGeBZDZe1tT5qPKWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 8:28 PM, Alexei Starovoitov wrote:
> On Fri, Jun 6, 2025 at 6:58?AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> +static inline int io_run_bpf(struct io_ring_ctx *ctx, struct iou_loop_state *state)
>> +{
>> +       scoped_guard(mutex, &ctx->uring_lock) {
>> +               if (!ctx->bpf_ops)
>> +                       return IOU_EVENTS_STOP;
>> +               return ctx->bpf_ops->handle_events(ctx, state);
>> +       }
>> +}
> 
> you're grabbing the mutex before calling bpf prog and doing
> it in a loop million times a second?
> Looks like massive overhead for program invocation.
> I'm surprised it's fast.

Grabbing a mutex is only expensive if it's contended, or obviously
if it's already held. Repeatedly grabbing it on submission where
submission is the only one expected to grab it (or off that path, at
least) means it should be very cheap.

-- 
Jens Axboe
