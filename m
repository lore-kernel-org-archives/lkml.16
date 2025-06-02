Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CA37485;
	Mon,  2 Jun 2025 12:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748866791; cv=none; b=kWoIuxJUJeK2yyDlj6GkAop7Z79reX/4HePHVjugTPFN5wKmn5FPc2JZ7HNCkH2ucNQ0QWBoJlaXGw+ykvhUFDJdpu69FodQzvc5RoZXbsE+yXlgvZ6M+8hAUERIQtIvwavq7tiH/B4g2NqpD7+fqORhd2RNBnkHIHU1oaC152s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748866791; c=relaxed/simple;
	bh=hYGbZ3dbO6ZoP7QIgrKOPGiWVeikFH6C7J7ujKVsfYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EwofNr/8he6TX+Kh/YD3v2qxPcwIxWbMzhGhdDmzGBfBMC2sMIlJ31qZFlNdoawiXw+vw7FK0PFOckhHDjpNASyckVuq/PpYMByF3WoTChUznG/TtB4nbw8vFvBRZz9a94XJqjIIoVANNzDb74Af0RGCj2iFMvTwKQYd7N3qjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUgRIhQ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUgRIhQ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6096DC4CEEB;
	Mon,  2 Jun 2025 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748866790;
	bh=hYGbZ3dbO6ZoP7QIgrKOPGiWVeikFH6C7J7ujKVsfYA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GUgRIhQ57+n/rSC1MPGY9crMDlvPjKnRRBomt0rMuD9m7KrNKrd+tz8BsfXG71FRR
	 vIfVGtl7zG11/taOSwb+da/pYjbNqkfIQh1smqhJmRcnVl5qad0gfiTcdPa6iqPY+6
	 x0LkUvayA+fQ9CdSyBfKahmqBSFOYijlzwFTFyI7DP3sWQZJLDU0D07RK8LJra3QsJ
	 Im1nKknxDK/t8W6eCOtvPoUeS9HBie9luFK0/SJuno2IHXsafZEKcmR21sHHmoliQb
	 KEO84CbCvRb1cFKNc8wxEbdPKKDzAUJAVWJEpwzNhA34ZZx19AT9kx0TWMA2+stig9
	 +vT3JAXVm5wfg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <boqun.feng@gmail.com>,
  <frederic@kernel.org>,  <lyude@redhat.com>,  <tglx@linutronix.de>,
  <anna-maria@linutronix.de>,  <jstultz@google.com>,  <sboyd@kernel.org>,
  <ojeda@kernel.org>,  <alex.gaynor@gmail.com>,  <gary@garyguo.net>,
  <bjorn3_gh@protonmail.com>,  <benno.lossin@proton.me>,
  <tmgross@umich.edu>,  <dakr@kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/5] rust: time: Change Delta methods to take &self
 instead of self
In-Reply-To: <aD1fgizC4FPT07vt@google.com> (Alice Ryhl's message of "Mon, 02
	Jun 2025 08:23:30 +0000")
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
	<20250504045959.238068-2-fujita.tomonori@gmail.com>
	<Mt0LwmRyNV7VeUvIiRpECX8VzX1D-BG2wI48N58jht_p7RwsCKlrAM1nXjlqUdVIe3cXdhia_xjlVOav1TikdA==@protonmail.internalid>
	<aD1fgizC4FPT07vt@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 02 Jun 2025 14:19:38 +0200
Message-ID: <87cybm72ud.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Sun, May 04, 2025 at 01:59:54PM +0900, FUJITA Tomonori wrote:
>> Change several methods of the `Delta` type in Rust to take `&self`
>> instead of `self`. These methods do not mutate or consume the `Delta`
>> value and are more idiomatically expressed as taking a shared
>> reference. This change improves consistency with common Rust practice
>> and allows calling these methods on references without requiring an
>> explicit copy or move of the value.
>
> For small values that can be freely copied, I actualy think that using
> `self` is more common Rust practice.

Besides best practice, the value will pass in a register. There is no
benefit at all from passing a reference here and no improved ergonomics
from using a reference.


Best regards,
Andreas Hindborg





