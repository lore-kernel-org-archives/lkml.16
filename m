Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E2215F4C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878886; cv=none; b=J/JNvOw8U33qC2cFETarEEsyQb+3CiTGdLjf2SnEaP+19W9R45cIs1GIg9tNikGV04VcKjg3qDyKIgQx+c/QQU8bB3p3KhE4723kMQcB3NpybVKfC71/DP/hEnJua8Km8Kqyexm+AvyVp1rd0sJ0LeVVqa3DcANps1pGFlwR7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878886; c=relaxed/simple;
	bh=ixkVyLZRUxWYA3WM0kBZtpt/YqFcJOlELSo02HIZGC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/G6YjWMefsmWLTssmX6QqDW8EUq4B7TvWvBqrl3SUCfcrBoQ6GlLohZSJtFBk4OwNzlskHGc/adaRutlbf6NPmf3Tio0Y/gVTAUCHU9foNYsEFoOJdaa0eAwCwj5ahpg92wXdpVDFk3Mm+WA/hmyHf0iJ0mldhYCbukdajdOZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OYDfoHdl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYDfoHdl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c33e5013aso6236495ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744878883; x=1745483683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb5CZXPsOuFwknd/3x7WQ7zJoOJkvgvN9w2Ymwy9MVs=;
        b=OYDfoHdlDjnroQD4zzmfNSMvJvVQ7WEFrxCffEQFBqKFjNRNeg1TDfxue5x7XvUDzt
         +w5+snldka1JvleGFXzKSeuEYJ8cpFY3MJ5C5kq3QjhHseHGtbjKPLcwEXTN3+GTjk6O
         WEpb3gmC2Kjcju8Auz+Q4JTTCLGHi287mLdm/hQ0mKyKggUTMb2QrlhWVGmqh5zniRrA
         01qq3QJu4f90Ir6O+WrFvqET1mP0d4wBW3tFQa5gFUhmYMqHbFZPwvEEJhF6NyZh2R9N
         OqDJRvd8zg3Xw3GswZuVXNbbvbGOmFt/frJzmsw83PFN+c2eqMo6ZiZgK5xoWP+r5OGw
         DCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744878883; x=1745483683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mb5CZXPsOuFwknd/3x7WQ7zJoOJkvgvN9w2Ymwy9MVs=;
        b=riPCt9JoOr0Q/UrHodThcpf411mvPsIKBlfOr53oRWj0JVnjPDyDewacn96nNRF0I4
         1npcZQr6mTeFJTBrbV6STHQWN00rF0pIXiyuZa3+YSfbpvsKXOWJ8ufk6VvB22CjVn9S
         WvujhEetR9+4BLK7juq5JFykV0hwRchryxEGXZpBuRpqWV1MsdYmGm4Z095KLsH4ZXCL
         JXDfhT4cWfe+JeluuxSUwuysyffp48QOqmfkgSPJNf5F4EnZ438tWGP0LjrHhXy2HtM6
         aZNmGEE6lKqrWEFKWG8/jpCfIuy0X/jhoxH0ymJKcZ3tNLpGqiJELx8fbr1Ec6UQyQod
         KIig==
X-Forwarded-Encrypted: i=1; AJvYcCUvqVC0/RA27Ca5wvPdwwSz6WZVsLDPWdy8PtRoOA5BO2dkd1dxFw4G5bO74KFKGxMt6mDac6QJ4LAvIBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUctOxivq8sWuM1jXncqHtMQdCA67nRhswrtwX4T8WOBqcI5z
	Kkq1hflxNR3cn7mZPhItSacUX5YunQgXKZLsk9AVbsUd3zsto8vOx3eZ/McFVwM=
X-Gm-Gg: ASbGnctqWuA/N8Qw4raWn+nwejJE7tSgWP8CQ8ALAZJAbDMfz3Rj6kC8HVnTVvZS/Zu
	KG4aPBxRHHicmvaQv7Rz/KteS4yVAbjVGx1G+dRP1Is9HxXD05+jB/Tsgnc0Hfu3cO4q4fgY1Jo
	sJdt6hXcJ7nrQt9idRrzF0QBvbtuTAWL1XRbPWnz35EIDPsZRR2cwwMzzAOQKKa6tkYPYFe6O9g
	TgOnxQzdxd0ctHkGHVFrU3Ns57XJvrgCyCwHTBJ/Z8w2Jhl+N4Nm98m1SvUok6O4eWPK6PGv2tR
	3KggUWTNB7/drfScu/k89lEFBVB6WvrDVFv3U8lPNLOrg0IO7YyW
