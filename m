Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E1A28D8F8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768167; cv=none; b=KLCYRDuxUwf8pBLlSndQ32bh24izEWuyUp9Y6BfXxx2VELvKNoLHvOOuNidWUqXQV3OnAJYuOsoZ4lsk6FqATldbbc+OgiLs9vOCQzpzI/MQAeSrs3MEGsJl/9wzr3w9OBfTlwHM97eqQ1HA+TGHCwgs3ilHv9KdQQS25lEHV/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768167; c=relaxed/simple;
	bh=jQ8u9ZH99hgK/EV7QukLMxw0vYk0v1W8W5JIgBpDeUo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=g8Xi3cy77JYJQiaBJpo1e4HBEoHdnIEEctssW00rP+2UXDblJjSalTeN+k3bhWFvNVP49x1ZMJeqE8P0SUyX0/hK6AFHtcolM4uTikeWZaGgrFJAXdMh6WbUElh4hF0EVcv6HFX7SX4Qg4Z4pvqZdR1xLTNCjukkS51YZQUhPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Sm6ggA8Y; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=WW8DTx1a; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Sm6ggA8Y";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="WW8DTx1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750768093; x=1751372893;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=jQ8u9ZH99hgK/EV7QukLMxw0vYk0v1W8W5JIgBpDeUo=;
	b=Sm6ggA8Yw7u+J1/4ssN4EBmg+aB0fhwYcakxY8aNW3vxYX8wZUJLksa/zMmhfOpwYL2OIGhE62whw
	 T1d0JNfjYa7Dpz+q1h2th5Q6O9MLYza2MgGFD28C0IPnjen1PclXU76hq8b8Pvo2XFjbNUqJHTYWP2
	 a1+lkxUUbCcr0lc308p8AshdjDaT6rfrT5x77BdUMuXCRiCISHX9q1RAF/ckdpv+etks4sgE7ImdCV
	 6pGi7eKA4OeC9UL9wc9VMQspb43t6hYWDGZZSzf8kLEM/eVIY1r3jEVn7jORoCc/OcWsLjMa2vOjWP
	 bonA1uvhd2KkowqrK8pRLqJRD4errVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750768093; x=1751372893;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=jQ8u9ZH99hgK/EV7QukLMxw0vYk0v1W8W5JIgBpDeUo=;
	b=WW8DTx1aUof2q4JjkF8HxCt8HWqzOv47Kybs5OKQLdCQ7MXyTLtiaOJxKccriu/4qqovLw8OK84PJ
	 XTOpYuDDA==
X-HalOne-ID: b1b0c725-50f6-11f0-81bc-29b2d794c87d
Received: from smtpclient.apple (host-90-233-201-126.mobileonline.telia.com [90.233.201.126])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id b1b0c725-50f6-11f0-81bc-29b2d794c87d;
	Tue, 24 Jun 2025 12:28:13 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] mm/vmalloc: allow to set node and align in vrealloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <CAH5fLgjYg_S574yQac=jQaCMM9GLkjRstkiB7tzw3iopkXAbTg@mail.gmail.com>
Date: Tue, 24 Jun 2025 14:28:02 +0200
Cc: Uladzislau Rezki <urezki@gmail.com>,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5C21A3CB-DDA6-44E1-B435-D2278D94969C@konsulko.se>
References: <20250624095121.3243540-1-vitaly.wool@konsulko.se>
 <aFqT1mK7SYsYd3DZ@pc636> <D562EE6A-DE99-4C97-8934-D60682DDE711@konsulko.se>
 <CAH5fLgjYg_S574yQac=jQaCMM9GLkjRstkiB7tzw3iopkXAbTg@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 24, 2025, at 2:22=E2=80=AFPM, Alice Ryhl <aliceryhl@google.com> =
wrote:
>=20
> On Tue, Jun 24, 2025 at 1:15=E2=80=AFPM Vitaly Wool =
<vitaly.wool@konsulko.se> wrote:
>>=20
>>=20
>>=20
>>> On Jun 24, 2025, at 2:02=E2=80=AFPM, Uladzislau Rezki =
<urezki@gmail.com> wrote:
>>> Do we have users which require alignment and nid? I see that it is =
part
>>> of kvrealloc() API only.
>>>=20
>>=20
>> There=E2=80=99s a patch pending inclusion of this one which will be =
the user of this change. I was reluctant
>> to combine these 2 in one series because the second one is on the =
Rust side, but it can be found
>> here: https://github.com/vwool/linux-mm/pull/new/realloc-extend.
>=20
> I think it is useful to include the immediate user in the same series
> so we can see how it will be used.
>=20
> Alice
>=20

Alright, stay tuned.

~Vitaly=
