Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34371FDE14;
	Sat, 26 Apr 2025 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704248; cv=none; b=De+cmh0QaUcXmahw3Wtg8Uqu9ZbbgVpjlwocEIB7Q8QL6P4/kDtTjxebtSjPIDRVx42LjOG9Bf1g2WzHXcBbO7h7uMaF32PfO8tXDo28RWyaOpSustbIIvyB5P77frk6q06rvG+VgEW78iU927wpxu2LWB/Al8fdDDfRVoOyAqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704248; c=relaxed/simple;
	bh=OOoxSyFSPyTLPl4FCcqmITLqQVrGDeYeXBwjw9sRGPc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=hT4lNkHPsUdJH8gWtYirp3Dk+Pb1+zw3W1SO6Tp7vWAm+23mbEcHg4sJZ1xhy0+IGGWE1nr4/v0giL0bJkDripEmf4DtUm7jz/sABH/V6etK/wn5cqM+ChvbXEA9ooli+y1DaSM2ybfZGBXwP7t7WVWyZfW2SOpo+2FVMcIkWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZlNgJ5Cq4z9slv;
	Sat, 26 Apr 2025 23:50:36 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Apr 2025 23:50:31 +0200
Message-Id: <D9GWI4GT3ZK4.25N3DYX5MSX0P@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>, "Dirk Behme"
 <dirk.behme@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
From: "Remo Senekowitsch" <remo@buenzli.dev>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev> <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com> <aAyyR5LyhmGVNQpm@pollux>
 <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev> <aAzrg31NB2g0X4qL@cassiopeiae>
 <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>
 <aAz1f2jhdwjXmHex@cassiopeiae>
In-Reply-To: <aAz1f2jhdwjXmHex@cassiopeiae>

On Sat Apr 26, 2025 at 5:02 PM CEST, Danilo Krummrich wrote:
> On Sat, Apr 26, 2025 at 04:35:07PM +0200, Dirk Behme wrote:
>> On 26.04.25 16:19, Danilo Krummrich wrote:
>> > On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
>> >> On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
>> >>> If it'd be possible to use dev_err!() instead I wouldn't object in t=
his specific
>> >>> case. But this code is used by drivers from probe(), hence printing =
the error
>> >>> without saying for which device it did occur is a bit pointless.
>> >>>
>> >>> Drivers can still decide to properly print the error if the returned=
 Result
>> >>> indicates one.
>> >>
>> >> One alternative would be to store a reference count to the device in
>> >> `FwNode`. At that point we'd be guaranteed to have a valid reference
>> >> whenever we want to log something.
>> >=20
>> > Yes, that would work. However, I'm not convinced that it's worth to st=
ore an
>> > ARef<Device> (i.e. take a device reference) in each FwNode structure *=
only* to
>> > be able to force an error print if a required device property isn't av=
ailable.
>> >=20
>> > Why do you think it is important to force this error print by having i=
t in
>> > PropertyGuard::required() and even take an additional device reference=
 for this
>> > purpose, rather than leaving it to the driver when to print a message =
for an
>> > error condition that makes it fail to probe()?
>>=20
>> To my understanding doing the error print in "core" was proposed by
>> Rob [1]:
>
> That is fine, though it doesn't answer my question above. :)

If the question is addressed to me, I don't think it is important.
I don't have a particular preference either way. I'm just trying to
come up with a solution that is satisfactory to everyone. We should
hear from Rob if he's ok with removing the logging entirely given the
limitations.
