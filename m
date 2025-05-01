Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149D72F37;
	Thu,  1 May 2025 02:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746067553; cv=none; b=hfcfhQJYTtz/JRxsX01e0Sio/pxZzspHVibJvwDYw1iW4jkERdISswbN3IJVefGe+R0a+XTsJrlguTSnwdTI/BEezGjaeyixupL2SS58l6JJCM95HjaWh+kTd5me92FNYJj8ZNNN4xSJ7wDxrWR2OFp2EQSwCT0BI6D9ba2Ay+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746067553; c=relaxed/simple;
	bh=gZjRgjeXeQO88HXp97C7IcDNhmOA3+hYIc8ao0riMbY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qyVwuNhufLVBvE/H/58sYbIW0sioP2/q4F28VzLmPDqLMUe9KJWtx/dJPJw4cwYpWJ3qsTl4/it2fk7qot+7kXl/hJegsMaU6fsV/XT4J6FDKSVLbVJeybt6yDZjIc4s2T6VjMeFVc8MN92IKvhqNLzsaA8sZMkbfrjAXCPhQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvFfOOLK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvFfOOLK"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so543773b3a.1;
        Wed, 30 Apr 2025 19:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746067551; x=1746672351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ri48kks70Ek240acbuWS4Me2Uf3YGEY+5BDzeQgP86g=;
        b=OvFfOOLKvWuFIYpYgstbBcnATMP4Y25Snk4uDd0rhFBhF0OMpSQvvt8rUWaLp3ozPc
         5OzLKFNMlLHScZPyfP/r8IcCA6k20sPHgsUrR1SKMps4LQVOzgBQQY42g95xcRO7W0Hl
         HlX12g6utm49Mz02RZ6r40nN0qSCpFHB08Frcg8w0EM0p5pydS6ucGMeBQQGuPQxTaB5
         ALia1zB+i/dai4GI20v4nFIwfCNOoxPwJMd96aAHPJxLB/Oqcy99Tjv4Nsi8xt4bztcJ
         treYGyzIEAjqzmsIuMPzV43FyTOHF2PkEf8O7FGzJo6XfPCPQJE9/Ic4agLXYPbGCXWO
         yZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746067551; x=1746672351;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ri48kks70Ek240acbuWS4Me2Uf3YGEY+5BDzeQgP86g=;
        b=EYeMPK5AhH8QXYXIyvtBlgx5uMAsrQzafdTmLYMg66SxqwCZXJb1kABKsg0aKqrfex
         U1hqeJnDBqIEUDy5rRZ0Q+aiuDcUmXisF8RmldInwuo7AAHOapR7zcHjGnEzJ8cOkcbL
         Z7WSE8Gse2q7RaCc1KDKppM0q6WetxkfA28cSpP0JW7BqUi3gSx5rLdLyN6Iwo8NqsJ/
         mYdGBRi/ErrhjYUPLaC1tBu/B2ynkUAH/yg/Rn65YnB7AWxfzpnkWQhNA6vpvdpJHfSo
         ykL9Gklx5s/XRJS16+I2ilZJO9R33hQRmlp4+jEgM0yfzo9Pa3sg8NHQQyQv1Rx7D+5/
         DY5Q==
X-Gm-Message-State: AOJu0YyHxTxxjg8k+JiztWm8/IyZHjQKDNqb26pcNTUnXqCNnyTFP5y4
	dmRYt81q5bQr2Zw96HMAdr3skEyPgmluUzCOBhfn+QZufv7jhOawnks/RpGD
X-Gm-Gg: ASbGncsMxZslL3Ur+AIaPMo1u3ZbyUge1/fjBY6sGVm0z3jWvetk+2vQVwjtA64WmAx
	IgbNZZ+WkN7/ad4ANo3Zdxtliw6v4+3jI8gB33QKR4RhN4TttA0WXDyrdUTR50FzJXKjGJZqnn+
	CtGJDG3NLvY7kIZ3ztXmXsDxyPKE0YcI6BLwpaZaK/V4Z1e0Bqzb09qtzhlBLOm8aYfUvNy2+7L
	Gts6354MSLM7DgR4U3POn+Ea3vZ74tWa6Q9UYsZA/bvUSds+zwm1K8KIG2sJjlDrpyfkNSg7XhS
	CYrPEgpZqmv/EVPX9IgeWFNOMOsFN2+YODqDXrAZolaOCwIyo3ilQsS6OAH1f/kTbjt/j1qTfWL
	8QUIuFWJVlgMvLeTVlY/RrKM=
X-Google-Smtp-Source: AGHT+IGn7mvDQIye5396/QcDs8efH9XyW/4mgIMHw7cRjbAVOTdxmnK6VRaZKrTVN1Od3OomN972eg==
X-Received: by 2002:a05:6a00:2306:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-7403a639eddmr6643618b3a.0.1746067550898;
        Wed, 30 Apr 2025 19:45:50 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a944d4sm2543117b3a.172.2025.04.30.19.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 19:45:50 -0700 (PDT)
Date: Thu, 01 May 2025 11:45:34 +0900 (JST)
Message-Id: <20250501.114534.1953073574103349822.fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, a.hindborg@samsung.com,
 boqun.feng@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
 arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20250501015818.226376-1-fujita.tomonori@gmail.com>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu,  1 May 2025 10:58:18 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

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

Oops, they should call ktime_to_us() and ktime_to_ms() respectively.

I'll send v2 later.
