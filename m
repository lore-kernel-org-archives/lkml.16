Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F8219E0;
	Mon, 10 Feb 2025 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176936; cv=pass; b=FWCqv6ux4hr4s2Jt7dbbKjTDomqm7vObgzeAVnHkKG3QHxCwDZAKzJUv3YTlD5hq73c2cSYgw6j1j9QbgZBtCKo1pJKvD2GSpjKFKsjUQcmFp9MFJgV3YUXR3egTAXDouU99MaVXMq+/uj7XGUa7Ad3x8xfhvrXOZrRoyviSh9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176936; c=relaxed/simple;
	bh=zXc6Cqbdx3V0opl+9NToRRey6LkIgdMcNCEsZBKohkw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tYB/VvhdagVgEt6/m/EVwOuK4l/lzkJOUw6xXJCBEr/JnGGp6CtgLwKrRRaMWDk9uDk2FyUm6/l1h6U3gvcvFlhigL2qlXHEbu+Kon7dvj9QKQPMi5vyzL1XC339cM1HNDog6Y+l0s8VghXEZDsgr7Vx5fJGaT+wynkIcNz1Zjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WapmED43; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WapmED43"
ARC-Seal: i=1; a=rsa-sha256; t=1739176916; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=br0AfVPgKKDhdKzR5i7En7dGpZ741dDCVqKJkS8LZzuvEzUZ0p6bbGgvnwyr60y/GMsyxDuegHex+AL59AkaEo2owokRXBc/AQ2tHU2HZN/gNat0nPtZequYYWu5vclwQ+eIdToB0phd9OplcqCaXdFIfDgs/O4MbOD19d3OKxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739176916; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rEe92CgA55XF46u17KQx3HppvtWwr8GugZUuq0ab+gw=; 
	b=a09BuS6I8Mt1DCFat2SrzxzD2828DtyXzsLEbGJbsFPZlfik/NjtSN43kmTZpaaEd8ROeREJ0hkps842k1B83NiB83VXaBeI4rsjnBcsw7UhnaLi9B8eQ+tisZlUU8FgDNw/at12nxk7goioUxb5Vv1HWEYjLAfLoL6jJx68RgA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739176916;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=rEe92CgA55XF46u17KQx3HppvtWwr8GugZUuq0ab+gw=;
	b=WapmED43D1VP+nJMCUaBmIfOcvffpb35wjHHwF/kIoGFlevw0rDVcq2sSYXVx+TK
	PQDYzXQIQ2oIC6Y01mCSNVfr9KWqigaI9drsgJotLo8uht8ywIh0ug6dROSuhdKKlfB
	J+ANE03FWsFLdc23/Eh2EYHJ9iu8ZsygWivSm6fo=
Received: by mx.zohomail.com with SMTPS id 1739176891514783.969343323908;
	Mon, 10 Feb 2025 00:41:31 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250122163932.46697-1-daniel.almeida@collabora.com>
Date: Mon, 10 Feb 2025 05:41:17 -0300
Cc: rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D058ABBE-A0E8-4D95-AA4F-31EAA4092A73@collabora.com>
References: <20250122163932.46697-1-daniel.almeida@collabora.com>
To: ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 benno.lossin@proton.me,
 a.hindborg@kernel.org,
 tmgross@umich.edu
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External



