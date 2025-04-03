Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FFE746E;
	Thu,  3 Apr 2025 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679516; cv=none; b=fvl70JA9rHeUiiqtAqrIQ2+wCe6JHhDPq5nUCoTT4Wmp9BGQJDDwLJVHPhyO9zJWLJH4jEmKiDqCGrImSLedrkhsIiI6z+R+n78aBITN8RufqjWxKIJKUDYUvNU2O5h0DQ+C7BIl7+Jr7vTg/kgL1otbBARzWCFiu7ukRiHrk1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679516; c=relaxed/simple;
	bh=EuZ+j/p5Kjpkon5TC1fOuctt/+lyQadTgl93X/5cuxU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZMEAvXOf/bYgkDf9k9gk4KMyqVQ8H7wV8EADJMhE8mscIHpEdZZqbnwxre57eDDHtffbjwJqPeNvDFnKLpIABWkB/0+L3SRBc+fj8kd6lXvWP4Y1XIiSIhojt/+mg7ipqItvyTJhyDBySWvTM9/CwSEyklT8UixdyJtcadI8WOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n3AWHpfT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4LpooKsa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n3AWHpfT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4LpooKsa"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743679512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1CU08XZD9aPjBvEmJkWRSp3wodCdCDRuOTIfkOuRKfY=;
	b=n3AWHpfTTeNmOK7ECLxCEqFtm/rX8Szwt6FAYUHmky9T4h3S4CzG2oHBwGmenORLgvMuQ6
	YVd6/zf0GHxsDTypI1zF/iTu+WRHQnKxgylcMbZXPbfVybpTB3Nv4frt5e36aeX8MoGx2c
	AqjhqPKNp0OVMGJrEAsy7YdfIoJEynIztuWAx6Tf9ZzUdSnle7iw9RFL0NT+nxCqgZVHjO
	WGQX0KQVFoxrj8OHzSLyuR26LwpvOdoVRjaFK5cm2G4RLQKInOpq8577VhJEoI3FtQLYpL
	k9i/SFcr0raLMzagBZV1I1C0T8AwC1oxzAT/m6lqaowK2P8do8667xeHOnr66g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743679512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1CU08XZD9aPjBvEmJkWRSp3wodCdCDRuOTIfkOuRKfY=;
	b=4LpooKsa4fho3VUxl0T760YjzVDkltIpk/yf3eEm+fCFUWwO7Vt2mPGw4yRYDhqCtB8TwW
	gP6pjwft5ZwZwrAw==
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, Andreas
 Hindborg <a.hindborg@kernel.org>, linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>
Subject: Re: [PATCH 2/6] rust: hrtimer: Add HrTimerCallbackContext and
 ::forward()
In-Reply-To: <20250402214109.653341-3-lyude@redhat.com>
References: <20250402214109.653341-1-lyude@redhat.com>
 <20250402214109.653341-3-lyude@redhat.com>
Date: Thu, 03 Apr 2025 13:25:11 +0200
Message-ID: <87a58xwkq0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 02 2025 at 17:40, Lyude Paul wrote:

> With Linux's hrtimer API, certain functions require we either acquire
> proper locking to call specific methods - or that we call said methods from
> the context of the timer callback. hrtimer_forward() is one of these
> functions, so we start by adding a new HrTimerCallbackContext type which
> provides a way of calling these methods that is inaccessible outside of
> hrtimer callbacks.

Just for completeness:

When hrtimer_forward() is invoked from non-callback context, then there
is not necessarily a locking requirement. The caller has to make sure
that the timer is neither armed, nor running the callback.

     hrtimer_cancel();
     hrtimer_forward();

is a legitimate sequence, if there is no way that the timer is re-armed
concurrently. That works just without locks.

That said, I really like that callback context concept you are doing!

Thanks,

        tglx

