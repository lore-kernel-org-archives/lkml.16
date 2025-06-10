Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DBF18024
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549630; cv=none; b=m+Fw7nMtXk95hVfqZW9fRKmvqliDbzGa3ED1cdn359V1prWTWjLZIaXbovrTQWnz4uDvudOP3nb3Qpe3pCqe4Qqz1U2qps58Y+PDNIWUQrk+W56OlPdvYJDERC+ufIgnEiIc/BK7dmzErGdBaK9YAGxtpm05L+rANGWbcQlZ85g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549630; c=relaxed/simple;
	bh=S10nBi/BiHjHSt02KbAKfhUFQkqNd2xBG/kn8e1CEPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTy+lxIyWAy8wQm/0NCrwrR9150B9lNn8+/BvQEqt5OZ+OEivEVfAOxjz8wCRwbDeT1CeZuHO9vOn8HhVXW0HNYH9oYsx9XSdIUpuu7ib8KYktz0bK5YnL0u2b/379cEnD8fN3gWq/SCPt+xLSC/Uz+JXSiW7c6scdADcWZWJ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N0y9Cd2/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N0y9Cd2/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23636167b30so7410245ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749549628; x=1750154428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N9ANb2Sz9T3OrMcBFLr3uFoqHAo9qQBhhQ3nsD5NOa8=;
        b=N0y9Cd2/iQNUJ3RYA9Ep2QZT8KLZ/1hLS9dUEQmiWT+0/NDMkaBBRz0Lu7cS0PEF7l
         O6mmZ2bFJCJd4hr2j4UZxefuG0l6x3CjLHLhMDnHs0zb750eLrg+5FM3Kb3BFl2/dabP
         Jdaqgio/IXHI9gJ4BrssVVELfIUViBrPA4vJd9gap3qjetNk4zsHITI35FIaEl9s7P3S
         d+jkZp5X+i0XgzVrrAEzwalvbOq0/0a0cnbFempTl3OAA9sFHbsdYgIH6AVoIgge69BO
         F63pEl5+bPxjJeSXRwCOsZgvFH6wE0i7+IP0OZvVs30L9//2fgPGRpiZOov/TkVg9rOc
         TKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549628; x=1750154428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9ANb2Sz9T3OrMcBFLr3uFoqHAo9qQBhhQ3nsD5NOa8=;
        b=GyuFRu4Q4JNv4rGyER+AI6s5oH1f3e1q7tPUdqmSb3OC5fFTyvTWEzF6+u6CBlGnzH
         /WXRGXlgmJYUJoiG2IwNhb21KDeVQUNs9fjBoGY6kxtbEcFq8Z6w4EnHLShsy14QcJfE
         8Cg7kflpWRT4CmSw0GEwvTlJpIHFxUU5QdPzkjd2Asmza5RUD6rOyiNtty6Quaze1q8b
         nZnBmjQ2jiX6ot91VcabWy40V36GnMBLLYK5v/R2zVwuUqYXI+UQvH55CFhaBwNDL1Zf
         4vJyKQhNypWZVupNt9VLurqDl7VxSlJhMRXxe2wGDHlyVC1OR8ED7EkUeatM1ye3n0GM
         QTMw==
X-Forwarded-Encrypted: i=1; AJvYcCVsEn840qPmH3NpwDtzQ2HL5UR+XNmAOis23keKWpgIoXShFeHpPc6ogEAmhMwzpXMgVATJeILSeEno/ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRk641SQYLuVzm69DxJjTR5D+7+6WCNTYKxjZNsky+Eznh8cOy
	ucqmhxhY1i8ZnASHajwSfXKjqmWSsx8UiEl4a0VJTP//iJUsSikUHmfnmJQddgc1LJVmNOcN3PD
	EthJ3
X-Gm-Gg: ASbGncsjaDKuJ9ehlkWJ7m8aF458vmg+YVrZB7idt2WpO68tg8xmpC8Po3HEROml+bm
	ST9nXgZmyC+zHg/tQR4i1jNkGEUs4IYB89WRb65RaDBYR/g4z3d9RnOdvw/5OauHH0BTt+w94ti
	mF/wfA/fQFkb/YQAHE/L9N1EqftQ/9CdDiV0dzi+E9+prYguaAZgbkBTV8EB4PQs6AZr9i6ATOv
	60D/qvUwRRN08wzKxHJ17jSKOnyAuvVDI1YUq8GACIwl5rIDycbWi23FzhbvoONiLJgGz5CcUhm
	Z3AO/5rqXtPwF4gGsJQNv4lq8AXeXltqkOyOCxU01W0k25o/aqLtM0gzK0jQ9YLuPWA+f0C81w=
	=
X-Google-Smtp-Source: AGHT+IEMzvtlYJvPs0fo3oH7VeFSegA6r1P8Nwp25AFI/D2oU0oLiOb4lq9od3f+FKn9BjFRrX3Fyw==
X-Received: by 2002:a17:903:2391:b0:225:adf8:8634 with SMTP id d9443c01a7336-23601dcd137mr212321375ad.51.1749549627911;
        Tue, 10 Jun 2025 03:00:27 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077fd8sm67488785ad.45.2025.06.10.03.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:00:27 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:30:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610100025.e2jadqzlmimyq4rh@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>

On 09-06-25, 14:01, Miguel Ojeda wrote:
> I also opened a "good first issue" for a docs bit:
> https://github.com/Rust-for-Linux/linux/issues/1169.

Just wanted to make sure before I post this, you were talking about
these, right ?

@@ -1057,7 +1057,10 @@ pub fn new_foreign_owned(dev: &Device<Bound>) -> Result {
 impl<T: Driver> Registration<T> {
     /// Driver's `init` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// - This function may only be called from the cpufreq C infrastructure.
+    /// - The pointer arguments must be valid pointers.
     extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::c_int {
         from_result(|| {
             // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
@@ -1072,7 +1075,10 @@ extern "C" fn init_callback(ptr: *mut bindings::cpufreq_policy) -> kernel::ffi::

     /// Driver's `exit` callback.
     ///
-    /// SAFETY: Called from C. Inputs must be valid pointers.
+    /// # Safety
+    ///
+    /// - This function may only be called from the cpufreq C infrastructure.
+    /// - The pointer arguments must be valid pointers.
     extern "C" fn exit_callback(ptr: *mut bindings::cpufreq_policy) {
         // SAFETY: The `ptr` is guaranteed to be valid by the contract with the C code for the
         // lifetime of `policy`.

-- 
viresh
