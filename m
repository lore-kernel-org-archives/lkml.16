Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D7211460;
	Fri, 18 Apr 2025 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960426; cv=none; b=Xm0LkjJC40R4Ldq4VBmgISN2N/YYBNM+xbZPZLpPEvklaNUmOPhCh+EwgniW3F0mLSK6TC8oi4AVWp9qajG/GbYKkOM3D0yQ4m892Ws6aY/zlIHjWoB+5BP84qwYKWUSZGaa0Y814rGTV0572y4X3Xs4gmFDY7xqY/jYqcbpqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960426; c=relaxed/simple;
	bh=uJkWXSyuVjsPWx7cVZ2isYIFsLgnAz8EaRO6ThBlePU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKMFXzmwsgzjXoeHWRYPU5YfdewOrN+kGY++eDS/jRDmm3tyD33ygNTaIcAEV2dYXvI+OljWxAMmbZuoA0eXc4X0O33uULHGmqjMZsFopj8jKVBhfs9SvX/AS92bgmddBNQ+GVAAnmLvSMP6roXt0W8r6mA22EOBfrKH5gC5ooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXRLb6Nv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXRLb6Nv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A61C4CEE2;
	Fri, 18 Apr 2025 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744960425;
	bh=uJkWXSyuVjsPWx7cVZ2isYIFsLgnAz8EaRO6ThBlePU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXRLb6NvB5Rx/SdmFnbnx+NXBmOxwpz+2mV2JJcypZ7bdQIZzZCxK2GDXTX7eVIqC
	 rBxBhKURHceQZzz+JHUXpDzhqGsr3H1jHj6eHFCDaubsKWptUtBb+Pv9jTu3aJq+4v
	 Sic6IskDMnmv7jRHtqY4M5dd63/27kf5J9ydodn8qqxFLEpDiVdpupNsDr0x2OYHp3
	 dKUL7uLG25Yl1bu2g0faGNHiDUHpq+Ba9B4AjgeyI5MT7On+fVjqI8r26pTgUZyJmy
	 HjNlVLH3VnyjNrw1vs2UQfFcRMbwpRy48tP0F3/Mh0TB3V1ioRjva9Hor6TxgQvpS3
	 QJM4eVG2sNacA==
Date: Fri, 18 Apr 2025 09:13:41 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Lyude Paul <lyude@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 01/10] rust: Rename timer_container_of() to
 hrtimer_container_of()
Message-ID: <aAH7pUGHgwi3NXv6@gmail.com>
References: <20250416090544.3311613-1-mingo@kernel.org>
 <20250416090544.3311613-2-mingo@kernel.org>
 <CANiq72kW2xps1Am5HEe4+uPykFjm2Pf4kKoGWVNjVkG4HSmH0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kW2xps1Am5HEe4+uPykFjm2Pf4kKoGWVNjVkG4HSmH0Q@mail.gmail.com>


* Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Wed, Apr 16, 2025 at 11:05 AM Ingo Molnar <mingo@kernel.org> wrote:
> >
> > This primitive is dealing with 'struct hrtimer' objects, not
> > 'struct timer_list' objects - so clarify the name.
> >
> > We want to introduce the timer_container_of() symbol in the kernel
> > for timer_list, make sure there's no clash of namespaces, at least
> > on the conceptual plane.
> 
> Andreas should Ack, but I quickly build-tested it and it looks OK:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thank you!

	Ingo
