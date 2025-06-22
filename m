Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489D96136;
	Sun, 22 Jun 2025 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750623527; cv=none; b=cL9tlDiev3JxY18Xk7Qw1qt/kQQgNENe11l9zSGrL9yD+G4lzoitB0pS8QE0is2lNc2EvhJ4n3sJp1whcwDvRc+DlIJNg174+67p6dbZjrGUX83rId55jgw3dciqe3cxp2gMTLMnZ/qIu6LHuLO8jWczNs4alGuUOH2R5Ixypu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750623527; c=relaxed/simple;
	bh=wLUoB7/w6XOQyarOKoPo3iGbEtB7aFJr+gpia+gRs5c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BJr/RUUBVFbVf54vY8gbRlaMczdfOnCW6VY4N+cWs+GO+K44hlgXDYOXcXiV2bwGiOaT9UwHdQV6mUb5BPiW5iImiMe1rGUjLUac8FHe7b2elm3UI5zAyeYgm3GwZRzLfW6KHKWDLny3DEmrFFjGXio3tshs0cUpW7wV7XYI3hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zp1vNPH3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zp1vNPH3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC36C4CEE3;
	Sun, 22 Jun 2025 20:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750623526;
	bh=wLUoB7/w6XOQyarOKoPo3iGbEtB7aFJr+gpia+gRs5c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Zp1vNPH3YzwSKu16TOXkEMglmJuvSdcSeGv2fH99hWLmlrR0hYI7yoQpsg45PBEni
	 LvQQWQgwEHiVc8SLjM8HYTQWpm+/VzZyJAQvuRAj3eoDzTw98cwg+EVcL+rOEho/ZX
	 Qj5j69+fFTvtyPm/WR6ZPViNBI+w1C0YIH9TimYzE77YMfZxBydzog2HQZmVCBQP32
	 9clxZh1D4B7vRjRnJycMJNNsQFTpJbeAJqK/Lky86Bg1ITGHbbKrEcWadHUe0PFGYf
	 E25H3CxoITNMnOKmUTVh1uhn9Mov/X6OOZ+krlUAa6+X6keGpC8+0HLSUdfxPHgV0Q
	 QAaFcN0XuuYWQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 22:18:41 +0200
Message-Id: <DATC8V6SSDG3.3NB9RB3B8OMMU@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dave
 Airlie" <airlied@redhat.com>, "Simona Vetter" <simona.vetter@ffwll.ch>,
 "Viresh Kumar" <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-3-dakr@kernel.org>
 <DASIPSH2IFKL.O55ZBVZFPVWB@kernel.org> <aFcn51EPcWlDG_YW@pollux>
 <DASW5JYFRE2K.1E5T6FI6KNRQJ@kernel.org> <aFfTCv9MrGBdbFOr@pollux>
In-Reply-To: <aFfTCv9MrGBdbFOr@pollux>

On Sun Jun 22, 2025 at 11:55 AM CEST, Danilo Krummrich wrote:
> On Sun, Jun 22, 2025 at 09:42:03AM +0200, Benno Lossin wrote:
>> On Sat Jun 21, 2025 at 11:45 PM CEST, Danilo Krummrich wrote:
>> > I feel like the name pretty much nails it: it's a new instance that is=
 not
>> > owned, by the Rust side, but by the C devres implementation (i.e. fore=
ign
>> > owned), which automatically drops it when the device is unbound.
>>=20
>> Yeah, but `foreign` is so unspecific... With `ForeignOwnable`, it makes
>> sense, since it could be anything.
>>=20
>> > Maybe Registration::new_devres_owned() instead?
>>=20
>> I like that one better, let's go with that.
>
> SGTM, but please note that this is unrelated to this patch; will create a=
n issue
> for renaming those.

SGTM.

>> > Hm, I think attach_data() doesn't quite hit the point. Maybe just
>> > devres::register_owned() instead. I agree that 'boxed' is an unnecessa=
ry
>> > implementation detail.
>>=20
>> I like `register_owned` better, but I'm not 100% convinced by the
>> `owned` part... The regular devres creation is called `Devres::new`,
>> right? How about we just call this `register`?
>
> In general, devres::register() is fine for me too. But note that it loose=
s a bit
> the indicator that the ownership of the object is entirely transferred to
> devres, in contrast to the Devres container type.

I'd say that is clear from the function signature & can be expanded upon
in the docs. `register_owned` doesn't really carry the meaning "I take
ownership of what you give me", so I don't think we lose anything here.

(if we have a `register_owned`, then it begs the question what
`register` would be... which doesn't make sense to exist IMO)

---
Cheers,
Benno
