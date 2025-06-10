Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B62227EA3;
	Tue, 10 Jun 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554787; cv=none; b=ff98BR2oTSh2eEvL+kBMRkkKnemLP+FL14u28eS7PrQgX+rSCtd0+U0RXbqVkneRqn+emHu5yXeKDpU1DJBTLtIXvPWQvOw/ppuA4N9jXR/YDyFk+4QVM1O77d5VIy6phs5/rk9z/3/klTPpx+Sh4HyCrCD6boqgx/jJnS3QliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554787; c=relaxed/simple;
	bh=GxsZzYir1KMfEhH5RfN4lHTXASP7zNQpZAH7Nyo4Keg=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=KwHEXDeARTcvlbdGuONQ56qdkAn2IY7qWOkUUOETeELw4dkJeHbcNq1j8vHlgfadcx14Cqo7BknIrZxIr4P4UJoefFJYjcbpxL57J4SZ6iv5hB1WPpXBYAJyjia1u+caXXWf4LkhpIIN2AglErBWPIqHYGSOsLmPqA10UHC56n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZc0yeUu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZc0yeUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F221C4CEEF;
	Tue, 10 Jun 2025 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749554786;
	bh=GxsZzYir1KMfEhH5RfN4lHTXASP7zNQpZAH7Nyo4Keg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cZc0yeUuxAitMPN5cmJ4zwn2DNzU0UCDDDT+ay1AxzmG0WUsw/vTis57P87rnuBIL
	 YL0K9dMnQ2N8NlrvAnjxHrVVN+g7KmGK2SiqARRjsF90UWmIRm0nk38ohykoJZ/fJy
	 /+3nuMum8dHbn1gswpazaT33xnIOcbT5ewqUPFPNVEoxVmLwQgiJBoyJ/Xz1VgRSIR
	 ZiUQWXQlceum5bScnY4+emqi4H0Fd0lnNIxol58i/P3gvh+i8uvoihVV+TyZD1j8WU
	 uFCoKCe4BwCzDGoU/NIidWSgTttGYZWFgxVz8RFZwt/k30FWBjLIdwd94dcPs4nhIe
	 0vKpwlzlP/aWQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v2 3/5] rust: time: Add HrTimerExpires trait
In-Reply-To: <20250609102418.3345792-4-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Mon, 09 Jun 2025 19:24:16 +0900")
Message-ID: <87tt4n27ss.fsf@kernel.org>
References: <20250609102418.3345792-1-fujita.tomonori@gmail.com>
	<K5M7S7ssDaLr6zxAhr9sU_mZ3uDRnO61lGHpZ9mDfuxbAa6b3L8Duhueu-dd7_nzgf2WQ6Ej6TFoxqPmwRAqKw==@protonmail.internalid>
	<20250609102418.3345792-4-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 13:24:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Introduce the `HrTimerExpires` trait to represent types that can be
> used as expiration values for high-resolution timers. Define a
> required method, `into_nanos()`, which returns the expiration time as a
> raw nanosecond value suitable for use with C's hrtimer APIs.
>
> Also extend the `HrTimerMode` to use the `HrTimerExpires` trait.
>
> This refactoring is a preparation for enabling hrtimer code to work
> uniformly with both absolute and relative expiration modes.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



