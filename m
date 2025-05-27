Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC1F19005E;
	Tue, 27 May 2025 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356942; cv=none; b=A8bc3BPgrEs2ri2e9f4rWTDo4B5V+ts2Tu+CMwInlM2A4T0m7Llc6/BW0gztBd+vzJ4BP9fDfhshW+CSKGeX04dYXVpDdvQE3dsheeGfK5qZdwKHFgc7w9GAtBrzwQPpSoTfVrxIPG9cZAEod2z86GZ1xjOBkrFYuD8ITPy+6lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356942; c=relaxed/simple;
	bh=ty9dKlbMTKoY8zi8UvjZi2QnisOm1tQhWnZWLR7ndiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX5rUp4NwxQVFMlZeEtgLitj1VEy0dogPO+ivQKejPT3Qs/rWViFYzMX8602tqnUx8zqqQlX8sMYNwSgkN0kt19wLk2pQKe06cikqabjo1WdgaoC4u95i3gync3S6SMwoqaKqmEd3kTtXudvyeJXVsJB0skOIP50hZN2rUU2k2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JiOmaYNK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JiOmaYNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5351EC4CEE9;
	Tue, 27 May 2025 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748356941;
	bh=ty9dKlbMTKoY8zi8UvjZi2QnisOm1tQhWnZWLR7ndiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JiOmaYNKlFvegpci6aEq8zSqH4b/ndsszhIgYYQ1m3f3wCoDVb8RP2Rwrv5dcJOk6
	 ifNmsXgUt+q5YybMgRmXtODdh3hUp0qYHkkqm4L6YkzhtfhAnUYhsf9WqhAOT8VDIt
	 a4iIapNcUOLmnMp66epi5E2Myj2zKNtIKz4hIdcw=
Date: Tue, 27 May 2025 16:42:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
Message-ID: <2025052708-crafty-lethargy-1ad9@gregkh>
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>

On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
> In C code we use sparse with the __user annotation to detect cases where
> a user pointer is mixed up with other things. To replicate that, we
> introduce a new struct UserPtr that serves the same purpose using the
> newtype pattern.
> 
> The UserPtr type is not marked with #[derive(Debug)], which means that
> it's not possible to print values of this type. This avoids ASLR
> leakage.
> 
> The type is added to the prelude as it is a fairly fundamental type
> similar to c_int. The wrapping_add() method is renamed to
> wrapping_byte_add() for consistency with the method name found on raw
> pointers.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Nice!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
