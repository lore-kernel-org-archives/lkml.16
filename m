Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A00F510
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308583; cv=none; b=kb++P/uyQuahyqKaswPXLnwCsaUkuV9mJXs73pPWVlkvAvv2BVSsIO6SFEncMGsqqxq4Q77ekkfQf1ZPw3AEDH2e187rSAOKp6vxrizcA4MU51YXptLP8fD4/yjf2G47OGKUl3vV4OBfN5IKp+Qj9eRoAkFnAW88oePlFsLdLK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308583; c=relaxed/simple;
	bh=8qU0WnLj7NnW8yFcl51Njv9nHN6akiHDOKwsqWe3AbY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CiQuJIoN2R95S4Lr8aava4u6Sh+eLrIrt1hArwfWnNSmyzNAvOdkKfqItI6GfDLa6/3aYzpByt3/8b8NfevHIDHsBv9EJFvtBruNszCYetH0r3U1XpWqWmpSuI9LMlmgTE/C5kADTKSg6ZbsoiUKSg57QuHnKkYZpITjJABcWsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JAsQokKT; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JAsQokKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gfslac7ddjhgpnmkgpfnzmywvm.protonmail; t=1745308578; x=1745567778;
	bh=8qU0WnLj7NnW8yFcl51Njv9nHN6akiHDOKwsqWe3AbY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JAsQokKT3/t+D0Sni9ANzIzVHuqb3v3BpSqda2Vq5M810e42/r5UJAqH3NN4okZg/
	 0MYOorE0ydh3KkKxa4h3TeGrX/GCYBoSFWMiB8i2+eDnc1TUgySE0ZhB0JdVGEqolI
	 He5uM8HnNvqvoxMA635igfFavH05bA7vZ4RotVqbBt6/0HNwoT5CUz32Vh0ielPB1y
	 ggtLBj2M3obvNzhs2+Al8lPgmgAPwgOuaqUCR5D8MHJ8vY20J0RFDCbFNzGY+Vd2Ts
	 zkDkANAXdVQL/C65DDRDlFvL5+RFUuCddLhyCbsATYatHWe4q3OL2SniPLQsVNxZ+i
	 jVzk8m5ypkadw==
Date: Tue, 22 Apr 2025 07:56:11 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] rust: pin-init: add `MaybeZeroable` derive macro
Message-ID: <D9D091TSBCKA.2C3REET71ZWTC@proton.me>
In-Reply-To: <aAcg86QfvlA0zAh4@Mac.home>
References: <20250421221728.528089-1-benno.lossin@proton.me> <20250421221728.528089-9-benno.lossin@proton.me> <aAcg86QfvlA0zAh4@Mac.home>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b7a9b1c7029c8302dd647590a8bbd75d648ba201
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 22, 2025 at 6:54 AM CEST, Boqun Feng wrote:
> On Mon, Apr 21, 2025 at 10:18:52PM +0000, Benno Lossin wrote:
>> This derive macro implements `Zeroable` for structs & unions precisely
>> if all fields also implement `Zeroable` and does nothing otherwise. The
>> plain `Zeroable` derive macro instead errors when it cannot derive
>> `Zeroable` safely. The `MaybeZeroable` derive macro is useful in cases
>> where manual checking is infeasible such as with the bindings crate.
>>=20
>
> Hmm... seems we need a customized auto trait? How hard would that be?

Very hard. AFAIK Rust folks are trying to remove them.

---
Cheers,
Benno