> On 22 Jan 2025, at 13:39, Daniel Almeida =
<daniel.almeida@collabora.com> wrote:
>=20
> Add support for registering IRQ handlers in Rust.
>=20
> IRQ handlers are extensively used in drivers when some peripheral =
wants to
> obtain the CPU attention. Registering a handler will make the system =
invoke the
> passed-in function whenever the chosen IRQ line is triggered.
>=20
> Both regular and threaded IRQ handlers are supported through a Handler =
(or
> ThreadedHandler) trait that is meant to be implemented by a type that:
>=20
> a) provides a function to be run by the system when the IRQ fires and,
>=20
> b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
>=20
> The requirement that T is Sync derives from the fact that handlers =
might run
> concurrently with other processes executing the same driver, creating =
the
> potential for data races.
>=20
> Ideally, some interior mutability must be in place if T is to be =
mutated. This
> should usually be done through the in-flight SpinLockIrq type.
>=20
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>=20
> Changes from v1:
>=20
> - Added Co-developed-by tag to account for the work that Alice did in =
order to
> figure out how to do this without Opaque<T> (Thanks!)
> - Removed Opaque<T> in favor of plain T
> - Fixed the examples
> - Made sure that the invariants sections are the last entry in the =
docs
> - Switched to slot.cast() where applicable,
> - Mentioned in the safety comments that we require that T: Sync,
> - Removed ThreadedFnReturn in favor of IrqReturn,
> - Improved the commit message
>=20
> Link to v1: =
https://lore.kernel.org/rust-for-linux/20241024-topic-panthor-rs-request_i=
rq-v1-1-7cbc51c182ca@collabora.com/
>=20
>=20
> ---
> rust/bindings/bindings_helper.h |   1 +
> rust/helpers/helpers.c          |   1 +
> rust/helpers/irq.c              |   9 +
> rust/kernel/irq.rs              |   6 +
> rust/kernel/irq/request.rs      | 517 ++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs              |   1 +
> 6 files changed, 535 insertions(+)
> create mode 100644 rust/helpers/irq.c
> create mode 100644 rust/kernel/irq.rs
> create mode 100644 rust/kernel/irq/request.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 5c4dfe22f41a..0331c6273def 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -15,6 +15,7 @@
> #include <linux/ethtool.h>
> #include <linux/file.h>
> #include <linux/firmware.h>
> +#include <linux/interrupt.h>
> #include <linux/fs.h>
> #include <linux/jiffies.h>
> #include <linux/jump_label.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index dcf827a61b52..bfc499d7f4c1 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -13,6 +13,7 @@
> #include "build_bug.c"
> #include "cred.c"
> #include "err.c"
> +#include "irq.c"
> #include "fs.c"
> #include "jump_label.c"
> #include "kunit.c"
> diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
> new file mode 100644
> index 000000000000..1faca428e2c0
> --- /dev/null
> +++ b/rust/helpers/irq.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/interrupt.h>
> +
> +int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
> +    unsigned long flags, const char *name, void *dev)
> +{
> + return request_irq(irq, handler, flags, name, dev);
> +}
> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
> new file mode 100644
> index 000000000000..3ab83c5bdb83
> --- /dev/null
> +++ b/rust/kernel/irq.rs
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! IRQ abstractions
> +
> +/// IRQ allocation and handling
> +pub mod request;
> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> new file mode 100644
> index 000000000000..61e7d4a8f555
> --- /dev/null
> +++ b/rust/kernel/irq/request.rs
> @@ -0,0 +1,517 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
> +
> +//! IRQ allocation and handling
> +
> +use core::marker::PhantomPinned;
> +use core::ptr::addr_of_mut;
> +
> +use init::pin_init_from_closure;
> +
> +use crate::error::to_result;
> +use crate::prelude::*;
> +use crate::str::CStr;
> +
> +/// Flags to be used when registering IRQ handlers.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`flags`] module.
> +#[derive(Clone, Copy)]
> +pub struct Flags(u64);
> +
> +impl core::ops::BitOr for Flags {
> +    type Output =3D Self;
> +    fn bitor(self, rhs: Self) -> Self::Output {
> +        Self(self.0 | rhs.0)
> +    }
> +}
> +
> +impl core::ops::BitAnd for Flags {
> +    type Output =3D Self;
> +    fn bitand(self, rhs: Self) -> Self::Output {
> +        Self(self.0 & rhs.0)
> +    }
> +}
> +
> +impl core::ops::Not for Flags {
> +    type Output =3D Self;
> +    fn not(self) -> Self::Output {
> +        Self(!self.0)
> +    }
> +}
> +
> +/// The flags that can be used when registering an IRQ handler.
> +pub mod flags {
> +    use super::Flags;
> +
> +    use crate::bindings;
> +
> +    /// Use the interrupt line as already configured.
> +    pub const TRIGGER_NONE: Flags =3D =
Flags(bindings::IRQF_TRIGGER_NONE as _);
> +
> +    /// The interrupt is triggered when the signal goes from low to =
high.
> +    pub const TRIGGER_RISING: Flags =3D =
Flags(bindings::IRQF_TRIGGER_RISING as _);
> +
> +    /// The interrupt is triggered when the signal goes from high to =
low.
> +    pub const TRIGGER_FALLING: Flags =3D =
Flags(bindings::IRQF_TRIGGER_FALLING as _);
> +
> +    /// The interrupt is triggered while the signal is held high.
> +    pub const TRIGGER_HIGH: Flags =3D =
Flags(bindings::IRQF_TRIGGER_HIGH as _);
> +
> +    /// The interrupt is triggered while the signal is held low.
> +    pub const TRIGGER_LOW: Flags =3D Flags(bindings::IRQF_TRIGGER_LOW =
as _);
> +
> +    /// Allow sharing the irq among several devices.
> +    pub const SHARED: Flags =3D Flags(bindings::IRQF_SHARED as _);
> +
> +    /// Set by callers when they expect sharing mismatches to occur.
> +    pub const PROBE_SHARED: Flags =3D =
Flags(bindings::IRQF_PROBE_SHARED as _);
> +
> +    /// Flag to mark this interrupt as timer interrupt.
> +    pub const TIMER: Flags =3D Flags(bindings::IRQF_TIMER as _);
> +
> +    /// Interrupt is per cpu.
> +    pub const PERCPU: Flags =3D Flags(bindings::IRQF_PERCPU as _);
> +
> +    /// Flag to exclude this interrupt from irq balancing.
> +    pub const NOBALANCING: Flags =3D Flags(bindings::IRQF_NOBALANCING =
as _);
> +
> +    /// Interrupt is used for polling (only the interrupt that is =
registered
> +    /// first in a shared interrupt is considered for performance =
reasons).
> +    pub const IRQPOLL: Flags =3D Flags(bindings::IRQF_IRQPOLL as _);
> +
> +    /// Interrupt is not reenabled after the hardirq handler =
finished. Used by
> +    /// threaded interrupts which need to keep the irq line disabled =
until the
> +    /// threaded handler has been run.
> +    pub const ONESHOT: Flags =3D Flags(bindings::IRQF_ONESHOT as _);
> +
> +    /// Do not disable this IRQ during suspend. Does not guarantee =
that this
> +    /// interrupt will wake the system from a suspended state.
> +    pub const NO_SUSPEND: Flags =3D Flags(bindings::IRQF_NO_SUSPEND =
as _);
> +
> +    /// Force enable it on resume even if [`NO_SUSPEND`] is set.
> +    pub const FORCE_RESUME: Flags =3D =
Flags(bindings::IRQF_FORCE_RESUME as _);
> +
> +    /// Interrupt cannot be threaded.
> +    pub const NO_THREAD: Flags =3D Flags(bindings::IRQF_NO_THREAD as =
_);
> +
> +    /// Resume IRQ early during syscore instead of at device resume =
time.
> +    pub const EARLY_RESUME: Flags =3D =
Flags(bindings::IRQF_EARLY_RESUME as _);
> +
> +    /// If the IRQ is shared with a NO_SUSPEND user, execute this =
interrupt
> +    /// handler after suspending interrupts. For system wakeup =
devices users
> +    /// need to implement wakeup detection in their interrupt =
handlers.
> +    pub const COND_SUSPEND: Flags =3D =
Flags(bindings::IRQF_COND_SUSPEND as _);
> +
> +    /// Don't enable IRQ or NMI automatically when users request it. =
Users will
> +    /// enable it explicitly by `enable_irq` or `enable_nmi` later.
> +    pub const NO_AUTOEN: Flags =3D Flags(bindings::IRQF_NO_AUTOEN as =
_);
> +
> +    /// Exclude from runnaway detection for IPI and similar handlers, =
depends on
> +    /// `PERCPU`.
> +    pub const NO_DEBUG: Flags =3D Flags(bindings::IRQF_NO_DEBUG as =
_);
> +}
> +
> +/// The value that can be returned from an IrqHandler or a =
ThreadedIrqHandler.
> +pub enum IrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None =3D bindings::irqreturn_IRQ_NONE as _,
> +
> +    /// The interrupt was handled by this device.
> +    Handled =3D bindings::irqreturn_IRQ_HANDLED as _,
> +}
> +
> +/// Callbacks for an IRQ handler.
> +pub trait Handler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed =
in IRQ
> +    /// context.
> +    fn handle_irq(&self) -> IrqReturn;
> +}
> +
> +/// A registration of an IRQ handler for a given IRQ line.
> +///
> +/// # Examples
> +///
> +/// The following is an example of using `Registration`:
> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::irq::request::flags;
> +/// use kernel::irq::request::Registration;

By the way, I wonder if a re-export would be beneficial? I find it a bit =
tedious to specify this path.

It also clashes with kernel::driver::Registration and =
kernel::driver::drm::Registration, so I find myself
continuously writing an alias for it, i.e.:

```
Use kernel::irq::request::Registration as IrqRegistration;
Use kernel::irq::request::Handler as IrqHandler;
```

Looking at mq.rs <http://mq.rs/>, I see Andreas did something similar:

```
pub use operations::Operations;
pub use request::Request;
pub use tag_set::TagSet;
```

Asking for opinions here since this is a bit cosmetic in nature. IMHO, =
at least the =E2=80=98request=E2=80=99 part of the path has to go.

=E2=80=94 Daniel


