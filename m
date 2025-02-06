Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332C4C8E;
	Thu,  6 Feb 2025 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861992; cv=none; b=CJY0iRcrbAB4gwh8xPlhVogAj5WKnrgjxqwLp3wenG5X1XzZargFKpYOh6vgLlSR74JBNnxlnVrPKGWsIDd1NA6PhO5QwO5HtMrs22ptTjGEgH0tbUWM1ngB0ZdUhdjydRtM4nlK6vH9QUvT1w72/3F9Pt1ddXeHS04sz0jXfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861992; c=relaxed/simple;
	bh=EPkk5KNCoFHlGRf4d/0WMlCGL0KNbPINAbxBqgvQbsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQ9tPZBVgMxmCp3x3X6VVffLo88kW2sH8KH5xvvr+NINrBqyPO4eIjjrSqvVJR7AgC93sHFx1/KY2V8nYLMGiG+ggn2wmQTZjnLNTOgJMQCmnD4E5ED1fNscOcE3P951pBmYjyJmzeCLp4sywLIEx/ePqhgx/QHz/iWEKrYSuCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDDu6iQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDDu6iQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3A0C4CEE2;
	Thu,  6 Feb 2025 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738861989;
	bh=EPkk5KNCoFHlGRf4d/0WMlCGL0KNbPINAbxBqgvQbsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDDu6iQpU3RyLJVY5LOfQNzXj0jjmuYKBI2eGncAmO8V7WYcxf3IBIGSs46EYZBzH
	 dtuJgzqTxiwORUam6wG7nW5rgwdHl5McnL1Umw/yFX7ZRgWJyf9Pn+jzJJYXN8JUy5
	 2oacL3henR9/vfYpAzDqEc6r6sDqrvaj45pSXJHn4nG5nfAOSgHkLWTr0W6/vP/mjZ
	 LDMdK6LOm318NTnXvuM6K5EjbCXxhMmZZ3ira/ER+A50qEgCT1xbzdYFFeNR+XAL4b
	 SyZ2k07nXAMcW2uTcV76bOjACfDW1royl3OcDinZ3Yyzx5lVLv0lS75+5h6jjP/Xjt
	 4qh9gZXhfWnFw==
Date: Thu, 6 Feb 2025 18:13:03 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: =?utf-8?B?5bSU5YWJ5Y2a?= <2407018371@qq.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, daniel.almeida@collabora.com,
	a.hindborg@kernel.org, alex.gaynor@gmail.com,
	benno.lossin@proton.me, bjorn3_gh@protonmail.mco,
	boqun.feng@gmail.com, boris.brezillon@collabora.com,
	gary@garyguo.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, ojeda@kernel.org, rafael@kernel.org,
	robh@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
Message-ID: <Z6Ttn83DQ_8asHXl@cassiopeiae>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
 <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
 <tencent_9719A47A97C91AAD7453E64CE987EDABD608@qq.com>
 <CANiq72mS-AgdAva4mB=FWf5dh3vZg95Ka7Wv36ypoZXChuwk=A@mail.gmail.com>
 <tencent_E1DC219DB45DC03A8454E2124D238DCEC705@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_E1DC219DB45DC03A8454E2124D238DCEC705@qq.com>

On Fri, Feb 07, 2025 at 12:40:14AM +0800, 崔光博 wrote:
> 
> 
> > 2025年2月7日 00:11，Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> 写道：
> > 
> > On Thu, Feb 6, 2025 at 4:59 PM Guangbo Cui <2407018371@qq.com> wrote:
> >> 
> >> With CONFIG_RUST_BUILD_ASSERT_ALLOW=y enabled, this compilation succeeds.
> > 
> > Yes, that is expected too (but note that the config option is there
> > just in case -- it should not happen that it is needed in normal
> > builds).
> > 
> >> Even if the size is determined at compile time, the compilation will still fail
> >> if CONFIG_RUST_BUILD_ASSERT_ALLOW is not enabled.
> > 
> > Yes, that is expected -- the idea is that you cannot make the mistake
> > of calling those.
> > 
> > I think you are suggesting only exposing the methods in the case where
> > calling them would work? That would be great if a design allows for
> > it, of course.
> 
> Yes, if the methods could not work, we should not expose them.
> 
> > By the way, Daniel, in patch 3/3 there is this comment:
> > 
> > +    ///     // Unlike `ioremap_resource_sized`, here the size of the
> > memory region
> > +    ///     // is not known at compile time, so only the `try_read*`
> > and `try_write*`
> > +    ///     // family of functions are exposed, leading to runtime
> > checks on every
> > +    ///     // access.
> > 
> > Is the "only ... are exposed" correct? i.e. are they exposed? / is
> > this potentially confusing?
> 
> They are exposed. If size is not known at compile time, calling the `read`
> and `write` will never compile failed. Example:

That's two different things here. Miguel questions whether the comment is
correct. And I think it's not, they are indeed exposed.

> 
> ```C
> let raw_io: IoRaw<0> = IoRaw::new(0, 8)?;
> let io = unsafe { Io::from_raw(&raw_io) };
> io.writeb(0xff, 0xffff);
> ```
> If I make any mistakes, please correct me. Thanks!

This behavior is on purpose.

IoRaw::new() is equivalent to IoRaw::<0>::new(), which means that you set the
compile time validated size of the I/O region to zero.

Hence, calling writeb() fails, because every operation exeeds the boundary of
zero.

In your case the runtime boundary is 8, hence the following calls do succeed.

try_readb(0);
try_readb(7);

Whereas the following would fail on runtime.

try_readb(8);

> 
> Best regards,
> Guangbo Cui
> 
