Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3DF1DFF7;
	Thu, 12 Jun 2025 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726302; cv=none; b=nT1StKAtRkVQYXCOVDxN1ULgV8lNQLNdmjahwzcxvbI3hCfqqE4p0WDT71GZgsD85d6eCmsP9o6LyXoMhnliWBGWxl89f3sVeAj+PmA/Y6M8wwvFhEk6NrMzGa/gUXM2hIq44ISzGtrneNJJBUbbXeRsy7Ndp25J81IxUp9+aHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726302; c=relaxed/simple;
	bh=eXoLEBB4A9ByaFX9yQ0XrvCbOgSUF3Op1uZxPdXKPVk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nz7go9MGQ+Flv+8SuYNWG8Qo+CwTJYtBe+F9XRoUYegHhwfIvkvKJobjacm2Eifrtz1sSqiaeqrNPXXCVDi1QO8MnnfeI1iO/LDjtwhDEWPwI2pdXinBB4xsxRFOmlDB6F8FAH5oEDQR/+4NFwCfJMpDxjYpxSS/VL9lNf0eLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGuT3MWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGuT3MWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE221C4CEEA;
	Thu, 12 Jun 2025 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749726301;
	bh=eXoLEBB4A9ByaFX9yQ0XrvCbOgSUF3Op1uZxPdXKPVk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bGuT3MWUdP5qBKdd2DPH+aTLrf9dWpbazBxndLSTNKgNpsAQxB3GVJaDVtJt2zLx5
	 1GXs3gkLN4ThCj1Z9wh7FU7Xz5JCodfl6+VTK3Z8G51T8hohvRYy7JnbgG3um5WJ7I
	 Qv1ro/6yYoixOhjUpRB71rrwJHDjvnerw/wHh68Xr4mxCq7HHzEvuJukwB+/A16rXx
	 CH3GwOBRuiHg/mnL0g74rO8sci7vmK1k1iTjGxEd4brtQEstjh1H1/pQcUTO3JbOGd
	 1FhoKMJawf+Mn+SkhXGWefjp0qtZXcF4sM3m3YPU96uPT12DA6g5B9ka2HCIaE8jm1
	 DngW4k58Q+uVw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 13:04:57 +0200
Message-Id: <DAKI7G567TFV.14ODG2Q5AMAVL@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org> <aEqsgD2ap2VMpTR9@pollux>
In-Reply-To: <aEqsgD2ap2VMpTR9@pollux>

On Thu Jun 12, 2025 at 12:31 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 10:13:29AM +0200, Benno Lossin wrote:
>> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
>> >  impl<T> Drop for Devres<T> {
>> >      fn drop(&mut self) {
>> > -        DevresInner::remove_action(&self.0);
>> > +        // SAFETY: When `drop` runs, it is guaranteed that nobody is =
accessing the revocable data
>> > +        // anymore, hence it is safe not to wait for the grace period=
 to finish.
>> > +        if unsafe { self.revoke_nosync() } {
>> > +            // We revoked `self.0.data` before the devres action did,=
 hence try to remove it.
>> > +            if !DevresInner::remove_action(&self.0) {
>>=20
>> Shouldn't this not be inverted? (ie 's/!//')
>>=20
>> Otherwise this will return `true`, get negated and we don't run the code
>> below and the `inner.data.revoke()` in `devres_callback` will return
>> `false` which will get negated and thus it will never return.
>
> DevresInner::remove_action() returns false it means that the devres actio=
n has
> already been taken from the list and will be run eventually, hence we hav=
e to
> complete the completion.
>
> If DevresInner::remove_action() returns true, it means that we removed th=
e
> action from the list and the callback will never be exectuted, hence noth=
ing to
> do.

Ahh I mixed up which call was which, I thought this was
`self.revoke_nosync()`...

---
Cheers,
Benno
