Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D07F1F4626;
	Mon, 10 Feb 2025 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206835; cv=none; b=GlBTQiet3XFkdqYrtk2Wpf9k3+C7kpywNaEFYtyHoKuO8oZztdbGmqkCNCgns/Tc8/66jgL5FqoiktFxDAYa63G5/yPgE7bJQma9GkRY5HiuKpXAWY6aXhljaYSDhmNJAaxZect3Ttl4rKf9b/XrlrBnJPzvF+TdUXoGR/lJXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206835; c=relaxed/simple;
	bh=4Y4k0nUZHd1oCq1XPyw8Qyk6L1nSopy7901vsvJquTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SEXyGVDeX0YaSiQbNudq+4RVwfB7lYtKy83ZYFo+TLoIADZpQe/7aII29YSXD2OC6nZlUsPE1adLZ4wlOX7NyBaRYbSU5r7lqDn7WeuHTCakYHaQbzeBviIgEDqRSK4ueQ7KeQoUMlL9qp7NATycy7ahTJePTAoyZdzjGDsgy/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=I2iOQ7ct; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="I2iOQ7ct"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1739206828; bh=4Y4k0nUZHd1oCq1XPyw8Qyk6L1nSopy7901vsvJquTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=I2iOQ7ct+CCF8mpIai8Dz+Zb1/QPGiY2hRnumMw5nRZ1XONbI9aRGZEU9qQaiAsbN
	 4N4tQU+X0fgBS08kRcnrP+W+MfzE6xVmeY/e7tm3yYtAzU6YZy43oo2JBihVUJOPnJ
	 hE0/UURngylOWmi6WVgIiK9vOajfoomCHIG2aE6c=
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Boris-Chengbiao Zhou <bobo1239@web.de>,  Kees Cook <kees@kernel.org>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Chayim
 Refael Friedman <chayimfr@gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer.py: add missing
 macros deps
In-Reply-To: <CAJ-ks9m3SV4ezHda0cu00_TRLwY8mNg+GxJrji+FQMs=mfuL2w@mail.gmail.com>
	(Tamir Duberstein's message of "Mon, 10 Feb 2025 11:51:26 -0500")
References: <20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com>
	<87a5atbw1j.fsf@kloenk.dev>
	<CAJ-ks9m3SV4ezHda0cu00_TRLwY8mNg+GxJrji+FQMs=mfuL2w@mail.gmail.com>
Date: Mon, 10 Feb 2025 18:00:08 +0100
Message-ID: <874j11buqv.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Mon, Feb 10, 2025 at 11:32=E2=80=AFAM Fiona Behrens <me@kloenk.dev> wr=
ote:
>>
>> Competing with https://lore.kernel.org/rust-for-linux/20241205115438.234=
221-1-me@kloenk.dev/
>> but I do like your aproach more.
>
> Missed this one go by. Sorry!

No worries at all, was mostly also to make sure that not both gets merged.

>
>> Reviewed-by: Fiona Behrens <me@kloenk.dev>
>
> Thanks for reviewing! I'm going to respin v3 that looks a little bit
> more like https://lore.kernel.org/all/20250209-rust-analyzer-host-v1-3-a2=
286a2a2fa3@gmail.com/
> which is the proper fix. If you're OK with it, I'll keep your tag.

Sure, feel also free to ping on zullip if anything specific before
sending. But your code already looks very good. Like it with the types
and such.

Thanks
Fiona
