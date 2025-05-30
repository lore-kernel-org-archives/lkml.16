Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71D1A3164;
	Fri, 30 May 2025 16:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621891; cv=none; b=Nv/QrphgF6PwMfosfT6QdzeU59+HJ3g8zj5o9ZJtF7g2dJtWm4jC7mfUfA0o9yCE0YaJEjRH2rbJIGLrW8q2jlwYOuLPgl6SrskLjOfTB/9g7aT+LhLm3xHaUQcyledUZzrQYY+VxUiNF6If8E64NuWrPh8rexUe9rIC0tp1anY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621891; c=relaxed/simple;
	bh=HOmp6/TC2SBVobnq1EsXqTdIMKdwZ+mNadR6EJzuo6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFRE70Z2tQkJ5XNmA6zxGhz9EfYBV4nhNVrlrjNuBaRSijGJt5lysJ1zTsEPSANKB0n9sEAJlHlxQLtCd+P4oSWfxZvTHfDQub1Jo5PUayC4BocnOhaadtNVeEe0lzfVcQ4+icI87/V9Fx1BNmSI8Y5QH1WshCoN1w/Q14ErEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NApTSMYR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NApTSMYR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cf2291bbso9644725e9.0;
        Fri, 30 May 2025 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748621888; x=1749226688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDnqE+A7J0Waj0wvoAK0xzg6BcGf7AcjB0JxiY7Oeqo=;
        b=NApTSMYRb1NiqFm4u2LZVUMBCygENtVDUGTAzs7ov6P2V4Peg3i0P5+BGtzr02b7Wp
         JpLRqfHWkl24cMSoBXsoBfFRdwdnS9glwbD5tuWZ+zLtS0ErFAldEDE9DbsuW8rTw7zP
         dQSEPEd9s6pChzbbI8INvuGAcON2G1tHUwT9E3SR1/5W5wALxVCzdcDzWB9LE7nWHHhv
         NGUa+GC/K5sB5Wag24odXB3O6IrkCd23sijLuxLoNZg8Gjf86n7AFl7pOopvBGMfzpDu
         o3FCUl3y4efEzfVaviprEZ0BBrjKS2CItUrLXI7chc3sdo5QzQwXkFTt3cAXByNMQxTX
         2/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621888; x=1749226688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDnqE+A7J0Waj0wvoAK0xzg6BcGf7AcjB0JxiY7Oeqo=;
        b=cPvKD3avR+1IKOoVJGtVpsS1Z/veTpLzukWdheJUqbYKXH39tIE6GYI6qoXiMRzRXm
         WjDCtLewQgBFbE3JN0ayCJqf0geKTHnYehXswTZptAMNW1pd3KIkXovVWctE32H0e6cF
         H0KMHhOOQc64qWZ5tNxPilLSWuKRdqIXtn+AXB+blY9xi96Kom4Zh1hfoZlj1lQmVJ+A
         vg0S0r3NDuBXR+wjtoG8nhujT9nwlZOMqHiL4d0dvXpg8oVhS9R4b2baTMO/QWE/tK2U
         oQsFaDvYsh4LUCtTsBkRrxwBZJcEN2ejdR3u0YECMC866mXr1PtwrekU5wAQmR1uw0ed
         ofQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN5xRu68JMhQwDLwkprMHHMdGBanGS8vp1n8Uzk+2dal2uXZO4AdUFETHFCng8RXyddtQ9ftJxLsZITXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO58dgK2BwF7kD9Lwmrl2atVEvb04zXphlhBDb7m4xlrtpr9Cf
	Vbc6nyHRRwz/a+VH7Af0wWBd+sa5y5juFtId4IOLVXsoz6ntbr2anMEQ
