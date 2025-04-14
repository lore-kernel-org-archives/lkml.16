Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D82267395
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744630189; cv=none; b=TWcrKpxVucEXEyvNivgb70o2xPuSe3WyWghrrlc5XXut2TlI+1eioaC2GWpIm6KHqqt9hNfXwSZSYvT/CmgBuEECFVsquSPBwfmf5UYjBGaicPvOrgRfjFki/4yWOXhrTpyOUKgt1GjMExR3sraTQvckFROeg03SSIBj+D5xnpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744630189; c=relaxed/simple;
	bh=OId65vYG4iChVP7s+ep0NmfGVOgkQkETuAsaQF/JGAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR9pvxBL98BnddoYDt4G+hFO5tienB5FbfttYO1+Rd17/o1vhn+Kni8i8EEsL7Edm1UB0dU39BqL+G4C3/PwZs3OEC/tndfi4/zt65zrZiMiSAt9fGKdDznnql8jiRy5OfU35F5O7ZVMUISV42QEbz2uptfB9bct8U8hRae3CSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aLSMqNTm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLSMqNTm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso55965855ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744630187; x=1745234987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6+sNIyO8JzbVU9H6WY1PZualMiTtrIWYxB95T2aKKg=;
        b=aLSMqNTmz41GrHp26HLeqezmtfrsjDxmMQIcAABezKLFe96hlbVkNUl92pj1yPyYWe
         wxfKyNvI1P/ID5roBtHIHz9J7NuZZIQe9tI/7eT+D1is04Qu32vMhJrrKKbonBSQ9/hR
         AbC2YEdSj6zu+u6QPwmoAMKQbtOzGzOyFlCJydosAOvG46/1nIn4usbvNopkI0c4dExI
         GdL2uO1SRXCXsNxsvhwqBckjxjrdiM8zNaGxpCylg1h7DnzOWRPcs2cLikwHKb07mVf5
         9HGyw6SB9nusv23J1JDE2ZqbSANGOCnTLGiLwQuGLIBT5UcICZ74BrnjPLf1uybLVUKT
         sE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744630187; x=1745234987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6+sNIyO8JzbVU9H6WY1PZualMiTtrIWYxB95T2aKKg=;
        b=YObbTBvp9tLbgREQFbRWG32rUOWapcnapsSCIiq84eF4x7o1W23Y2bG/pP5ied4sBC
         z27nmq/4DRp2MzV2TysRiVgkKOlyPTCI0Qfx11TNlR17KxDd34gzLkQIP2EkCOXKuTao
         etghKTE2vS0Wl5s59AqPV+ILd5nYAMeJev8RQpDLxioOCC6OIXr0ZRuwCitnKU7I/QnK
         aZK9p2JFCUp7Y1JdXOdHDWE+e4Ibzqg8pVDJ/xd8hBgvQix8lhxZM4+cz7E/u4GJm6qo
         ELGfeO/8XQrbS4LxrFsBSeQ1Z3SuAw+ZKo3u+Kedx3nrNtqzerSQt/6wo4QFdzQAWRT/
         1Ygg==
X-Forwarded-Encrypted: i=1; AJvYcCUpu7da+Rs44HUVBgLfMAsG2EcpWMuFX98kZlYLN1fyDO9iRA0yvRuLBN+WFaAgMVPaa9WdOnLPrfWxeqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/z1aktOu0cSia/bQCPMzY8+DaqWEjc4yOIUJKgCe3PochaEl
	jITmiINyTCtt1BrR7QRcFlUD1I23WE01eswzRUfCmIm3IccmLsaPqito7Sfs7MU=
X-Gm-Gg: ASbGnctAVtYmbW1FigzIWWOM5ug9MsM4bgv8JmYfvtQ22WWzlIgt3sVH9fqpG26ZPDK
	9Rn079PyeRzS/n6LlnmzKNYdCVE6Vop1ujzSVIhErgR0WMdJJCq7LeGaa8IX34El3+FKX4LTFp4
	yhDILqWDJkV3yxN9ne/GZw7BynHmI92ml3zfm8Goivmc2JRSeGEdw1vnTGJSn9Zj80jyFOkar+w
	2m/grgdIsdA3vMOzuGoTfj/Vh0C2dVvkb/+7x+6svpgsZVWQ3cYo3ghVM6JbryMrBDkLrIF+2+c
	bl9B+Z3ojvD8wlC6MAujBMxycAunQynZGfC+5GMLGw==
X-Google-Smtp-Source: AGHT+IE2yePppLq/70OKRdNpVINOxCz29KaYhLiwBomV/BOoxtq3utngiXMthhUwoFkXpZSNMWS9Gg==
X-Received: by 2002:a17:903:1d1:b0:21f:f3d:d533 with SMTP id d9443c01a7336-22bea4a17fdmr134579745ad.2.1744630186633;
        Mon, 14 Apr 2025 04:29:46 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b628desm96556265ad.20.2025.04.14.04.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:29:46 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:59:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>, Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V9 03/17] rust: cpumask: Add initial abstractions
Message-ID: <20250414112943.r2h3a54r2jm4iana@vireshk-i7>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
 <9a004e3dff5321dae3b96df2817799daa699ce01.1744366571.git.viresh.kumar@linaro.org>
 <Z_k7HtIZaSWeJvM4@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_k7HtIZaSWeJvM4@yury>

