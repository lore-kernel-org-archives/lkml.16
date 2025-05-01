Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2522DC76D;
	Thu,  1 May 2025 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086474; cv=none; b=XOSQ7UVI66h6aWBTY1GD1Jzmxx5pM5mOMlCbjekK4RAtFLYofZZJfZrnRnb24wK5klqwjXeE4hZierNGD6zQ0mdeG1ApXHUoYkPbVz6VD0xr5PE2uj8+PY5UMYst65lm5D7df4OlZ+570f7HoL2IPD+rso3An8E+KTywPh1ipco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086474; c=relaxed/simple;
	bh=Pk6nT7Z6HOj6iM6vn3J/dCR9HMLpJWbj26qWyLtHMo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idiRtwiYNc6vjN2OLVl0/ar1hgsgvON1HawHSq7go1gFwTq76Olsb55fS3f2h5jhoJ+0cOfyDcIJrIgxLKCbuufxYMVpCtvS5q/1H9+5IjkQi5UHY47aorHugsABesAXlcdhmF/D4fpMlFMkeGvydka1/62rjgWBFl3A8SnIGzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYZsma4W; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYZsma4W"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c30d9085aso382004f8f.1;
        Thu, 01 May 2025 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746086471; x=1746691271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpq/3MPYLCiYVpIaK44vmdWI8dydlDKJW1s9pss2iF0=;
        b=PYZsma4WU9SHbIyXO6V8BoIBtQKP+qYro6r/l92AGRHCJnz6e2pLu5M9g35HcD9wbd
         y1kNGIAxFB+jQk4UjVkempIHwSeGVpIuCe7fClHvPKD7JY8feIyfxoKfoq/qJME392Ym
         KbHFwlz+s/urPDHiTyDoXVGPf4rt4107bhrjNIzVe8IJGMnlWn/mgwPOvhog3OLIDAOL
         Pyo+AXXPcDEom/sagjd6tp3lRbNuIazTd07maF1RAj5HliH0icR8NUG9Bt/GIBo8cepz
         4f9WcCnRa1tmqkOim91mffqR45jPoN8O9zyvpITKZ85RQAMKHCF/6igwaN4KoGDuf35p
         QBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746086471; x=1746691271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpq/3MPYLCiYVpIaK44vmdWI8dydlDKJW1s9pss2iF0=;
        b=cbIwIV+5JYNLzQqV4jpiwJYxubsdfyWHkBazmGibqxPkyjrXpHXWsfCWd/wVE4v2b9
         YWToE33E+BxrfEq7CwgvaH4qmZfWYkWAYhIhEJHGzecDMztVvTYPnTDS/RlcJ+AEIZOn
         0cq8wV0Q3ZV0AFZC1MTcti0lGk+S4CcS6Rd+9/e559doDEYNGXnYe+eMmYlWuyHC/5XO
         F1gX4RnM2zZYCfxKftwTOU+Jk9KmgQa3XpZZlEyn6GAV5eVh77R10nixGSeG4mblpYNN
         olQm2jfxl6gwQU1F0R12bm5KNlNN1fhScERSMjOWF6RwJkGaIMp2pAddqjo5l9B29kvt
         SyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTxCIgG5eo1OMMNH9W12ST031NwYeSqIAR7bME9LqZ4Z82UtUA8EQ2WtUwrvrZuHw0hHCVmDhZkLBpx7jmrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAu4Fwy8CCF62deKxzafd4X/O+RGOuF5wbAjqiYML1LAjRYNQy
	CyWTThlpZDMf8QGjCUJyQ6YKVu0vhaAGzp1oyMyBfVl2+VTv5dtWgIA9paJ38d4=
X-Gm-Gg: ASbGncvcb/vB7BsANnm0vHNT5M8zcsXDVQCuax5VTvL+DTv2Fo3b8v0u3Zb8M8HCYnD
	7XV95/0PaglTwSk51jJhaelCZWB8gLI1ypERWXNjQrmy51DkgswB69q9yCwKNlqaQXdAY0ckl5R
	1Rm7qAh7pTrsseLxDzDql/U5AFJhlP7WJuz8DdC+a7Wv4THRjznYrMPlD5++1RYnQEgOXh9SC5T
	9gKJ9T3aUzBrJMw3cQlufhWBKHTbVxTbAdUbQEBZ9CiwJc1fo5PWsWQQcV+Ex7KbbZTYVNeI6zp
	jey1AtJhI5Y3rGw1SOgC1T9ifGnACZ80/sBMpaUPX53hCw5JDAyK9w==
X-Google-Smtp-Source: AGHT+IGer8rYoRyvfpmNZT9KF4BawfFT3s+8cTc7l0ekuoJz0ymeewZmmO9cnZDgKiR91eDxRCZ1KQ==
X-Received: by 2002:a5d:64c3:0:b0:39f:601:85fb with SMTP id ffacd0b85a97d-3a093030740mr1941114f8f.2.1746086470555;
        Thu, 01 May 2025 01:01:10 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a3e084sm169689f8f.19.2025.05.01.01.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 01:01:10 -0700 (PDT)
Message-ID: <96b49cd4-4ee9-4ee1-8d8b-98f5b279c166@gmail.com>
Date: Thu, 1 May 2025 10:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, a.hindborg@samsung.com,
 boqun.feng@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com,
 tmgross@umich.edu, arnd@arndb.de, linux@armlinux.org.uk
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250501015818.226376-1-fujita.tomonori@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.05.25 3:58 AM, FUJITA Tomonori wrote:
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
> One downside of calling the C's functions is that the as_micros/millis
> methods can no longer be const fn. We stick with the simpler approach
> unless there's a compelling need for a const fn.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

With the helpers fixed:

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

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