X-Google-Smtp-Source: AGHT+IEDwXJHk1xXHf+mY6UKQ16fJRqHoR8U6F2UN30Z5lrJQeqnSkvW3GayzXRMMQB5iBA+UB+Ifw==
X-Received: by 2002:a17:902:f686:b0:216:53fa:634f with SMTP id d9443c01a7336-22c35983c46mr79168505ad.48.1744878883068;
        Thu, 17 Apr 2025 01:34:43 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5d77sm27820665ad.150.2025.04.17.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:34:42 -0700 (PDT)
Date: Thu, 17 Apr 2025 14:04:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 11/15] rust: cpufreq: Add initial abstractions for
 cpufreq framework
Message-ID: <20250417083440.q27nwcizlxb76vzn@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <ac6854885277b23f100c6033fab51a080cdb70eb.1744783509.git.viresh.kumar@linaro.org>
 <Z_904KuBhKbO738_@pollux>
 <20250416093720.5nigxsirbvyiumcv@vireshk-i7>
 <Z_-hskVtNFPxUmlC@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-hskVtNFPxUmlC@pollux>

On 16-04-25, 14:25, Danilo Krummrich wrote:
> This sounds like you could just abstract the index passed through the callback
> in some trusted type (e.g. cpufreq::TableIndex) and let the cpufreq::Table
> methods take this trusted index type, rather than a raw usize, which would also
> make the methods safe.

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 87a54a8af198..4de7fea7bf3f 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -61,12 +61,12 @@ pub mod flags {
     pub const NO_AUTO_DYNAMIC_SWITCHING: u16 = 1 << 6;
 }
 
-// Relations from the C code.
+/// Relations from the C code.
 const CPUFREQ_RELATION_L: u32 = 0;
 const CPUFREQ_RELATION_H: u32 = 1;
 const CPUFREQ_RELATION_C: u32 = 2;
 
-// Can be used with any of the above values.
+/// Can be used with any of the above values.
 const CPUFREQ_RELATION_E: u32 = 1 << 2;
 
 /// CPU frequency selection relations.
@@ -157,6 +157,36 @@ pub fn generic_verify(&self) -> Result<()> {
     }
 }
 
+/// The frequency table index.
+///
+/// Represents index with a frequency table.
+///
+/// # Invariants
+///
+/// The index must correspond to a valid entry in the [`Table`] it is used for.
+#[derive(Copy, Clone, PartialEq, Eq, Debug)]
+pub struct TableIndex(usize);
+
+impl TableIndex {
+    /// Creates an instance of [`TableIndex`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `index` correspond to a valid entry in the [`Table`] it is used
+    /// for.
+    pub unsafe fn new(index: usize) -> Self {
+        // INVARIANT: The caller ensures that `index` correspond to a valid entry in the [`Table`].
+        Self(index)
+    }
+}
+
+impl From<TableIndex> for usize {
+    #[inline]
+    fn from(index: TableIndex) -> Self {
+        index.0
+    }
+}
+
 /// CPU frequency table.
 ///
 /// Rust abstraction for the C `struct cpufreq_frequency_table`.
