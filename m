Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329711F0994;
	Thu, 10 Apr 2025 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266119; cv=none; b=a8p4tqoSACTTR5K/nHft8YstiR+Fl79JaJLHC5MIdKyyjROnCN96jPR5p+/RJoerQZcIS1yE3NnbzBOZVkwpn55YJVMdnJ14wl3OleBz3V2tSyaCa7ewtbyjIYhp7t8dYep4Sx+zOJvcdsbcR5NYNlWPj/L6CjmTw6ZT0KIT84w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266119; c=relaxed/simple;
	bh=5CJz9fYb95MeBui9R2eQsn2MgoafDeFGkPMgQL7ISac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ki4X9gj5NIkcotzjRjWs5LA3HxZK2rQEsX3ngulsRf8JeQ2MCsytLD9QI1/Y4gohDLbMX9gDCPi9IWAycW3tIOqIq0UpnZaGCct47AhVEjnd3roEs53lfBDyLFOh8D3SOK6svSTxKWbcKYyRZgw8zddwdVtY3LwvddBbQpyKOyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goyAkGZb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goyAkGZb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C6AC4CEDD;
	Thu, 10 Apr 2025 06:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744266118;
	bh=5CJz9fYb95MeBui9R2eQsn2MgoafDeFGkPMgQL7ISac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=goyAkGZbelh+r9vjwSDSOFxTd0o8RAvAfKKkR/GCsgPosE5EW8+nowJIur3HZk1A2
	 kmUpCqivFnzHwr+R9Xn4FozqxEN2jOBrPkjMURUqw3xJR1cHlhIhPITsau/lvQU1fu
	 HpDQEt+07dqGAD3T+zC7LnvLDfyuoC4XoxoaeHxZvmN4vRbDp3DkIAg4T6bLbd6xBV
	 CSgkT7JpmmhAtchvGJV577WxLOO62D3Fh6yEBSuzG0ehe26Vm11e1WWgmqSmPJOgi9
	 +tppDpHJ4HxaUbRNHVL89v1FxXxAhFS5Kz/Ob7VgOQyBWNbUD6U/2VD3qBxFcsjxo5
	 sajX2qvB2x7mw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "Frederic Weisbecker"
 <frederic@kernel.org>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Anna-Maria Behnsen" <anna-maria@linutronix.de>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 2/6] rust: hrtimer: Add HrTimerCallbackContext and
 ::forward()
In-Reply-To: <f4a220eced4a1b9df77055b8262612a65b15bd2a.camel@redhat.com>
	(Lyude Paul's message of "Wed, 09 Apr 2025 13:15:13 -0400")
References: <20250402214109.653341-1-lyude@redhat.com>
	<AVQT2wHP9t48ZH5r3ywLh-pwv0IGUraoDxWO8KXcxL_y3mE-0YmWlQjLMvP6JBYxG3_1SYJL4Fxp1jc788HniA==@protonmail.internalid>
	<20250402214109.653341-3-lyude@redhat.com> <87v7rej2n5.fsf@kernel.org>
	<ofkrywngVbnZefTyPMlUmu-wcbxEbFB0MAOMAgFOsTMwFjfpEYJqQAFBP14MabYmHMaDBWkB1rBgSxGCJOyy_A==@protonmail.internalid>
	<0baafb97ec786c01c1d44270dd211537105922b6.camel@redhat.com>
	<87lds993l9.fsf@kernel.org>
	<c1fe401de60546c5de23229ecf7dd639f71ff938.camel@redhat.com>
	<C8RKDjsuiNTvDBJM5TX0QHCOJTd7SDxKeSPJozPYgvqWs9ue8gjMtJvqovi8cNfDOWAPfqLG8gynTCxCYzOiew==@protonmail.internalid>
	<f4a220eced4a1b9df77055b8262612a65b15bd2a.camel@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 10 Apr 2025 08:21:49 +0200
Message-ID: <878qo8bkoy.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> On Wed, 2025-04-09 at 12:58 -0400, Lyude Paul wrote:
>>
>> Pin<&'a T> is noticeably absent, because I'm not sure it could fulfill these
>> requirements. That being said - assuming we fulfill the unique ownership
>> requirement, I believe that for all the unique aforementioned types it
>> wouldn't be possible to take out a timer handle when they're in scope anyhow.
>> So we probably could skip the cancel() call?
>
> Nope - realizing this doesn't solve the edge case of "what if someone tried
> calling a contextless forward() from within the context of the timer callback
> itself" since uniqueness doesn't actually mean the timer is cancelled. So I
> think your suggestion of returning Err() if the timer is already running might
> actually be the way to go here. I think we would still need to ensure
> uniqueness though, since that can at least guarantee that the timer won't be
> requeued between us checking it and before we manage to call
> hrtimer_forward().

We should not be able to obtain a unique reference/pointer when the
timer is armed. In this case the timer handle will somehow own the
timer, either directly, by refcount, or by reference.

At any rate, you can add this to the current series, or you can submit
it later as a separate series. I don't think we need to stall the
current series till we figure this out. But it is good to keep it in mind.


Best regards,
Andreas Hindborg