On 11-04-25, 11:54, Yury Norov wrote:
> On Fri, Apr 11, 2025 at 04:25:02PM +0530, Viresh Kumar wrote:
> > +    unsafe fn new_uninit(_flags: Flags) -> Result<Self, AllocError> {
> > +        Ok(Self {
> > +            #[cfg(CONFIG_CPUMASK_OFFSTACK)]
> > +            ptr: {
> > +                let mut ptr: *mut bindings::cpumask = ptr::null_mut();
> > +
> > +                // SAFETY: Depending on the value of `_flags`, this call may sleep. Other than
> > +                // that, it is always safe to call this method.
> 
> I'm not sure I understand this sentence. What's wrong with safety when
> the alloc() function sleeps? Even if something is wrong. If you really
> want to protect your users, you'd introduce new_sync() version that
> returns error if user provides sleeping flags.

I borrowed this SAFETY comment from similar allocation done in
page.rs, I think we can skip it though. Here is the delta so far:

@@ -27,8 +27,8 @@
 ///
 /// A [`Cpumask`] instance always corresponds to a valid C `struct cpumask`.
 ///
-/// The callers must ensure that the `struct cpumask` is valid for access and remains valid for the
-/// lifetime of the returned reference.
+/// The callers must ensure that the `struct cpumask` is valid for access and
+/// remains valid for the lifetime of the returned reference.
 ///
 /// ## Examples
 ///
@@ -86,7 +86,9 @@ pub fn as_raw(&self) -> *mut bindings::cpumask {
 
     /// Set `cpu` in the cpumask.
     ///
-    /// Equivalent to the kernel's `__cpumask_set_cpu` API.
+    /// ATTENTION: Contrary to C, this Rust `set()` method is non-atomic.
+    /// This mismatches kernel naming convention and corresponds to the C
+    /// function `__cpumask_set_cpu()`.
     #[inline]
     pub fn set(&mut self, cpu: u32) {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to `__cpumask_set_cpu`.
@@ -95,7 +97,9 @@ pub fn set(&mut self, cpu: u32) {
 
     /// Clear `cpu` in the cpumask.
     ///
-    /// Equivalent to the kernel's `__cpumask_clear_cpu` API.
+    /// ATTENTION: Contrary to C, this Rust `clear()` method is non-atomic.
+    /// This mismatches kernel naming convention and corresponds to the C
+    /// function `__cpumask_clear_cpu()`.
     #[inline]
     pub fn clear(&mut self, cpu: i32) {
         // SAFETY: By the type invariant, `self.as_raw` is a valid argument to
@@ -198,15 +202,14 @@ pub struct CpumaskVar {
 }
 
 impl CpumaskVar {
-    /// Creates an initialized instance of the [`CpumaskVar`].
-    pub fn new(_flags: Flags) -> Result<Self, AllocError> {
+    /// Creates a zero-initialized instance of the [`CpumaskVar`].
+    pub fn new_zero(_flags: Flags) -> Result<Self, AllocError> {
         Ok(Self {
             #[cfg(CONFIG_CPUMASK_OFFSTACK)]
             ptr: {
                 let mut ptr: *mut bindings::cpumask = ptr::null_mut();
 
-                // SAFETY: Depending on the value of `_flags`, this call may sleep. Other than
-                // that, it is always safe to call this method.
+                // SAFETY: It is safe to call this method as the reference to `ptr` is valid.
                 //
                 // INVARIANT: The associated memory is freed when the `CpumaskVar` goes out of
                 // scope.
@@ -222,20 +225,19 @@ pub fn new(_flags: Flags) -> Result<Self, AllocError> {
         })
     }
 
-    /// Creates an uninitialized instance of the [`CpumaskVar`].
+    /// Creates an instance of the [`CpumaskVar`].
     ///
     /// # Safety
     ///
     /// The caller must ensure that the returned [`CpumaskVar`] is properly initialized before
     /// getting used.
-    unsafe fn new_uninit(_flags: Flags) -> Result<Self, AllocError> {
+    unsafe fn new(_flags: Flags) -> Result<Self, AllocError> {
         Ok(Self {
             #[cfg(CONFIG_CPUMASK_OFFSTACK)]
             ptr: {
                 let mut ptr: *mut bindings::cpumask = ptr::null_mut();
 
-                // SAFETY: Depending on the value of `_flags`, this call may sleep. Other than
-                // that, it is always safe to call this method.
+                // SAFETY: It is safe to call this method as the reference to `ptr` is valid.
                 //
                 // INVARIANT: The associated memory is freed when the `CpumaskVar` goes out of
                 // scope.

> > +    /// Creates a mutable reference to an existing `struct cpumask_var_t` pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
> > +    /// of the returned reference.
> > +    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask_var_t) -> &'a mut Self {
> 
> The 'from' (wrt cpumasks) has a special meaning: search for a cpu
> starting from a given one. This 'from_raw' may confuse readers. Have
> you any other name for it in mind?

'from_raw' is widely used in Rust for similar methods, though I do
understand your concerns.

Danilo / Miguel, what do you suggest I rename these to ?

> > +        // SAFETY: Guaranteed by the safety requirements of the function.
> > +        //
> > +        // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
> > +        // lifetime of the returned reference.
> > +        unsafe { &mut *ptr.cast() }
> > +    }
> > +    /// Clones cpumask.
> > +    pub fn try_clone(cpumask: &Cpumask) -> Result<Self> {
> 
> Just clone(), I think.

The method 'clone()' is already used by the 'Clone' trait [1], and
that's what I wanted to use initially. But 'clone' doesn't return a
'Result'.

-- 
viresh

[1] https://doc.rust-lang.org/std/clone/trait.Clone.html
