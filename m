Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023728DEE0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717258; cv=none; b=r89/t/TrpMUm8Moi4gi9TRv4RUbhoW2janncLTqXGjP+aqFh3rbCxSo3rlmp1woJFDhVQNDZuGgJdo9oSyc1BEZbdOH0/dxdcd/rnU56Zurp5UZ+mDA2mSN7uf9FfoY2vhITbHk0xGw7BwltXSIWbvo51PYLkIVk63xpEFxywQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717258; c=relaxed/simple;
	bh=ZJ7OpKdka1F7ZBFYQVrdJ8oxYihNjUeS07C9hmUDydA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYiA9PMZwLZRhe15O+ICfBY+CioXxiIV6de7AV1RKtf7gt8ymMItNmwlpu/UtsJbICkSrpxEc+YSH32OGtoNBRWjoPLx2FH8j7pwdYN5oLu6lfYeNyCI9fg4NkBtCb5wG3xK7SPSX1R7JtWVnTJpUcKqAsFIRdJcKbCyoicr3qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kc3Jsi0K; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kc3Jsi0K"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so2108877241.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744717256; x=1745322056; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5wyWC2vD7HP03u0+k9/k2OZ1y4kWaoLC9/4tNgnhE0=;
        b=Kc3Jsi0KY160f4uj0Ayy+TunoD8RNWiDrQx7ttcx31mqGQssgTu6jmqcf3zV1MWFz8
         BjJJSWg+ane+n/TKKX6bnrpaE8y56DaNb7kkdlnwM1y7izNeAWvpHXFSPoHtcFD2dLp4
         z3sRybuMfP3aqK2BpeDBpAZMdEB0czvgfuvpkqdvbqVap5uJCYHa5W3WkTbdFdzuVfjs
         XtoYq+ZiN+vkSyrGGCZDo9O5/vFkZMtL1yL/X+txQ5j/LLyZgisBO2BR+fJB1m8Ze9Sm
         z8bGxqJy7il7DKapMYdtzdmu+BqMVS/OZYrT+pulhgo73NrATMSHoxZ+9NpXeEMRAqsK
         k//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744717256; x=1745322056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5wyWC2vD7HP03u0+k9/k2OZ1y4kWaoLC9/4tNgnhE0=;
        b=P2BKbdqQh/EPVosf6SdTxJ+3A/iL01v87k5DhdjsXTWcAmdDiCU8mkL8LHpXmegbCq
         44lArFklBagymhN9bl9MlVVWBU1715fKX3S0ed2ChY0sqzKmTn/ygo8K0cLX1Q43v6mT
         2VDlb5SOF2PtUwXAmCSb7OEenD2wxQ1aKisEiopxEJMcdySHVJcSZnBPsJSgD/rfGHuo
         c+bbj1ExroTUUdXDL6eggm5syf31ywdzpAnLihlQaQOuPUTx/GhiCGohFnJoglQKWD9W
         js2mOCygVQxifoDRCbMhZ4/AOCw8rgmgaPzM/sOzcAt9L0LEhSx+uYamR9tsB+nkX1Ti
         c1oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzi49c/SnbB5+mqpdMKOsgKWEFy+ZjhfLYxx4ZlWBgbzIlbR9pcdbsGAwj3SRwOxozNm+oYL/IFSG3gEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2IaJokVXGBuOaRKRiz4NnLTXL47DFowejYoxq/QfJLD8U+6hS
	qVyizRhsfDYToMfEUbb1cin2op12/PSMQc2S1W3v37i92A0x4X+HOJL6OXV+RqU0L9dvssG1j68
	7rOB44qEFnSKsHBTHrJD7O4J6oVZOR6ggo81SnQ==
X-Gm-Gg: ASbGncvOORn2AHRSwENfZJl3YqL4yIgo8N0e9qXo/oLMLQC2OCFRsUI/hqOHuffJ5Vm
	KNbFoSD3lw7kvWAnK5bpjNKmZ2SIs2zaAotOKDz/TYL5zVjQU5AcixT/oLhMBleCWt8aqTm5EVd
	m8uiPkyt6L3pJswE8AeqTjsi75R1Rrs2CFOYcJ7qUaqczIcaACV6FwFEo=
X-Google-Smtp-Source: AGHT+IE+NNVE88iDUwAaQ7r8ENal9D9/Spnw5Z3aSwELhPsIBbz/10RGMoWuKFkC1AOSsqEBVzUhDU6ew73aGrw3MS8=
X-Received: by 2002:a05:6102:dce:b0:4bb:eb4a:f9ef with SMTP id
 ada2fe7eead31-4c9e4eb963emr10663742137.4.1744717255872; Tue, 15 Apr 2025
 04:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
In-Reply-To: <20250407183716.796891-1-ojeda@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 15 Apr 2025 17:10:44 +0530
X-Gm-Features: ATxdqUHRgjnjW4n6eMFjqJplHcq4SMBMewSYmPqnuxbGTAXBMTStlZNMQ3l7DSk
Message-ID: <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <ojeda@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"

Hey Christian, Miguel,

On Tue, 8 Apr 2025 at 00:07, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> On Mon, 07 Apr 2025 22:58:02 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Regressions on arm build with config rustgcc-lkftconfig-kselftest on the
> > Linux mainline and next failed with CONFIG_RUST=y enabled.
>
> > Bad: next-20250327
> > Good: next-20250326
>
> > Unable to generate bindings: clang diagnosed error: error: unknown
> > argument: '-mno-fdpic'
>
> I assume this is the arm support, i.e. commit ccb8ce526807 ("ARM: 9441/1:
> rust: Enable Rust support for ARMv7").
>
> Clang does not seem to support `-mno-fdpic`, thus you probably need to add it to
> `bindgen_skip_c_flags` in `rust/Makefile` so that it gets skipped when the C
> compiler is GCC.
>
> If you do so, please double-check if the flag could potentially alter the ABI in
> a way that `bindgen` would generate the wrong bindings.

I tested this idea and it works but I don't know enough about
rust to double-check if the flag could potentially alter the
ABI in a way that `bindgen` would generate the wrong bindings.

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..f207ba0ed466 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -273,7 +273,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387
-mpreferred-stack-boundary=% \
  -fzero-call-used-regs=% -fno-stack-clash-protection \
  -fno-inline-functions-called-once -fsanitize=bounds-strict \
  -fstrict-flex-arrays=% -fmin-function-alignment=% \
- -fzero-init-padding-bits=% \
+ -fzero-init-padding-bits=% -mno-fdpic \
  --param=% --param asan-%

 # Derived from `scripts/Makefile.clang`.

- Naresh

>
> I hope that helps!
>
> Cheers,
> Miguel
