Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1E7221729
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644250; cv=none; b=TCR0/KL7DtK31gfU3jSvwZHqOz29unhKDkuu7IQ1tZHqJxHgapTFwMdpiORrFuZBPXoaVKKrnhsdWfJ0vINTsb6u3jr77rk/NTjlx7hq47PD0rlTsstzcYayd+upMFV/QDh/DORy8U49LTwAGgwCO3O38R12fPTQhdV0Y9EGJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644250; c=relaxed/simple;
	bh=v4y9hjaECbxJ58t1a+ljNIGNGmARQwwnjn74YOZRZ7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYuonfNqOTtr5TXMlSOF+x2UZZjWmmUcdpdTex8bVl/eBYMSYJlSeeAEmhZQeJlmIyrTjjBLqp2XM9RVTlwDjvIgGg1FQ+3+MhRdXI9Map+eGY3PPIfb2xNIH+P1TLdm0mURygNMOTQS62IdMNRXG9ScJ30rBbKbqZdI/jdpFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E7lpAEdK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E7lpAEdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751644247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIlXKRuex4Uektqt8RduXNnmtT2T4T8FvbHA7xmItfU=;
	b=E7lpAEdKB8RTih+uOrvl2UaEyqU+CQ6GwbNOl4X26f/ZaoftWNDL1BzgS8FXFWRZU8Lscu
	zBDGcCX82pO5O+G7x7AgNlRRkOjOojx3LAiXSlY3nhnvHTNnUaRv2KPcz+5xNSeRW3c202
	mN3xriy2u13pMZCWr0IskbTcTyPx1Bo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-hJrOAAraOSO5rhYxwfRJCQ-1; Fri, 04 Jul 2025 11:50:46 -0400
X-MC-Unique: hJrOAAraOSO5rhYxwfRJCQ-1
X-Mimecast-MFC-AGG-ID: hJrOAAraOSO5rhYxwfRJCQ_1751644245
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so5411785e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751644245; x=1752249045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIlXKRuex4Uektqt8RduXNnmtT2T4T8FvbHA7xmItfU=;
        b=DlBGH/ABpaTuFX72UmhGMK+nCyZzn99ddLhznPTze6oGzy0DPXmoDzh0s6D2QjL80T
         2c+Xc2j6fDrncY+pNopu/qmo8mtoEr2ya8m8d4igK1G1OLExjwVe2jvuBAw+vprVavCM
         k9OEgV/cELgxPUnsKA5cy7qmdHU6qwGYWovVvfgmN6mr711eHyn/vJuR38WjoXMivDl6
         DQVxj9ADjkuXU+ct4Lu5MudqOA5Ciwc4WNbTubdTiyKHn+cnsfOTrItE6ROBrX8pASRE
         jmINLxokMoOzoEjXXT9f4zjCojtnaX14xuK8QQBtFoEMTClCXuldawGwubcwodLm7fZp
         EZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYxJMrX52zL43XVESfIqyNv785CtgPHlXDfzh5s0Z9k5LIMZQ3yH2ZwbUX/H0syApvxrSQ3TKMJqpOvmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkuZNP5ZB3ZqxD43Xj3cyM3txrVF7LI+lp++df2YRh2C6OcunZ
	+3Yj4w8vnCVksF7ewy9bV0cQgATJwumh7+Bmg5MjH7J1FNHyTeAiKc8lI1+P/HhlTnRfEmC6AJu
	4cgLrIzWwyo/vDi7HDLo+XgqB+XNxi+n+zj1ud1ZjSahhd7t8dJBPjM8iB3sH/bFV1w==
