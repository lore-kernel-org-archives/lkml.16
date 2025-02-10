Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649457C93
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174767; cv=none; b=MmwzBVm+QrwxFaxZI4wV/0oR3fNE6iGo0zaK+O+qvVo2RDc+Hi517gQsB9KGORKaj/x6Q+2vSrQ/C1VJ4F9UCAELOGPHM1PKtei/vmAL2hRaA3noGOja7PQP8BF/aMoFa9HKk4DlpjJcBHuA0lCU19XgVzI97GrUViyW1m1WYoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174767; c=relaxed/simple;
	bh=5WB/xN4I0+Le1mu5gDHsjLNT2znP0CA6bOhx+6FlUhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Irc/XKx3wfoKMAUZCxipc3GAFLu4LgXEOaZU/PRno7zau/sAdQfrHMpbYbvfVKAotq9UNHQzJmqOliYUWQ+uH+TmoQpPxEyDCho/zoeEf+2RLm1orhcDlkLe0XlFOX/PNuxreaa5BV+Bj6FkOu7LOl9FoB+aWoSUnhyiSMw5sM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R2/20IKR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R2/20IKR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f55fbb72bso41415215ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739174764; x=1739779564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQjHhBqGj5IZ+lWQctqtiLtMtAyUEzvqFMG/1MA1FoQ=;
        b=R2/20IKR8LpM6+FYQCBJN/vco5x2msQAZRbUEXjagUkLShkEex6acjhasgHRoRN+QS
         LgWLwUrCMuWqt+JbOXc1LPSDAIyMihJRtMb5PBiPoxJXnmYw/uack01en3SfFn0ZivmH
         1Ih0tXIBOBy8ERi/SaArqEu23XdSiQmAtmF7/aDnkyF/1w5fjRLyD8zYQak3lFLqPJCY
         pWqOZoeZAvKIOqidY98gLzAiIS6JQJK8A0OnDCpa95iOFeLlUtltQvY51F/OgOErnxrp
         82tjniAeFPR7pxc1GRxJq1FF0uTwFocMEjwpjvQpyaYzPhgBWCLwHzG7aSOvDSMpTOeD
         GdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739174764; x=1739779564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQjHhBqGj5IZ+lWQctqtiLtMtAyUEzvqFMG/1MA1FoQ=;
        b=CwadmNLLL5QYxZiS+IQ32k3rg0F178RQiAo6b75SwoThfS0EbxbFa89FA408fNbhVT
         P1eo6jmLND5bhL9VhnHpDwr8TCz98iwsx/K0Urneg/lWxfkTSvXAXMQwNWxF9jZJC5PQ
         3gt9X6r3SrTFLTSvSEHP1XpzgvEDvWCVt2SkUYt6mZivw8287RPPsdQafHIsU3V/UBkU
         TPFRhCh5segY1dVWz3WdO60jHOmPKZDxH60gyEcUYh7rvs3ihk5dWg1IXWz5Kpow2lSb
         dBI2HkUjBTKz/ziOOQJsZFi1HLPGXeaR9uQG8I1zcNbyqccIVxfpAP3jGKTDuvmLlvPU
         bdFA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ABg3/8R83aGi/ZZUJnAwZ7v/nWxBkrOwyOPlK371iAZaJzADB/+acN66kvQM3c8sov6sl4gZ4x2GO+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJb0B4n3Nw1T5Ibr59Ai9JzHoISr8JcMj5yhFUS1ZqB7C6fTL
	jnA9XiZ+1TAcDz+uNIBLlgdko+YxVdaC/HNHyiJm/6HNumhXd1rDRiJkgZ64nGA=
X-Gm-Gg: ASbGnctCC5vAQ8L5ouVqV4a+e95ilGJ1oi4EdecNVQQgKubaIAgwhxpNtV/ngRdWVxT
	eZxs5WUjcC1QSozwLDdqvO0Cit0ouI32kkjZwg802LPm28QY4UNSth/14Ql0AFA/odBd/NilzAR
	R0WvcUjH1HwI6izUrSeXC1M6NNX/4VSJf83Obp46aDwJF4vtz8eDdlibDEFbQ2WvXTfnGZ1EOPc
	kXGiTDKQmv08NQvZ8W54WMMtxGtqB49KlKbUXh/RAuVqnrXrTaaj3/wsKGgzxA1DNNbe9zM7ABU
	ey55EXt7XPZ4d+Hd6g==
X-Google-Smtp-Source: AGHT+IFq5wp0CMK0YMZ+JeRZQs6mquvHCQKLzwwMogSPHJ1odDnDs2wNVqpJPZZfSlztYEGJOAUAeg==
X-Received: by 2002:a17:902:e848:b0:215:83e1:99ff with SMTP id d9443c01a7336-21f4e6d255fmr173960985ad.27.1739174764103;
        Mon, 10 Feb 2025 00:06:04 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d58fsm72231715ad.122.2025.02.10.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:06:03 -0800 (PST)
