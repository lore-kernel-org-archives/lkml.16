Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F405230D0E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079255; cv=none; b=c8XIdso+WPiJFw7VwAOy86T1jJJvNMEujq2JxBjQzVBSYkBpnHoysCoZ/D5SuhbMeV5I9sksao1FMnTC1RhFQt3TkClkybWbT0D2DR+MTk/yV6qK5Eb+knHZwlzT+OgJpFJvklZOVnnSmpuLS+KpbnvidFVEWvmhouikTCFrjfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079255; c=relaxed/simple;
	bh=K+2x3g3ibknHv1jEjab8MkunrvI8egf4XRjyzS3MveA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JglIVqTUtzuHp/r/Jb0aGINUdWOyLKhIlOsJ75cVrRYBHpu+EQE+jXbTvFpOoSq6pxZO9RNvnTIG0H9R3NFeIpItcRAINjWkxzPhzndz6UHL5c5y9G2sIu3ZzMlMptp+jQIVTjg/p40CNi0C6oRlqFrQsG5KotuluHpJBwiz114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ivpaAujU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ivpaAujU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750079252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NEh91vA9Wxz85gRtNA+9lUxQQ56dlvAv6y9wRHW8BUw=;
	b=ivpaAujUntXBJxajdfwulr0RQJ/cirw/me+q/pK0p9smL9ZxdCyi0m+v29sY68zQJd1YIG
	cV9sh3tABPWYo4Y3AkwUft2DL6ugUlJVnrczmKNOoor2nLbBbfJ5tYB+ZksUYlbsHoZ+x3
	rqdLt64b8wX+2PuWWpKPmM5EZuYgVBc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-pP3QbsVoMoK46ItaFg8PCg-1; Mon, 16 Jun 2025 09:07:30 -0400
X-MC-Unique: pP3QbsVoMoK46ItaFg8PCg-1
X-Mimecast-MFC-AGG-ID: pP3QbsVoMoK46ItaFg8PCg_1750079250
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f3796779so3049058f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079249; x=1750684049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEh91vA9Wxz85gRtNA+9lUxQQ56dlvAv6y9wRHW8BUw=;
        b=BaDLKXXk8VQCO3oN40PYC9XCv7ofJjOxssMYnOM8LVNr6Q1M73kYc5bIsHskXSPLmL
         EA/xjsULAu+CtI2tQ3tilv6+v1i0+8jH2Un6xhU+ghceUQLorGrG6QTbekUOcSAuyWRz
         rCtFK2FQGGFKpNUlHXvKI6KzJeOZ5kPZD2cA6c3+nqkmrbzrvHCPTou/VETpKoI79PQ2
         Hq3rq2cyAPyTJHTtscJiMym1tuhzQinslFjPkGHA0555sbbQY4w3E9EoyAC8a6/EZY4e
         5qUkD0rCM5B01SQxPA0DuEvFgCsfbjPSpPmi+yHGYz9eCrN6TTQiPhr0SFrMyiwnCsJk
         +6ww==
X-Forwarded-Encrypted: i=1; AJvYcCW/aRNAq1yb0GaJZ/HaLl9fQf0UzvpzfzjalZRNkFsOu4gMbAixF/1wfEvrcceWaI9UkDYYZd8j+0Q+VW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdW1JZQMVXqzZSNmjlSXi6HY6JHhXC+RAU/r+9WRiq4jOf/slM
	KhBr6BpH0d30tVyrPPB2qOp6yWxe8U+qK97XCdV3OC4tDlm2L8mZNQH81wILqkPBxWAVpavoLvs
	V4h+Rm7rCmyueBe4K36BTBscJGMda3vSoOxrzOxBskUKxvnsCqmaX12frNd3Y8Vge6aYQKM4SHA
	==
X-Gm-Gg: ASbGncvBjfu34FnsKjk7tshYwqPQ9kY5tAtHbg2uTgnEDlVpTaTzpL+woAZ4xzXwCMd
	qQqNHlEtMtrwilO50eYXlF9h3O9Tu3TdQaCf/BPYtHbMc6tmIz8WsGrNyCQqMD6Ckfj6OUQZunN
	Ei/a0N0w7RugGaHVF+knkMIzMYzkIQ0ljg1cm0XJNixZuGSVMg+FCkFUzHQEHk+xqjQxGzlhJtE
	ywldflEE6+rOyxxeBb50fznLFeSdT2Ta352OHjg2vTIEgr9E5GvGAitCwcOSYmzf4L9y7AQ/x76
	X8UmqiW10s+Cq0xGh/pue2QERnzBRiw4JuKBbr1wIg5Ie3OA8+TXppJQvZyKmg==
X-Received: by 2002:a05:6000:144f:b0:3a5:2599:4163 with SMTP id ffacd0b85a97d-3a572e8e56cmr7284429f8f.47.1750079249509;
        Mon, 16 Jun 2025 06:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx1GOoDTc/8rrvBJlWHToytU+R3cfbzVAbYt+/o6NPhC2gNi5p8T4FxpCUlpaE2CWc1vf5UA==
X-Received: by 2002:a05:6000:144f:b0:3a5:2599:4163 with SMTP id ffacd0b85a97d-3a572e8e56cmr7284381f8f.47.1750079249064;
        Mon, 16 Jun 2025 06:07:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c? ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b09148sm11418791f8f.58.2025.06.16.06.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:07:28 -0700 (PDT)
Message-ID: <ecfe7d40-257a-426c-b200-4fd62f18cde7@redhat.com>
Date: Mon, 16 Jun 2025 15:07:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <20250521092236.661410-1-lvivier@redhat.com>
 <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
 <20250528031540-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20250528031540-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2025 09:20, Michael S. Tsirkin wrote:
> On Wed, May 28, 2025 at 08:24:32AM +0200, Paolo Abeni wrote:
>> On 5/21/25 11:22 AM, Laurent Vivier wrote:
>>> This patch series contains two fixes and a cleanup for the virtio subsystem.
>>>
>>> The first patch fixes an error reporting bug in virtio_ring's
>>> virtqueue_resize() function. Previously, errors from internal resize
>>> helpers could be masked if the subsequent re-enabling of the virtqueue
>>> succeeded. This patch restores the correct error propagation, ensuring that
>>> callers of virtqueue_resize() are properly informed of underlying resize
>>> failures.
>>>
>>> The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
>>>
>>> The third patch addresses a reliability issue in virtio_net where the TX
>>> ring size could be configured too small, potentially leading to
>>> persistently stopped queues and degraded performance. It enforces a
>>> minimum TX ring size to ensure there's always enough space for at least one
>>> maximally-fragmented packet plus an additional slot.
>>
>> @Michael: it's not clear to me if you prefer take this series via your
>> tree or if it should go via net. Please LMK, thanks!
>>
>> Paolo
> 
> Given 1/3 is in virtio I was going to take it. Just after rc1,
> though.
> 

Hi Michael,

rc2 is out. Do you always plan to merge these fixes?

Thanks,
Laurent

