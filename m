Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10528BA85;
	Mon, 30 Jun 2025 14:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292175; cv=pass; b=WOTcKb8GL2I0Gm7EFh6SfT2nRr6gHuHmZdgeasrOnYxwtF1nCPRxICNF28eE/5PT6lGEcrlPIvAMhc8EcPR6BupalcWjsYVMIYV0yDT7ZfN2UwcGJcI9fVSNNMHye93mw8vowiURicNoSmgLNOirvTlVnCls46K6PH7JRP4Qqgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292175; c=relaxed/simple;
	bh=hs77ckMRFA12uk/J7QzlOb3L4+rw3p6OOdGUfcOw5vY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lJzk85fXEbNNcv5wpI+KWfsAxzFt0YZcKAzs4xYH0ekFI6CHCd+1FyHroD1Px5muEm8ThUR7kMQO71kqgHquk8m79Kn3VYNDvx1Lkzi0uQ//fwSQJwXJCJ4D0Vej9pUXYPhcyGLlTX7mKesr6IqtDoBvbLsI56FysBX+pos84kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Ypadki5X; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Ypadki5X"
ARC-Seal: i=1; a=rsa-sha256; t=1751292132; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hForjdBUnS7VFOskc8XTGF4ZuD49bqkWIkoHNtO31t++xH37GrpYQZ0Os/VH+53AQvFHkJRKjX1iPe9OAvXW+UdvK/1fIGmjSb/E4hNWZUEmOp56e7u6CvM1cHxYzZyiaRPf7i4MwQNuAzqanmoaFujaQN3VAibBvBqH5c17wXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751292132; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hs77ckMRFA12uk/J7QzlOb3L4+rw3p6OOdGUfcOw5vY=; 
	b=O5nOi0VT3fesTXzwzlvCgNDRD46jUYOBu1HYj4ZDYcJ4Q6tq2EgucsBJxHzGvQnh+NkkPAQ/ByOPnAX0F4uH85uSkN5j9QN//wmcqZRSs5neqVv5UGNIKiabx/6X8d9YRimHUMOrbFZDF+7kJSbfpchfDjUDjPklIfAceRx8w3E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751292132;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=hs77ckMRFA12uk/J7QzlOb3L4+rw3p6OOdGUfcOw5vY=;
	b=Ypadki5X0lEDmOWiz687xIyTAGF87BWUW92Z8ZmBKuiUPB4G2zqgWP0RQpAwsItz
	bTpM9NNqjhYv5lMzmu8BvBcw6tE9YgqCb+ng++wBIXB+Di/jGPsdKf2LWE1qikS5Kmp
	M6HV4+U0PlTYVuwvCWbHQjP0du+qAerJSiJheWaM=
Received: by mx.zohomail.com with SMTPS id 1751292130667973.1662508363917;
	Mon, 30 Jun 2025 07:02:10 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
Date: Mon, 30 Jun 2025 11:01:52 -0300
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Stone <daniels@collabora.com>,
 Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D83A328-9F34-420C-966F-94DFB26C8451@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux>
 <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
 <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
 <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Rob,

> On 30 Jun 2025, at 10:52, Rob Herring <robh@kernel.org> wrote:
>=20
> On Sat, Jun 28, 2025 at 4:31=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>=20
>> On Sat, Jun 28, 2025 at 2:13=E2=80=AFAM Daniel Almeida
>> <daniel.almeida@collabora.com> wrote:
>>>=20
>>> Also, for some reason the Clippy lint did not save me this time.
>>=20
>> Hmm... it should -- I tried to build it and Clippy reports it. There
>> is also another warning too [1].
>>=20
>> I see the compiler reporting [2] too.
>>=20
>> By the way, do you need to depend on `CONFIG_REGULATOR`?
>=20
> No. Drivers rely on empty stubs for all the providers they need. It
> would be pretty unmaintainable to depend on all of them. You want
> enabling drivers for compile testing as easy as possible.
>=20
> Rob


Without CONFIG_REGULATOR, the regulator abstraction doesn't build, which =
in
turns makes Tyr not build. So Miguel has a point, at least until the
abstraction itself is changed.

If that is not the right behavior, as you seem to be pointing out, could =
you
please comment on the patch[0] itself? I can then send a new version =
addressing
this.


=E2=80=94 Daniel

[0]: =
https://lore.kernel.org/rust-for-linux/20250627-topics-tyr-regulator-v6-0-=
1d015219b454@collabora.com/

