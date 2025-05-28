Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1671C683;
	Wed, 28 May 2025 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445518; cv=none; b=jNEC+4+9vxjQjHpna/bjj/zL+Qf5suRWn+02U9SxnJOXAZGAd+3wacoTLph/ZInO9X11dbX0ShEbVTbJtSCXg/6KXBgbrlXzR4Ct/ssSNgfz5NypoSLVtWHq9W2wa5L1P411ynqxQRicdAPm3x2LT7dDX89rRA1wkOcHtwkEyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445518; c=relaxed/simple;
	bh=+zDJ8MaeFZpDuL2f5yRXJ9pjdL74Yqj2SSN6QD34VgI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u1MTTjuenGXpwG+IpzwKQwTiEP6m4S12UFt/PAGqS5Sb8Oj/JsAvkVA7+uDCfN/PGgtC5vroGHhsd+Y9TMhNCZwuKO3mKRKUES1ze3SurorQ9tuQssqNmodTLqB877JmcCMj88R7VysXnsLak9i1Q2BZiEYc5iB2kgajmOF15DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu+Pb8gI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu+Pb8gI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC23EC4CEED;
	Wed, 28 May 2025 15:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748445518;
	bh=+zDJ8MaeFZpDuL2f5yRXJ9pjdL74Yqj2SSN6QD34VgI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Nu+Pb8gIrtgHgB8mrs3o9QSmjutdd2/6IMQK9d2hPiK40xRnhXMPFs1lWMMNLKk3w
	 c2/2+Di7rKMH+2GM1eMlqbNlniagubrsvoRxesI4Rf7GOQW/6sl2yB5jVp95vQkvQq
	 wmw2EmFHJTwCy6J+ZteoJVY/38oo2+Pz/4C4sU4zkM0H/GgcETdy8DxKUvJeravkuR
	 Tw5s9ISOuOMLxKCIsr5pjz1cgabfJeCoUcRgX8xST+uYzoRoUxxdct5Kgxkv/rFgaG
	 J1VlxWxfXEW/n6cQnohF9iRnaDZoYk5bfUaHH5pbV1C92wss+pJ/L6PXwgsLthlLZA
	 /ZepwO3iA/BFA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 17:18:32 +0200
Message-Id: <DA7W7FU3XF0C.3N7KB44MCSPTG@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Alban Kurti"
 <kurti@invicto.ai>, "Michael Vetter" <jubalh@iodoru.org>, "Lyude Paul"
 <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/13] rust: pin-init: rename `zeroed` to
 `init_zeroed`
From: "Benno Lossin" <lossin@kernel.org>
To: =?utf-8?q?Beno=C3=AEt_du_Garreau?= <benoit@dugarreau.fr>
X-Mailer: aerc 0.20.1
References: <20250523145125.523275-2-lossin@kernel.org>
 <20250527215424.26374-1-benoit@dugarreau.fr>
In-Reply-To: <20250527215424.26374-1-benoit@dugarreau.fr>

On Tue May 27, 2025 at 11:54 PM CEST, Beno=C3=AEt du Garreau wrote:
> On Fri, 23 May 2025 16:50:57 +0200 Benno Lossin <lossin@kernel.org> wrote=
:
>> @@ -1469,7 +1469,7 @@ pub unsafe trait PinnedDrop: __internal::HasPinDat=
a {
>>  /// this is not UB:
>>  ///
>>  /// ```rust,ignore
>> -/// let val: Self =3D unsafe { core::mem::zeroed() };
>> +/// let val: Self =3D unsafe { core::mem::init_zeroed() };
>
> This looks like a find/replace that was a bit too eager :)

Oh yeah! Thanks for spotting this!

---
Cheers,
Benno
