Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329EA239086;
	Thu,  3 Jul 2025 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546058; cv=none; b=e53XcQbdLxwOnSLnjE5NzMfGLKIPt1SnnQ7qzrCyFdhRcLHW1jYs5GXjv5UayuGBWJKMH2RKmXIh/LMHtMdC3YhfYSYncAHEt529Ijafp7n6AdJCj9n2JM9yr/gdluXWJ2iAtQMzPF1Q5CPkr54AbBx28VcJvfeZFZbpqJ7u+6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546058; c=relaxed/simple;
	bh=h2sUJzSTaZC2MeE5OfPRzElg2P710CdqCzhkJWAhzgE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ElW1FhLO05hdfvkV/PNJb4N18ZVttb4lXRzv9/Fq53valCEMDrBW7oDmAOu9nncHqbU5t0hQj+UAvLK62eUZt6yxfsGB9e7CAaLJIgOZ1pGb+p0lPX1igpXu1oTeJB+EMNYnDFB3bGHfZYJuYUmVpDh+SM1ylIbb3uMiXu466VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWZZoVNl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWZZoVNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE0AC4CEE3;
	Thu,  3 Jul 2025 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751546057;
	bh=h2sUJzSTaZC2MeE5OfPRzElg2P710CdqCzhkJWAhzgE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=oWZZoVNlsTIk9SSvkHJgsqbacuisvsg6avU+Iu0E9UqVsOSVMmyZj7dhoMsGV2YZV
	 CyTY22BAOYiGgJBG1R8EYtRUPILcENVwX/09OMgeXdOVQYhE/VPGS0qkZj9l6aqM4D
	 02DmkfblFIDPotgdOHjWkSjPGSrP0d/DPfdASWwbFwfodJWl9Fafu0exuLLwB5oLj7
	 pRdbYICxZ2rtATygeXd1RQDKU7kah5sPN+KruJrx3m2qdMmHdR6h/fkEze63zgnyhG
	 QTVeAGXG2ZCNAsl6HnP6Q+A8V9jfzsfTBp2egB9Knw6yblnJ9E9sBeFSqOjgWT3wSH
	 /4Lz69wEdUEUQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 14:34:13 +0200
Message-Id: <DB2F98GJQMTL.3UMZTA6FR7BA@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Matthew Maurer"
 <mmaurer@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
From: "Benno Lossin" <lossin@kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alice Ryhl"
 <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux> <aGZVUqangIR-c4aW@google.com>
 <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
 <2025070349-tricky-arguable-5362@gregkh>
In-Reply-To: <2025070349-tricky-arguable-5362@gregkh>

On Thu Jul 3, 2025 at 1:41 PM CEST, Greg Kroah-Hartman wrote:
> On Thu, Jul 03, 2025 at 12:54:18PM +0200, Alice Ryhl wrote:
>> On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Benno Lossin <lossin@kernel.org>=
 wrote:
>> > How would your example look like with the current approach? IIUC, it
>> > also wouldn't work, because the debugfs data can't be mutated?
>>=20
>> I would store a bunch of `File<Arc<Process>>` instances somewhere.
>> Each one has a closure that takes the spinlock and prints the
>> appropriate value.

But you could also do that with the pin-init design?

> Ok, I think we need to see some "real" examples here of the api in use
> before figuring it out further as I'm totally confused :)

Agreed :)

> Yes, we need to be able to have a debugfs file callback handle a mutable
> structure in order to lock things correctly.

To me this seems orthogonal to storing the value in-place or in a
`ForeignOwnable`.

> We also need to have it be mutable so that it can MODIFY the value
> (everyone seems to forget that debugfs allows that...)

Well that changes things a lot IMO... How does the C side usually handle
synchronization here? Does the driver decide that the structure exposed
to debugfs is locked with eg a spinlock and then in the debugfs callback
they just lock the same one?

---
Cheers,
Benno

> So how about a platform driver that exposes values read from a platform
> device (i.e. a soc info driver), that also includes a
> local-to-the-device data structure that can be locked and modified?
> That should cover all the use cases that I can think of at the moment.
>
> thanks,
>
> greg k-h

