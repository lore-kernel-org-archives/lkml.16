Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2362E2656;
	Tue, 17 Jun 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168854; cv=none; b=RN4MhKznv5ebmNXO48//5YuaVNmCHeHRy2RQmd0VtvA1VfddjHqZrC9a5E3xdreEUIcmUwBHjaCIHJeWK2Lwe3dlDTsLS00RE+p0F2tMTtfF8++WwW7t2Z1FG+s4/oIrx+BJ+fiuvr8GbdAKDA6cuejU4Gt92sWFE78NXTzQ7N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168854; c=relaxed/simple;
	bh=62JsnR3UZJQkjbzRgtU9Ra9PTcWAY+26XLsS4IaQ7ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dB/FZyLgwjcYNSSpPZ0k0ngJcqMaf/ANIr1zo7LyH9kmaiNlSTVrpBNOFMkaS7y8yzYKZk0eJ60OwHLUaRKGPEiF8id6YQW2mITRZxT86iB7aRTqR58wPeLNCG23e61OmhJ7S2dbcN0aUzyG0Gu8bEwYq7Yjx5ufY7DBlI0H8SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt0IueQg; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt0IueQg"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40a4de175a3so3856539b6e.0;
        Tue, 17 Jun 2025 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750168852; x=1750773652; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XyBeuJ9WEWgL/1r1YnWJi46KzhzVrXvRrVr7KluAbq0=;
        b=Vt0IueQgY1W/XkLR1UNmc2J8hGLYMxOmdCCavif0oPR65IKrcJGSXTvKpXXL89Tw0S
         dmLJsKVWTrlvkTTCUZZip938EqdUMT5vG83lyhrU/oa5hT8AIGiWO6kU7Wf/jGq/HDLR
         ++vm3NF7waxpkTIBBNec61Hr+OOpfcFWAPCyteyqyAEm/2lA9KfIUv6RACENjq9c36sA
         pQ15ayT+avGs00vyzLbCgojCkgSfjgmYMt0BBFXP8SazZB7ClpIVdj6SdM3I/8zWhWNM
         BDyUP5+1HnxqVMBP5OPEc03br6Kz7hDg6IxCVtifIj02azey7V9P/fySXaTcZDq19mwC
         eQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168852; x=1750773652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyBeuJ9WEWgL/1r1YnWJi46KzhzVrXvRrVr7KluAbq0=;
        b=fCVBilTIYoQl6cXsyIQGtgzF6E7HMRm3QNp+vOrrjKdJkaeFTtNR0359yvSETuyory
         1mN/EujuDu1/5TmlddDy5iT08WECjAAYUUPIeYZbzNeS/pKhvSa+Jh8WgT2QLOxMhqk3
         BYZQw00ta63wL0N1U2+R3WEc2mzPZUwiNsYVmWRuv+DQ+TbWctXndJelpkLalWC/COIB
         F+Uux3LCRmgFATKvelXs/AK5PtR/LYrurZhQ9swqB9G0vmjZPkipEOmmCKmSM80GLsgJ
         JcJpPIk9v8WzybH/xyamGNyFBf2jcYgcnQzXcxXdIAZ/+vM2lN2FOa8z4Q3PEvoDU3q5
         tdIw==
X-Forwarded-Encrypted: i=1; AJvYcCXRXPCzLnnFi0w4PYqoMKbF8XmTJIotpk08UNdfXtZo32q1AcUOEMuYiP3tB2vjzL8HBZbMJCxGoTSBZfU=@vger.kernel.org, AJvYcCXrYK6SKl6i0MO6xZEOeowZw4R0NqUvuTLioLQXzsSGKWWZ4nzNneo5TmmzecEBD61MCrnT7oaUlvBDTEDX0wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDuxTnTWIKDPxFBfsO7MdCaKeAwoeit3HgoHE4kJrhQSGuF+hC
	aRfiwvikaLDP9p4UCLAdX8RdtoHYZOq/m8CeTg9kTlsRcAR/9fA9iY/wpf3tmA==
X-Gm-Gg: ASbGncs4C/5wsm1425xI7w1F4vTYQ3J6ORbsFhwbylG5x6F0Gnl9hDwfG3q2uejFSoJ
	EfZHeQkGVD2QJYw0d8V3OAo8OzZqSahIA7YhicL2uhXmfz9Wjh24NJ4DmurFKB2gTBoAcvxoLKz
	T0CczipAEpOiuJh0IGxF6s63NY8PQa2TyF6utR/+LBY77xTiMYIJY3+3dBJNq21OY5bntsqn6Hr
	Sm3msCGT3bW5CzBZtfRKXg9uNRXwEXuYDrHk/9SHq7HdtPdX5G1FX/MreVZwcvK2Mc4usBPuIPb
	Qbi9XCXI2IIT4XhwtdK1e2/qWWvVB+XhQzq7oC/0ZBGD42JeLJYUUea2bw6CcFo0Qrh1ZJ1xQ4+
	X/DTEtpL99rTG7+dk0k0Q0qtl7qab1QcFtnG0aZW5ZPIbDZRsIoA8
