Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF997155757;
	Tue, 17 Jun 2025 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171915; cv=none; b=cVOnHFiEO+hWJ+fyYhD7y+vD5CEED18kXKgstYbOe2eMOE3R25WZsR1roOKWFN7rXK5Jfjr4uRLXiThszJnmv5gQpBiqhrOQN3q77w7R5igaqXZza3zxIcCAZriszpSbkJ+pKuRYoTJHitx5dsaoM9ahUEpsGqH1OQLzDsqdb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171915; c=relaxed/simple;
	bh=/mGQh+J+t4IMrtKlfeRSnPbTyqx7t9BN5qNn/leODi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUQklPSe8NUJk2s6RsuY+Bb+LFzUju3kiHW67G4h9ejmAXBoiqce3OEMVjWTPU+/mCX5URuna+jSXYWfEwSNPK6WEWbYxZ+C9pOdy/pTU9Ni08ZVSHMXScWgU20gxuyl8xJIkTld9ZtTqTDhiskMB+CjB36ueY8eUmF4Kv3X3aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlbuWNJp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlbuWNJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F606C4CEE3;
	Tue, 17 Jun 2025 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750171915;
	bh=/mGQh+J+t4IMrtKlfeRSnPbTyqx7t9BN5qNn/leODi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IlbuWNJplYKGnRk7FNk1CLeExMOVhbqKP7d+004jtqWZTPqfxsDsRJSOi/bJNu8Tl
	 89AIigbauG7Oa+IV6e4O6+N9VHzHZCEhukoztgfZIrLnzRro+df+uKDHuLnB452kmw
	 WVxbhQfQQfkR6uapqatQnxY9JMfArULSD0k0DeRY+tkHbI4l0SEJ/jcedE9hpGIVgv
	 uwiWIXgS3ijEMzsfbEMU8TrwM6y3uJNCUW4QwU/K1/3CpiIjiT7PEQsd09U0DTkjX5
	 hswUGzS8CoeZbCkW7BwcjX0zeQJxwPSToycY83klw8/4F78qkd3HRkcrBL3YDI9GYd
	 FuXiIZ4JvuAxw==
Date: Tue, 17 Jun 2025 16:51:49 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"will@kernel.org" <will@kernel.org>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"longman@redhat.com" <longman@redhat.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"lossin@kernel.org" <lossin@kernel.org>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"tmgross@umich.edu" <tmgross@umich.edu>,
	"thatslyude@gmail.com" <thatslyude@gmail.com>
Subject: Re: [PATCH v2] implement `ww_mutex` abstraction for the Rust tree
Message-ID: <aFGBBUu2VqIx30w7@pollux>
References: <20250617053821.7666-1-work@onurozkan.dev>
 <aFFS8iKWPytEnwZi@google.com>
 <123821750165989@mail.yandex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <123821750165989@mail.yandex.com>

Hi Onur,

On Tue, Jun 17, 2025 at 04:28:59PM +0300, Onur Özkan wrote:

On kernel development mailing lists we only use plain text messages [1] and
interleaved replies [2].

Can you please adjust you mail client accordingly?

Thanks,
Danilo

[1] https://docs.kernel.org/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
[2] https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions
