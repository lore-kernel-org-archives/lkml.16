Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9A228EC;
	Mon,  2 Jun 2025 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868846; cv=none; b=GJCd+2xhN5rGfwpQ7tkTouXnHvfLtbeSWufeoX71+t4jDjo2J+jyiEKkWKVngluZ05qkazl+ITOUSu2GeLb75xF1kEgFVSbT0LMkYxATdnaImL5kjhAlsdebk0edqHSClTnlwlSJhNYopUmPwclG8yp7TWtLWSACQYBD/VxFo4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868846; c=relaxed/simple;
	bh=m0jqnnWT/eYObbfkt03Mn80SkFQfHiRBFR+qG7H+q1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cXLWiTmzzQbZ5k4kUoOsAkqjmoQY6cHS8WPFdH+8I0cOP1Zr+C0esAWbHq0ponwluUSSuAwAd5xAqb69lFlGhGrw23foSmtoPfYM8o9OwOKhgR7jnAUXG/KzLGfJwF2g06Gqwm4dORoJVIuFU90NBYr9k2G2EhFG0REjW+17w40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLKl0K9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLKl0K9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D1DC4CEED;
	Mon,  2 Jun 2025 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748868845;
	bh=m0jqnnWT/eYObbfkt03Mn80SkFQfHiRBFR+qG7H+q1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sLKl0K9pGKuHOIYzZV1HiHAEHfK3WRnxNcxlCaCV0+rEcFI1mC9BOfqDA/sNWKcoO
	 tnMkgks+I7XVuLZPTytRccheF+fTZLUD/SBztZdM/a6CtX4dvZCaDBofMIcsp631VI
	 18sriU4v9LUv3yoZePaHicxO6mW0xMEg0bNUNwNfoCD7T5apqMsPFJQd4BuTrAthGJ
	 cPIxcjKFbHGQZnEURXfPOw/XK3JQFtcfSW+fY0tqLDwq6TD62UIdyMB+QrAgh/MLnP
	 xlIUqwjfUHdbE3S27mgpJCTdoiGNY5tj9lFHb7aoqMVtKWV2qVEjrQtI1CsumxtqpF
	 i8KpItvQThc9g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <aliceryhl@google.com>,  <tmgross@umich.edu>,  <dakr@kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/5] rust: timer: Replace HrTimerMode enum with
 trait-based mode types
In-Reply-To: <20250504045959.238068-3-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 04 May 2025 13:59:55 +0900")
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
	<8qkPFqY2HgZ9FxfkCnf9ruDp6DJu-Q6_jcy7ltHT3dG4vZx8HoowJTgYM78cpydwP1n3go6XXHAsPG1iBAabJg==@protonmail.internalid>
	<20250504045959.238068-3-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 02 Jun 2025 14:53:47 +0200
Message-ID: <87v7pe5mp0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Replace the `HrTimerMode` enum with a trait-based approach that uses
> zero-sized types to represent each mode of operation. Each mode now
> implements the `HrTimerMode` trait.
>
> This refactoring is a preparation for replacing raw `Ktime` in HrTimer
> with the `Instant` and `Delta` types, and for making `HrTimer` generic
> over a `ClockSource`.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