X-Google-Smtp-Source: AGHT+IEc3RYlTOUaeRrynwjncEtoUrpqtfHETCob8pEIir/VbS6KPkJ6ha8anz2Wq/45Wipg6oodpg==
X-Received: by 2002:a05:6214:d4c:b0:6fa:bb26:1459 with SMTP id 6a1803df08f44-6fb47725ed0mr272770456d6.7.1750168836544;
        Tue, 17 Jun 2025 07:00:36 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb5590d105sm23429786d6.28.2025.06.17.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:00:36 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 667801200069;
	Tue, 17 Jun 2025 10:00:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 17 Jun 2025 10:00:35 -0400
X-ME-Sender: <xms:A3VRaPc0ad-WavileZK_ccjLCoTzJgWGpWVoZNMZdabswjna5pYX2g>
    <xme:A3VRaFOTC_McCjXM6-wZjW19Jpp5oVIUyLj613CyUIUSP9OIMxpbkCKOQrSkxf-SM
    BrzjjoBCkZ0HnM1YQ>
X-ME-Received: <xmr:A3VRaIikLqSqmMY8waeUbCMHiuADQLlf-sSFer4B0paBxgy_u5HVxCYDoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleeg
    jeelvdffteeihfelfeehvdegkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epfhhujhhithgrrdhtohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehm
    ihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgig
    rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihgh
    huohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvg
X-ME-Proxy: <xmx:A3VRaA-q8bHS8xWAn55Y39avJNowqK0qE7E0mCc_PcYZFUltedylWg>
    <xmx:A3VRaLumxua5c7xH1kY7DXOlZe0tWV3zxkN0kfKA2gzYwTwEg1BqKg>
    <xmx:A3VRaPGbqxuVT7oWOitU1B2vrxRkGXRPXiyc1gqL9x40FLOW9lcieg>
    <xmx:A3VRaCN99SgIAqP02mgyLo-QddbFB60jtNGNHy2PGWgsJXU2bhKAgw>
    <xmx:A3VRaMOG6L0apZ1l84lo6FMnZHQMl6m9PI_9UpphjJAsFkvnZAoYvFfI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 10:00:34 -0400 (EDT)
Date: Tue, 17 Jun 2025 07:00:33 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, pmladek@suse.com, mingo@kernel.org
Subject: Re: [PATCH v3 2/2] rust: task: Add Rust version of might_sleep()
Message-ID: <aFF1AdgffZB8j0M1@Mac.home>
References: <CANiq72mES+dPBuhsdh0-hJcV69AO74j6W5vhCeo+yV5S-Zp+yg@mail.gmail.com>
 <20250617.120453.1403624234989149033.fujita.tomonori@gmail.com>
 <CANiq72kB4hxsyi9D-PV0YDc9KEgfC9iYCTJVEOosZv3fg1+mYA@mail.gmail.com>
 <20250617.214207.1883960660906763456.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617.214207.1883960660906763456.fujita.tomonori@gmail.com>

On Tue, Jun 17, 2025 at 09:42:07PM +0900, FUJITA Tomonori wrote:
> On Tue, 17 Jun 2025 10:02:22 +0200
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> 
> > On Tue, Jun 17, 2025 at 5:05 AM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >>
> >> How about adding a link to the header file where the might_sleep macro
> >> is defined, like this?
> > 
> > Sounds good to me. Though, for APIs that have rendered docs, we
> > typically point to those instead:
> > 
> >     https://docs.kernel.org/driver-api/basics.html#c.might_sleep
> 
> Ah, somehow, I overlooked that. Thanks!
> 
> Boqun, here is the revised version.
> 

Thanks, applied. Although I kept the parentheses because might_sleep()
is a C macro, in the same spirit of [1].

[1]: https://docs.kernel.org/process/maintainer-tip.html#function-references-in-changelogs

Regards,
Boqun

> diff --git a/rust/helpers/task.c b/rust/helpers/task.c
> index 31c33ea2dce6..2c85bbc2727e 100644
> --- a/rust/helpers/task.c
> +++ b/rust/helpers/task.c
> @@ -1,7 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +#include <linux/kernel.h>
>  #include <linux/sched/task.h>
>  
> +void rust_helper_might_resched(void)
> +{
> +	might_resched();
> +}
> +
>  struct task_struct *rust_helper_get_current(void)
>  {
>  	return current;
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 834368313088..b79d19deb02e 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -400,3 +400,27 @@ fn eq(&self, other: &Kuid) -> bool {
>  }
>  
>  impl Eq for Kuid {}
> +
> +/// Annotation for functions that can sleep.
> +///
> +/// Equivalent to the C side [`might_sleep`] macro, this function serves as
> +/// a debugging aid and a potential scheduling point.
> +///
> +/// This function can only be used in a nonatomic context.
> +///
> +/// [`might_sleep`]: https://docs.kernel.org/driver-api/basics.html#c.might_sleep
> +#[track_caller]
> +#[inline]
> +pub fn might_sleep() {
> +    #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
> +    {
> +        let loc = core::panic::Location::caller();
> +        let file = kernel::file_from_location(loc);
> +
> +        // SAFETY: `file.as_ptr()` is valid for reading and guaranteed to be nul-terminated.
> +        unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as i32) }
> +    }
> +
> +    // SAFETY: Always safe to call.
> +    unsafe { crate::bindings::might_resched() }
> +}
