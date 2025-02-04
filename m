Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069F2207A00;
	Tue,  4 Feb 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738663031; cv=none; b=UZFF9zjzG3roIDAP3bElt+K6UpIbMe525lcRk08djNMT9Sk4HHRhEZI+4J+nUOXrImjueNl4glCKp/FwkwxlnbjAxkkR/yh0Uh8/PUxEfgaP5d3qDMeA3O9TD9ly2dYEP8ksY/8Nnpf5+8nmS0k1wDN2WmpuUq5L2XBxHgP96Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738663031; c=relaxed/simple;
	bh=CRAuX3gIwh55u1WP0B5HC9FHvESNBJhpwidHcqoiZTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tf7qhi+R76z0smG8XDqFnfNl6A/40ZLkL2ZgH0lvW7SZule24vTBP12Ud9WHjleXar5+NSm2aKk+TkgAIT+L63hmD2sIrW2P25a+38AvXjUNfLluoF9NdLbyoc6wn6i70z4JuXHOieImGkQoldWnxuqRRIqbwxezvDWlSRSP5p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkM6M7NF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkM6M7NF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78593C4CEDF;
	Tue,  4 Feb 2025 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738663029;
	bh=CRAuX3gIwh55u1WP0B5HC9FHvESNBJhpwidHcqoiZTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mkM6M7NFudRwSzbMcKB6KnE4KXa/A/oU03Oo7Lbbq1hHXGqqffcBJyYf3hrpGCEKT
	 ZsfGehCarZ8kPSt97rj8reRNLYoN1FxomrQf6PpPA3rlD1whmlTRDPPfbQe8wkovAP
	 HmeMva8TrZ86NPYo1hRLg4LVQJoGIW0fhCAIPoVp4NV3FA3tF9UOp/ielbzuKFKqr2
	 KD0DJM73yKHMKsC8qshQlHkLSYg1fHQtRNAXn5Yw2lIV0PQT8LhqL9CT++hiIJzQre
	 tAqHWn5zAmhW+q8rme7fCrV3oXpkwa3sAJuvmflgRXu1CQSUYdajnCEcvx5BzIOoT2
	 DfCKyZNmQ5Kkw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Lyude Paul" <lyude@redhat.com>,  "Guangbo Cui" <2407018371@qq.com>,
  "Dirk Behme" <dirk.behme@gmail.com>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/14] rust: sync: add `Arc::as_ptr`
In-Reply-To: <CAJ-ks9=gKET-yaTkqta2TfTaxe031yKqnUHNXFjjJH_AYF2oqw@mail.gmail.com>
 (Tamir
	Duberstein's message of "Mon, 03 Feb 2025 17:46:42 -0500")
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
	<20250110-hrtimer-v3-v6-12-rc2-v6-3-f71d50f16482@kernel.org>
	<3zUeHP9VQ7ZaBieXue_fQ_8V8tcTW1nc83OQA7ehwV7itvlpzwF5DHHmyqTU70UzpXhUKWoDtueUb2fsFQdyUA==@protonmail.internalid>
	<CAJ-ks9mygX61B=FOgQegs3uReBHDju2cs6eFRohjNEX_GPwAjQ@mail.gmail.com>
	<8734hid0qh.fsf@kernel.org>
	<MrCmM4idAc3dwMug-_ZigRHpTNLBv1zJ4QAZNWxrhLwmEesH1CGZwPAolimUVnWKLTXSbcxevmAWDDLQ7mQw0g==@protonmail.internalid>
	<CAJ-ks9=gKET-yaTkqta2TfTaxe031yKqnUHNXFjjJH_AYF2oqw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 10:56:55 +0100
Message-ID: <87r04ejamw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Thu, Jan 16, 2025 at 2:23=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Tamir Duberstein" <tamird@gmail.com> writes:
>>
>> > On Fri, Jan 10, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>> >>
>> >> Add a method to get a pointer to the data contained in an `Arc`.
>> >>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >
>> > Can this mention why it is needed?
>>
>> I can add that after the cut. It is for impleminting `HrTimerPointer`
>> for `Arc`.
>
> The broader question is: why do we need to implement `/HrTimerPointer
> ` for `Arc`? Even broader is: why do we need to use raw pointers so
> much?

The C APIs work with raw pointers. One important detail here is that the
consumers of the Rust APIs will never work with raw pointers. That is
all encapsulated within the abstractions.


Best regards,
Andreas Hindborg


