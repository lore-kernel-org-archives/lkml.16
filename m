Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8425823C8A8;
	Sat, 31 May 2025 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748704985; cv=none; b=WMbezWbeDyVnC8EDOluZ7lWXZ7COB9evV8oJbHbaarMxalp8Eak/3vcKkWqpVnY1maOdhySvHlgb1DT3IJyV6Calbgnbyh0h8zayBTlLTUT/jH8Bo7YHRRDhTc2HN8+D4jXpudyu/X+jyCj8aLE46r9uyT+nkvNjZjNyu79/FpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748704985; c=relaxed/simple;
	bh=zwHQVI0/pNMJZ1ybXwmumUWIVKyedXJpst3QJjnQhyA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=K4q+RTXIloVuNZG1PC3KdSF36BLZKkPZOlMQlLjO7MdkQdSz43I3KM/TEPRJMOtl3l4g+hH0qEOxM/uS1hr4z+9MrUU1v34hs/eJJ5wkgN4SW1W0hr4wOECYc5Xg4TA9hmjDRFVMhcGt2WKOi/gzA47XnJV5F+oEOXKIOoMietg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pK3SqPfy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pK3SqPfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA65C4CEEF;
	Sat, 31 May 2025 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748704985;
	bh=zwHQVI0/pNMJZ1ybXwmumUWIVKyedXJpst3QJjnQhyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pK3SqPfyN04F2RHqC3No94VNlAPN2UTUJ1KbiwRWxZ0atA7I4BTNFqBpXPFdijCy3
	 S0JLKi4FVlTuw9uDGGkJB6Bq677Wh7X8z7vzKnTe0CSPBj0AoofJ6lSu9914537EW8
	 NDf2z5JblYWNYCZNrZsWHML0IpYP7ybuPzDtmIRjCz+5h/cjrJyYptbh0toCVj5swD
	 fFc9Gtbd4J7w+tN1CxxQrvMEkuPWZrh79Lp7RKIGFD9MbpXT2myX/VCOFipyNjHUfG
	 NuD7n6A36UqnDhjrr+SSqx8RPNy1c+WvkS3txsgeM597FRfKbT+WP2pnHtMMwN/3Ew
	 C10QkZP9dFG9Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 17:23:00 +0200
Message-Id: <DAAG6HNJ42IJ.1AWL4SUJDUGO5@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] rust: miscdevice: expose the parent device as
 &Device<Bound>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-7-dakr@kernel.org>
 <DAA7CJOUJPNL.F7UH9KD8JANF@kernel.org> <aDreGUcvyR4kjMGl@pollux>
 <DAAC2TIAOAEY.16STTUX7D2UNR@kernel.org> <aDr4ZUjBX9q1c89S@pollux>
In-Reply-To: <aDr4ZUjBX9q1c89S@pollux>

On Sat May 31, 2025 at 2:39 PM CEST, Danilo Krummrich wrote:
> On Sat, May 31, 2025 at 02:10:08PM +0200, Benno Lossin wrote:
>> On Sat May 31, 2025 at 12:46 PM CEST, Danilo Krummrich wrote:
>> > But, I agree that we should not name it `Ptr`, probably should never h=
ave been
>> > named `Ptr`, but `Data`, `Private` or similar.
>> >
>> >> Would that also make sense to use as a general change? So don't store
>> >> `Self::Ptr`, but `Self` directly?
>> >
>> > I think it can't be `Self`, see above.
>>=20
>> The rust_misc_device example would still work if we changed this to
>> `Self`. Now it's not a complicated user of the API and someone might
>> want to store `Self` in an `Arc` and then store that as the private
>> data, as the MiscDevice is also referenced from somewhere else. But I
>> don't know if that is common or an intended use-case :)
>>=20
>> For simple use-cases however, I think that `Self` definitely is the
>> right choice (as opposed to `Pin<KBox<Self>>` for example, as that has
>> an extra allocation :)
>
> The data returned by open() can be anything. It can also be some arbitrar=
y
> Arc<T> that already exists and is looked up in open(). It can also be som=
ething
> new that is created within open() and requires in-place initialization.
>
> So, if we want to change this, we could return an `impl PinInit<Self, Err=
or>` as
> you suggest above and initialize it in-place in
> `RawDeviceRegistration::private`.
>
> I agree that this is the correct thing to do, but that really sounds like=
 a
> subsequent patch.

Sounds good.

---
Cheers,
Benno
