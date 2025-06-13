Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD02D3238;
	Fri, 13 Jun 2025 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810715; cv=none; b=T0yThhAl1adp3MxWObS1vxe43/H1W6cF7JrKFcS/O7ZBCY6VE/bNR1TByCU0uYj8N4GoR85DfFgyuc38kRXRCdt98errQmcYw+nTROsi8M8EGTAVkE2R/h59ITCek3Jxf0/CJS9wUUzL++g1125pcn7SkMI0cKeb8h6YIleBFVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810715; c=relaxed/simple;
	bh=Jo2S1Vhmz+DHyBwpm2/Wakx8tkEoQUYYmyKwEmiczVc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hbJ2E3kPaJOYwcUqRqnMhadFRTQFNHOkbcBCBg9+1xJdo8DGhVDFW6yB0fgLkyw+GzbypOSNVg/ybptL/oztlNls9jIe0x/Z8TjVlHw1gHC5tQ6WjdOU9Qachr+Hal59uSFShczDh4hJlh88f2TFae89VWaYa+XmdnpT6GGDa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B76Sqbjv; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B76Sqbjv"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so16486211fa.2;
        Fri, 13 Jun 2025 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749810712; x=1750415512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qFr8LwPYLDgF3kaOI6zifGZaMW4ZcZipWwfZcZc5XZU=;
        b=B76SqbjvGuUztFvEC3+Lax67vR0xtVZJoerpgY1ljk59lPI4d3dWdwzmqUCYtN5i/M
         iqJsAPPwGEIBjSCcojF27Y/gdznp7w2yuQGoOGXEApMKrxg3NQgOM6xUdxhY0e3Cv6+P
         X1RmVqATrOrYYrV3u2JqDQS8A4aRt2FHhJE4k7dWVToKRvdJ4ByMlBqISt76Rg5/om3g
         vicV5vrWzq91r+sdLVmhvOOXLB06LlKDF/MZS43Bq4HfNhaw0FyWD2wfi6MicgUpUjSl
         LtjYP1tnDS/8Cnm11P1Rp5lYHm5Qm8E2mHz0zjbJ+y37q8+oV68vOIXiVlJ+TeUsxcrs
         3GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810712; x=1750415512;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFr8LwPYLDgF3kaOI6zifGZaMW4ZcZipWwfZcZc5XZU=;
        b=Thv4xscUDqLqwGM+1/m4709q1wY+4dLQtWjh/8vwg1mPlY1RyC9h56AJQfaEk9geQr
         Cu9xYqTeSY/VP6BkQT009u/994JzMfkc0KUyAggBu+cfn5uQJbxt2uNcOVaQt5aaoMWe
         bq3PIe/QUurUmbqBtRSFQ9gcSePMwNvUJQnsnYIMYLVVKtAHarwq8sQu5n7LLgpZG+3L
         9LKc4by6l+8lpesyRfNnjOfH0ifRbdwAtlRBwvjKCJPtV6KZAaNNN3YzLIQr/e401oKu
         u5H+u9gMuAxsvVRZ7SbTiGNqWWXIck5Htg/VHQkwdhZwML2cOELzflGHAIPNh/gPiRRH
         azsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+qw9jIbwqT2uJFV5LaIylPeO9i62vagyz07VpXK66w9EczO2y0OuxkjR5LxPbgSHGqtcH+T3k2tQ8lawAZ+M=@vger.kernel.org, AJvYcCWChJCVNdP+irOGUKFDTATsToNaKMAcK5TgygES1fyp/V5otiUHMn+1IscLonSyN77a+5ozsAkaHXVwFzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlkGM0TAh7qgQEdaBEaABz7Z9j0neeeRoYIqk9kGIMkPaAVhLm
	lTLftdz1FCKLgwwgzww68oE5RNsluc4k8GIQ8RCBv+EIspTWQDUjqptxYtSIapYF
X-Gm-Gg: ASbGnctYwbfcCVHx1LKdm+pVrIuVmKvWeDzUVSFGqBQ4xhtgiuQNScnHHbISXebKFjN
	gCl8HN1Eq+LEUF4fKdo9p0PdruZ91I+NDaHIWE0OxehbJ3wDvsS7BzrENJWAIKTWcRgbIl7MSiM
	rqBqmjQC6wjioUplKJd5F7CBOn4OSf8l+kxEkJ73UxsxYv8kAkSpIJrJSvoDlkwSUJ8dfy/exVU
	RocYjFmoJAHXooSBJt/TE1FAUNV9cCcXbKcninRlgQmmWB4Y5FWSrAWZfNUu032f3Ow8BoivUmq
	DrUZQjTpblAt6WnchuViJdZ/kysgFM0cFLtemuyGtjQyPZPc0IXoEzNNbUvZoap5FG93pLViYmE
	KRQcSfpokboV62CeId0FsXstRP5M37SMnW/P4WA0=
X-Google-Smtp-Source: AGHT+IFRFFHwGOays8LaUCDYJXNXCmkVUhd04lr0fFAv7SLkPad+uB9OtTwn3owIn4pP4b0UsMJj7Q==
X-Received: by 2002:a2e:be9f:0:b0:32b:3cf5:7358 with SMTP id 38308e7fff4ca-32b3eb6edc0mr7716691fa.28.1749810711440;
        Fri, 13 Jun 2025 03:31:51 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b33189c36sm4876741fa.76.2025.06.13.03.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 03:31:50 -0700 (PDT)
Message-ID: <2d269d74-6151-4871-95a3-08089111358d@gmail.com>
Date: Fri, 13 Jun 2025 13:31:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rust: dma: add as_slice/write functions for
 CoherentAllocation
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>, dakr@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
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
References: <20250602085444.1925053-1-abdiel.janulgue@gmail.com>
 <20250602085444.1925053-4-abdiel.janulgue@gmail.com>
 <DAC2ILD2DSIZ.3TF8W39X5DDH8@nvidia.com>
 <0b71832f-f3a9-4109-baa1-f29a8327d872@gmail.com>
Content-Language: en-US
In-Reply-To: <0b71832f-f3a9-4109-baa1-f29a8327d872@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 13/06/2025 12:45, Abdiel Janulgue wrote:
> that the subsequent paragraph makes it clear that the unit is in bytes 
> unit? 

Sorry, I mean *not* in bytes unit.
