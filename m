Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF118DB1A;
	Thu,  3 Jul 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549668; cv=none; b=iqFK8vsN3KWtaFzsVtbKtkIQuIgpSVbFa11IV70kS3OGugPVHxHT1ctPMBueXNwP/qaP7/EItFrlqFsrpm3yA8CivPf/dB7Prufyc3qQtSD64AuxXcs6m66IeEAD4LzOjyaWkM52CcDpSgm/RaZdO+Y310Jr0AdhVF5kZQrIT7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549668; c=relaxed/simple;
	bh=FslVDeBg6EqBCZI8xcWRy/XpFKF0YeXIHs+VpfoIyzo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fSNVBL0qMPYtj8ZwjK8jIxUAzfYm72rxw2lfZwRK1EhDvBVm/xRQR9LGMunP761ixymeoniC5ZHvvuQodq8jU/tFLnGRsUgwsHUFXWJVcueq6erwR5r68hs88rJ7d0ZqhEqePwAfyI1lYl0pLwAhLjgjQFWY87BUgE+FE/vIb28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awixeaz/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awixeaz/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13034C4CEED;
	Thu,  3 Jul 2025 13:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751549668;
	bh=FslVDeBg6EqBCZI8xcWRy/XpFKF0YeXIHs+VpfoIyzo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=awixeaz/v3h602wRJjurY8YIpwdQ65XhMMZ/tT2owQgq2icreVQbq8VdFS+avRX5b
	 gJDVN8DbNReub6trulaNfvcJf9ZTw1zR6XVMuNhqxHmC2lhyIgXNM+m+kcR9ppCv8A
	 4Oy9N9mElc6kzaptu2hgoGBWombo1OWzUnqT8AxCrCfqen+tn47BezctT6XQSlO24x
	 U2DPjngmESU76q4nVVWz2XCY45FkzPmHr35C4shtYZ3njlXcdI3awnln3mZxhIfmdm
	 hVIfJ5aVmU/PnHFfrsylAhBzGxweF0STyRivdIScH7DfoqmaAyB6xCOkV7k6lztXLK
	 1HmCpoL/zJKMA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 15:34:23 +0200
Message-Id: <DB2GJB0ZRCSN.32R6OOCOMSO2Q@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Matthew Maurer"
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
To: "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.20.1
References: <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com> <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh> <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh> <aGP6d2-jJy5rtjMK@pollux> <aGZVUqangIR-c4aW@google.com> <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org> <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com> <2025070349-tricky-arguable-5362@gregkh> <aGZ3q0PEmZ7lV4I-@pollux>
In-Reply-To: <aGZ3q0PEmZ7lV4I-@pollux>

On Thu Jul 3, 2025 at 2:29 PM CEST, Danilo Krummrich wrote:
> So, what I'm trying to say is, I think it's a good thing if fields that a=
re
> protected by the same lock can't be exposed through separate files, becau=
se it
> means that the fields only make sense in the context of each other.

I think that even the pin-init API can have multiple files for different
elements of the locked structure, you just need to nest `File`:

    #[pin_data]
    struct Process {
        task: ARef<Task>,
        #[pin]
        inner: File<File<SpinLock<ProcessInner>>>,
    }
   =20
    pub(crate) struct ProcessInner {
        threads: RBTree<i32, Arc<Thread>>,
        max_threads: u32,
    }

Now you can do:

    pin_init!(Process {
        inner <- dir.create_file(
            "threads",
            dir.create_file("max_threads", new_spinlock!(...)),
        ),
        // ...
    })

But I'd say this will at least raise eyebrows for the reviewers, which
is good, since it catches the footgun.

---
Cheers,
Benno
