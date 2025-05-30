Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F261A5B8B;
	Fri, 30 May 2025 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621740; cv=none; b=jI5DB0omRoa1X10bksc8uPk0nTxYRMMJ/w13B4sOI6AdNEqrontvzQm5hXhSKP1JnG4KwR1k7aXoeYowxu/gcoNQKXFK2aQC2CVlZBSOaep1+4BTGCSu7Ah/LRRKkFpFWfpO7LFVqf3XjCWhMHSenSlZevfnvq9aIiqNYJB7iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621740; c=relaxed/simple;
	bh=nMHhGzKx6l1yFtYUlEhM7VyCxgik5nVNLeVZurJT0e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+iGNQAdhuVe9KgxfOmyC/HOiOvkseetYSERx51nWRoT9OnUPjgVvjP53q90C3SrOD9ILcYO65gvhpZNAx9dzz7jR2m0FVdwl9GZNXowccA/cXof42Qlo8kDldyCMPcosiFlj3sV0xCBlUAsBy5Yqu1pUvM8Q/RjvEpz4iqopQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUr+R+IG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUr+R+IG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442f9043f56so13813185e9.0;
        Fri, 30 May 2025 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748621736; x=1749226536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy6uONJd9YDsRJcfKs6FIt0MY6YyHzNaH+4QdToi3oA=;
        b=YUr+R+IGaL/e8+/FZ/+dFP8WXDe6jjbfpHobP7stBPsIN0E3GqmR06x67+gXnbNKFi
         CVCgYHBTdKz8UDwQd4ogiC2rj9v6pR5wOpgDnnihaJBo2e1mDHbPOvlEbEKBBySQA01F
         sJcX2X7GO/eT/WKG9lQ3R83idbBWp7PECbmabjA3o5eQUCb0fr7awqRJuUkdsAfRtAQ6
         DGJ3umOXgbDZJ5HDui0Qu4byIQVPhxUR6fi9zIaVE8e8uk31yM7/VpCJxQ7LDAzh32H+
         UBx0g0TN5Pm7O1KNwGl7C1Y9fs0axQlTZ01MvMthGimIFkaQINJl6uoQTcp8hXUFKtLi
         6mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621736; x=1749226536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qy6uONJd9YDsRJcfKs6FIt0MY6YyHzNaH+4QdToi3oA=;
        b=dTaRxoRnbNhgzUE/vCI8HRL4oW58/g/te1AhNjKGZ2yxdwKHumyci6m5i5Xvx7Ke1n
         YTHcOkY1GFcapfiYvEkBGpOcVVNYwZI/b5TzQn98lib2stxVfjsLcKP16xhnz2myyoY4
         tsDHo4dKe9a6AeDZOshVujDoP1rWaWbhRyq+Hn/imQFAluMHmA9sT87r9DjprHl+i5nt
         obeOX9gFEVGyXrBU7gs0YkzEYecVOEbohQlFslJCL9gbwOnKiQ7hD+1b+McQnuQU5zmr
         7e/BDyZHZomH6pNQMMpofDVDPeBs/McXOU3JE1IHbXD9tFax1oFSiVgBKTETKtTyNElO
         Z1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVu5mLIoWKNO5NKAZyPQq7N4w3ToKbleVs/gz84AvZVk8hkTDLQTcVWmRZ6NdNwkSgfVTcTxdqAeKCt2aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweOUYpWf8IUg9ItN+zl5//O73i9mLjQwBAM1xnEOJDfGyOJVdk
	AqPtmF4uCb/1E4kXnfsDJjS+UYdEZR9KrRZ7L9oxpHMJjkrE/88rSwh9
X-Gm-Gg: ASbGncu0t4pYaYINnggkZFF8D+H4iOf0KpcfcWq+VydqVbHRjunrQizcWw8LbUyOetT
	L9MrYy+BYY44zp3cw6AArl0ezaTm+pDZfOkbes7/8x1xXs4BXzBhURgwvSPgYNSq3QXS19BohCU
	jL+UOHZm1DTlTBGhHNHknN5LiJsO5NOE/Dh657FiwETVdcxpW55lmHTZ648M4yb1livCA4aUauF
	dam0YsQoYTzaBa4Cu/Aw24q+hDX3dC81eIOfnVJoBIUEQp/ZWkqEm1nzhJ+hqQm5l1rR7Wbuc6i
	nj5eLB5A9BE/tmbYKRBXMVam6aKdZiebisFxwIX/wxYjZ4EFcgIcR9nNa9tYqSmB
X-Google-Smtp-Source: AGHT+IF3Qheau+41FJN4zh+ru7u19FUa9vqxVjioTQgILtoyR31hRsBY/unJ+M14by/h2EdXRVD++A==
X-Received: by 2002:a05:600c:4fc6:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-450d6599897mr37801315e9.33.1748621736182;
        Fri, 30 May 2025 09:15:36 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa2493sm21651905e9.16.2025.05.30.09.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:15:35 -0700 (PDT)
Message-ID: <d30be54d-f2dd-4394-b677-193cb2d77f1c@gmail.com>
Date: Fri, 30 May 2025 18:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] rust: revocable: support fallible PinInit types
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-3-dakr@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250530142447.166524-3-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.25 4:24 PM, Danilo Krummrich wrote:
> Currently, Revocable::new() only supports infallible PinInit
> implementations, i.e. impl PinInit<T, Infallible>.
> 
> This has been sufficient so far, since users such as Devres do not
> support fallibility.
> 
> Since this is about to change, make Revocable::new() generic over the
> error type E.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

>  rust/kernel/devres.rs    | 2 +-
>  rust/kernel/revocable.rs | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 0f79a2ec9474..2dbe17d6ea1f 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -98,7 +98,7 @@ struct DevresInner<T> {
>  impl<T> DevresInner<T> {
>      fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
>          let inner = Arc::pin_init(
> -            pin_init!( DevresInner {
> +            try_pin_init!( DevresInner {
>                  dev: dev.into(),
>                  callback: Self::devres_callback,
>                  data <- Revocable::new(data),
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index db4aa46bb121..ca738f75dc10 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -80,8 +80,11 @@ unsafe impl<T: Sync + Send> Sync for Revocable<T> {}
>  
>  impl<T> Revocable<T> {
>      /// Creates a new revocable instance of the given data.
> -    pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
> -        pin_init!(Self {
> +    pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, Error>
> +    where
> +        Error: From<E>,
> +    {
> +        try_pin_init!(Self {
>              is_available: AtomicBool::new(true),
>              data <- Opaque::pin_init(data),
>          })

