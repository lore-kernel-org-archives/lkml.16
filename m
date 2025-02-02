Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193F38384;
	Sun,  2 Feb 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501821; cv=none; b=MDwaprKesbxe7Nt20Bzvi8xSjoyRHx0WRAJT2FYbIhzwd+nq2L035CH9GWq3qMLdMXeVF9XVjS8E+5LBQ9FwCJwHCe33UldvlYqTXIQeLtklZPTc7p6Blk4kiRi9fXKdPI7bkw2P59Ze85Kn5QNnRZsTVS8G5rzw1MvnWBThQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501821; c=relaxed/simple;
	bh=u5WzlU9Phw6fZglCZ2EjESEQH1bBXFAPkcvMkNrxgn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRL6Huu1wqv8mV3TRb0YHm7yU23oSn+BUsGBSesKGyltgFPAz2/9pykwnj7ZhuDksuCDvwsCHFrrhrN37Urge8iULjs6IDW+v5fmlJ/ipb4I14pp5UTb9qwwth6kWiY7vOh9HsjJEEkKI0ipwmOjQU7J9B7t4k5UqC+pu7N0SLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV3bfbUi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV3bfbUi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283d48so25908195e9.1;
        Sun, 02 Feb 2025 05:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738501817; x=1739106617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5e0mz2t+cKzoHtw4Id7Bo73sERup0BZcoHiKCXhGa8=;
        b=MV3bfbUiYSGGcxwpSCt1LR67af3CU5gWZynd1P7sBcspkCN8VOOSbR0N7ZMUa7qb1H
         gg1OTYEbrpm2lGSNHavnfcwWyFa+vz0mt1h82FxJP0TmFzd3oaZfGSULX1sr4qTlmVtU
         ayC4FoTRwFGpLn6c8iS/41V4ObnSb8BjNeHPaaX55Bq3DoQbpD+g6oUCayoOaHa0H0Im
         ugiLcWR8xuyTGF7ub2FsBG2bESIp2WHvwUbz5PY+VJj1NMErKmZqy8RTuthuWuM/0YcD
         MV8XjByTMcsty3abGF7I5FI9zBGVIq/BIIvYkmIcCem5frI1ECto2RtSR3l43bOVjnBU
         6Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738501817; x=1739106617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5e0mz2t+cKzoHtw4Id7Bo73sERup0BZcoHiKCXhGa8=;
        b=Tw+D2iqgmtO6q0nOGSUcJFt72LkLmXX2yQivFttsPT8qAqUTIUXnM/rhesrYsCMlxZ
         JSuGEmlTuu7BCuSNq/DuZ6yn+txOgSxwxNoc7OUzY4R6l/SATi3OvZFtkUSJTSVCvv07
         7utLYG8Rs8g+1ZHQ/+wDdB+zMIZ6ouQeMqSaX5At/XAECvitCAGbnctUdZ9CEqcLQvus
         PTq3PIqMasaCZRNbnR2aZ2RBir/Vag7kcjM6UHAjlxtqgqAgGDb/CgQ/vazGqkcJ4NYb
         KjzKZG+l2BUln74VTYzP7CO/WdVfwSYOy9sj8joN6cTHJdkvOtGpQrrzthdUqmGyfyjI
         lmgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSlmSyIUaqPmuESpQqSkOxuGD6K2oC5A8nq05HyfhPSnwVHFNH0p/XkmWEF4wLydVIrP/bQ/6jor5rJF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM1eCxDfCSZr4T/qqx9W3opAUPlKZorh2QAw9uPJzhrohVXaW1
	GJOgr4VK5dU0lidtHk3edDy0f77vywMjKsCOZy04iwSw9NbAClLR
X-Gm-Gg: ASbGncuywiR7H5Ebo0qnY3WuXtyUV0Hy0n4cphss0g966BuvJtD/SqGzjZo3DP1fzzG
	t8PXLyxRAbJ5DdTYG8yeWKFi8IqIrFvgWxbsKi84NKF2XOHhLJkkfdhxWuBEQMpfVVHs3JWQLEw
	Be5KhRkksk0fWUraTzNlqLvoZPK5iOoMZdJw/2i1JGUuyFlLcTruuqhqU1PAMVCSpg3qwEpRRcN
	sbsgUk9zwENM1UgbN/js4eA92Dgxp6e0Ns4hohEXnKp6qszot4xUA9Gbi/08n+kGjfD5N1PnCr0
	WzLm+s8gnbSJSQpuRppFWRNqTKBrRBEhk7gwu/B1tLaiqheoyXXVkWvKMf/5fBd/FpFEfAsDV95
	W9wIal8g1NEEAlQBMfHAzBC8IgXhB69nqDCs+GkeukNqE
