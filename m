Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17FD2D77FD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535304; cv=none; b=QtAcudMzOBJTWL83wODpeO1sDxBuh1oBHUiJgnY5YnId8SAtVzmJI5NsNdaB0p/gzWR4S6UkNqAnlwMhpulGkhxEisKYauroTmH4G9XF+u7Enqzf27Hwc0LNGACSG6MMe2zjeJYSncU3I3J5cyhMem4S/tto5H//T5hi+u7Ax0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535304; c=relaxed/simple;
	bh=VR6ewPlkDFxYVcgxyd675Ed+HjCla7X/pFXJY9SXONM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcYWhhldTaulFJxofnWOn/gYg4Z/FFyVmqTdQWpN1qrDJE4Jo9KVyb7C8OOQTrqZzJklGSLRVhc9nPM8NJdyQN6SzHC+wknGvw4QVT5706xFUlcUNxG+RydOlrjtVdH4iLVnWCTFaFC0X2mV72vfkOOmJdodyqKEGhNMfGeBU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EsNz4cM6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EsNz4cM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751535300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/ecjRiZ4n4Bi63qDTEf/0ZSKiFCmEcZDCqQjBwaZSE=;
	b=EsNz4cM6h4/ptiaMsKO7dKr56tplXuMS2RlGXegtBd1SswWumsaFaXCLAj5CD3PexRb2cj
	OPmQoNIKdhTbzEW8cLvtB3ZOf9UqImnCylVTerswFDTBv5tNsnI+HIfcBTcQiy9xbPt4XS
	xfL8zuWU1Lfo4YhjoH0b85a/aKtJc2M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-C-BdJ5ZGMm2XRqFjUd9L6A-1; Thu, 03 Jul 2025 05:34:59 -0400
X-MC-Unique: C-BdJ5ZGMm2XRqFjUd9L6A-1
X-Mimecast-MFC-AGG-ID: C-BdJ5ZGMm2XRqFjUd9L6A_1751535298
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3863184f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535298; x=1752140098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/ecjRiZ4n4Bi63qDTEf/0ZSKiFCmEcZDCqQjBwaZSE=;
        b=gI1m1hkfWWFNHGI1l0GyJ2znQBT8ov0On2NPhp5cPUpOPv/iJ0UE2sWjKYdsnbWcik
         rDKvkD20HSrsRH30IybHSQNiEr31df273bVxxv539UXPTtZPRt9ln3VuGtxEL2YNW7kB
         t2qzQWoXVLktjENUJgzMIgUu8RBgql8TgF2k+y3myS5UFm4Qvvx390i+8H6If31bSbxs
         HCNiX9YbzwY62uJcSwIUtAUFaKbRq4whJbFkweeg7x5w9xva+VKK1tQTTf6EsLW/ogqV
         D3j8/5zKkiUOaECCwgwSYXIpthRVqfZr5G2WUIZULT53oME5bbE1F9FOPjhk7zRfcMuT
         z/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/n4LRx1ts/QJAMWFrjamQRiVMewR3GRXPQvknuSGFhWAztL3h1sxYW1eSaXUHHj1rZAVHH2nVgVqsUzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqfAigWeyjruecRGD2DbfPuc75GXHIYKJtA/I3SnS7YU/Sr1i
	YDVVB22VImKP3Xbt41n4HuQ0xeIGx9wXUIAiTrlSJELveWt0N6sJoHacTEs1RUMesqEvGPxx/Sw
	caZsx4NpM1xghXmhhcrrAs6Yk33PAOH1RSfOCcEQoJwqox6P5atluf/JMbNzMgjSDwRSbJwX+kD
	Qr
X-Gm-Gg: ASbGncu0mXF7tsDJA76Vc4ULWr9GhuczBHzRo8YczhScPnjRUpgKuAxLvIHk/LnXNqG
	B8DUb40jMl/J4e8EZ1//390CeWvvrdVd5Gsr+UoNj4TcInmIzQYdCX4zfdQNY5zfhRcI9JL6aLI
	8fkgAwInn9schrOWbs+tCM0Ql1KGcYV6PkJZB9f6IPjGARONZRKH8foJYos3Fw6lR98XDO/L45s
	QxKzkaPFsFV4J0a93b48K3KLW8KEgHzWMC/ppKWNEcPfUQvmrG/z2qCoJWiAYCVUIDcUqtaDtnW
	NdR7lQN/uWU00PRfC6EZ7rjSJe2NLAjAblaH/2MRwNFRg9XlALHEpAzfG2Dbn8q0LE4=
X-Received: by 2002:a05:6000:25c7:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3b1fdc22221mr5018373f8f.13.1751535297789;
        Thu, 03 Jul 2025 02:34:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7Sup7XyxN+vlAC3A6KR6EYEEhcRygZVV8MNmYtKBfNlpT2OJsvFJElmDrry1SsdzOsPGkZg==
X-Received: by 2002:a05:6000:25c7:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3b1fdc22221mr5018346f8f.13.1751535297350;
        Thu, 03 Jul 2025 02:34:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7098sm17827679f8f.4.2025.07.03.02.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:34:56 -0700 (PDT)
Message-ID: <c7eb3517-2fc3-4d91-8fa3-e5c870acece1@redhat.com>
Date: Thu, 3 Jul 2025 11:34:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 linux-kernel@vger.kernel.org
References: <20250521092236.661410-1-lvivier@redhat.com>
 <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
 <20250703053042-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250703053042-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/25 11:31 AM, Michael S. Tsirkin wrote:
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
> I take it back: given I am still not fully operational, I'd like it
> to be merged through net please. Does it have to be resubmitted for
> this?
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

I just resurrected the series in PW, so no need to repost it.

Thanks,

Paolo

