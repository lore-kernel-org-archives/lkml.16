Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A124501B;
	Mon, 30 Jun 2025 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291535; cv=none; b=WSfSh7oWk0KHQMETUk2f24hOSmwdhRfiBE05gpORTSY5LuJ+8pQHM75GKqSlhEXXZQJa+saYRlok3//N5ka41Uezf2Y44EtIKUmVLfHQewAnjKFlTnQUM1P58qmO3Lr9HtwVaxrWXGet7ahfYe/lbkIcAOB3x3CxfbaiRtqPf4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291535; c=relaxed/simple;
	bh=ZVhB3F1syAlanzOC6BWsCKPObUTNq+Hyhjr2MG6+qSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmYNRRU1t37PMLkA7F8jze+P4z6T0vmrkfApMmF7O7SOWhiyDqBZE8L/OslUDLJsuNNKl6UfQ7Dw6Fi9nOblwcr7UkZEDex1YR2miKVM3rLqfQDnjzd4Qr7ZU2ggwegK4wrNMA6SJxJmCUjI/b1/vfHO61Mxc2u5/qJ9bJ1AxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9YIoM1x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9YIoM1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782A3C4AF0B;
	Mon, 30 Jun 2025 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751291534;
	bh=ZVhB3F1syAlanzOC6BWsCKPObUTNq+Hyhjr2MG6+qSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E9YIoM1xJuly1I/dqa51OQkNl4Pi4NI1j6j69EQT4QFCPW8W6CoTn7w5Qv0dOYAiD
	 7ocdY9La4RXt7q9Lopk8tf++CWlPngmICp1xPKQyi5hgj6YbkrU/9DEVNb1FtMqOXU
	 lW76+RyOxkPsDkMiCwjQgcINbxodWthxxsbKFr0dn1AAeUTxkTUP5EBI58AoS1JL49
	 KWYs+yOHScN7Ea4TDnaux9YUJItzab8iycc2c/KU0jBCuOqsFmSeu6pm7yRDqXKtC2
	 uP/xBnHHv4QjFyPWC7x/NFXr+aoB/3BX0VwnHyl31/DwM0gw0BeUo+LKyUzhVl/TMA
	 anaBh/ll7LD5g==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso3623650a12.0;
        Mon, 30 Jun 2025 06:52:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6uDdS/XnIYn78YK8c/ERBU0/Oq83Ed2UbgqiWWeggQRVEshq+N7xdYZdhXIY1bC5+eq3ldy+cfTZkG3eyZiI=@vger.kernel.org, AJvYcCXRiC2tPLStvNSz7JzOnRvlkK0sUFeHaf79Q0pyBBKy6KV7vHvRQ6SWQOUB47j7oR9sal0LI/Sqh64tFKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyC23E1i+WB6nw8BTKt/gcxRjvz0qxst7zFAqvKLaqPAbo7cK
	3SuYHA3w1oqOlmlTrRH/+DQIvTLsVg2KdbxIioiOjZ3o1Q8UPxmTqHiDw5DSnOhCS01HyKkV7wF
	6A84gD6Q2rucsZXkR8981S9rrzxPX/w==
X-Google-Smtp-Source: AGHT+IE+9b7yISVeOJPhqJjR1jJvgc4yFdOFlIaPB6jTLtq6nW6I8YOwe3YIoEFXDQ2vXwDapLz3Dh1QuhBBSeBl2pY=
X-Received: by 2002:a17:907:9d17:b0:ae0:b7ef:1c11 with SMTP id
 a640c23a62f3a-ae34fd33723mr1146744766b.5.1751291532815; Mon, 30 Jun 2025
 06:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com> <aF8lYpK_l2I-ts1k@pollux>
 <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com> <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
In-Reply-To: <CANiq72mgt4ZD43Tm2bFr-gpicXMhFbC2DLqA6F0rN_J4rAe_CQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Jun 2025 08:52:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
X-Gm-Features: Ac12FXxJ9AdtyAFgl_713aw6S2x8PYt3_96u_vQFqbnBdmLeQkUoEpEUgENKmhY
Message-ID: <CAL_JsqJktA2F4y8YFfZ5FzrwrJbtxkbiqts1LWT2KvXLSSDLjg@mail.gmail.com>
Subject: Re: [PATCH] Introduce Tyr
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Stone <daniels@collabora.com>, Alice Ryhl <alice.ryhl@google.com>, 
	Beata Michalska <beata.michalska@arm.com>, Carsten Haitzler <carsten.haitzler@foss.arm.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Ashley Smith <ashley.smith@collabora.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 4:31=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Jun 28, 2025 at 2:13=E2=80=AFAM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
> >
> > Also, for some reason the Clippy lint did not save me this time.
>
> Hmm... it should -- I tried to build it and Clippy reports it. There
> is also another warning too [1].
>
> I see the compiler reporting [2] too.
>
> By the way, do you need to depend on `CONFIG_REGULATOR`?

No. Drivers rely on empty stubs for all the providers they need. It
would be pretty unmaintainable to depend on all of them. You want
enabling drivers for compile testing as easy as possible.

Rob