X-Google-Smtp-Source: AGHT+IGqdSy7/XSImhEb0RcnAexb6l6Lfi9tisNZHaD0RXXCKzoQkJJ5XnaDS1IS/soNGt5fg7FYCw==
X-Received: by 2002:a5d:59ad:0:b0:38a:86fe:52dc with SMTP id ffacd0b85a97d-38c51949a3cmr14506695f8f.13.1738501817175;
        Sun, 02 Feb 2025 05:10:17 -0800 (PST)
Received: from ?IPV6:2003:df:bf03:a200:5cf2:a133:958e:1f2? (p200300dfbf03a2005cf2a133958e01f2.dip0.t-ipconnect.de. [2003:df:bf03:a200:5cf2:a133:958e:1f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm10238610f8f.53.2025.02.02.05.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 05:10:16 -0800 (PST)
Message-ID: <3e2cb277-a896-4575-b23b-8d9b42c87173@gmail.com>
Date: Sun, 2 Feb 2025 14:10:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] rust: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>,
 Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
 <20250202-cstr-core-v6-3-8469cd6d29fd@gmail.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20250202-cstr-core-v6-3-8469cd6d29fd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tamir,

On 02.02.25 13:20, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible and rename
> `kernel::c_str!` to `c_str_avoid_literals` to clarify its intended use.
> 
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/net/phy/ax88796b_rust.rs |  7 +++----
>  drivers/net/phy/qt2025.rs        |  5 ++---
>  rust/kernel/firmware.rs          |  4 ++--
>  rust/kernel/kunit.rs             |  7 ++++---
>  rust/kernel/net/phy.rs           |  6 ++----
>  rust/kernel/str.rs               | 37 ++++++++++++++++++++++++-------------
>  rust/kernel/sync.rs              |  4 ++--
>  rust/kernel/sync/lock/global.rs  |  3 ++-
>  8 files changed, 41 insertions(+), 32 deletions(-)


Have you checked samples/rust/ [1] as well?

Best regards

Dirk

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust


> diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
> index 8c7eb009d9fc..b07d36f45a43 100644
> --- a/drivers/net/phy/ax88796b_rust.rs
> +++ b/drivers/net/phy/ax88796b_rust.rs
> @@ -5,7 +5,6 @@
>  //!
>  //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
>  use kernel::{
> -    c_str,
>      net::phy::{self, reg::C22, DeviceId, Driver},
>      prelude::*,
>      uapi,
> @@ -41,7 +40,7 @@ fn asix_soft_reset(dev: &mut phy::Device) -> Result {
>  #[vtable]
>  impl Driver for PhyAX88772A {
>      const FLAGS: u32 = phy::flags::IS_INTERNAL;
> -    const NAME: &'static CStr = c_str!("Asix Electronics AX88772A");
> +    const NAME: &'static CStr = c"Asix Electronics AX88772A";
>      const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1861);
>  
>      // AX88772A is not working properly with some old switches (NETGEAR EN 108TP):
> @@ -105,7 +104,7 @@ fn link_change_notify(dev: &mut phy::Device) {
>  #[vtable]
>  impl Driver for PhyAX88772C {
>      const FLAGS: u32 = phy::flags::IS_INTERNAL;
> -    const NAME: &'static CStr = c_str!("Asix Electronics AX88772C");
> +    const NAME: &'static CStr = c"Asix Electronics AX88772C";
>      const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
>  
>      fn suspend(dev: &mut phy::Device) -> Result {
> @@ -125,7 +124,7 @@ fn soft_reset(dev: &mut phy::Device) -> Result {
>  
>  #[vtable]
>  impl Driver for PhyAX88796B {
> -    const NAME: &'static CStr = c_str!("Asix Electronics AX88796B");
> +    const NAME: &'static CStr = c"Asix Electronics AX88796B";
>      const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x003b1841);
>  
>      fn soft_reset(dev: &mut phy::Device) -> Result {
> diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
> index 1ab065798175..2f4ba85a0d73 100644
> --- a/drivers/net/phy/qt2025.rs
> +++ b/drivers/net/phy/qt2025.rs
> @@ -9,7 +9,6 @@
>  //!
>  //! The QT2025 PHY integrates an Intel 8051 micro-controller.
>  
> -use kernel::c_str;
>  use kernel::error::code;
>  use kernel::firmware::Firmware;
>  use kernel::net::phy::{
> @@ -36,7 +35,7 @@
>  
>  #[vtable]
>  impl Driver for PhyQT2025 {
> -    const NAME: &'static CStr = c_str!("QT2025 10Gpbs SFP+");
> +    const NAME: &'static CStr = c"QT2025 10Gpbs SFP+";
>      const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x0043a400);
>  
>      fn probe(dev: &mut phy::Device) -> Result<()> {
> @@ -69,7 +68,7 @@ fn probe(dev: &mut phy::Device) -> Result<()> {
>          // The micro-controller will start running from the boot ROM.
>          dev.write(C45::new(Mmd::PCS, 0xe854), 0x00c0)?;
>  
> -        let fw = Firmware::request(c_str!("qt2025-2.0.3.3.fw"), dev.as_ref())?;
> +        let fw = Firmware::request(c"qt2025-2.0.3.3.fw", dev.as_ref())?;
>          if fw.data().len() > SZ_16K + SZ_8K {
>              return Err(code::EFBIG);
>          }
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index e75db4d825ce..93e375e75ca0 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -40,13 +40,13 @@ fn request_nowarn() -> Self {
>  /// # Examples
>  ///
>  /// ```no_run
> -/// # use kernel::{c_str, device::Device, firmware::Firmware};
> +/// # use kernel::{device::Device, firmware::Firmware};
>  ///
>  /// # fn no_run() -> Result<(), Error> {
>  /// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
>  /// # let dev = unsafe { Device::get_device(core::ptr::null_mut()) };
>  ///
> -/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev)?;
> +/// let fw = Firmware::request(c"path/to/firmware.bin", &dev)?;
>  /// let blob = fw.data();
>  ///
>  /// # Ok(())
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 9f40ea744fc2..3d812edec057 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -56,10 +56,11 @@ macro_rules! kunit_assert {
>                  break 'out;
>              }
>  
> -            static NAME: &'static $crate::str::CStr = $crate::c_str!($name);
> -            static FILE: &'static $crate::str::CStr = $crate::c_str!($file);
> +            static NAME: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($name);
> +            static FILE: &'static $crate::str::CStr = $crate::c_str_avoid_literals!($file);
>              static LINE: i32 = core::line!() as i32 - $diff;
> -            static CONDITION: &'static $crate::str::CStr = $crate::c_str!(stringify!($condition));
> +            static CONDITION: &'static $crate::str::CStr =
> +                $crate::c_str_avoid_literals!(stringify!($condition));
>  
>              // SAFETY: FFI call without safety requirements.
>              let kunit_test = unsafe { $crate::bindings::kunit_get_current_test() };
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 9e410de3c3a3..5fb9b0e1c9b1 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -780,7 +780,6 @@ const fn as_int(&self) -> u32 {
>  ///
>  /// ```
>  /// # mod module_phy_driver_sample {
> -/// use kernel::c_str;
>  /// use kernel::net::phy::{self, DeviceId};
>  /// use kernel::prelude::*;
>  ///
> @@ -799,7 +798,7 @@ const fn as_int(&self) -> u32 {
>  ///
>  /// #[vtable]
>  /// impl phy::Driver for PhySample {
> -///     const NAME: &'static CStr = c_str!("PhySample");
> +///     const NAME: &'static CStr = c"PhySample";
>  ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
>  /// }
>  /// # }
> @@ -808,7 +807,6 @@ const fn as_int(&self) -> u32 {
>  /// This expands to the following code:
>  ///
>  /// ```ignore
> -/// use kernel::c_str;
>  /// use kernel::net::phy::{self, DeviceId};
>  /// use kernel::prelude::*;
>  ///
> @@ -828,7 +826,7 @@ const fn as_int(&self) -> u32 {
>  ///
>  /// #[vtable]
>  /// impl phy::Driver for PhySample {
> -///     const NAME: &'static CStr = c_str!("PhySample");
> +///     const NAME: &'static CStr = c"PhySample";
>  ///     const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x00000001);
>  /// }
>  ///
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 2b63cfaaa981..20d852aa8b3c 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -190,14 +190,13 @@ pub trait CStrExt {
>      /// # Examples
>      ///
>      /// ```
> -    /// # use kernel::c_str;
>      /// # use kernel::fmt;
>      /// # use kernel::str::CString;
> -    /// let penguin = c_str!("🐧");
> +    /// let penguin = c"🐧";
>      /// let s = CString::try_from_fmt(fmt!("{}", penguin.display()))?;
>      /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
>      ///
> -    /// let ascii = c_str!("so \"cool\"");
> +    /// let ascii = c"so \"cool\"";
>      /// let s = CString::try_from_fmt(fmt!("{}", ascii.display()))?;
>      /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
>      /// # Ok::<(), kernel::error::Error>(())
> @@ -250,25 +249,37 @@ pub const fn as_char_ptr(c_str: &CStr) -> *const crate::ffi::c_char {
>      c_str.as_ptr().cast()
>  }
>  
> -/// Creates a new [`CStr`] from a string literal.
> +/// Creates a static C string wrapper at compile time.
>  ///
> -/// The string literal should not contain any `NUL` bytes.
> +/// Rust supports C string literals since Rust 1.77, and they should be used instead of this macro
> +/// where possible. This macro exists to allow static *non-literal* C strings to be created at
> +/// compile time. This is most often used in other macros.
> +///
> +/// # Panics
> +///
> +/// This macro panics if the operand contains an interior `NUL` byte.
>  ///
>  /// # Examples
>  ///
>  /// ```
> -/// # use kernel::c_str;
> +/// # use kernel::c_str_avoid_literals;
>  /// # use kernel::str::CStr;
> -/// const MY_CSTR: &CStr = c_str!("My awesome CStr!");
> +/// const MY_CSTR: &CStr = c_str_avoid_literals!(concat!(file!(), ":", line!(), ": My CStr!"));
>  /// ```
>  #[macro_export]
> -macro_rules! c_str {
> +macro_rules! c_str_avoid_literals {
> +    // NB: we could write `($str:lit) => compile_error!("use a C string literal instead");` here but
> +    // that would trigger when the literal is at the top of several macro expansions. That would be
> +    // too limiting to macro authors, so we rely on the name as a hint instead.
>      ($str:expr) => {{
> -        const S: &str = concat!($str, "\0");
> -        const C: &$crate::str::CStr = match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
> -            Ok(v) => v,
> -            Err(_) => panic!("string contains interior NUL"),
> -        };
> +        const S: &'static str = concat!($str, "\0");
> +        const C: &'static $crate::str::CStr =
> +            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {
> +                Ok(v) => v,
> +                Err(core::ffi::FromBytesWithNulError { .. }) => {
> +                    panic!("string contains interior NUL")
> +                }
> +            };
>          C
>      }};
>  }
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 1eab7ebf25fd..ec7f80a924c3 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -61,9 +61,9 @@ macro_rules! static_lock_class {
>  #[macro_export]
>  macro_rules! optional_name {
>      () => {
> -        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
> +        $crate::c_str_avoid_literals!(::core::concat!(::core::file!(), ":", ::core::line!()))
>      };
>      ($name:literal) => {
> -        $crate::c_str!($name)
> +        $crate::c_str_avoid_literals!($name)
>      };
>  }
> diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
> index 4c4d60a51c1f..732dde45024b 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -266,7 +266,8 @@ macro_rules! global_lock {
>          $pub enum $name {}
>  
>          impl $crate::sync::lock::GlobalLockBackend for $name {
> -            const NAME: &'static $crate::str::CStr = $crate::c_str!(::core::stringify!($name));
> +            const NAME: &'static $crate::str::CStr =
> +                $crate::c_str_avoid_literals!(::core::stringify!($name));
>              type Item = $valuety;
>              type Backend = $crate::global_lock_inner!(backend $kind);
>  
> 

