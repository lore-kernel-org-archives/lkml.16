Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587C614658D;
	Tue, 22 Apr 2025 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323645; cv=none; b=Q3EMPVCApSQSyvBffu/kx5aCyhXREGmL0m+FaY9QyIuznM3vm1s0WzTjGKP08pQKCpAj6J1Vga42f8bb1VXOrHEPrIqHtsvIaRDsLQ4n4o5p64zRFYapjm3YUT7Ej6OtaivvfIcPprWHv9TTKqsglH+d1akpdvrKswLm4NQMVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323645; c=relaxed/simple;
	bh=OBfe8Ek/fGIsqzH06Fvhs9ujpTLbbrgmmqi+5C8lSFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSHB2LV47iW5nwTlexyLYPVmUeZBrFkjyVDtKBejfsMJlrEs9JclDaSy5IdVQ3zF3Z08v3aT6ntJR4n8GxIx6EpSd/p1PNMjlTYG0zojDJ06jL41Y7WTdoptYAarFNttzGYiBt0RmvcxndcbqKgcSx6vfoyJQHkVACRW0bOCuOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WolUm2gA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WolUm2gA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB460C4CEE9;
	Tue, 22 Apr 2025 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745323644;
	bh=OBfe8Ek/fGIsqzH06Fvhs9ujpTLbbrgmmqi+5C8lSFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WolUm2gAGq8nDv4YvE6F04tDuvG1GnbnyDn84umwh1skDFc9xh4tfOlB6evHlIGc9
	 Sp/k8gkibf2f+E1b40TIwCmWunIv76a9F+mTFmINe9waw4TM+LjCwuR4pA+zvwRVgu
	 ECfavh7fMc0Egfkjyhxt5Yh6RdMq35EvSMMTSGF4ME5ap6a3M19bjOBxPjW+Qdu0kI
	 zCRysq9ZihBTHwI2ZAOarlfX2IGe1Tm/ZgljdJHJo3TV03vZjSPa82IBmCd6U1zAaa
	 6phezCpyjSETC/0Y+SILBSOtgMedJIq6zPkKpquK4A2Bz9/baN8Vspd1m3O950zn6R
	 jm5it5cvaKTVQ==
Date: Tue, 22 Apr 2025 14:07:17 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 10/16] gpu: nova-core: add basic timer device
Message-ID: <aAeGdRvlm5EVJOw3@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-10-ecd1cca23963@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-10-ecd1cca23963@nvidia.com>

On Sun, Apr 20, 2025 at 09:19:42PM +0900, Alexandre Courbot wrote:
> Add a timer that works with GPU time and provides the ability to wait on
> a condition with a specific timeout.

What can this timer do for us, what and HrTimer can't do for us?

> 
> The `Duration` Rust type is used to keep track is differences between
> timestamps ; this will be replaced by the equivalent kernel type once it
> lands.

Fine for me -- can you please add a corresponding TODO and add it to your list
of follow-up patches?

> diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..8987352f4192bc9b4b2fc0fb5f2e8e62ff27be68
> --- /dev/null
> +++ b/drivers/gpu/nova-core/timer.rs
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Nova Core Timer subdevice
> +
> +// To be removed when all code is used.
> +#![allow(dead_code)]

Please prefer 'expect'.

> +
> +use core::fmt::Display;
> +use core::ops::{Add, Sub};
> +use core::time::Duration;
> +
> +use kernel::devres::Devres;
> +use kernel::num::U64Ext;
> +use kernel::prelude::*;
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +
> +/// A timestamp with nanosecond granularity obtained from the GPU timer.
> +///
> +/// A timestamp can also be substracted to another in order to obtain a [`Duration`].
> +#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
> +pub(crate) struct Timestamp(u64);
> +
> +impl Display for Timestamp {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +        write!(f, "{}", self.0)
> +    }
> +}
> +
> +impl Add<Duration> for Timestamp {
> +    type Output = Self;
> +
> +    fn add(mut self, rhs: Duration) -> Self::Output {
> +        let mut nanos = rhs.as_nanos();
> +        while nanos > u64::MAX as u128 {
> +            self.0 = self.0.wrapping_add(nanos as u64);
> +            nanos -= u64::MAX as u128;
> +        }
> +
> +        Timestamp(self.0.wrapping_add(nanos as u64))
> +    }
> +}
> +
> +impl Sub for Timestamp {
> +    type Output = Duration;
> +
> +    fn sub(self, rhs: Self) -> Self::Output {
> +        Duration::from_nanos(self.0.wrapping_sub(rhs.0))
> +    }
> +}
> +
> +pub(crate) struct Timer {}
> +
> +impl Timer {
> +    pub(crate) fn new() -> Self {
> +        Self {}
> +    }
> +
> +    /// Read the current timer timestamp.
> +    pub(crate) fn read(&self, bar: &Bar0) -> Timestamp {
> +        loop {
> +            let hi = regs::PtimerTime1::read(bar);
> +            let lo = regs::PtimerTime0::read(bar);
> +
> +            if hi.hi() == regs::PtimerTime1::read(bar).hi() {
> +                return Timestamp(u64::from_u32s(hi.hi(), lo.lo()));
> +            }

So, if hi did not change since we've read both hi and lo, we can trust both
values. Probably worth to add a brief comment.

Additionally, we may want to add that if we get unlucky, it takes around 4s to
get unlucky again, even though that's rather obvious.

> +        }
> +    }
> +
> +    #[allow(dead_code)]
> +    pub(crate) fn time(bar: &Bar0, time: u64) {
> +        regs::PtimerTime1::default()
> +            .set_hi(time.upper_32_bits())
> +            .write(bar);
> +        regs::PtimerTime0::default()
> +            .set_lo(time.lower_32_bits())
> +            .write(bar);
> +    }
> +
> +    /// Wait until `cond` is true or `timeout` elapsed, based on GPU time.
> +    ///
> +    /// When `cond` evaluates to `Some`, its return value is returned.
> +    ///
> +    /// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
> +    /// `Some`, or if the timer device is stuck for some reason.
> +    pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(
> +        &self,
> +        bar: &Devres<Bar0>,
> +        timeout: Duration,
> +        cond: F,
> +    ) -> Result<R> {
> +        // Number of consecutive time reads after which we consider the timer frozen if it hasn't
> +        // moved forward.
> +        const MAX_STALLED_READS: usize = 16;

Huh! Can't we trust the timer hardware? Probably one reason more to use HrTimer?

> +
> +        let (mut cur_time, mut prev_time, deadline) = {
> +            let cur_time = with_bar!(bar, |b| self.read(b))?;
> +            let deadline = cur_time + timeout;
> +
> +            (cur_time, cur_time, deadline)
> +        };
> +        let mut num_reads = 0;
> +
> +        loop {
> +            if let Some(ret) = cond() {
> +                return Ok(ret);
> +            }
> +
> +            (|| {
> +                cur_time = with_bar!(bar, |b| self.read(b))?;
> +
> +                /* Check if the timer is frozen for some reason. */
> +                if cur_time == prev_time {
> +                    if num_reads >= MAX_STALLED_READS {
> +                        return Err(ETIMEDOUT);
> +                    }
> +                    num_reads += 1;
> +                } else {
> +                    if cur_time >= deadline {
> +                        return Err(ETIMEDOUT);
> +                    }
> +
> +                    num_reads = 0;
> +                    prev_time = cur_time;
> +                }
> +
> +                Ok(())
> +            })()?;
> +        }
> +    }
> +}
> 
> -- 
> 2.49.0
> 
