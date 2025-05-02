Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A12265CB1;
	Fri,  2 May 2025 06:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169076; cv=none; b=D6OjFO2eWnfOZ0AIP4FjcMeEbWgY8Mvz21Qsbt9MRleYiVD62sHVbTUdIUK4UU8ZnS2hiOFiIV+aj/MD/QgERhNfv0/LRJVKqX03TW8BpHa8GbsFeklv7JWkQvemLLb0xbklg20nkVa6Q7bCaTIoimh5Y301z1vJTYqCkEk3FLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169076; c=relaxed/simple;
	bh=peH5j8VNVMZWuyu8yTb8TuLLasFbXp0yKjcH/xeoDY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CtgxQNU06P/68zaYoUHcxYGG2FmoTmRN3lYWAqPJUjdIacCa6EUbBD49ofxG86PdIQ3ELQjX5CMSfQHT2UfVMBdXeR9oSHanUgg50xtjdIeORm4qCzD/XZygJa/9ZQ8dqUHLXzvoG5mykg2oZQp5jvqI/Rs52JKnVGsYCwUMP0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny3+cBR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny3+cBR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A47C4CEE4;
	Fri,  2 May 2025 06:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746169075;
	bh=peH5j8VNVMZWuyu8yTb8TuLLasFbXp0yKjcH/xeoDY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ny3+cBR78/pmID2WE1FKTe31/Idn2lAAPt4/IO6aR9kIs4sgWZGkdyRBlD36K87KD
	 ej6vAyG8XhdfS/ZUtwLLDCKGDUW+txA16s6e9QO2kB6f/Sb9GlJnSawtxNq4T3iZIA
	 psNlQs0u2YpOkkDWwxgV4sCF09MNz5pQ/MdSv8earsnQCEFwIWOqQNTju4Nw1b3bMZ
	 tCR7shNCph30JlhiQPxHyrmy+adnOQaEyM6urGfrMRuOczYFqGPV59atadeCLYh/xu
	 MZNHWZxU39oXRtfAbAL1mo1Bk7m7PTrZVqkBstvnvWy0BEu62axulItG3K8SSTcp+X
	 tjujtXpiYgfEQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Peter Zijlstra"
 <peterz@infradead.org>,  "Ingo Molnar" <mingo@redhat.com>,  "Will Deacon"
 <will@kernel.org>,  "Waiman Long" <longman@redhat.com>,  "Fiona Behrens"
 <me@kloenk.dev>,  "Charalampos Mitrodimas" <charmitro@posteo.net>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,  "Breno Leitao"
 <leitao@debian.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
In-Reply-To: <CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com>
 (Miguel
	Ojeda's message of "Thu, 01 May 2025 23:46:44 +0200")
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-1-66c61eb76368@kernel.org>
	<ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
	<CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
	<87msbw1s9e.fsf@kernel.org>
	<86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
	<CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
	<87h62419r5.fsf@kernel.org>
	<FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
	<CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
	<87bjsc154u.fsf@kernel.org>
	<CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
	<TbTextfZAMlWFS5cWlUE-Wtnp1bv8P783IQQbWUcnHvEgBjpIxukMngLdPkqNR9jWT9O_OtOY1ejin9JoOnsww==@protonmail.internalid>
	<CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 02 May 2025 08:57:41 +0200
Message-ID: <875xij1ouy.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, May 1, 2025 at 11:28=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> Ah -- that explains it. Yeah, your calls to `add` were from const
>> contexts, which explains what you were trying to say.
>
> No, wait, they are not from const context. So a "normal" `assert!`
> there would have never worked.

Right, they are not from const context, but they are inside a `let`
statement, so if all the captured variables are constant (which they
are), the let statement will be evaluated in const context [1], right?

Best regards,
Andreas Hindborg


[1] https://doc.rust-lang.org/reference/const_eval.html#r-const-eval.const-=
context.init