Date: Mon, 10 Feb 2025 13:36:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Anisse Astier <anisse@astier.eu>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 00/14] Rust bindings for cpufreq and OPP core + sample
 driver
Message-ID: <20250210080601.afrxidoywz4ukqdt@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <Z6Sgwbgfp-9SCr8Y@pollux>
 <20250207071538.xjxauatta2jsedz4@vireshk-i7>
 <CANiq72k4N_bD3_QxFKveyjGsSeXJX7y6fKU4EVt0hBOcq9q7tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72k4N_bD3_QxFKveyjGsSeXJX7y6fKU4EVt0hBOcq9q7tA@mail.gmail.com>

Hi Miguel,

On 07-02-25, 12:07, Miguel Ojeda wrote:
> The warning is there even if you don't run `rustfmt`, and it does not
> look like a bug to me -- what Clippy is complaining about is that you
> don't actually need the `unsafe` block to begin with:
> 
>     error: unnecessary `unsafe` block
>     --> rust/kernel/cpufreq.rs:631:22
>         |
>     631 |         attr[next] = unsafe {
>         |                      ^^^^^^ unnecessary `unsafe` block
>         |
>         = note: `-D unused-unsafe` implied by `-D warnings`
>         = help: to override `-D warnings` add `#[allow(unused_unsafe)]`
> 
> since those operations are safe. Or am I missing something?

One thing you are missing is the right branch to test. I mentioned the
wrong tree in cover-letter (though I don't remember getting above
errors earlier too, not sure why you are getting them) :(

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git rust/cpufreq-dt

This patchset was generated correctly though.

I don't get anything with CLIPPY with this branch, with rustfmtcheck I
get:

         // SAFETY: The C code returns a valid pointer here, which is again passed to the C code in
         // an array.
-        attr[next] = unsafe {
-            addr_of_mut!(bindings::cpufreq_freq_attr_scaling_available_freqs) as *mut _
-        };
+        attr[next] =
+            unsafe { addr_of_mut!(bindings::cpufreq_freq_attr_scaling_available_freqs) as *mut _ };
         next += 1;


If I make the above changes I get following with CLIPPY:

$ make CLIPPY=1 ARCH=arm64 O=../barm64t/ -j8 CROSS_COMPILE=aarch64-linux-gnu- CONFIG_DEBUG_SECTION_MISMATCH=y

warning: unsafe block missing a safety comment
   --> /mnt/ssd/all/work/repos/kernel/linux/rust/kernel/cpufreq.rs:632:13
    |
632 |             unsafe { addr_of_mut!(bindings::cpufreq_freq_attr_scaling_available_freqs) as *mut _ };
    |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
    = help: consider adding a safety comment on the preceding line
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
    = note: requested on the command line with `-W clippy::undocumented-unsafe-blocks`

warning: unsafe block missing a safety comment
   --> /mnt/ssd/all/work/repos/kernel/linux/rust/kernel/cpufreq.rs:639:17
    |
639 |                 unsafe { addr_of_mut!(bindings::cpufreq_freq_attr_scaling_boost_freqs) as *mut _ };
    |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
    = help: consider adding a safety comment on the preceding line
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks

warning: 2 warnings emitted


This I thought was a bug (I may have seen this with other Rust
projects too, from what I can remember).

If I drop the unsafe here I get:

error[E0133]: use of mutable static is unsafe and requires unsafe block
   --> /mnt/ssd/all/work/repos/kernel/linux/rust/kernel/cpufreq.rs:632:26
    |
632 |             addr_of_mut!(bindings::cpufreq_freq_attr_scaling_available_freqs) as *mut _;
    |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ use of mutable static
    |
    = note: mutable statics can be mutated by multiple threads: aliasing violations or data races will cause undefined behavior

I don't remember seeing a CLIPPY warning ever about removing the
unsafe here, as reported in your case.

> In any case, passing `rustfmtcheck` is a requirement. So in the worst
> case, if you do find such a bug in e.g. Clippy, you may always
> `expect` or `allow` the lint or disable `rustfmt` in that region of
> code. But that should be really rare, and in such a case it should be
> reported upstream.

It would require clippy::undocumented-unsafe-blocks to be disabled, in
this case.

> I also found other build issues in the branch you mention in your
> cover letter, so please double-check everything looks good before
> adding it to linux-next. Please also make it Clippy-clean.

Sorry about that, maybe there were other issues with the earlier
branch. Can you please try again from the tree I mentioned above ?

-- 
viresh
