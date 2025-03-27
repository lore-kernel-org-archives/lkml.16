Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EEC188CCA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088973; cv=none; b=Oo4wUiDmyDlZuaVWIfX/POESkwq+nvd8qqNuGjt78JYA1lyRtnX9KWdItp3Bw7a7XEmqEHgpSt+w/lAZdJGYSYHOb3MaGhZM34hLajB1eVSqOFuG5IpbCcfLD/vG9/9u2mRIyb9eVfshiSlM7hM5vyKGeSrK82U2Qdq3z7MkOlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088973; c=relaxed/simple;
	bh=1nGruMCbppY7qn4neYE0wvu8NfeEHt8bZVd8Orps9qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czrGeVVw0tWKCg0NF2PLZ1EwnprEjK79agLv3jMuxMhV0F3v7Fnhz49xcseVv+KviGNCTuOQVlaE1uOfmOnvFIcBFxOaoHGP62rIJ56Qa4Inn6425lzC0Qz20nB7sVgAG4eKgEKKJlvEUIFaOstYKuwJY7i6h23lesSqr0v30oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aoJjBXvT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aoJjBXvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743088969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyIB6mZ7OHIQ8TN1E0AWKE682onUFLQ3XEbxIz51DMc=;
	b=aoJjBXvTG6ZabkrU6jjp2FKkMwfICmt9aNTrfHqMv7BVc/7Z6s6PX+nf1KYQSNT7w6gAYr
	3yyfrr6M24D2/YWWX+B4Y2yAAmNVvt7U9Q7Q6VEZ4KLmiSPZqZQ4JWNZAYWZlibccnB2nd
	RPyfNc5JXN94i09798iZYfOaOhlN8GA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-9xYZuFDVNQu7vuSr1o1viQ-1; Thu, 27 Mar 2025 11:22:48 -0400
X-MC-Unique: 9xYZuFDVNQu7vuSr1o1viQ-1
X-Mimecast-MFC-AGG-ID: 9xYZuFDVNQu7vuSr1o1viQ_1743088967
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so630360f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743088967; x=1743693767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyIB6mZ7OHIQ8TN1E0AWKE682onUFLQ3XEbxIz51DMc=;
        b=ept4trt/cW3rZ+rBl+cXFqsgaJwbfM0T5QWPwlwHJ2cwPAQzZ4zCBIvWeMl1l5hTkx
         F9pdwg1yO6TmprWePeaCfhHq1IOw9Od+1XTBCI8YkZxFTYDMMe76O3gZY8avMwqh8N4a
         jkPmSuVUCW5JGexAkftxnYiJb5e/wDPwTEPNUFnT/P1L33G7F/P5PDUX6dQeRgDkeMJW
         okHxAdHKt9fyfC9CywNnfRM45uHE56qVe3DTaxsGdtMX7ndfzjWG7rJ/bEtDO0A+Kp8H
         klGpNJsKO1krXJw5c3hN/ogolfgApxfUDWMEBB6HWgjPQAkrZ8/SOfU0fnmq9G/CWiyz
         T0og==
X-Forwarded-Encrypted: i=1; AJvYcCVUq53MzuwOp25fUx1al3OXFEyrscS5XSMVG0+k+AYTO7gTHqHmNBnYZ1MoXbIWP/e0dJxYif0yNEYa7ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvaN/hdLKNIJu5L42HuQdtYJrL+22WZdELXJK3osCris8xgyyl
	FE7s14I0GyaGML0fQTk9vQypvhk+5AhWAZ3SRC5ejTipkcZser486qzwb0HG2yOa/pLz1ua9IB0
	MHTfwZ199IcznPBEgTgudA+Cc9HItXMUw7i/3SRD/eysaw2TA1x6OwwwVksEgDA==
X-Gm-Gg: ASbGncuu4DW/25JTu2SmmixAUHkkpTd5kPlG3MA1CggJokuuJ2/yCmJGGF+1lvNZfF1
	zFMi1EbZDqyKelX3Bby6OP6BBm9lgQlebRtPl8K6k4DZpPIFzdFx/0IzhTHtXUD3Kv9GaLeexKg
	SMxq3OUyVsc+SPuQLQutArO/0nx0L6QIBCkv1GcRH5c9wRVryvhj1XZykYovyuZL7tp71XkTxaq
	QMoUQqXsRgRhfnZH0gAewkPmFSjArlGXdMm4JLUJJtstG5l3UpgO9ZPBpnqelC62zJIPYRETnJy
	h7u7+9ynnfKoVH3AwAgcsBYdqn/tws0IoFle0PN9YWKmkRrG4mu3fE0=
X-Received: by 2002:a05:6000:1f88:b0:38f:6697:af93 with SMTP id ffacd0b85a97d-39ad1740e6amr3598497f8f.9.1743088967247;
        Thu, 27 Mar 2025 08:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9Nh306S6nC8D3y6/2MymAxytzfH2EE+T7OhkoPuApxgDdG2zQZrGWFxbxp5lSU2j1CNBGxg==
X-Received: by 2002:a05:6000:1f88:b0:38f:6697:af93 with SMTP id ffacd0b85a97d-39ad1740e6amr3598456f8f.9.1743088966782;
        Thu, 27 Mar 2025 08:22:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede98sm41019095e9.6.2025.03.27.08.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:22:46 -0700 (PDT)
Message-ID: <a495133b-7fae-4b88-8254-78d65677990f@redhat.com>
Date: Thu, 27 Mar 2025 16:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/panic: add missing Markdown code span
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250324210359.1199574-1-ojeda@kernel.org>
 <20250324210359.1199574-3-ojeda@kernel.org>
 <dd1616d5-4808-46be-9167-6fbfe76e0c73@redhat.com>
 <CANiq72kz9SW8Rexj7feZRvTAhgF+cBwarpFnqu0TSk6C2r9SRQ@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kz9SW8Rexj7feZRvTAhgF+cBwarpFnqu0TSk6C2r9SRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/03/2025 20:04, Miguel Ojeda wrote:
> On Tue, Mar 25, 2025 at 10:05 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Thanks, it looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> You want to take the whole series in the rust tree?
>>
>> Otherwise I can push the patch 1-2 to drm-misc-next if needed.
> 
> Please take them if possible, since others may want to take them
> through their tree anyway, plus it should have less conflicts if you
> change other bits, plus these are independent fixes anyway that can go
> in on their own whether or not the lint gets eventually enabled.

I just pushed 1-2 to drm-misc-next

Thanks,

-- 

Jocelyn
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

