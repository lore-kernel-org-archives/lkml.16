Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826DEEA8
	for <linux-kernel@vger.kernel.org>; Mon, 24 Mar 2025 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801543; cv=none; b=BFNujF7hW1eFxsZL/APIINPLtKCH07zpEXK9UcQWOrrDwn2mFZeGipVsaXSqkT/wcQTAazFPD5l58XQX0TML3VY8H6Ih8hXUrewVBy859TNKJlJkX88cI2ivlpC9WARL/Ivx802Z0WJxfBSiZbTQnuSPke/hg1Is0wTvH8//0mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801543; c=relaxed/simple;
	bh=4kwONzzGAb7j/EpmGAg17PKdIoNNEIO0Nr6aIZBujKk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gXrxX5xtpQbPG2dXkP2Ay5rHMpo39uU55V42aupslaM7xmJq1iRUo277ne7LLJUhK02N0KPUpQ+YnAwirVnx9E/VW3vXtYkr3s6FfVJEKM6pLqCIvDEdVMgY+85v4a5oScAINw45k73vLp5XGFKk8EKZCcaI4lvyNWuN9KDg1Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lS2Vvd+U; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lS2Vvd+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1742801534; x=1743060734;
	bh=4kwONzzGAb7j/EpmGAg17PKdIoNNEIO0Nr6aIZBujKk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lS2Vvd+UTX1sIAbF7ZC1bbVL/akHfHgu+rE0oP9lme1NE2qWwvymzfeMQcD7d71de
	 Bu0v/qk69aLEhfr76BHaCb3Hrsvk0LgHczcYj7V54Y9a0pVujFPkOM28xDpN5VZ9GJ
	 GEohJM8xE0BBVbLXNRelPo4pACT+GhSXAjQqZnW+eBif8ckWFzHElayerYjYBmCHtt
	 2jHGiuIfpdSsYcgH8zQremtkNcyWzA8gFvTMSPiyj5o48ng4Pn6WhBrYQ+knKpiNCp
	 3NvQkpbTiuIQ0/cLG33zBJOoBB7bB78fA3B6IppgDPvq8M7VzH7uSNVsV050hX9vDe
	 TwL7oW7Jg7mmw==
Date: Mon, 24 Mar 2025 07:32:08 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/4] rust: rename AlwaysRefCounted to RefCounted
Message-ID: <Z-EKcUppzh-5oTI6@mango>
In-Reply-To: <67dd91ca.050a0220.acaf0.79d2@mx.google.com>
References: <20250313-unique-ref-v8-0-3082ffc67a31@pm.me> <20250313-unique-ref-v8-2-3082ffc67a31@pm.me> <67dd91ca.050a0220.acaf0.79d2@mx.google.com>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 22a341c52edd1bfe218b1fd297c33dd5943465b6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250321 0920, Boqun Feng wrote:
> On Thu, Mar 13, 2025 at 07:00:11AM +0000, Oliver Mangold wrote:
> > AlwaysRefCounted will become a marker trait to indicate that it is allo=
wed
> > to obtain an ARef from a `&`, which cannot be allowed for types which a=
re
> > also Ownable.
> >
>=20
> This commit log doesn't explain why we need to do this.

Hi Boqun,

what exactly do you have in mind? It mentions that it is to allow types tha=
t
are both Ownable and RefCounted. That the next step is to introduce
OwnableRefCounted? That we want to safely convert from ARef to Owned?

> > +
> > +// SAFETY: we currently do not implement `Ownable`, thus it is okay to=
 can obtain an `ARef<Request>`
>=20
> s/we/We
>=20

Missed that one. Thanks.

Best regards,

Oliver