@@ -173,20 +203,19 @@ pub fn generic_verify(&self) -> Result<()> {
 /// The following example demonstrates how to read a frequency value from [`Table`].
 ///
 /// ```
-/// use kernel::cpufreq::Policy;
+/// use kernel::cpufreq::{Policy, TableIndex};
 ///
 /// fn show_freq(policy: &Policy) {
 ///     let table = policy.freq_table().unwrap();
 ///
-///     // SAFETY: The index values passed are correct.
-///     unsafe {
-///         pr_info!("The frequency at index 0 is: {:?}\n", table.freq(0).unwrap());
-///         pr_info!("The flags at index 0 is: {}\n", table.flags(0));
-///         pr_info!("The data at index 0 is: {}\n", table.data(0));
-///     }
+///     // SAFETY: Index is a valid entry in the table.
+///     let index = unsafe { TableIndex::new(0) };
+///
+///     pr_info!("The frequency at index 0 is: {:?}\n", table.freq(index).unwrap());
+///     pr_info!("The flags at index 0 is: {}\n", table.flags(index));
+///     pr_info!("The data at index 0 is: {}\n", table.data(index));
 /// }
 /// ```
-#[allow(dead_code)]
 #[repr(transparent)]
 pub struct Table(Opaque<bindings::cpufreq_frequency_table>);
 
@@ -214,47 +243,34 @@ pub fn as_raw(&self) -> *mut bindings::cpufreq_frequency_table {
     }
 
     /// Returns frequency at `index` in the [`Table`].
-    ///
-    /// # Safety
-    ///
-    /// The caller must ensure that `index` corresponds to a valid table entry.
     #[inline]
-    pub unsafe fn freq(&self, index: usize) -> Result<Hertz> {
+    pub fn freq(&self, index: TableIndex) -> Result<Hertz> {
         // SAFETY: By the type invariant, the pointer stored in `self` is valid and `index` is
-        // guaranteed to be valid by the safety requirements of the function.
+        // guaranteed to be valid by its safety requirements.
         Ok(Hertz::from_khz(unsafe {
-            (*self.as_raw().add(index)).frequency.try_into()?
+            (*self.as_raw().add(index.into())).frequency.try_into()?
         }))
     }
 
     /// Returns flags at `index` in the [`Table`].
-    ///
-    /// # Safety
-    ///
-    /// The caller must ensure that `index` corresponds to a valid table entry.
     #[inline]
-    pub unsafe fn flags(&self, index: usize) -> u32 {
+    pub fn flags(&self, index: TableIndex) -> u32 {
         // SAFETY: By the type invariant, the pointer stored in `self` is valid and `index` is
-        // guaranteed to be valid by the safety requirements of the function.
-        unsafe { (*self.as_raw().add(index)).flags }
+        // guaranteed to be valid by its safety requirements.
+        unsafe { (*self.as_raw().add(index.into())).flags }
     }
 
     /// Returns data at `index` in the [`Table`].
-    ///
-    /// # Safety
-    ///
-    /// The caller must ensure that `index` corresponds to a valid table entry.
     #[inline]
-    pub unsafe fn data(&self, index: usize) -> u32 {
+    pub fn data(&self, index: TableIndex) -> u32 {
         // SAFETY: By the type invariant, the pointer stored in `self` is valid and `index` is
-        // guaranteed to be valid by the safety requirements of the function.
-        unsafe { (*self.as_raw().add(index)).driver_data }
+        // guaranteed to be valid by its safety requirements.
+        unsafe { (*self.as_raw().add(index.into())).driver_data }
     }
 }
 
 /// CPU frequency table owned and pinned in memory, created from a [`TableBuilder`].
 pub struct TableBox {
-    #[allow(dead_code)]
     entries: Pin<KVec<bindings::cpufreq_frequency_table>>,
 }
 
@@ -302,7 +318,7 @@ fn deref(&self) -> &Self::Target {
 /// The following example demonstrates how to create a CPU frequency table.
 ///
 /// ```
-/// use kernel::cpufreq::TableBuilder;
+/// use kernel::cpufreq::{TableBuilder, TableIndex};
 /// use kernel::clk::Hertz;
 ///
 /// let mut builder = TableBuilder::new();
@@ -315,15 +331,18 @@ fn deref(&self) -> &Self::Target {
 ///
 /// let table = builder.to_table().unwrap();
 ///
-/// // SAFETY: The index values passed are correct.
-/// unsafe {
-///     assert_eq!(table.freq(0), Ok(Hertz::from_mhz(700)));
-///     assert_eq!(table.flags(0), 0);
-///     assert_eq!(table.data(0), 1);
+/// // SAFETY: Index values correspond to valid entries in the table.
+/// let (index0, index2) = unsafe { (TableIndex::new(0), TableIndex::new(2)) };
 ///
-///     assert_eq!(table.freq(2), Ok(Hertz::from_mhz(900)));
-///     assert_eq!(table.flags(2), 4);
-///     assert_eq!(table.data(2), 5);
-/// }
+/// assert_eq!(table.freq(index0), Ok(Hertz::from_mhz(700)));
+/// assert_eq!(table.flags(index0), 0);
+/// assert_eq!(table.data(index0), 1);
+///
+/// assert_eq!(table.freq(index2), Ok(Hertz::from_mhz(900)));
+/// assert_eq!(table.flags(index2), 4);
+/// assert_eq!(table.data(index2), 5);
 /// ```
 #[derive(Default)]

-- 
viresh
