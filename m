Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B3155A4E;
	Thu,  1 May 2025 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102420; cv=none; b=I83zRMUAkhO7HmioYtlIK4kiONthGSM4uJ0vHddwdPMdT6tBaA2iTCqM9eyVWpXKvsreAfw1zx1p8FhxyAFKXeBHTuhndoRaqy2AlxSlPXdj7LPoZ9zjGe9DYuLIpWwEyB63wN8C2XC7+v5K+zU7sUVwrSPPhGhILfIigxhyFrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102420; c=relaxed/simple;
	bh=MF1ecPaRs6Ep0EQM3LGxVIokN6KB5FWBwQ9dzGxYweY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHI+WPan6n8OHE4KBlgnb+UDfVD+YNxBQgpVEcjjkj7h/js7FhgwpuDXKxh/JUAiVGSJ24NW5fe/JVYEVIHWTipvjmtxmseq2y6TG83g9v+la05+8OZTNyi/MNLjQmLuwVmVwZhc7HQ8raybPjY6D14blgTmpx4Qz9Ar+H5kN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaNmvSjr; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaNmvSjr"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c546334bdeso82496885a.2;
        Thu, 01 May 2025 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746102417; x=1746707217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVK9UauVUHuEEctG3hR8s4Wk34v8u5zdm8c+rKq16dM=;
        b=AaNmvSjrAPq4Q1mQWVKfs2xsUR9ZIW2OkYolKSRpokOnLQQ7BA0/8ncXnDgj2ek1c6
         5ip05RO2rCjov7Rqy9Urgf3IU3s8uV7x98G/rdczsVlyvvvMFLfig+6Srq3dQ3tbzet8
         sMszT/TUGAPVvV/u+hL88lJyTBP54Q9k4uoKEhU77enz87EBAj8VOG4hrRa2rkxGmi0J
         nhSVIPWMlZLmRaGtmU+3GpzyOXyz7sXxZk3gU7x3NdS5yxgMlPzfALn/0mShDC8qaHU3
         5i8NwORdfiZemqpPsqe+0oWPUaahY2aOn5aueXdwJZ7d1CWCpSrlC9y7JZe/JFPxqUDa
         Of9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746102417; x=1746707217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVK9UauVUHuEEctG3hR8s4Wk34v8u5zdm8c+rKq16dM=;
        b=NCsUpMNqdSgA8mRFsm5GKr86yFkrKUutc/E69F3hSUZG5loMBu5L/filKHd4Z/8PGy
         aCldFxA+da4+6ScZezfYfZFxC0g8LqjbHfeZmvalMsLAQiRc0DxD/omKtWCqUvDm164p
         Nmz3bAPt0I+NkLjoxf3U2lFKIxs/BboHbR//7q9luj0gjJi2dEiTvWnvIL9A5qXzLZ2j
         tnlJwdI5Lo3CMA7CGmJ/g0Z533KcoTjsxkYVTmDmKX5ht3IF5D0C0rddynKeZ598b6W5
         N34JeHwA9RNaKge1BrzhZCgdCbMpCewDPB1z97tGT7Bw7QEMqOB7Yo8HgHPrXDmoI5A5
         GVVg==
X-Forwarded-Encrypted: i=1; AJvYcCWyZSixkkGTyZOVxHR91T8eI7bboiZzwImE4hhH38ONyijE3Xy+Qx9PGS9bg4kUUXUhKiwhHeo0+RcpF90=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMwzalyMtmTo3s0Ptu6PxglLg3AyXUC4ruQ/jAKrcamKLrU/me
	jbDe4Bw8sMZ5Nf0BWrnu9AK11aN/amvHzYTkvvzWmsbe3NVdxhCV
X-Gm-Gg: ASbGncvdqVAJRkvFXEX0YWEcT2QpEJ1W3xagqlbwHl8j5BlkDhlskAQ08/M7nBFNVyG
	ZmHSQi2OhmoPmREz9h+sttzVvPVuxlCmHAolbPTLxpUhNzI/GLH87bpRGdYdEvRrtGbd6xNzvKP
	8RZ20m6UmtOqNvJ3hbvyDvRZoSe7vbmPOIbMd/Z/Cdhc3xofNhZB33MAWEoMVyplLTDFS9vnMhT
	KrFWMDkeddEmCJrktzAiJw58keK9vQVrYvNQgyOepnNS3c/msAL4k0ttePHKf4XJ6ZB2lEdyyd2
	zXJ6qSENxtMIPwYDZlyUIF0OM+884rTIoi83NLz2VV5wOqhLTnXjDjpCQT4uwowxN8iQT37tRg5
	FiOv7WzfhDUAVklyzJnMHHN+C9PkLltY=
X-Google-Smtp-Source: AGHT+IG6GZb81/7Bj3z/jUgscDzo/ELbCvp/Tf1creRoXOSlltyn5II7ImuDdcSkIWZL4ojxlkIemg==
X-Received: by 2002:a05:620a:280e:b0:7c5:e40b:caaf with SMTP id af79cd13be357-7cac7e30fcdmr973288785a.31.1746102417393;
        Thu, 01 May 2025 05:26:57 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad242b554sm33916385a.89.2025.05.01.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:26:56 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4A95A120006A;
	Thu,  1 May 2025 08:26:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 01 May 2025 08:26:56 -0400