X-Gm-Gg: ASbGnct29DoWMwed/0u8f1ghf4hBK0F440VQKLMkFOASZtmzm2+pK1jnR9K3qy1Mj+N
	DFgXFrs5OjgjhaK+kG02ca2Aq33Y+BH8eGu7OCUqQgCHRl1BJITpDlTEtxqMjwO6U1VmPo1l3S4
	/DCsTjcLCBW2X/vnPFWVt+c+t5ZSaI88B6FJtBESsy8zmJuIyQT66u9f6iOiNZ8pyc5FMOPU0i6
	VPzgGQW9XtnODJ+P6soFM/MFc0hnsDkg+fe+tJsJnZWF2SkElRI08SWSKaUg348GTYs05TOQs5r
	2a6Hz960+0sj0ZO4ebyC7ER3wcrf8EzRDLHvEQg5G6TL6WXdxroDeL3rkvpJgNfloQE=
X-Received: by 2002:a05:600c:620b:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-454b306c152mr29742455e9.6.1751644245129;
        Fri, 04 Jul 2025 08:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsgA7XYKBBw3EQMZa8JF43UMRxcEZOtJQKdgaXLw7ik/LQ3Jo+Cs4zNGNdfG3jrlZYiq9/Fg==
X-Received: by 2002:a05:600c:620b:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-454b306c152mr29742215e9.6.1751644244687;
        Fri, 04 Jul 2025 08:50:44 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1685499sm29511905e9.22.2025.07.04.08.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:50:44 -0700 (PDT)
Message-ID: <1a24a603-b49f-4692-a116-f25605301af6@redhat.com>
Date: Fri, 4 Jul 2025 17:50:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] skbuff: Add MSG_MORE flag to optimize large packet
 transmission
To: Feng Yang <yangfeng59949@163.com>, david.laight.linux@gmail.com
Cc: aleksander.lobakin@intel.com, almasrymina@google.com,
 asml.silence@gmail.com, davem@davemloft.net, ebiggers@google.com,
 edumazet@google.com, horms@kernel.org, kerneljasonxing@gmail.com,
 kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 stfomichev@gmail.com, willemb@google.com, yangfeng@kylinos.cn
References: <20250703124453.390f5908@pumpkin>
 <20250704092628.80593-1-yangfeng59949@163.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704092628.80593-1-yangfeng59949@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/4/25 11:26 AM, Feng Yang wrote:
> Thu, 3 Jul 2025 12:44:53 +0100 david.laight.linux@gmail.com wrote:
> 
>> On Thu, 3 Jul 2025 10:48:40 +0200
>> Paolo Abeni <pabeni@redhat.com> wrote:
>>
>>> On 6/30/25 9:10 AM, Feng Yang wrote:
>>>> From: Feng Yang <yangfeng@kylinos.cn>
>>>>
>>>> The "MSG_MORE" flag is added to improve the transmission performance of large packets.
>>>> The improvement is more significant for TCP, while there is a slight enhancement for UDP.  
>>>
>>> I'm sorry for the conflicting input, but i fear we can't do this for
>>> UDP: unconditionally changing the wire packet layout may break the
>>> application, and or at very least incur in unexpected fragmentation issues.
>>
>> Does the code currently work for UDP?
>>
>> I'd have thought the skb being sent was an entire datagram.
>> But each semdmsg() is going to send a separate datagram.
>> IIRC for UDP MSG_MORE indicates that the next send() will be
>> part of the same datagram - so the actual send can't be done
>> until the final fragment (without MSG_MORE) is sent.
> 
> If we add MSG_MORE, won't the entire skb be sent out all at once? Why doesn't this work for UDP?

Without MSG_MORE N sendmsg() calls will emit on the wire N (small) packets.

With MSG_MORE on the first N-1 calls, the stack will emit a single
packet with larger size.

UDP application may relay on packet size for protocol semantic. i.e. the
application level message size could be expected to be equal to the
(wire) packet size itself.

Unexpectedly aggregating the packets may break the application. Also it
can lead to IP fragmentation, which in turn could kill performances.

> If that's not feasible, would the v2 version of the code work for UDP?

My ask is to explicitly avoid MSG_MORE when the transport is UDP.

/P

