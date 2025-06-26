Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9524B25F7A9;
	Thu, 26 Jun 2025 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931338; cv=none; b=b0zKmwlcZKwQtU608EZfPQen+B6tgBI68GZFzBLzokwdBwE2SPYXj8RvKq9/Y14TxCq7PJfi5mcjsq8p4pbi43fVX9pYoXKIA/WLEhyS5PE7N5to30W9JxoSJqMHKeqJw+sW5dOTgHMPVFLT0Ei2DQ8X0CuKQeEdxHMhNPs90XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931338; c=relaxed/simple;
	bh=vrsynEKKjMPCf8siETayk8FfA9mx8H6OWY4JdTrX3ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYnYjsNZRp3YXMSj3vY08LQBccb1bU9we7igqxkSgGPn2kMI5coH+6tcrJX/s9K1jyuVXe+tDP5L5S6sJ1vUqdxhmCP90h6xmG3cvY5EaPaERbSqvuZ1gQaJVneKpSeJXpMPQ1zTjczWLn/fDBPHAbfJYim6DPFFyylNjyI4VDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbh4uYrD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbh4uYrD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4BDC4CEEB;
	Thu, 26 Jun 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750931338;
	bh=vrsynEKKjMPCf8siETayk8FfA9mx8H6OWY4JdTrX3ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbh4uYrDsn+tEYulteENZ4VhmF0WGAw2s/L7kHjYPmiB9PdPEj6uEpWa46znJ/yV5
	 BlkM4D8eoWYU1/A0i/zURR2vS9whH4wHCIN2KvFevYt6LxKXVwA6fNSopU6ut21437
	 JyhMQMHsfi86YpDj57FfgurxhKnzVmekT2uiVj4TAbLM042FjRZ1F9gle11DL6sbbq
	 TeuC7EqNszDHY8VmspeIyeVtjJtyGbXmZIenvrrvHbejIgR7QQJGYGpOWWaMm+kFXe
	 WgZH3Nj+YAbVST6819ZCnZTZLqYphAscW5RvU748w1nxMOMxJjJQYJG34XzCiN+d6I
	 28CVL3igKwdCA==
Date: Thu, 26 Jun 2025 11:48:52 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Onur <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH] rust: simplify `Adapter::id_info`
Message-ID: <aF0XhFUkdQNLNwef@pollux>
References: <20250625043630.7677-1-work@onurozkan.dev>
 <aFux2MUDAGEYY49I@pollux>
 <20250625113604.21a6ec4a@nimda>
 <aFu10-dGkoyi0I2T@cassiopeiae>
 <20250626111045.2c90a402@nimda>
 <CANiq72nsQzCje3167G_4YSJ_he02Czr4NveLOf13zYj-DO_gsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nsQzCje3167G_4YSJ_he02Czr4NveLOf13zYj-DO_gsw@mail.gmail.com>

On Thu, Jun 26, 2025 at 11:41:33AM +0200, Miguel Ojeda wrote:
> On Thu, Jun 26, 2025 at 10:11 AM Onur <work@onurozkan.dev> wrote:
> >
> > HEAD: e0b49ca268d4a0d2b97d5820420d5a78b67d2537 currently doesn't pass
> > clippy. Should I send an additional change for the clippy fix or would
> > you prefer to fix it yourself first?

Indeed, this is the case for #[cfg(not(CONFIG_OF))], I'm going to fix this up at
my end when I apply the series. Don't worry about it.

> Where is that commit coming from?

https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/acpi

It's a temporary branch containing patches that are staged for applying them to
the driver-core tree.
