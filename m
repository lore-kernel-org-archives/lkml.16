Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724321421B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991557; cv=none; b=n89wQwdzYBod2Zl4vQ/W3gwbnKjkJM4nM2Sf2cIi4TI70xEMX6WSYPjH0EQz5B6Icqnni+Ly+euPOJK3HQHprexTMqmpgDSZ/P/MlPbValTImu4OyDKsbbpETMr2E3mxkf6pwvq2M00+3bRF6hepnaZMqpfbd+GiFgzvWke0hO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991557; c=relaxed/simple;
	bh=F/FqzNZ9qlnPa1jemkgvzEU/JpEsiXoIVKP/J4XS9H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw/SQfHjSe64GGNhVFQG6ABE1tW5yMlrQCo7CLIN1/5xvwJ67vUc68VPHUAhxx+UYFTZA4h7LxzR7usXY+ReJOFrPDrxunA21SPW5eHorfqlU4qzmpsjCjNm1d0ExZnngVqPUoF6OXfnSKnkPTX8JikVDigs2yaL4Q2cPphSYRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N0u+B/TN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N0u+B/TN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744991554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wc26qQbycqhuxkUDZ6Sh+SUpqvdXJSaAUblqosEd3s=;
	b=N0u+B/TNvBR/ightFvb3CU7X9BRk+DW3HNHhWi4gxkgmKSAodKpLR5lgaehXM6CWr3KHSh
	PrGBbtEdCISPgF7MZNMGCQkJ69G6INYuGrOeji+jnsBCPgK5uW2CSFvoW7ec3XmXPnNggc
	WyiwlIDhawP8Mzt1a3e3nBIy3f+ct/E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-F34pG41GOm6wut6NpenehA-1; Fri, 18 Apr 2025 11:52:32 -0400
X-MC-Unique: F34pG41GOm6wut6NpenehA-1
X-Mimecast-MFC-AGG-ID: F34pG41GOm6wut6NpenehA_1744991552
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso1362651f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744991552; x=1745596352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wc26qQbycqhuxkUDZ6Sh+SUpqvdXJSaAUblqosEd3s=;
        b=TSc+igjaqU1Cw+XYEhbPREca848KS9avfQcy6BzzDZFMvkTo8u4MtePGENi9OUvCnM
         ZJxQawnrktJKPJXWkV609X4ZCw+T1pmvackspHPTQnhNxIzNePOdwguKCGkKqcPh7Vxz
         r0B22XVG19wmrZt0EW50Bg8caqdm64NzBEtxBpiYcLaH4BDI5fiEltTQxBKGJuqNKe1E
         5b7vmutukLbnBUgs9ndiDyHKunO+DNNwMvNxdhKr+hw2Vl9DIhP51oUqGb9SH0MbT8UK
         cTJ59cvxRT7Re1uv/a2grV5Av8/OTJCd69zMxhKmAr8UboccMzgAqx0MxlQRkBJ4MeSH
         Yzrw==
X-Forwarded-Encrypted: i=1; AJvYcCXwDyuGxoyNAPfnbcBwfw4QLZFWIK5ozYrIWVnEULegtIQYe9i89YopfALU+SStKU4DVpNW3DLrGVx9NEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDm8vOIlHpTjuaDKF4tHrv7UOrsRzeqgUT4l5JVBDUnu1YZOY7
	SAKvkzo2lCaE21alNiIstET2tinqcJ0ROBiKMbKJajmNq3AcFOf7skNc9pa+N5Fsgi49ANYXMTC
	+vAwgw2R75lkT7mtt+IjUqRvZ89EQKbyt85604xjOQ2rTslq9Nph3xpnc9RxN5Q==
X-Gm-Gg: ASbGncsrhMncIMJT13rsOmaoOVqsVg8x9usha7sfAJmj0JLF8Rw1wBJnEl+NdlqRAmq
	HjPCpbQYmfliNqRqfHBYnD1Hh/MSfOsaKtOzrIBHhi/aDoAYPaeXFNhwH7UZDy6z0cEFL8C6MxC
	PMfXj5YojuK/iJveQ3eHe3p5Gnn1MkLZHRSduS1pGmcLxWQnCpxCgcYgCO7LeouJ8XQEy/SBL1Q
	0KLaEVcaiu1OXWrBpEWbNZjc2kBnMum7lAEc8TOW1Z5641d3blip/MiUdcJ8DKpMeSYDZMLmwD8
	BIElAjtTvIS5T7plQnJdgWZsxUJN57TF4WWwJZnyA+6gm4RFA/U=
X-Received: by 2002:a05:6000:1886:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-39efbd007c0mr2568836f8f.0.1744991551741;
        Fri, 18 Apr 2025 08:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8hJOtqgZKvHmMFX8Sr5+SXl0HJhOYBEusxbHJ4Nl8XaJ3wP71Jpwu6vFmp9aQLWT50/PDaw==
X-Received: by 2002:a05:6000:1886:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-39efbd007c0mr2568820f8f.0.1744991551365;
        Fri, 18 Apr 2025 08:52:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433191sm3168492f8f.31.2025.04.18.08.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 08:52:30 -0700 (PDT)
Message-ID: <7be276bc-4c55-4144-ac29-b734b1f44667@redhat.com>
Date: Fri, 18 Apr 2025 17:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: use `///` for private items too
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20250416122106.2554208-1-ojeda@kernel.org>
 <CANiq72msZ7FUo0=KXQjMkXjfm3jVaNhhVDCu_BFXRTL_xC0vog@mail.gmail.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72msZ7FUo0=KXQjMkXjfm3jVaNhhVDCu_BFXRTL_xC0vog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/04/2025 14:24, Miguel Ojeda wrote:
> On Wed, Apr 16, 2025 at 2:21 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>>
>> `///` should still be used for private items [1]. Some of the items in
>> this file do so already, so do it for a few other clear candidates in
>> the file.

I just pushed it to drm-misc-next

Thanks,

-- 

Jocelyn



>>
>> Link: https://lore.kernel.org/rust-for-linux/20250416112454.2503872-1-ojeda@kernel.org/ [1]
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Sorry, I forgot the Cc: Jocelyn (it could be nice to have a
> `MAINTAINERS` entry for this one).
> 
> Cheers,
> Miguel
> 

