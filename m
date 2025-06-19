Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45918265637;
	Thu, 19 Jun 2025 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750324331; cv=none; b=B0sC3GgKQ/0RqOSbGQxFKQV9HSyl/EO0ShXCdcB1YWIZNvxShWwPFg5hk1IumkOHMi4QwGTM5DtNNpHOhBzE3ro3KmZueRSwBpggiCEKIH26PuJQ51FoLX5xO7XXl/dOI6GbpjTNsuDmiSKAp9wqsD5iGroL778vvsG4SMSjJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750324331; c=relaxed/simple;
	bh=Sg8ZB7zRTaiF7VwfD5YzBa2ZZKB3AIitrYiKGX28tEs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KOjiDpvMqcIFkNsFfKeLzP94sdy3PlgQnDNtVoZKJZp7GoNja7FNLjdh8ftsCub/EfNUIVawK8SUb0+LpSyKDUUggXC7S3wFhWDL5A9nbTFVjr63QQotkRLAJeA0z6T7CvBRAbLaWQlCjkFguklF/3RKXBZgKxFjc3clB+M7cMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VV+iVEfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VV+iVEfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EF3C4CEF0;
	Thu, 19 Jun 2025 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750324330;
	bh=Sg8ZB7zRTaiF7VwfD5YzBa2ZZKB3AIitrYiKGX28tEs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VV+iVEfI7PHeUD+vb+B7fM96kXSOkyqvXhIaM6hD3V13xEvzKVRh8SpKmA5fp0+BU
	 m4t/ziGLzHd70NqAO1YXFUu0Ql1q4bwTJW9oB/XxN/2HM052o+NCiTnmnS2+Ak8J9U
	 f0Ry9L5cVn+/zzo5zupS0xJNxCgI9Tyx8xx55NBuZaJH1AZO9Me7hIQnC6k/m2eDFx
	 vyWpobaJWX63QvWgChle1DMGm/iMyOrJu1NK6HKSL28hs1C+ZEEgqEeSMCqyV4wrt/
	 8c/SwLR1NCkueqn18i9AeujB9tylvQec7YjdBmSYoSxZ82AEny+nI6qA+JfANI9vBP
	 Runh32eDM/K7Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods
 as_micros_ceil and as_millis
In-Reply-To: <20250617144155.3903431-2-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Tue, 17 Jun 2025 23:41:54 +0900")
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
	<nGua2ftAnkipxGpZlW-9RYB0309pR0BxmzzR1rUx-LWFRRaiuycAACIWx6mPAp9PQcxmF5d1xC14XIu5flxBiA==@protonmail.internalid>
	<20250617144155.3903431-2-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 11:12:00 +0200
Message-ID: <87o6uk859b.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Fujita,

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Rename the Delta struct's methods as_micros_ceil() and as_millis() to
> into_micros_ceil() and into_millis() respectively, for consistency
> with the naming of other methods.
>
> Fix the commit 2ed94606a0fe ("rust: time: Rename Delta's methods from
> as_* to into_*"), wasn't applied as expected, due to the conflict with
> the commit 1b7bbd597527 ("rust: time: Avoid 64-bit integer division on
> 32-bit architectures").
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Sorry for messing up your patch. Since we have no rules against rebasing
rust-timekeeping and the PR is a few weeks down the road, I will just go
back and fix the original patch. Keep commit history clean.

Best regards,
Andreas Hindborg