X-ME-Sender: <xms:kGgTaBSmlI00ph6Z083O2Heef9pZ8f1X9B5STu98dbAYqqBIgHD0EA>
    <xme:kGgTaKzK5o-BKKpC_t69Sa_HoycdyFRzfDXD5ie2BRmTD6gmJuDY0CAttMB_58Q97
    RhldCv3eA22FDZ_MA>
X-ME-Received: <xmr:kGgTaG0rS5XPwxJLUGM9W9F4Ig_TR9kdRgUP0oqduZXdgGUYcFALP8dU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhise
    hgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehsrghm
    shhunhhgrdgtohhmpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehtghhl
    gieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegrnhhnrgdqmhgrrhhirgeslh
    hinhhuthhrohhnihigrdguvgdprhgtphhtthhopehjshhtuhhlthiisehgohhoghhlvgdr
    tghomh
X-ME-Proxy: <xmx:kGgTaJDXZO0FpqZf8gQTkEQPpni45GmWeehzmMNLCmZIXmxezGDwJg>
    <xmx:kGgTaKjsnoI6-o30ja-1NysWzE59lc_1KaviYMrhJMLAdTx1sdv3Pg>
    <xmx:kGgTaNpPEMLfrAqXumjayPjr83oKbikie0inKVgIv1RE9c4ROcrDKg>
    <xmx:kGgTaFhtRWTNQbCc82RbO-i-k_fHOJsb46dIwYOiVFUzeKFzNrclHQ>
    <xmx:kGgTaFRrnTdD8x0-_irJ0jUoedjceGcJ6FWFgeYPUMviQea55gaY8UVt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 08:26:55 -0400 (EDT)
Date: Thu, 1 May 2025 05:26:54 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	a.hindborg@samsung.com, frederic@kernel.org, lyude@redhat.com,
	tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
	sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
	arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
Message-ID: <aBNojspyH5dHsuOm@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501015818.226376-1-fujita.tomonori@gmail.com>

On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
> Avoid 64-bit integer division that 32-bit architectures don't
> implement generally. This uses ktime_to_ms() and ktime_to_us()
> instead.
> 
> The timer abstraction needs i64 / u32 division so C's div_s64() can be
> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
> for this timer abstraction problem. On some architectures, there is
> room to optimize the implementation of them, but such optimization can
> be done if and when it becomes necessary.
> 

Nacked-by: Boqun Feng <boqun.feng@gmail.com>

As I said a few times, we should rely on compiler's optimization when
available, i.e. it's a problem that ARM compiler doesn't have this
optimization, don't punish other architecture of no reason.

Regards,
Boqun

> One downside of calling the C's functions is that the as_micros/millis
> methods can no longer be const fn. We stick with the simpler approach
> unless there's a compelling need for a const fn.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/helpers.c |  1 +
>  rust/helpers/time.c    | 13 +++++++++++++
>  rust/kernel/time.rs    | 10 ++++++----
>  3 files changed, 20 insertions(+), 4 deletions(-)
>  create mode 100644 rust/helpers/time.c
> 
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 1e7c84df7252..2ac088de050f 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -34,6 +34,7 @@
>  #include "spinlock.c"
>  #include "sync.c"
>  #include "task.c"
> +#include "time.c"
>  #include "uaccess.c"
>  #include "vmalloc.c"
>  #include "wait.c"
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> new file mode 100644
> index 000000000000..0a5d1773a07c
> --- /dev/null
> +++ b/rust/helpers/time.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ktime.h>
> +
> +s64 rust_helper_ktime_to_us(const ktime_t kt)
> +{
> +	return ktime_divns(kt, NSEC_PER_USEC);
> +}
> +
> +s64 rust_helper_ktime_to_ms(const ktime_t kt)
> +{
> +	return ktime_divns(kt, NSEC_PER_MSEC);
> +}
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index a8089a98da9e..e3008f6324ea 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -228,13 +228,15 @@ pub const fn as_nanos(self) -> i64 {
>      /// Return the smallest number of microseconds greater than or equal
>      /// to the value in the [`Delta`].
>      #[inline]
> -    pub const fn as_micros_ceil(self) -> i64 {
> -        self.as_nanos().saturating_add(NSEC_PER_USEC - 1) / NSEC_PER_USEC
> +    pub fn as_micros_ceil(self) -> i64 {
> +        // SAFETY: It is always safe to call `ktime_to_us()` with any value.
> +        unsafe { bindings::ktime_to_us(self.as_nanos().saturating_add(NSEC_PER_USEC - 1)) }
>      }
>  
>      /// Return the number of milliseconds in the [`Delta`].
>      #[inline]
> -    pub const fn as_millis(self) -> i64 {
> -        self.as_nanos() / NSEC_PER_MSEC
> +    pub fn as_millis(self) -> i64 {
> +        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
> +        unsafe { bindings::ktime_to_ms(self.nanos) }
>      }
>  }
> 
> base-commit: 679185904972421c570a1c337a8266835045012d
> -- 
> 2.43.0
> 
> 
