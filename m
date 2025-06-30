Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DFD2DBF45;
	Mon, 30 Jun 2025 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304603; cv=none; b=ssFS0NljDeShg6Psl5jXuGp9mZR6QxJUWa+th6yYp8DiM4cwQJjBSB10UkJjLI/yRef0xtJ7V7e6t7NTaASQYdyeJcP+oDt1OxwGi4YQO375liIkTZastoMmgLPWSsn+xriWQ+ha0spPw1i4RjU9PjVH1gC6ts6IL2eUtg5trjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304603; c=relaxed/simple;
	bh=Z6QX6lD6cFEGt/IuorJBE53cG7SR4dt8J7FkW6CFOeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivHdRQeiMpzs/7y1bpRsX81/8scVi4WDJqgEnw6E0z7+5l7KPJsxgw5hBBWvwdL1wNX/5grAGLnzMajanPS6NG41D0HRsjEdi8Z9MaHyJelw7fadSANKDFkfe1pHTcvEjVeFWBYoOe9PFIjiIe7XCOU4VnHDcfS4muMEfndg4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qacEEoMY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qacEEoMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7D9C4CEE3;
	Mon, 30 Jun 2025 17:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751304603;
	bh=Z6QX6lD6cFEGt/IuorJBE53cG7SR4dt8J7FkW6CFOeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qacEEoMYG7/OR8HEs424jMhJrYyXigieFSOyxQH9IjDifFu3qNHhaBFp8F8PYIe52
	 BUaRUqfSub9INxRg51V+HL/wEr/3tF58jLtOnXpaWhxAb+mJtnRKzd1NmAf7O18fer
	 Whf8DTxsjaOiLF2QBPfaU0cKpJc+E/xAsjdET4bDmFsYE4WmKlGo6nZEXm82sjZIB9
	 Yxdzqnm63CAjGV2QmaSH3P1FBuov87dQ2knrwCO1W7iigDDEHYF/BG6ZSRHzk+mG13
	 gtlYFMig7cHOgHKoQdekzdyblQhV5FoJrr9qKfpb5LX+iv+zsy+dVRJtyh82ESAv0i
	 gnuxDyBzK0Mtg==
Message-ID: <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
Date: Mon, 30 Jun 2025 19:29:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for
 File
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>,
 Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/25 1:18 AM, Matthew Maurer wrote:
> +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) -> File
> +    where
> +        for<'a> D::Borrowed<'a>: Display,
> +    {
> +        File {
> +            _foreign: ForeignHolder::new(data),
> +        }
>       }

What's the motivation for the ForeignHolder abstraction? Why not just make it
File<D> and store data directly?
