Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9DD12FF6F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220096; cv=none; b=Bb7tUZMcnpHQy5Uw67gPs+Bh2B0UQ6oBOWBX2cLnAmBRAA9LOLsnAIut7Ui/2Sy7mifeKC+KN74sSRGlZPrxCTwSsnLqcxit6mRcMtwwiD0WvP8w/IbeiPQR1k+EifL3nYuf7LeK7AP8/DrjFvF+4X6MyA6Q9WZO3J8/bgW0NmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220096; c=relaxed/simple;
	bh=yGw2KCsyMGQhD+cV7Xq0jX7AcZgSEZyRWrXunzclL1s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HVUNRuFEkDFVkj6ktetDlcqWY8jhW4/1kM9yEkiIJYaUBhrEjy1ZdQXWecp1e5pmkmhZxkYlqHOOuDVKxyuoAkKp86gnPKjGwoZGm+wwWBHAJw0612bS3pLac+Hnaz/f4VVAVnkxycpUkgwC6XFGmwx51kdizfOIvK6jOrqqTo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=bECm3ooN; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="bECm3ooN"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86d0c5981b3so68631039f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749220092; x=1749824892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3O04NlGxiolO1CmbKy++35ARtom08d+p1GVLWa2NnfA=;
        b=bECm3ooNqOr7ZBwPRk6qssZuPTq/SvT0mGTHY+CBUFRlVV/URBM25Vj9onOyrZrb+J
         QYqenh/1eLUU/W0kUWtA51gkAlXsFMAoLQHz3rPKi27xp21OwpVr/J5IjVJU2sdG4G1z
         blOw+eSjlymw2z6OjEQxCRUWNLmwst9+4wFxFIjr2bK8ZGezbr9So8eCSpEek0ql0MfF
         o8uxFN5dh/t0jMwI2TWkjLDLHbezOWfr9nOzVEcgS3fhgsl6gvey9xB65c+bwBGA1iOq
         vePUbVswkdHirTXLIYnjNH+bFtUDFiYUOZv1RyWjn3nXWiD95JmybEYWBY6H9jL2aygO
         Mwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220092; x=1749824892;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3O04NlGxiolO1CmbKy++35ARtom08d+p1GVLWa2NnfA=;
        b=M/OfvQlNzuYj6hjoFwpV/NrUyL7uF6W/uC/kQzr03fi5UiPiS7uDektjS5GJPH/aVK
         xDbtrdv1rBieh/JS87iiNa9v/hjbUaJDX4SRQti5RjqaYJGcXKKzKfWfquwut+0bqOjd
         gNY1YpwONhCQA5hrd3uJ2N1pjr8REH/rMHFGs1l3Yb+i5GS26q+oP8PxBNKHdGzs8RRB
         XP0R0T7k2QZRQnPTvurz/ZDNnrYkxMZloeob7ItBCzonIplD68G5ScYGDYwjOKeo7W8n
         jrm8RBfYkA/t5VEsGOMtCorZHMk5Ggh8BM56AMvOTOXtH7y+1h0fWiTYaiG73r8E8EeP
         Z0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVdM2jQlJnosWK9p1djPCJ+HQxHsUhe8kHYhAf2KYcwWWbxr6XyS8JELxAP6CuEiyfkqpbTbwlXVs8EUhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzui6rLi2pyuCUYTc9e7J+5ETRSYVOb7FLc8laMUKeASjG0jZ9K
	JwWz5ECf3zAMcaefeDC86JNsq5IksJ/EFXAxAoLJYp41WvbfG4gkvSqlDNtgJi4M82o=
X-Gm-Gg: ASbGncvK6Eh/gFsVuH5v4kLTmx/fsRH+Xw238upkbIXJmxqEF6IkeZSMru00I6IH91Q
	Q3vtXVPGckCs7UrNn1BGd6Sv1/VFBCOA8C/4yzT9eZWrESzxLDjotVns8dhcpnpT0vFSfPrjn9d
	3vnsjGS6Y3sTewZ54tAjcc1M6EV+LfSA6KYveDF07C3UT+D72CHbHIkhC9eXTQp1RPkm1hDOuVm
	VUrizjWL42QySHtAI/wiNBe+Y7HNZWRirp/O5xf1DzJDVallrduqfPw4uLJKnT0HafZgDYn0+Wv
	8mbX6/ZLFQgzPh7hluAQdGdDmwk3W0BNhp64PSNRnVJeEyYhv4CATTGjUA==
X-Google-Smtp-Source: AGHT+IEDaUVHOPyyhzFPamWfZwsvgI1rLw4PRNRY6eDRtYy1d7W/lfguqrkX0/AWabqTCYiFnyX3HA==
X-Received: by 2002:a05:6e02:16c8:b0:3dd:b726:cc52 with SMTP id e9e14a558f8ab-3ddce3cd206mr20550835ab.5.1749220092612;
        Fri, 06 Jun 2025 07:28:12 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddcf1582dfsm4388395ab.23.2025.06.06.07.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 07:28:12 -0700 (PDT)
Message-ID: <f6ae27ea-03b7-4fe9-bb6e-15b988f2a6b8@kernel.dk>
Date: Fri, 6 Jun 2025 08:28:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/5] io_uring/bpf: add stubs for bpf struct_ops
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1749214572.git.asml.silence@gmail.com>
 <e2cd83fa47ed6e7e6c4e9207e66204e97371a37c.1749214572.git.asml.silence@gmail.com>
 <783d14e8-0627-492d-b06f-f0adee2064d6@kernel.dk>
Content-Language: en-US
In-Reply-To: <783d14e8-0627-492d-b06f-f0adee2064d6@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/6/25 8:25 AM, Jens Axboe wrote:
> On 6/6/25 7:57 AM, Pavel Begunkov wrote:
>> diff --git a/io_uring/bpf.h b/io_uring/bpf.h
>> new file mode 100644
>> index 000000000000..a61c489d306b
>> --- /dev/null
>> +++ b/io_uring/bpf.h
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +#ifndef IOU_BPF_H
>> +#define IOU_BPF_H
>> +
>> +#include <linux/io_uring_types.h>
>> +#include <linux/bpf.h>
>> +
>> +#include "io_uring.h"
>> +
>> +struct io_uring_ops {
>> +};
>> +
>> +static inline bool io_bpf_attached(struct io_ring_ctx *ctx)
>> +{
>> +	return IS_ENABLED(CONFIG_BPF) && ctx->bpf_ops != NULL;
>> +}
>> +
>> +#ifdef CONFIG_BPF
>> +void io_unregister_bpf_ops(struct io_ring_ctx *ctx);
>> +#else
>> +static inline void io_unregister_bpf_ops(struct io_ring_ctx *ctx)
>> +{
>> +}
>> +#endif
> 
> Should be
> 
> #ifdef IO_URING_BPF
> 
> here.

CONFIG_IO_URING_BPF of course...

-- 
Jens Axboe

