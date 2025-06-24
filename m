Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19054226D03;
	Tue, 24 Jun 2025 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750787823; cv=none; b=oy1lWMDqs/QamcnZ929VUIIIqZv1lfv/7eQeo1ZSkQsSsgQpif3vthFwVEQYPKis2o8EPB8ADkRnKpd754OPlUzMMQ3qJQEjUoMd6P8E4w32M8kueqvMQA+m8jn2Z1SvEZQft2b05mKnHk0EFgaBAyUmPfSX6dI4VmcrWWw4J3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750787823; c=relaxed/simple;
	bh=R9g8kQqV+KiQ4qTrp1QqifiikINChQu5KSwsFwL2DM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WFcyQdmXjsQrzsMcG9FJQtl/I5d9K3hRVl/qyoFDL3S0jX7gtUIAo7KBjmc1XOy4x7EszfU0te7T2Watpd59nClLufZaPY2/DyEBreG+K5sS4QCelPunEy6GMpU/KGuNdxvvO9RGtv4dAo88845grYmxIKiJ3/60SRBqzwA+rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZ5ui514; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZ5ui514"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA31FC4CEE3;
	Tue, 24 Jun 2025 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750787822;
	bh=R9g8kQqV+KiQ4qTrp1QqifiikINChQu5KSwsFwL2DM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VZ5ui514TDZxb9nc+0GjYmqRVHRPx0LzZK+fZhXm77NkppE6vrte4hNYCtLg/0Hpg
	 lLqqayuwm1WIBjz54URV9KqVhtlG8LiWPIvBdFtgwaYOm5xCtujg9W3ePAezpBld5d
	 +r//UbFiUW3qTWpbPaMooNm6ot6Pup1RyK2hPw2MWqjBfXIGFDurb7os0mVpwRgJMg
	 RwT2dFqfeIV9Fb+42/uA06dIe+USUsctAFwoHsqZR6nag+9CNdtAtWD5o4aTjyMpbx
	 Tb7Cpoz6Vy7Ctkr9zmHJOsZLpuvnvbeHHQUFmxNz5d1Ym1xeSu2iboUugkOkXTjKZ5
	 X9sH0UaPPuYbw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <miguel.ojeda.sandonis@gmail.com>,  <alex.gaynor@gmail.com>,
  <ojeda@kernel.org>,  <aliceryhl@google.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <boqun.feng@gmail.com>,  <dakr@kernel.org>,
  <frederic@kernel.org>,  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
In-Reply-To: <20250624.224130.2089845741064711087.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Tue, 24 Jun 2025 22:41:30 +0900")
References: <_dhT441zoMZanviBlUpcvPZEw7TiwB4v28ONPXSwi7WvEaMg_YJSmi5vRlLVaaUOujF7NOspxR0NYFLOHXud_g==@protonmail.internalid>
	<CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
	<87wm912sjg.fsf@kernel.org>
	<NrHeKJqwjFSpcF_2PKPa5kh4otoqBJTD97hA80afZiXD64Z1Ax6GqU3b_-vu9la9g2t6y2cdPFXdbnJELgO1uA==@protonmail.internalid>
	<20250624.224130.2089845741064711087.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 19:56:50 +0200
Message-ID: <87o6ud2fbx.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Tue, 24 Jun 2025 15:11:31 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>> and already introduces pain for
>>> others (and likely even more pain when we need to rename it back next
>>> cycle), it doesn't look like a good idea to keep it.
>>
>> Ok, I'll drop it.
>
> Do you want me to send the updated hrtimer conversion patchset
> (using as_* names)?

No, I am just about finished fixing up the rest. You can check if it is
OK when I push.

Best regards,
Andreas Hindborg


