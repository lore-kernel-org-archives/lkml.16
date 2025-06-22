Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9F5E545;
	Sun, 22 Jun 2025 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750623425; cv=none; b=g6rRbsjyDaEA48AiXZQKnGSJw/N2eAXgb2aOYXcUHq6gbmK2+jFlGjMaahEth371UxlYbGnKt1Wi/NaTAjYJeNPcHYB6gMFWM0/iIzf9+hmKk6OZSDtYCS6ycMrdGiyrgUu7ude6p8mAztQ8rxoLnDjW76xOOOaAuykzJNTuDPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750623425; c=relaxed/simple;
	bh=xEruOBf5mstU3J3+5S3Z/Nr74sk9Jlcqpm4muKNZ4tY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r/TXc3fqJb6xRu/QyUXUd3rGVSHs5MiF7sz6PVeiliXc51GN4aorT99xYSCJqFay/z4IU3jlts4FIlH9D3j4eHroP+TS8BGFkepOrC+c13zdaA+TyxkyT/JlTdFZ44Tw0zOKO2RrGyTjyFF8xeNalU8Oc+I2SD70QhYcEIkVHNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h01CLhr9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h01CLhr9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747C9C4CEE3;
	Sun, 22 Jun 2025 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750623424;
	bh=xEruOBf5mstU3J3+5S3Z/Nr74sk9Jlcqpm4muKNZ4tY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=h01CLhr90LKI+7WzqmG96jyzKKdYWVFreOFntHKuUoGidPD/2TOkwOiu1OZNwmoEl
	 5Q5vA+OkD6Dgo4XQCfDLjYNtsJjT6nLmroNRlX5TsZJOat5kt8GAdRLjtRj9Ib9E3Z
	 eANUa8snASy4SoDTDv/OPxp3taURBq+LAYK0cRypKSXsC8cJosNiGL5+y0QTuegjXz
	 Ks6s/3TUmIm48HHUiaO/0ROGUIBMLvRPnHOJX7wmHutTcxuoRwdL8VgVWlIZN7ypYR
	 /k96q/wGNK6BtXkKxlj36kOG4rMwR8V8I92ERrkqPStU8/e1nxQGP9xgr/Ho62NT30
	 xBmaBHCgJmagQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 22:16:59 +0200
Message-Id: <DATC7K94JMMP.23EIR12T7UAAQ@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: devres: get rid of Devres' inner Arc
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-4-dakr@kernel.org>
 <DASVDU1WY5RH.1VLCIQ4TIS0FP@kernel.org> <aFfyRuYPxUfc7TM-@pollux>
In-Reply-To: <aFfyRuYPxUfc7TM-@pollux>

On Sun Jun 22, 2025 at 2:08 PM CEST, Danilo Krummrich wrote:
> On Sun, Jun 22, 2025 at 09:05:51AM +0200, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
>> > +#[pinned_drop]
>> > +impl<T> PinnedDrop for Devres<T> {
>> > +    fn drop(self: Pin<&mut Self>) {
>> >          // SAFETY: When `drop` runs, it is guaranteed that nobody is =
accessing the revocable data
>> >          // anymore, hence it is safe not to wait for the grace period=
 to finish.
>> > -        if unsafe { self.0.data.revoke_nosync() } {
>> > -            // We revoked `self.0.data` before the devres action did,=
 hence try to remove it.
>> > -            if !DevresInner::remove_action(&self.0) {
>> > +        if unsafe { self.data.revoke_nosync() } {
>> > +            // We revoked `self.data` before the devres action did, h=
ence try to remove it.
>> > +            if !self.remove_action() {
>> >                  // We could not remove the devres action, which means=
 that it now runs concurrently,
>> > -                // hence signal that `self.0.data` has been revoked s=
uccessfully.
>> > -                self.0.revoke.complete_all();
>> > +                // hence signal that `self.data` has been revoked by =
us successfully.
>> > +                self.revoke.complete_all();
>> > +
>> > +                // Wait for `Self::devres_callback` to be done using =
this object.
>> > +                self.devm.wait_for_completion();
>> >              }
>> > +        } else {
>> > +            // `Self::devres_callback` revokes `self.data` for us, he=
nce wait for it to be done
>> > +            // using this object.
>> > +            self.devm.wait_for_completion();
>>=20
>> I don't understand this change, maybe it's best to move that into a
>> separate commit?
>
> We can't do that, without this change the code would be incorrect.
>
> What happens here is that, if drop() races with devres_callback() we have=
 to
> make drop() wait until devres_callback() is completed, because otherwise
> devres_callback() might experience a use-after-free.
>
> Previoulsly this has been taken care of by Arc<DevresInner>, which C devr=
es held
> a reference of.

Yeah I understand it now, the diff was adding too much noise and looking
at it directly was helpful :)

Theoretically, you could add it in a commit before removing the Arc, but
probably not worth it.

---
Cheers,
Benno
