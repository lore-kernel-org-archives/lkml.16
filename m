Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F601F416F;
	Thu,  6 Feb 2025 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857913; cv=none; b=ns1ee8jn4Cf0vmj8p6SX8+7cM1AeYYgpCj5/QAffEDtB6zxptCfrpKWwfSTJFNhz4V/rZBU2aaOQb0lmgm/EESwjcYo8OL703SB1CDKMsJBgRVwAkXudvHpJESn0zGL0p87OJgSUkxH0iyxsLL6cJ/5yeyKTCxIDRTvlEqaXh+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857913; c=relaxed/simple;
	bh=kLiN6Ca6XHLciZHLp5Q2tKjJWfjJen/+oon350gMGIw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIniOkL/fMDXEwNUdwf3SNxErA4Mvp68aPFNwG5sSisPi/JuF7CwibaV1dpwuwAWCVqlZr75DU6FtsWXYwkBQJGRZhD1bO6X7p3hwtrKwdhN5ylYIpYXPsp7fC5+d+dv07ia2bwQnUDZ28H9OS29SpxeZysXJAagPO7biFSDF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=qGw/MrCH; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="qGw/MrCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738857904; bh=KM+l6VZ31VZd27QcCzdyuLEj+PAZZGjr1wNlk0QZUmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qGw/MrCH4oyEec938A3vjCL3Acgxi1jK7Mdq/r2qiodM3CJsGuaFwWMqmj0KTuLeg
	 hFlzGNJO62PTexHv3LqJpG9T+LScBtyG/cUwysAH90W2EPPJd0Vfhe8O09C80/0V6A
	 uTEoz+x+CPoDA1utp/4Id5BKwNcVRYruSVC+NSzU=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020 ([124.240.51.113])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id EB31D8C5; Thu, 06 Feb 2025 23:58:51 +0800
X-QQ-mid: xmsmtpt1738857531tf524jj7j
Message-ID: <tencent_9719A47A97C91AAD7453E64CE987EDABD608@qq.com>
X-QQ-XMAILINFO: ODStV5VJRLb1IxmS2eOJ3wxb37wfI/ZbB0sfg+8DlSmhVnkV2nTPfjXTbtN3dP
	 ajjl6SmTWHZGC5bFdC5xxJ7rrUbQ0wi1Ew6LqqeDhqSAro7vtdqY2DjdcTU7KIAYs6eE4DzsKHCt
	 hHW9nUbEXi89xETLKGslt5MYoRyzHAhtX+9JexOxtDd4hZR5bO2lntHg1s/V3DB3tfEyjVTiHkp0
	 tiH1c0eqWDR+xGAqE67sjc0SogiKzoxbEZ/7n4IM+B5HfMoFRJeSdBh/+h5rqguERqAcPqm3bUDg
	 01rRtMXaBRrP9xM+kqz5PtNOz+UGmrvCxup5hzs/lzyaGm3w7jYanr52igWcG+tIzgZt9ysIwzbX
	 97jgD+B+4aKSiCQxPChR7aWDbEdduyIl7Z5Vyf0BVPOp8GZFvZITdUKNh91J9yIruwO44LEqLVa5
	 VPRJT1k4zM1A4C2o4Qjpb7lCG93CobmzY7fIO9XChLNJZaG9HnOI61ljL7klGVYKPegHg+KLvflt
	 oI+j48mZVjvmAL0kWailk6unwDqA1O1Rs7RyYtPD73wQFPRSaw6EFJpGHq3jfKTxtvbsxhfADXBn
	 iPDUINU5OvqQwQa8yiMiCdrSZZnb8z+SOx5J9BsBtwrMk6+Jl8GEWY2hQs1XL/CL5TOjRh/eHhn9
	 dOviqcYGHOMW8WsnS/SwTXAL9xMXbwjngccnGPZ6Z2rajKV8i4CoIWhcV4HfUuu2GNYnIk75bbQ2
	 NKFROHSMH60KUvKuBwBM+/7Vq0tjP5apwo8ZJFnlST1QyolbbhPdPpGIYzVs9Rq3JE/fqnIX1S97
	 BSbzjyP65B1a6E4M8GVk2p87RPRsiVdB47DR7EeGLUQStmWnYl05t2nnw2mJ3s5ycB0rvJu+Tw5W
	 cOlaE0Gh+MS3wiefTSb8iP3stibxwmNo6Fp86bJGyVnJMvshMlJYyrRC4YUOu5O2aaBGnZXaM2dQ
	 5WRYnwd/wMC6KvNyNtuw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Date: Thu, 6 Feb 2025 23:58:51 +0800
From: Guangbo Cui <2407018371@qq.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: daniel.almeida@collabora.com, a.hindborg@kernel.org,
	alex.gaynor@gmail.com, benno.lossin@proton.me,
	bjorn3_gh@protonmail.mco, boqun.feng@gmail.com,
	boris.brezillon@collabora.com, dakr@kernel.org, gary@garyguo.net,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	ojeda@kernel.org, rafael@kernel.org, robh@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
X-OQ-MSGID: <Z6TcO0Qijma4eL52@jckeep-Lenovo-XiaoXinAir-14IIL-2020>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
 <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgi+Qf=o91XEPamjycdrGeso1yDEDOGNQRmmy-miakDaOg@mail.gmail.com>

On Thu, Feb 06, 2025 at 04:43:17PM +0100, Alice Ryhl wrote:
> On Wed, Feb 5, 2025 at 3:56 PM Guangbo Cui <2407018371@qq.com> wrote:
> >
> > > +/// A generic memory-mapped IO region.
> > > +///
> > > +/// Accesses to the underlying region is checked either at compile time, if the
> > > +/// region's size is known at that point, or at runtime otherwise.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the
> > > +/// start of the I/O memory mapped region.
> > > +pub struct IoMem<const SIZE: usize = 0> {
> > > +    io: IoRaw<SIZE>,
> > > +}
> >
> > Compile-time checks are only possible when CONFIG_RUST_BUILD_ASSERT_ALLOW=y.
> > Otherwise, using compile-time check APIs of Io will cause a modpost error
> > because the rust_build_error symbol is not exported. Details at the issue[1].
> >
> > Maybe Io should expose compile-time check APIs only when CONFIG_RUST_BUILD_ASSERT_ALLOW=y?
> > The expectation is that a build error should occur when calling `Io::readX` and
> > `Io::writeX` due to a boundary check failure, rather than because the
> > `rust_build_error` symbol is not exported.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1141 [1]
> 
> This compilation failure is correct. You're trying to use writeb even
> though the size is not known at compile time. You should use
> try_writeb instead.

With CONFIG_RUST_BUILD_ASSERT_ALLOW=y enabled, this compilation succeeds.
Even if the size is determined at compile time, the compilation will still fail
if CONFIG_RUST_BUILD_ASSERT_ALLOW is not enabled.

If I make any mistakes, please correct me. Thanks!

Best regards,
Guangbo Cui

