Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6209170826;
	Tue, 24 Jun 2025 19:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791815; cv=none; b=OMpuBG1uexpAjy42C/CVGomDb552QVV09Y8NpX5H4edarqRrnUjMQeu64LfdkP9Xs3P7+Mud+uMuZ6jLAa82tho7Ppitl/EgULu1lL7FsIgrlOyD5Qs00ff6rxIhpSbEUnNgYZ97PtZKPA8VTmHiMABk0BeT8H+yGYJ+gqEg4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791815; c=relaxed/simple;
	bh=kxOa7FyXEDKy7RG2L0lqYalsa4MpC74s6Q+Y7frh6tk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cbrgLHU94z4RQK3Mrhxffz2a06M0sxn/iGzfEymQelTPcMUzbDdWKcMLgkOVI3+s46IetsLjnN28kmsydaQyn3hlCr620xNO42UWM6fVuf7rd/zbcD5f0h95GYZgE/SDyI4JdqtYs3qBnbZVBsfjZ/EvHcFJLMs+f7m7ZCOipmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AooYWGYt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AooYWGYt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72BCC4CEF0;
	Tue, 24 Jun 2025 19:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750791815;
	bh=kxOa7FyXEDKy7RG2L0lqYalsa4MpC74s6Q+Y7frh6tk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AooYWGYtLTqSYu/m3CO7vZx7qc4EFJ1F8AJwop0w7cYhiLPtU/ReSCzjuSQTxFoK7
	 MgTHjuY1jH+3uK4hoviUXdEAulgmwT32klIQB3bIiWFTTZuA2mSazun3OrMaFw6sgI
	 9lLrD6SZQopdlpEBUfH+MqqsjEx2DVgAzpRh7Y1/5qoQEtqaszWJO/9EPdrah08cjZ
	 hoCNBGDW4PBXpWpYSUx72Kt7ZjVfFegARY83qNQ4e4+qEvTI3oS3weDnuFXHYI/l46
	 +cYTx+G1mpR/MeTWhSf4riXLKInZFXD4U8KRuKhjWEblGoVxVPYX5qmZBGe2Zn/T/G
	 zjxziD0ZBFmsQ==
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
In-Reply-To: <87o6ud2fbx.fsf@kernel.org> (Andreas Hindborg's message of "Tue,
	24 Jun 2025 19:56:50 +0200")
References: <_dhT441zoMZanviBlUpcvPZEw7TiwB4v28ONPXSwi7WvEaMg_YJSmi5vRlLVaaUOujF7NOspxR0NYFLOHXud_g==@protonmail.internalid>
	<CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
	<87wm912sjg.fsf@kernel.org>
	<NrHeKJqwjFSpcF_2PKPa5kh4otoqBJTD97hA80afZiXD64Z1Ax6GqU3b_-vu9la9g2t6y2cdPFXdbnJELgO1uA==@protonmail.internalid>
	<20250624.224130.2089845741064711087.fujita.tomonori@gmail.com>
	<87o6ud2fbx.fsf@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 21:03:24 +0200
Message-ID: <87cyat2c8z.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>
>> On Tue, 24 Jun 2025 15:11:31 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>>> and already introduces pain for
>>>> others (and likely even more pain when we need to rename it back next
>>>> cycle), it doesn't look like a good idea to keep it.
>>>
>>> Ok, I'll drop it.
>>
>> Do you want me to send the updated hrtimer conversion patchset
>> (using as_* names)?
>
> No, I am just about finished fixing up the rest. You can check if it is
> OK when I push.

I pushed it, please check.


Best regards,
Andreas Hindborg



