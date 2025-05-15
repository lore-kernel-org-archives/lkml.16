Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E628A735;
	Thu, 15 May 2025 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299600; cv=none; b=PqdbHhDgirf3TrizqUdipF+L3h7lbFRAVHI9LCuv6O5xl5+9BZcZWa3xEy01BWfnVXY8oX457z9EwJrYs75NHCnEJoZGyFRhI2s5ggvKRv6Lb3XZf5HNnVVUpks72evITGXQ08xTv2o30RLqlD9oF/CqaVZP+cLTcp32c5Ryh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299600; c=relaxed/simple;
	bh=rHy4emrIBLZbJ3QtrnS37i1Uyh6E0LFIHII0qhsVPRU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bSlhmPZ8O00aTDK57smNBOFDbKOp/rVwPW7Bb1Cs5q8NCT0dfrohTpkeAMUXaDRVDzJvkBIPiSxMHv9WA4LMFr2kaV3Xwh+QI3q43TShxIYWCY5P4hX3zABPTCCYVqvhZvPAZ2D13rcj1PnhQKZDk2PbUVgqK6J43J6weImHD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPZHrRFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPZHrRFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5022EC4CEE9;
	Thu, 15 May 2025 08:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299600;
	bh=rHy4emrIBLZbJ3QtrnS37i1Uyh6E0LFIHII0qhsVPRU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=cPZHrRFZwUiZpLDBAHEXVEO87FttS6GNGCHxlZY3SXhnK8MUFjvRF4PKjohYjT0d8
	 XDHH6zo85WbnxuwsDp1F+ohK0FO8+74FyV5ug/lwUuMeuAg+QQJ/5mkbCfujrv5j8o
	 8mtD7LBqP4PGnAtXKzO6r/q9cdo5H8+AQitMrhgVKW9onRURFFRNsvsOg70Ox5SH1A
	 ySHXzg5zX+SL3larrBRlkJZ79Y4aWuGXRj6G2d49alkgzUGybcBxwAWhR+Ty2fBZC2
	 dxRJ9tc1f5aQGzCplH9R5MwQ9DFhmJh0uG5H/i6Vy1I98lA9HtTQ7L5o/4DQOX0Nh/
	 0q+BcRyFvl3sQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 10:59:44 +0200
Message-Id: <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org> <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
In-Reply-To: <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>

On Wed May 14, 2025 at 11:55 PM CEST, Matthew Maurer wrote:
> On Wed, May 14, 2025 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org=
> wrote:
>> However, I really think we should keep the code as it is in this version=
 and
>> just don't provide an example that utilizes ManuallyDrop and forget().
>>
>> I don't see how the idea of "manually dropping" (sub-)directories and fi=
les
>> provides any real value compared to just storing their instance in a dri=
ver
>> structure as long as they should stay alive, which is much more intuitiv=
e
>> anyways.
>
> We can't easily do this, because dropping a root directory recursively
> drops everything underneath it. This means that if I have
>
> foo/
>   - bar/
>   - baz/
>
> Then my directory handle for `bar` have to be guaranteed to outlive my
> directory handle for `foo` so that I know it's didn't get deleted
> under me. This is why they have a borrow onto their parent directory.
> This borrow means that you can't (without `unsafe`, or something like
> `yoke`) keep handles to `foo` and `bar` in the same struct.

Is there no refcount that we can use instead of borrowing? I guess not,
since one can call `debugfs_remove`. What about a refcount on the rust
side? or is debugfs not used for "debugging" and needs to have the
performance of no refcount?

---
Cheers,
Benno
