Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC531F8ADB;
	Sun,  8 Jun 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749381572; cv=none; b=iZCQ0LXB6lCtv6h4aGZAUV6qeeGuR6GKSqZ59aLkV7yq1flDzDfjFlKaXdwIBK/FNo1qLuh3FP7DoxLWcUbfPLI1lapbkYjdwISIVIZHyL6zQ8pawIHHGInY8D3dl8o+5PUWWzjA/BWdokc4pr6btnNebkpacGP7xfc+SezzoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749381572; c=relaxed/simple;
	bh=8psAWaUnvU/iR2O829D2oogB5b3T0NnUW/saaOUEqkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5Aud5B+NM15+B/KgPYXbHQjQagD0jeMnccnJNOhu14bK2f4j18kDnIKvrEHH92aN/4qnAxGM8z/4jkdLRJsTbnl94lXk+LVFUzu3J8EJuUmInYEpsRZ2LCwy54G2rPDXrmO9Gns8ATQnYN6AljhuWu3NsJxIQqIsY44yK0XAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAq+LBAI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAq+LBAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B2CC4CEEE;
	Sun,  8 Jun 2025 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749381572;
	bh=8psAWaUnvU/iR2O829D2oogB5b3T0NnUW/saaOUEqkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAq+LBAI/1r4Gwe/HH7FGhXx4D11TmvmNsC4kqyiOigxc5cnCnu2FhaWx1GrZrTIk
	 bJ3X3lSx24+K5tOS+daeqf/jREHrG0IUqQTMwyXp8bNyeamg+BX0iwH8SL07caxnWY
	 fji+vK0hSFGOQDSpUany7Kh01HHdkjc7m0L1jt4D+buUWTapxuIeh6SAuboTdmTPv3
	 QepRM+mOls2Aul9JwDcI0RlaZZXt0GxTdbmw08KbfCD+bpOnSHQRUEFHzYGXyL7GX6
	 14K9Az4bi8uiLBTkM3bUeuQyt/x/SMZwx/H1KBgsz+iD5MoqKaeRqfA0PQ9YWegLNh
	 5SXKvvEPtqGGQ==
Date: Sun, 8 Jun 2025 13:19:26 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Benno Lossin <lossin@kernel.org>,
	Gerald =?iso-8859-1?Q?Wisb=F6ck?= <gerald.wisboeck@feather.ink>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Message-ID: <aEVxvkt-0Ilv6ya0@pollux>
References: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>

Greg,

On Sat, Jun 07, 2025 at 02:07:29PM +0200, Christian Schrefl wrote:
> Christian Schrefl (3):
>       rust: implement `Wrapper<T>` for `Opaque<T>`

Just a heads-up, this patch is also required for a patch series with some
improvements for devres (sent out soon), which itself in turn will be needed for
the next version of the series adding device driver support for misc device [1].

Unless there's a reason not to do so, we hence probably want to take the misc
device patches through the driver-core tree. A subsequent conflict with the
char-misc tree seems extremely unlikely.

[1] https://lore.kernel.org/lkml/20250530142447.166524-1-dakr@kernel.org/
