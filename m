Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6727D771;
	Tue, 22 Apr 2025 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324323; cv=none; b=PaAPEA9GEk1c2AI0rilhnTSabPoV+gugbJz7eofTzPp29XkRD8uxaByJwDy0oZ4G8zOJV/PemlT4xiAtAAXXOaKNn0u41K0jkq0txudt96FRXSE5h75zAMW2aBUsRpEtq/+oC9lsRdFcSVHfo7d4KDNceMGygZ4xW/Gh1yBmLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324323; c=relaxed/simple;
	bh=b0Nhk3vAShab0d+vfPBjLrBPylBmRgabnM2I4Qf3Lak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D5yQy6rhknLG43oBDNWM6H0VRKP57d8YG9Jmv0giM8//tA1mwn1tPOWPnNmjVBpZgXe51kQwGX1VbKYsF5OuFZlQzDEdONxz6F/kExM3+X4SkXj5YMtEirYoiWzw503mgGyeQwA5i/ylUa9r4xn6N1dFgkCQN3/8Jwh+3iEHIwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXr0EX5w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXr0EX5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5552FC4CEEE;
	Tue, 22 Apr 2025 12:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324322;
	bh=b0Nhk3vAShab0d+vfPBjLrBPylBmRgabnM2I4Qf3Lak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DXr0EX5w71ACsiT9csgYRCmXKsuSAKCm/LE1feFp7ylMDqXMBmJ0DbIIuojP5c1jF
	 J7JpAw0rUGdegetWspwrpAnP5/2bZhdgzdDX3r+vIz+gcxTWA+ms4twpj3vYWf0ESa
	 Nhkh6aelhBJKYRzDDDPb9UcE6lIGSaHj/W8jmlNnH1HpQ4i/v5Eg8hxjCFad9fkiLq
	 bgMc4BMWJ/w0CSD9YxnwiBTOUxPQtcfvToazQZ89TPIIoYqkGz/oBqJuCwAQ7ey9oE
	 rgi7+XZIxHdwSFCrFhiqnblJV7O+nYGnrf2naogyWyfTUd7lr3gWhoDIYJ4V6fmr3C
	 48cNgQ5q+B2bA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
Cc: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,  "Boqun Feng" <boqun.feng@gmail.com>,
	"FUJITA Tomonori" <fujita.tomonori@gmail.com>,
	"Frederic Weisbecker" <frederic@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Anna-Maria Behnsen" <anna-maria@linutronix.de>,
	"John Stultz" <jstultz@google.com>,  "Stephen Boyd" <sboyd@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	=?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <benno.lossin@proton.me>,
	"Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
	"Danilo Krummrich" <dakr@kernel.org>, "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH v3] rust: hrtimer: Add forward_now() to HrTimer and
 HrTimerCallbackContext
In-Reply-To: <20250415201747.417825-1-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 15 Apr 2025 16:17:46 -0400")
References: <20250415195020.413478-8-lyude@redhat.com>
	<MqNEUgTO3ubRyR1tiumirBEhtJpQ7H2YmU4ba6qwwi5sEJLxHQkm-VG47aJvFOnSlKfW9NiAfebTIZM_JiHasw==@protonmail.internalid>
	<20250415201747.417825-1-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 22 Apr 2025 14:18:28 +0200
Message-ID: <871ptkbd9n.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Konstantin,

"Lyude Paul" <lyude@redhat.com> writes:

> Using the HrTimerClockBase::time() function, we can now add an equivalent
> to hrtimer_forward_now() to both HrTimer and HrTimerCallbackContext.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This thread contains two patch series. That seems to confuse b4. It will only
apply the v3 patch. I would expect to have all the patches in the thread
applied on `b4 shazam 20250415195020.413478-1-lyude@redhat.com`. Do you
think this is fixable?


Best regards,
Andreas Hindborg



