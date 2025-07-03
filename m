Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F92295524;
	Thu,  3 Jul 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549757; cv=none; b=MrOgUIIm6EQYZub9eRgRxsaqshadzAofHio7IuHW7nmNAeADb4HGFss3LvyPyIPRSUGaNYKigMx4vA9NOldjdYW/kKTMAnWBkF02TmO/ZthSi0cTwf3CPkQNFkkY2KljUzIT4sJtvSt0l2wRsr4mzGBKOodDtUwCuumQ1Pi/9P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549757; c=relaxed/simple;
	bh=Sw56mQH+HjIAjMB6ARuILcj1oqw5cMB+35BgJfWA2uE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bQZAR3sB/rQ+2ULA9f4Km68LbDP3FsNizaBOcd8Lmh7tb7OXljNzKnZQ3EAhvF7WggRNcmw7gpdSi6KBFmfwmFSMjZZxlJEXmHhJBNIqag4Ld0rVcrG0d5kkIDve1OrYW2ZJfyHMU0pB3mTiQFCtznJ6FiW7LL1qjo0yp4/j8qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFbFGG+1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFbFGG+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B53C4CEE3;
	Thu,  3 Jul 2025 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751549757;
	bh=Sw56mQH+HjIAjMB6ARuILcj1oqw5cMB+35BgJfWA2uE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nFbFGG+1LWRVB+UTMbuXa6UmIaoC12qKa8hRLtv4klELQiThESBPcduJU4mRPBEDV
	 qswHwc9zCXIPeO6/kTpNs2rIoH8xnNKu7Rh0gQRWVJDnOGjJJX+i22JpyLA4E6zsJw
	 rGhXri9lOzp7tcWFWeYiI4RPLV0w9dZakq5TVdCGQxScun3eMKWrb4YBidiC7xeU9I
	 Lxdmn8xaxytosqZdmsm9IjxwkWAfxzmi1NpyK4H3cBtmArtkzlvzpviUJlKU2wm3Mh
	 5K/9v/55YUZij4limnmUfXvFZ6d7+U7MMaYRJvuo0QCB6dRAuFFPduoPMs32qCQ14b
	 +SRHCANHrZlmQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 15:35:52 +0200
Message-Id: <DB2GKFUREH3U.15ME8JB2HJOQN@kernel.org>
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
> On Thu, Jul 03, 2025 at 01:41:53PM +0200, Greg Kroah-Hartman wrote:
>> Yes, we need to be able to have a debugfs file callback handle a mutable
>> structure in order to lock things correctly.  We also need to have it be
>> mutable so that it can MODIFY the value (everyone seems to forget that
>> debugfs allows that...)
>
> Well, that's possible with both approaches. Data behind a lock becomes mu=
table
> once you grabbed the lock. That's the same in both cases.
>
> The difference is that with the pin-init approach I propose you can't hav=
e what
> Alice sketched up. And I think it's even desirable that you can't do it.
>
> Let's me explain the difference on a simplified example, based on Alice'
> example.
>
> ForeignOwnable API
> ------------------
>
> 	#[pin_data]
> 	struct Process {
> 	    task: ARef<Task>,
> 	    #[pin]
> 	    inner: SpinLock<ProcessInner>,
> 	}
> =09
> 	pub(crate) struct ProcessInner {
> 	    threads: RBTree<i32, Arc<Thread>>,
> 	    max_threads: u32,
> 	}
>
> Here we have to create an Arc<Process> (let's call it process) and create=
 files
> from it.
>
> 	let file_threads =3D dir.create_file("threads", process);
> 	let file_max_threads =3D dir.create_file("max_threads", process);
>
> In the file system callback of both of these, we now have an Arc<Process>=
, hence
> we can access:
>
> 	let guard =3D process.inner.lock();
>
> 	read_or_write(guard.max_threads);
>
> and in the other file:
>
> 	let guard =3D process.inner.lock();
>
> 	read_or_write(guard.max_threads);

Where do you actually specify this callback? At the moment, the API asks
for `Display` and thus it can only read values?

---
Cheers,
Benno
