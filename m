Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2417A30F;
	Thu, 19 Jun 2025 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343637; cv=none; b=bIQY3hbEEHH5lUIQo1zwRZSI9Fr1kTT3gg1dTiGhugVy2aUHIF5xhY6pokKbSqQ+9AsCTvobM+S6U1Ubc2YhSaIoKAJkgOaM5xN6rNB2jyPJp6wRKDY5y3uqJ5KqicBq7gIqcBjHgCCF0hTvh4Cq/lKAhTshtWpwHdZ2NfV0Quc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343637; c=relaxed/simple;
	bh=wOZ5uTN5479Z6g69DPnz7C9RgtplSjaSC8wJO85CcYA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdUTjTFJ2PzGG8gBFcqKm5/ZvzPeQ+H1XF4+9T4xr3BgeItD0pg3+h8LBFb1m3//dJytR0kZDc3YqvXhRAZdix1qKVoijVQxWttRsVPf69H6Lyhlo7z55h+vfUuldANs71/KG4vcvbOPTm6d3BHIim4rIJb7twNiZHlkD5gkVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=oeEkQjjr; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="oeEkQjjr"
Received: from mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8916:0:640:ef62:0])
	by forward501b.mail.yandex.net (Yandex) with ESMTPS id 26AE36160A;
	Thu, 19 Jun 2025 17:33:51 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id kXPAP38LjCg0-jyKJDS7h;
	Thu, 19 Jun 2025 17:33:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750343630;
	bh=jcxSX1TMbsEbkdeHJrOiYkZWZnk9zdTh8ILIKxpkwfs=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=oeEkQjjrKjnAvP5AOJojH7tynNWsv1Qx2eHGd3IfqmIQlkMyFfOrvmUfHn3wVM31j
	 koc8CkTx/bcNihUK9qNc1PapNpNw3jXTj7RjYBbIS4ukuhQVPMel4MyldDGqnexYHt
	 CpSlnxGB0NGfD1BaLAf8vky04Kj0kjICkaniJJDg=
Authentication-Results: mail-nwsmtp-smtp-production-main-69.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 19 Jun 2025 17:33:44 +0300
From: Onur <work@onurozkan.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, thatslyude@gmail.com
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
Message-ID: <20250619173344.6c72c48a@nimda.home>
In-Reply-To: <20250619141401.GI1613376@noisy.programming.kicks-ass.net>
References: <20250619140656.498-1-work@onurozkan.dev>
	<20250619141401.GI1613376@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Jun 2025 16:14:01 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Jun 19, 2025 at 05:06:56PM +0300, Onur =C3=96zkan wrote:
> > +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> > +{
> > +	return ww_mutex_is_locked(lock);
> > +}
>=20
> Do we really need this? In general I dislike all the _is_locked()
> functions and would ideally like to remove them.
>=20
> Pretty much the only useful pattern for any of the _is_locked()
> functions is:
>=20
>   WARN_ON_ONCE(!foo_is_locked(&foo));
>=20
> Any other use is dodgy as heck.
>=20
>=20

It's an abstraction of `ww_mutex_is_locked`. Since this is an
abstraction module, as long as `ww_mutex_is_locked` exists I think
we should keep it. FWIW it's also quite useful for tests.
