Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246F2857C9;
	Wed, 18 Jun 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241069; cv=none; b=TlFQmsKyAhLPWLiv2vz9LqCsEo/4FyZEdTSOjLDSQEu3M6jK2tDjFZdfwBsjhUWhxfSz9/KjNQ5q2egFtksgnnkXpd2Yg77nl7idJSdUTQ4ubHN+8tlqC3AEpFLwlcKbhg2YGodiFISC3Cz/REe3j7qHlwyFIzgmrF6UcUb7Sx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241069; c=relaxed/simple;
	bh=js50rT7ZmZqp2Zlm1S45NX1PVXUIxD1VZI6hR9bYyeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHKm9p+7P7hiumMIQK170OQkHH9bw2qy2ivczcsHzUAtyHAas+0KIxl7ejHp60Zw1VosMeqyinhzsSIPNcoRcCAw67F5QbTHh7ilGBQXV+WaPZbpliPgZuAkEmL4zFt+6NGAVQiKZtVCqGYLmhxm1s+5sOFE/lvso21DR07NPNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3ommhor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3ommhor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BAFC4CEE7;
	Wed, 18 Jun 2025 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750241068;
	bh=js50rT7ZmZqp2Zlm1S45NX1PVXUIxD1VZI6hR9bYyeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3ommhorCyH9FEc9UQoT3/K6L0puvugkbjyz8oKRYLvPuUkiz2B91lxm1mpoH2kAT
	 lR9HGp3IIeJXPSThAzuiVsnmnpO/G9U6YLmSaNB2v7BPSFzJrqC5LRF3QHDJadOxzU
	 9+npQoy+0b9Q6OuqTlp5L9/kjH1/BApjNgdqixNnyA0IG4PBKWO3XC9GBshKyQZR92
	 zhFLHWcKnFDiWmsfFcKT28xCfPRQhOmc8U2Ef6Y/81oioR0yV8+xTBDToP/bnIzXXV
	 fbkbMB3m9oftR7lSNsNiBtyyWW4O9kl81G2S6pk1ugMvc71EoXj60m7KJTK2DAIbHj
	 GaDohBMHL5geg==
Date: Wed, 18 Jun 2025 12:04:22 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 1/5] rust: debugfs: Bind DebugFS directory creation
Message-ID: <aFKPJnZ2Tk3-oqBE@pollux>
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
 <20250618-debugfs-rust-v6-1-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-debugfs-rust-v6-1-72cae211b133@google.com>

On Wed, Jun 18, 2025 at 02:28:13AM +0000, Matthew Maurer wrote:
> +#[cfg(CONFIG_DEBUG_FS)]
> +mod entry;
> +
> +/// Owning handle to a DebugFS directory.
> +///
> +/// This directory will be cleaned up when the handle and all child directory/file handles have
> +/// been dropped.
> +// We hold a reference to our parent if it exists to prevent the dentry we point to from being
> +// cleaned up when our parent is removed.
> +pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] Option<Arc<entry::Entry>>);

NIT: Can we import Entry, such that we don't have to refer to it as entry::Entry
all the time?
