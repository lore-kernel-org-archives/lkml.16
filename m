Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F01C3BEB;
	Mon,  2 Jun 2025 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867163; cv=none; b=s0b1C85RG6TXnw+T21xSs/uvdhCBdWbFIVNRDUB9MCxMYjxbOTNVUChpxL0FxdCfOpD4axPOoq4rmYvsEMgk/O87gJvg9HG7iBWTthA6FXg29f2ve6mK/yP8spEvnawAkQBXLSuxXQSZDtfqf4ZfD558s4VUoiEJGjqz/eYBaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867163; c=relaxed/simple;
	bh=IvyJNoELFWAc1pwZK+On2sYk30E3H6Bv/8JU7bkB85k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvfduy/ST6xibayLarFX4kfKxuEndm+PJ4EvTxCJkfh/7Xn5iNhy0bl7hNat56R8Qg2Cc9/K2g9ll4ZTVtyis9yS8z6q41Vsi0vA6cZuOFf/GC/2FOhJb6qDKVWZ/towUFEMy8GGSD6lm5hOGxXnL0wF5uYLX6MYuqFqllF7uJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlZX0/wJ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlZX0/wJ"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-31062172698so42336711fa.0;
        Mon, 02 Jun 2025 05:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748867160; x=1749471960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+xZ+1rNLzamfg62JThm32IA/jBJvxSiOUYhQofWR7Y=;
        b=LlZX0/wJKafnFvB+ORVJsAkWbkWzFAoNESv0jE2azkQVXihL4RMxNpsHIhxsGIufyG
         7RG7CoPt6XJ/HhjtX31Ad2m/fzMOZVzmfNDjqQ9I4GmIe7HaRF+ufZKdpf5xNEgYapQI
         i6ZRQrZt5NQPRaHRaaA1aTD/dbWEDxdGbXX3F75OWM9DTscCpTgXINjAiAfxUI4GMS3s
         lKNWGJCxi2MQo2Nl2nVYi/dwyfMr8kceX6jXTmsvBYnafP4aw3naUssCeHSNRMuacdc7
         4l5D/dpgd2nvxMLE+rn4VysG8sJ0fCKn8MjWBR4Px0In9vVJcb8QL+CfH5mlqxCzlz6X
         6Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748867160; x=1749471960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+xZ+1rNLzamfg62JThm32IA/jBJvxSiOUYhQofWR7Y=;
        b=H0pFi5lwplyfopzSM1FGBjvNdCaPGqDybOwcIMeqQAZwvaUCDjYSVXAoStdrCuZQBn
         PGyps+xsXZ+eM2+6SzA51jZaqtGs6oDUovyap4XTTfggD/JHgjF4jriZeZ2Qdf8lSUjY
         Nmq7ytalyh+jwQS/37tHPrHdOaPTZ4sUaeMDBPfC0GbrLLaGPGbRLC950XmsXc2QhpJI
         aPmWEXOhxsQYM/QvF3ftwU/sDdvgAlb0auFt367uYSdXkk5LCXqp/ruuIkT/IUEfd5V8
         ps3xzoIiiGvhgZ8BYzUVrUZIhdK7EKRSkmmnJktHQ4KnLuYy9q48i4s/vg9f8Uzy/+TW
         h/dg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZJx/4eUezg2E+WHr+HsKBtSWt8DWrlKTzYFUk8BMyZPEkYHFEWb2w/6vmdoLKRY1x4JG8Py42pehUTNGoMs=@vger.kernel.org, AJvYcCULKT8lAWN6qSxVjf7GwU8uYJDSZDTCmYRJHHVUo1vGP31R61JIWQwE/Qs8jPkgURr41O17SNysQhgm494=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdqMyDRms3e2qCt6Sk9CH0isJM46M3noXLJTu5qsCJsVFRZcS
	xK+6GmySbhp6ABVX1a8fcxs/Pa3qNgviN5qjWWXUQ8MzGG8JnyZJMegEN/PIzQ==
X-Gm-Gg: ASbGncuos0GhUz96bpn8fIdVKXVRurl2LZ17lHICJ8M+2PV5n8z4JsLiTODXmLP98mA
	KUbqc8+d6smr9kgejC2E30IHZ45FWV/wtpRfzwOrQ/4rHksAfJL4qzxOFpJd1Mei5QTH1ucVXgl
	TaxGku2+W+cf0Q064xWC+4OzYW+6eqZYFvl1JzzmyIw3j5DAcJt6IVdS/Qtfuho4Wi8mYitgw1k
	jBhHkAHzbMdMkSFZLN+/x4RNu+pUoLebZLa/A3uqiy0ziZuUEBCIn3DipEwj1j0XjX67KziyDJx
	weRzGAxcBYHu02TU3h6p5k15RPxhCKoOyvUODIBs2urbFPyJX7IkAxK0/dAlFHg32/xo9pyxi5i
	dned8wnJuFVCmBcv23D+MYumIkL/QeGpm96Wx+HI=
X-Google-Smtp-Source: AGHT+IHfLZLW7auV30M3BKqzYy/PS/uhPlzd7MURt+DLuiKZmTu4Csl3qjOP0d7BohBDI7Zrb+dLMQ==
X-Received: by 2002:a05:651c:3247:20b0:32a:8c95:d841 with SMTP id 38308e7fff4ca-32a9e9cee67mr11289011fa.14.1748867159569;
        Mon, 02 Jun 2025 05:25:59 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b527ecsm15045091fa.48.2025.06.02.05.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 05:25:59 -0700 (PDT)
Message-ID: <5380b2a1-8a92-4362-a014-132fbc301579@gmail.com>
Date: Mon, 2 Jun 2025 15:25:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
To: Jason Gunthorpe <jgg@ziepe.ca>, Alexandre Courbot <acourbot@nvidia.com>
Cc: dakr@kernel.org, lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
 rust-for-linux@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca> <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <20250530141419.GA292183@ziepe.ca> <DA9KQF9CY77R.77PBMU8Y1FPY@nvidia.com>
 <20250530145026.GB293473@ziepe.ca> <DAAD0NZOCHS5.9FTVJIOI12QI@nvidia.com>
 <20250602114047.GA298147@ziepe.ca>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <20250602114047.GA298147@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/06/2025 14:40, Jason Gunthorpe wrote:
> On Sat, May 31, 2025 at 09:54:20PM +0900, Alexandre Courbot wrote:
> 
>> So if I understood your idea correctly, this would mean creating the
>> SGTable and mapping it in one call, eschewing the typestate entirely?
> 
> Probably no need for a type state
> 
>> And the `SGTable` would own the backing data, and only release it upon
>> destruction and unmapping?
> 
> But I don't think you can do this, it is not allowed to pin kmalloc
> memory for instance so you have to do something as you showed to tie
> the lifetime to the kmalloc across the sgtable lifetime.
> 

We could explicitly have the SGTable own the backing store, so the 
lifetime of the pages is connected to it? ie., we have a VVec with the 
kmalloc allocator, instead of passing a a reference to pages, one could 
have the page builder something in the likes of:

sgt.init(||
	let k = Vec::<PageSlice, Kmalloc>::new();
	k.reserve(pages, GFP_KERNEL) {
	...
	)

Anyway this probably needs the related (still WIP btw) support in: 
https://lore.kernel.org/rust-for-linux/20241119112408.779243-3-abdiel.janulgue@gmail.com/ 


/Abdiel

