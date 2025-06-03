Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55AE239E6F;
	Tue,  3 Jun 2025 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959715; cv=none; b=rf9IiGcx6RCd3ipX6Lkke2eXkK6FLM8xiZufI+1yn9Ae6+3IZRj4fcH5sC0UhjceXY4CrxRVF7gMT0WQ7niYP9w05UF9EDk0D1jL4oHycSC/T3HXJc66faXAhy1Xl0P6k6KfORkds3LzRtsq+uEoPeNE1iTiGofhFKoTac4yyaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959715; c=relaxed/simple;
	bh=5x/f0EZuI/JqhMxT7VHKCt5FkLTKEV6h9MAJTamDwh8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=inpktmFjxtg4/idHSc5KoGBlo8ExH6oqSIk1AJgaaGzw2GbE5r55N1jBQ+D+/mPzgNKAKNkmvFr73mhcdOQ5bYr6+XNWsIG+73sEgzHxEp78eAzGc9WPx4ZHRdEh+QXFGnDIcZ4X8HaUFE7/+7+upepB9nr6GEt0V3mtzgOD/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJIFBuS6; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJIFBuS6"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b271f3ae786so3977363a12.3;
        Tue, 03 Jun 2025 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748959712; x=1749564512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQQ/cv1hJEUU0b2kO6L2aGXF38EM9DHmWuiQsHfN/k8=;
        b=WJIFBuS6gnqDmlngSQjULCaTP8VY4lXtrI0s3+fQ26ewTmiaSa1eOdW9BNPOkfB/AN
         hixaAxmo0JHNuaPhSz1+785Y4v0JrOCTMC0AZ+SjwF4uUQ8YvBtkiYmkXFtyW/79Bg5a
         FZVsjko21LzlbcVjaLLLSwG+cbCy5vqTvbkR+8Bps/EbE0pPRBcsyVJ3A7YQ3Y0Tnrh4
         1DcqpwUPcnPvlPNNAh9hy5/dlTMyiaNNeJ7k+RAx2K4eQ9oqGIR388URzROsVu+LW3Wy
         7iKiWZUIrPhlm7sde2IxDp0eIo9ZkusAIsZcZjmcEgI6SGsqQ09Mjw5HKvj70VlnXHYP
         DFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748959712; x=1749564512;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fQQ/cv1hJEUU0b2kO6L2aGXF38EM9DHmWuiQsHfN/k8=;
        b=AtVkvb0wXLyGnW5lpzx1xVm9okxIBMzgliyda140lMSqe+E2NMKCyn+zdWu/c1pLWc
         55AbWe5MKABJelZoQstMC+r+ktM4zm3fbxf+xJLwADxTR37AeEbnvSx43E9gXsKJbFTA
         RhV8Hj4/UsOWSnRKNj0WdxknBVmsuEreQu5kBju54O1YM9i5TdmE9uFbl3RIQyOAeobo
         +OTe0MQcXit6vGkSrqSnYcaYARs7BTr0+KIPJ3AbgJHLnxzZ6Bfp/coNxJJWdYcFPYtp
         GHH4yajmne0cuePqOZ1Qthgt2KlrtwAYR0NxYahX9BL2ZQHOhgrneo4ZGsMRBuCrOxs7
         5jFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS7L28a8ZFcjO+c60DDpLbKPKV625SbuOpsrJl/ivvefE7r2ZcHm1qams87DaJsodJ4cJmdNPRo3izBE1cGmo=@vger.kernel.org, AJvYcCWcHw+s1rJBOPfA+Z/3cLAtnwjlS+/rd2nausySHYNOW6d7VLYRLaaOeYHCFjmMufgAKrfHhsxHpCv4b6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3E7cRsmjOuf/o0wCRtf6WnqV0rfdpqUCo35eV8x4wqW0xZM8Q
	Tzccen9ZiZYaJCZxmB6kECmYCgQCXI4WfB/hcpu+CmCpnvLVboc5mbSA
X-Gm-Gg: ASbGnctfycuXtTh0qq9LZd6ph5vxsCktcOzYOjHr664/HXZcGE85YPySEabMfiB+d1R
	hyQM9u/WzuQhKesTJ3gWyxQ4FkckSB15VhCLT0tWbxBCHvasBpyzmAJGjotxmw1YGUW7fMPyOxx
	pvmsZhE+VMyBRkG1bCErgMLrOr1ow2gWntYKcvLLIToiQ3esGexpIy6cpxeMzcxEK577ntEP5zu
	IPpFUFLdHHgt40m0b1wgN83+Mui7zy9/P7tVt+VKUCeFxZGrZK+pmuRCGIkAsLVZEOhIXLBMTvm
	z+dFzFLxfCC0S9jozqh6Hk7ztYXIIeQiADKm61Ug96bAjHKhd2LFWGP1HbLZC3lw/dmBxQ1zqAx
	xvzFh3HcyENUiVxfWslqjeuHOJRvFmcuUW28XRtliJMKi
X-Google-Smtp-Source: AGHT+IGh2ZcHlAX/bFqZ4WSwa/ggCYCIcvpet9Y90iHPYRTenGfyss3jsjmeb5QPinu/zA94b6EwrQ==
X-Received: by 2002:a05:6a20:4388:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-21ad95c0ac3mr27308808637.23.1748959711639;
        Tue, 03 Jun 2025 07:08:31 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb28ea8sm7155211a12.18.2025.06.03.07.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:08:31 -0700 (PDT)
Date: Tue, 03 Jun 2025 23:08:15 +0900 (JST)
Message-Id: <20250603.230815.1426696742567640092.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/5] rust: time: Make HasHrTimer generic over
 HrTimerMode
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <877c1u71uh.fsf@kernel.org>
References: <HhGhHOv9fvWu0G7TihU0V5UMif0USODr5QagKogYlf-zE9P6uyPWYdEckCaFi747sl_vkLi5XDB_O9BFcwsjow==@protonmail.internalid>
	<20250504045959.238068-5-fujita.tomonori@gmail.com>
	<877c1u71uh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 02 Jun 2025 14:41:10 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> @@ -579,12 +604,16 @@ macro_rules! impl_has_hr_timer {
>>          impl$({$($generics:tt)*})?
>>              HasHrTimer<$timer_type:ty>
>>              for $self:ty
>> -        { self.$field:ident }
>> +        {
>> +            mode = $mode:ty,
>> +            self.$field:ident
> 
> How about:
> 
>   mode = $mode:ty,
>   field = self.$field:ident

Works fo me.

> So that there is some sort of red line when calling this. We could also
> consider adopting another syntax for association:
> 
>   mode: $mode:ty,
>   field: self.$field:ident

Looks fine too.

> or something else like `<-` or `->` ?

I personally prefer one of the two options above, but I'm also ok with
`<-` or `->`.


