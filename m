Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710D256C75
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282317; cv=none; b=pK53kJHhBM21QAbDLTs9lsIH1I2shytUULfRM/cgBUTS6Txf2QazCbvZzsMrkCVSXiPbfZkynAGQgxvROhRnc/6QOb0UuAAp8i1bh8PkrZoLMOAeQ98N70PDo9GmgrjzT3DdwXJq9AGwMSBrlaSe8dwKqQGzQFjMZbsvrL0jvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282317; c=relaxed/simple;
	bh=Hu/dyNyMQiMt3jY/azDePScdyJcDtyMqgmW7s3RlZB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R32thJqy6uH2GtYgHJLNwf44/iEmf2KNAZo+3u+3RtjiPpIS2N+wp7437/roqIHofJljA2wCHC/FJ80LojMMDNOIEmrAV4gW47tGMivXzfVpvMOhAQSTqXw3kQrTHy7cvkPqDcL+/AOqOb2WzCx5508sjN0XHCl4khxMU9G5s6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfMqTbz4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfMqTbz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744282315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hu/dyNyMQiMt3jY/azDePScdyJcDtyMqgmW7s3RlZB4=;
	b=BfMqTbz4uRoPhhebYLBXBh2iPrKeUYvQAnhRwjKYWk3L/MQpDzV5LlqvyP+E14410RWM4Z
	xhdcy+CBA4a4LrQOeJRi98gRK/Z/Fijhckl4hXcTHZ/OkTHyOetm9CrDZRxmkAImRfljJg
	6vwubNugLU3K9HejUUF8bLvOS6tgsz4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-rDFtDUxnPO6-5lpVVnr_Rw-1; Thu, 10 Apr 2025 06:51:52 -0400
X-MC-Unique: rDFtDUxnPO6-5lpVVnr_Rw-1
X-Mimecast-MFC-AGG-ID: rDFtDUxnPO6-5lpVVnr_Rw_1744282311
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912d9848a7so886471f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282311; x=1744887111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hu/dyNyMQiMt3jY/azDePScdyJcDtyMqgmW7s3RlZB4=;
        b=cHzSP+e6DmUbxMK/Aw6Z2Xdn184236eTRXlab8+wS/JV/KLhkv2XusT+8VyqB0y+ku
         r3VPlrc5pp5yNWxR4PQ59jfizQwEE0LHETURGkRkwPgl1FRnPohSn81HHeYAafqnaU5w
         Y8IQMBM257w/CkjUpGTkcRaG9sM6l6APPK1Uc+ybCpetsfJ400XbW+4cXrlk94XSaiiI
         WdxNBcPkzlgAiEoKl1Br/odc7PXcSR1g2WcRnM5miiBpKyEvAHrffkRtVjgKThSYAgyv
         U1rdD6lpm+hMQjL+Jpja55l+Y+EDQjKu8dSrvc3Z2nbCKxiMrUD3d4oRMXS6/e3XobHN
         ajkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNpqeWXs90edcm9jTuijlwtsQg15MUZKf2dNvYW9sI6Yg5jxOL3w6G/bnXX4LQPZSyfkpVmYmy4q4V0A4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK5NgbLhUvfhLcReWgAHPoSlhPD6BNlwxegUM9M0VzJsSdyt9b
	kjYSn4P/CTSWfVpz4AIumStjvH/wM0sXH6Xf1zm9UfE9Qfbd1WFz87XZAOw48bSrJ2z5cUpm60H
	rn3fVuGhsfvoN4lfWOcnpFGfro5S8GVKQLr8fes2HPNDLViCJbi00hKbbIPdobg==
X-Gm-Gg: ASbGnctVcHyhd0MTAauaO4aMwm5/3A3OjJbaUxXOfPYzCH6SRLFwmki7BL6TYGK+nyM
	Q1iqQswgQQcjotQ9U9KCQQKKCFHC8ycvOslYXT8JNwhVCIzKDzN8tDidO/lo3V/YCJbkQB5mLbf
	wP0REkv0TeFjYO2nYS0oZ4cl4Fl/OI0TygcPPFJmzCbYGVadatzNoTnx9ZLI/ZwqkjkJIYYAhAF
	kO9ZjWQ7l8r6AQIw9qfeNNnH4vRZ9frycqZ0P3PScnEQ8I5b262gXQAYTXc1o9J0Pr22sXJE6sq
	lQPErfNkfXYuUdA6X2FJQdoQV0aeDgKkNl2PNbk=
X-Received: by 2002:a5d:648c:0:b0:39c:2c0b:8db4 with SMTP id ffacd0b85a97d-39d8f275fbamr1595329f8f.10.1744282310744;
        Thu, 10 Apr 2025 03:51:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/0IeDpLk+TZuwsPB4YIsabynndJrajxwaMO5dLlq7dbzR+E2v8IMog4+FmRDVWpawIdK9Kw==
X-Received: by 2002:a5d:648c:0:b0:39c:2c0b:8db4 with SMTP id ffacd0b85a97d-39d8f275fbamr1595300f8f.10.1744282310374;
        Thu, 10 Apr 2025 03:51:50 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4359327f8f.91.2025.04.10.03.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 03:51:49 -0700 (PDT)
Message-ID: <22ad09e7-f2b3-48c3-9a6b-8a7b9fd935fe@redhat.com>
Date: Thu, 10 Apr 2025 12:51:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] vsock: Linger on unsent data
To: Michal Luczaj <mhal@rbox.co>, Stefano Garzarella <sgarzare@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20250407-vsock-linger-v1-0-1458038e3492@rbox.co>
 <20250407-vsock-linger-v1-1-1458038e3492@rbox.co>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250407-vsock-linger-v1-1-1458038e3492@rbox.co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/25 8:41 PM, Michal Luczaj wrote:
> Change the behaviour of a lingering close(): instead of waiting for all
> data to be consumed, block until data is considered sent, i.e. until worker
> picks the packets and decrements virtio_vsock_sock::bytes_unsent down to 0.

I think it should be better to expand the commit message explaining the
rationale.

> Do linger on shutdown() just as well.

Why? Generally speaking shutdown() is not supposed to block. I think you
should omit this part.

Thanks,

Paolo

