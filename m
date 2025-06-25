Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BCC27381E;
	Wed, 25 Jun 2025 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840214; cv=none; b=aw3XOoDa2f7V1l99S9adjMSw/tLmaZ8reqbijGpP/upaYoyPNPFGNRCWdM10Qv3YR56bb4jfZ85QkgYiwhF5FU31HF2dl5QAg+T/lR9QVTlD//H4gVQHWQbUVoATDrWfb8jUyESUm8Mfy5SZY2Oh4x+57OsSBualIbKjA54Vq7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840214; c=relaxed/simple;
	bh=ZMYcV0v+/lOBTq3uVM5tv5E1P/nDL0elBHzgrXYiC5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oNrO428l3nm8rzOuI8aHLJetK7Eq97sMmcXCPIFtyHUUBIiqTmHLkkrUtGSeMHESdJSmrqVTl6AjYrothn7wEfN/w6H3/zY/I7b5zHJhZHPI87mWqTN27JmHtklc3NGiNbApBxpJ88YtItxMA+68xxDAVtnkI0fiHxrhhh5wLiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cpd6syaX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cpd6syaX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFD0C4CEEA;
	Wed, 25 Jun 2025 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750840213;
	bh=ZMYcV0v+/lOBTq3uVM5tv5E1P/nDL0elBHzgrXYiC5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Cpd6syaXk0hxiMytORKNWNPS6j7d/MGIi91z6ajhWMiVWLz9gB4/MZBhH8edvvJcw
	 lBLktn3CwHdO9W90pORMAc2TyeGFS61u3fNjXuq5O1SwF6L0RCBkVCtqHJThLm57zG
	 mdMBU0mK7yWcijctfJ+zePSHqjM126HO83k9DCO49hwgyPgXPn/PF8GeqPO1K8N8Nd
	 rY8j6Tu4E/O2jdXraDysEFpz3t6Gl23sEq6fhWDQiXvH+zJBz8VQYGB9J+5aM1fevZ
	 BCjqEhBtniN3wQ6V52lff2e7uXqR6ik+O9xiKcKQp9gIUDAo1HI3DZeGkhW94EZ4nR
	 5Z11nuxCJCAkQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "FUJITA Tomonori" <fujita.tomonori@gmail.com>,  <alex.gaynor@gmail.com>,
  <ojeda@kernel.org>,  <aliceryhl@google.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <boqun.feng@gmail.com>,  <dakr@kernel.org>,
  <frederic@kernel.org>,  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
In-Reply-To: <CANiq72mTKTh+GSWUW5aZwkqpdMFZ5VwA6djwubtsVn2KOy362Q@mail.gmail.com>
 (Miguel
	Ojeda's message of "Wed, 25 Jun 2025 10:11:56 +0200")
References: <CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
	<87wm912sjg.fsf@kernel.org>
	<CANiq72kHocyULzwqxS51XeSEhsJpccfNFc+QYE67yvfvS8BApw@mail.gmail.com>
	<20250625.083037.1910124819838055415.fujita.tomonori@gmail.com>
	<3zCWvNSS_nriw1U9HytX_Lh6WWrEJelevyNQ_pWrzbxvSoUPNd-NTs1koz4PY2rIzkOBeVL82dj0NTR4_R5nyw==@protonmail.internalid>
	<CANiq72mTKTh+GSWUW5aZwkqpdMFZ5VwA6djwubtsVn2KOy362Q@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 25 Jun 2025 10:30:04 +0200
Message-ID: <87v7ok1awj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Jun 25, 2025 at 1:30=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
>>
>> Just to clarify, Delta implements Copy:
>
> Sorry, that was a typo: I meant it is `Copy` (the table says `into_*`
> is for non`-`Copy` types).

The confusions will have no end.

Best regards,
Andreas Hindborg



