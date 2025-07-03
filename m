Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FD4EC2;
	Thu,  3 Jul 2025 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551472; cv=none; b=VmTmduFDS1sQz5t7P5fGq2UXvkmCuM125Mo6o6YC5YUPAHbVRZ+sYNT8wg4BrAbQCtz2fKIPcOIhFXaPiwh90aMDzjykpIr/0oWiKew0PL4ewDgCCK+ZkxSivMyZbQeKbAGpbSCj4RSUbGngy9ZVAPK8+zmfiD5G4BD3sCp1ydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551472; c=relaxed/simple;
	bh=XxFehov2mpyqjrTtvjAVi3gAe6jCIoB4PFQTddnMFdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdgnOp5ZQExGqA3/VE/98sVvL1bWYu2p8ApaWzC2JO5haRhP6sMJQ+QMY7lsvmm2HDyaaIkwnQ/7pZmedRhSOfR2NYcliPEt3i6808pQiFRKkvmJE4fFud3RJdKq1FBvXHJmBuBOWt/VjG9B9GINkuyV4BWDLsVCe7oV/a81+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/Cwf+bb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/Cwf+bb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E8CC4CEE3;
	Thu,  3 Jul 2025 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551470;
	bh=XxFehov2mpyqjrTtvjAVi3gAe6jCIoB4PFQTddnMFdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/Cwf+bbcCzXtqyRWcaw4ikovxESzc/UpTNm7gRGtdzl8oQwo9LPXXUrE2aFeMAdb
	 kzKVYYqRPHSV186y8va1pfRLb4rFlmMCSG8XRx+msLspJBhZcVNJ+fsNQ8GsKewpz8
	 LcA4Wkbad7br2dmqv1Zk2APBk+ud7hqvqumqxAMlDJ7CbQ9XYtGkyWZQdbh4jpVQ+G
	 CCPv0oD8V/Qn0WpkGyoAkTJS5FZkZmgzvU5znOSigFFniQ5+TZH3CXqIhvu/0upNlx
	 rvuUpHoxQ2n0jFmedY477roeIEQhtk5KZjcmONq8G8q8pDMt6mqv3pwUI9bAhZTZIV
	 By/6X0eHjGI8g==
Date: Thu, 3 Jul 2025 16:04:24 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
Message-ID: <aGaN6PT-w9b2pQOr@pollux>
References: <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <aGZVUqangIR-c4aW@google.com>
 <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
 <2025070349-tricky-arguable-5362@gregkh>
 <aGZ3q0PEmZ7lV4I-@pollux>
 <DB2GJB0ZRCSN.32R6OOCOMSO2Q@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB2GJB0ZRCSN.32R6OOCOMSO2Q@kernel.org>

On Thu, Jul 03, 2025 at 03:34:23PM +0200, Benno Lossin wrote:
> On Thu Jul 3, 2025 at 2:29 PM CEST, Danilo Krummrich wrote:
> > So, what I'm trying to say is, I think it's a good thing if fields that are
> > protected by the same lock can't be exposed through separate files, because it
> > means that the fields only make sense in the context of each other.
> 
> I think that even the pin-init API can have multiple files for different
> elements of the locked structure, you just need to nest `File`:
> 
>     #[pin_data]
>     struct Process {
>         task: ARef<Task>,
>         #[pin]
>         inner: File<File<SpinLock<ProcessInner>>>,
>     }
>     
>     pub(crate) struct ProcessInner {
>         threads: RBTree<i32, Arc<Thread>>,
>         max_threads: u32,
>     }
> 
> Now you can do:
> 
>     pin_init!(Process {
>         inner <- dir.create_file(
>             "threads",
>             dir.create_file("max_threads", new_spinlock!(...)),
>         ),
>         // ...
>     })
> 
> But I'd say this will at least raise eyebrows for the reviewers, which
> is good, since it catches the footgun.

Heh! I didn't even think of this trick. I agree, this should at least raise some
eyebrows. :)