X-Gm-Gg: ASbGncuacJyCLDDS3IGC7noDOEn1G98Hou6PLdO46TVymw1s+H4dE1hziVb3B9MYCUB
	nS6bjzx/7phEzDXcWTRoGL0jsvojmm4I8Jms43+kU/LRNrF+i/kUhzSFZyPLapdYp7qpOpt/z0W
	4NpmickQowahf0Mwnu0eODcUjexVPTm+vgkAjDxGiOP3DTIFwF2cL/CZW7WL+cYpjagJBabtyfj
	EeZqYb35xJJsTUESfq+6TO3QpeQSqpNUSnzHQssHY4KIF0XRVre1H9i+TaWgq1RsewOLqngG/Ig
	b+CXC0T8vbKYuzJh61gUJGFmfYrdpZmUtT1I7uqhdFBdUaX70n31qZzvjLqK6/IQ
X-Google-Smtp-Source: AGHT+IHa2ogdviUmPvuiupgmZBSkZZ5D0C+SYmRFFzjDeso6y1U5zuZIbepqxTo2PUGqmof6wq5vQA==
X-Received: by 2002:a05:600c:3b27:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-450d6515da1mr33084225e9.19.1748621888220;
        Fri, 30 May 2025 09:18:08 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm21846095e9.9.2025.05.30.09.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:18:07 -0700 (PDT)
Message-ID: <ec3adfb8-006d-4778-ba4a-e9222461e38d@gmail.com>
Date: Fri, 30 May 2025 18:18:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] rust: devres: support fallible in-place init for data
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-4-dakr@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250530142447.166524-4-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.25 4:24 PM, Danilo Krummrich wrote:
> Currently, Devres only supports a data argument of type T. However,
> DevresInner already uses pin-init to initialize the Revocable. Hence,
> there is no need for this limitation and we can take a data argument of
> type impl PinInit<T, E> instead.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

>  rust/kernel/devres.rs | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 2dbe17d6ea1f..47aeb5196dd2 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -96,9 +96,16 @@ struct DevresInner<T> {
>  pub struct Devres<T>(Arc<DevresInner<T>>);
>  
>  impl<T> DevresInner<T> {
> -    fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
> -        let inner = Arc::pin_init(
> -            try_pin_init!( DevresInner {
> +    fn new<E>(
> +        dev: &Device<Bound>,
> +        data: impl PinInit<T, E>,
> +        flags: Flags,
> +    ) -> Result<Arc<DevresInner<T>>>
> +    where
> +        Error: From<E>,
> +    {
> +        let inner = Arc::pin_init::<Error>(
> +            try_pin_init!( Self {
>                  dev: dev.into(),
>                  callback: Self::devres_callback,
>                  data <- Revocable::new(data),
> @@ -168,7 +175,10 @@ fn remove_action(this: &Arc<Self>) {
>  impl<T> Devres<T> {
>      /// Creates a new [`Devres`] instance of the given `data`. The `data` encapsulated within the
>      /// returned `Devres` instance' `data` will be revoked once the device is detached.
> -    pub fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Self> {
> +    pub fn new<E>(dev: &Device<Bound>, data: impl PinInit<T, E>, flags: Flags) -> Result<Self>
> +    where
> +        Error: From<E>,
> +    {
>          let inner = DevresInner::new(dev, data, flags)?;
>  
>          Ok(Devres(inner))
> @@ -176,7 +186,14 @@ pub fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Self> {
>  
>      /// Same as [`Devres::new`], but does not return a `Devres` instance. Instead the given `data`
>      /// is owned by devres and will be revoked / dropped, once the device is detached.
> -    pub fn new_foreign_owned(dev: &Device<Bound>, data: T, flags: Flags) -> Result {
> +    pub fn new_foreign_owned<E>(
> +        dev: &Device<Bound>,
> +        data: impl PinInit<T, E>,
> +        flags: Flags,
> +    ) -> Result
> +    where
> +        Error: From<E>,
> +    {
>          let _ = DevresInner::new(dev, data, flags)?;
>  
>          Ok(())

