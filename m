Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471123CF12;
	Fri, 30 May 2025 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633073; cv=none; b=qNhNY5zeFIn+t8Toe6ziFY1mX+bVKSctB7qAjAEtiPwRhzJ1J+1NhaBOEWdgmSFVct1ghCiVjXwfM+8xrxyEs0CWGN5zX9XCaeSCFRvbo1RkLH45c18ltGk9mSydv4jGNkhZTwauV1blm8QU/ExHTr49NGkbLfKDYvxdJune5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633073; c=relaxed/simple;
	bh=H11030nFrNAGRfgABJ/vGtiV49oAW7S/aC2MEYd038o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UvdTxzWIWPTFkGSKN5nDLlaZKQodXQSl1LbwtYNbu+JZEME4TvTy8nTTbTxsFb7z9A8fMIHkGqiP49oKQkWA0LAAT6TnSRFKsUrrX+b98DkrEDsZeN9iFv/NeHN6/fkZacOoHdej1cVX3PcGGrIBklLWZ52VZDgUHhvtNftGAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChRmfzht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChRmfzht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF93C4CEE9;
	Fri, 30 May 2025 19:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748633072;
	bh=H11030nFrNAGRfgABJ/vGtiV49oAW7S/aC2MEYd038o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ChRmfzhtjv7BPisD2fRKRD1YJRkO0/XlazV5AH/jeZP5ASNmiWpLcvBOESmMVWLvO
	 8oAmtnD1fzGpq/uRZ7EVhh+RzobGGldfmReWBryvpQEnEYePueH9STCqLTZqOHpZcL
	 F/jtwhsazX0u8RUMcCBdZPzD96MSlBMS744ukSFK8RqudAivlA8uQP8PqEUfmwmDru
	 g6wP7aoKYCdYY3EhPbhzyrzxr8Med6dqYwcQPQKCoLZzSOh7NzJZwjt6mc6w1Z9m/C
	 b408GdMm+7GMyOTvGCLglkTx4dUw++Zfk91hHCsJeMwksMcFQOsxVDsId8aX9lDVf+
	 awIVmmPM3M3ZA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 21:24:28 +0200
Message-Id: <DA9QOTLU4U5M.2X7K7UWJ53QGI@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] misc device: support device drivers
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>
 <96891e54-8614-4f98-8a98-ad90f18c8e43@gmail.com>
In-Reply-To: <96891e54-8614-4f98-8a98-ad90f18c8e43@gmail.com>

On Fri May 30, 2025 at 7:29 PM CEST, Christian Schrefl wrote:
> On 30.05.25 6:37 PM, Christian Schrefl wrote:
>> On 30.05.25 4:24 PM, Danilo Krummrich wrote:
>>> This patch series adds support for device drivers to the misc device
>>> abstraction.
>>>
>>> For design details, please see:
>>>   * patch 5 "rust: miscdevice: properly support device drivers"
>>>   * patch 6 "rust: miscdevice: expose the parent device as &Device<Boun=
d>"
>>>
>>> This patch series depends on the pin-init series from Benno [1] as well=
 as on
>>> the misc device series from Christian [2], with UnsafePinned replaced w=
ith
>>> Opaque, as suggested by Alice, since UnsafePinned may still take a whil=
e to
>>> land.
>>=20
>> If you want I can send out a new version using `Opaque`.
>>=20
>> We could also add a type alias like:
>>=20
>> type UnsafePinned<T> =3D Opaque<T>;
>
> I forgot that Opaque doesn't drop, this would not be quite as simple,
> but with a newtype with a `Drop` impl it should be possible.

That's one issue another is that `Opaque` also allows uninitialized
memory and (if the upstream one isn't changed) also modifies the
behavior of shared references. I don't think we should name it
`UnsafePinned` if it doesn't guarantee the same thing as the upstream
one.

---
Cheers,
Benno
