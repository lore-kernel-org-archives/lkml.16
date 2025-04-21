Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A627463;
	Mon, 21 Apr 2025 19:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263401; cv=none; b=BXrfLxiINzlQdKwvi/VDV7/oRM8pgLGIqWoVlx2uWCy7W5YU640HQGdEKRDUv+lTvOe+32ED9v+0E+LbfLiKHs+njSStCE7bjt9166TaK1B65lqdv9JnQiKXL0OIaRemS0wKqxym9LU51+kZz1jUerrmwMkDD1qQiHKDbYJfK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263401; c=relaxed/simple;
	bh=lRtqpbgHDCcp7nOVkDB14FmG/BylPuXxfyBVpaldHYc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBQEwbAtvoSxRkCXAgh1kjRSDV6jLkmpjsvZ5ItauAYUhz82qxy3Sy/i7efOjMAqKkTTEv0PX9/S72hKdC+D1dPgncFKlU0/A6zU8WDH+ZrvvBpRQSMEp4x0J+RxzI7JztQEUbkdwtHdejuZYk0RhuQDeynPj+n6f6MaGGz7ITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gdhgxOuK; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gdhgxOuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745263395; x=1745522595;
	bh=DjpmfT1yjVDcix0Uh58qbaeXSbJGdS4oo2QAuVftPgw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gdhgxOuKfG8QgvK/a6K2Wh+xyK6cl/BFM/WtpG3uUcBthL0Lx5kQdj+44rbVHZiiC
	 ZjWQV6AVet/gDIXN7UmsGvxzf6Iug2rg+8beBHn/9re6XMFjz3SzsleWrwhl6HAHlF
	 P3IpiyLBu/TCj/J6jfTy8aPSyZAYmf79EE+xp8NSxjTpJDliM6ME1qD3zA0M9g/eLI
	 ET0TusGH1Lg6UccZDLr2GFC3Znvd2ckl9fvNXP3MzdiUcX1F9H6er9YQplO0CYLTxX
	 Xdr2CQOZ49Ty/U5oZYxGGJZ9BgbH73bxa9kM6bdIi1OQoj00O6QTSQPwJjbWXjfvJI
	 npkjxLCZ6n7BA==
Date: Mon, 21 Apr 2025 19:23:09 +0000
To: Guangbo Cui <2407018371@qq.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, simona.vetter@ffwll.ch, tmgross@umich.edu
Subject: Re: [PATCH v3 3/4] rust: validate: add `Validate` trait
Message-ID: <D9CK8IQAKV4Z.2YOX7NIAGTOS4@proton.me>
In-Reply-To: <tencent_D04FE925ED0AD6F0A4C297CA1A1A74FDE608@qq.com>
References: <20250421134909.464405-4-benno.lossin@proton.me> <tencent_D04FE925ED0AD6F0A4C297CA1A1A74FDE608@qq.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 2a311428ef2e095115646c498986a4d4d0690efd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Apr 21, 2025 at 6:47 PM CEST, Guangbo Cui wrote:
> Really cool patch! I got a few thoughts below.

Thanks!

>> +    /// Validate the underlying untrusted data.
>> +    ///
>> +    /// See the [`Validate`] trait for more information.
>> +    pub fn validate_mut<'a, V: Validate<&'a mut Self>>(&'a mut self) ->=
 Result<V, V::Err> {
>> +        V::validate(&mut self.0)
>> +    }
>>  }
>
> The `validate_ref` and `validate_mut` functions should just call `V::vali=
date(self)`
> directly, since self is an Untrusted<T>, and you already implemented Vali=
dateInput for it.
> Calling `V::validate(&self.0)` would cause a type mismatch error.

Ah good catch, but the fix should be a different one. I intend to remove
the `Untrusted` wrapper in the input to `Validate::validate`, as
otherwise one would not be able to access the underlying value.

Maybe I don't need the `ValidateInput` trait after all. So the signature
of `validate{,_ref,_mut}` should ask for `V: Validate<{T, &T, &mut T}>`
instead.

---
Cheers,
Benno

