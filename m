Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938BE25392F;
	Mon, 14 Apr 2025 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646867; cv=none; b=dAE5OoiGDx17Cr5LztsiOUsw8RyrocEewoufnhU46L07kWkik7jDju3/L5J7ia0uWagYhfvKZ3Vmxygky/oVHbd9oolrvPJoHbDEAkNu/0oMAK7YPnigym2WHtccMcxCla5wl7ECHMPkPnbZF6UxlK3la4lFUIDhVcnJGzUkrEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646867; c=relaxed/simple;
	bh=89SsQWQlURMhXll0vbjgPkOEDNr6faR3UOE0ugvBQoQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=m88nquj5Sehvka5i48VJJksF2gZLGpa/d0bzOYPWUNLq5WnvbEkjCB87PVBR6PeZAugL+XogXuOzy8KrdWd5TlAkt5WSa+5/pMupNBR1VbtDMnV6I3Hz/cBp+7O2a9Uw64ojYVZG7baP8Z/8LUK4Wa0cwfQGe7Tc2FNsJ2Mx2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Zbsd92Y2qz9tsW;
	Mon, 14 Apr 2025 18:07:41 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Apr 2025 18:07:37 +0200
Message-Id: <D96HP1UV49SY.1U1BFA14P8XHE@buenzli.dev>
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] More Rust bindings for device property reads
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <CANiq72mJubnGyqSk3sqKVa7g9HvnJvmRg=gJ2kaBtbMMVWWC8g@mail.gmail.com>
In-Reply-To: <CANiq72mJubnGyqSk3sqKVa7g9HvnJvmRg=gJ2kaBtbMMVWWC8g@mail.gmail.com>
X-Rspamd-Queue-Id: 4Zbsd92Y2qz9tsW

On Mon Apr 14, 2025 at 5:38 PM CEST, Miguel Ojeda wrote:
> On Mon, Apr 14, 2025 at 5:26=E2=80=AFPM Remo Senekowitsch <remo@buenzli.d=
ev> wrote:
>>
>> changes in v2:
>
> If possible (no need to resend, it is just a suggestion), please
> submit new versions (especially multi-patch ones) in a new thread,
> otherwise in some clients (including lore.kernel.org) it gets harder
> to read.

Okay, will do next time.

Junio Hamano recently wrote on the Git mailing list[1] that he wants
his contributors to do this, so the original message-ID can be used as
a "patch set ID". A quick glace at the archive[2] confirms that people
work this way. I assumed the kernel community would appreciate this
as well.

Link: https://lore.kernel.org/git/xmqqy0w8ng5r.fsf@gitster.g/ [1]
Link: https://lore.kernel.org/git/ [2]

Best regards,
Remo
