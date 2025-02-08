Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A91A2399
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739058923; cv=none; b=Smx1vS9gXdVcyRVZCH6zfnBPzV6eE6q8GkyIDeXKeSguDimF0KBBl9qD9pb9LoIaXUdbFyUIFdyTS4qaQwnzh2QBcXA/rQn1rQrp5SeuzQ5dRpAlyZHOmlyjD82eH85k8viGJmC4ySxj6jhN6ia9tgCsH2wqZaTQfreao47/J04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739058923; c=relaxed/simple;
	bh=JRYaldM9lNmyv0V3AluADdJ9dlvrHbXlkp5UU3XH9Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cYOF+f6ArPFaxFjALianelOQI+PgpHRk838gZUTtpL9pzDyp2lhu2nGSNw7EFmvJofOQA0M7zOMOMLDtuV9fE2XMd95uPwUg/gnioFGJudyCH1+8Mlm2sVANI8F7K2goq7j8+jTaxdSX26qYxpdrhvUE87Apqhlq3vtcOZOQMhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=V/GdBK9U; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="V/GdBK9U"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-726cdcec232so205951a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1739058920; x=1739663720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPicVwQS5wbJAwKsL40Ymzq5q/Ob6IjbFcIhIGSOedI=;
        b=V/GdBK9UEzWMQ14583BhtSuIbTUKMhwLIrtAHFBPCs+yIqupRn5ykVRB/TCNqSOiJB
         rsaqHlYpxej/dfd74EuJuGXQ9/My16iz5tDiMYZeqNys4gQnTYkkhLf1aWD9hDJvsPaH
         r+WeeNpfPmrPGLtGgbC4WbbrnDh5oOXsKX1bw+u8KO+QPPrNCaOuRTpOnogQjNaaddOc
         0wqhzhTXQjhbz2wqrIomBn9wP0lsnPsQ5H0v7nPpR2dl1ijYKZ7jUpqwiw6r9IVtSbxA
         fhE0Hd3U+wvEfkduXvUQqkreZrUKVv/SYr63utjnyLmNbPv/xEoRHYooy6ERuXtRdWZj
         q7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739058920; x=1739663720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPicVwQS5wbJAwKsL40Ymzq5q/Ob6IjbFcIhIGSOedI=;
        b=RkmhbVjq/UkQ+nCUlHu9xSZ0IO29y3nAEE5riPxR4NFNypDL5E/sGZWsHIlbgeloyX
         /vLUuhiVbNssUqOYVvfTBWsmay/WCN5dSU0tY2lDMvRraV5WAgpYaMhqkvxP/ehrXdmG
         MLYa8mVX32NLg69ViaaQ5FwBEIDawx1dFUSKIHvhCY+eIS545ilMiD+YBk0NOBgqcouo
         a0TpajDNSxC7SKaiNsvKQTS4Gnpk7EvihhVCzE3hJCFdyrLmLEkfVoDGoK9JDvmRDAUG
         kY7DbSMhA5VCvJn2Dd+kY6FSPS5F5Jh8JGP7MJGUg3DFDdJ85lZONrhjSnTmcoDvUdVX
         xGnw==
X-Forwarded-Encrypted: i=1; AJvYcCVsHAjJPu0rrcNJLbmiu+NEvkFQLsRfppGvoaF12f1brDPpH8zjYFO16/UZ+1G15deZNUpz2V1JGLoP1M0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz08nISASnjtCMC2hMVql6mrOnKl92Y6NphhvaMP5W65WzF27O
	5dgWoKym+1khoYpUANE8sMJmO2MQ8Uw2u7z6vQuagHX6sRIa4Bhg7QdXWnqmBIU=
X-Gm-Gg: ASbGnctGh1Zdi1lilqcwJUEJGCUTLXk0TIgGYIjwWAMz7/YMrDSICM0urNqqXDmhDv5
	f9XMSql7hGcAEyPfbA8qjqd0B8CyUS4r9DU3l1k9ITP2TqzedXj+O56/nz7pqDRZjYSdl02jMon
	n/o93FTapSdWoZMiy7b2WuAgwuoHwfiBHgXC8EpywGBFQQ8NLM7os54f63b8TyEmbReDYmcBHO3
	bDaHnlMZ2IqY4jGIM+JVtpbkvANgrveadlYV/8JFw7ASKOvXFNFyogKe1T3DcJ1X5OjE1rc9Pdl
	dg8MUNbsx+oiebTnurQ815TK9NHpVbRCPqdz1j6aUUy5ehOzTz6QHBKIHg==
X-Google-Smtp-Source: AGHT+IHWk4r4HVyiqLL19e9cELrxNlFZUIzBX3h21rZtA7zL/FAkU7jPy3L3H4qYyNZyOB/xY8XDPw==
X-Received: by 2002:a05:6870:5154:b0:2b7:fa6f:9672 with SMTP id 586e51a60fabf-2b83ee95b12mr5471087fac.38.1739058920357;
        Sat, 08 Feb 2025 15:55:20 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b826262333sm1734780fac.37.2025.02.08.15.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 15:55:19 -0800 (PST)
Message-ID: <1894f095-e93a-4def-a223-d5c089ecc2df@vt.edu>
Date: Sat, 8 Feb 2025 17:55:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@lst.de>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
 <20250108135951.GA18074@lst.de>
 <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 1/8/25 09:16, Miguel Ojeda wrote:
> On Wed, Jan 8, 2025 at 3:00 PM Christoph Hellwig <hch@lst.de> wrote:
>>
>> No rust code in kernel/dma, please.
> 
> What do you suggest?

This is it. What do people suggest? This thread has received a lot of
attention -- maybe it's an opportunity for the community to brainstorm.
Here's an idea:

Some maintainers clearly hate wrappers/bindings to Rust, while others don't
mind as long as the R4L folks commit to the maintenance duties. Depending on
the subsystem, it will be a completely different conversation. It seems to
me that right now, every time the R4L folks interact with a new subsystem,
they need to understand the maintainer's stance. That looks like an
exhausting process.

Would it make sense to have a C middleman that Rust calls instead of
binding directly to the C funcs? This dispatcher would provide a simpler,
stable API with fixed function signatures, even if the C functions change.
If a C func is removed/changed, only the C dispatcher would need to be
adapted, but until that happens, a new error could be returned to the Rust
side (not ideal, but Rust doesn't just break). 

This would obviously impose some limitations on the Rust side, but it might
be less conflictive than direct bindings. Also, in Abdiel's case here (for
example), he'd explicitly take on the maintenance of the Rust abstraction
and its DMA dispatchers, leaving no ambiguity about ownership.

> 
> Thanks!
> 
> Cheers,
> Miguel
> 
> 

Thanks,
Carlos
