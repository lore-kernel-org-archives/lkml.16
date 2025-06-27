Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13352EA72A;
	Fri, 27 Jun 2025 16:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043348; cv=none; b=H48YN3Rr+5+mFuqQBwpSE/rtTjdk5c7cGB8N0jy2FO71JEtt/+1IYh66QwgoDB24VpOHC2Uluc0yrYo/NBHlVPgY7DE/8YUYoBW95I0PAiCjLEh+G7FTMuw5SybhPgQ8mWAGZiKRMLNlT+v+3+lMoIuxXo0KVKrZXv70NU/PEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043348; c=relaxed/simple;
	bh=Ru+vXHBV8y+6Bsp5bc2kVjvc7h7M/KrKuaxCk5SRMDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2JJFXVwSZvy68/gjQJt0+Gb11Rl+FcVD2C8KCJN6F0QU0ncNJI3gwNAxuFVYFgQuZCrmR/DPFsC4rAbmEWe6vJH+yr+9UNs+qu5s0RCRMf8OedjL0FKIYIKVOV3TTefdGpx/QhVXKeQnLpwgZ82DUJi7NWzbK+WlkJqIASYn08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC0nrlmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC0nrlmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F01C4CEE3;
	Fri, 27 Jun 2025 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751043347;
	bh=Ru+vXHBV8y+6Bsp5bc2kVjvc7h7M/KrKuaxCk5SRMDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EC0nrlmwfOMi0lYaBe9mBqhAcEdP04DXeSoAAG0O3fTue9Onl3312Nub3JSY2aeXW
	 tERxqOV8nAvSOOrOHcyDC6pSIO1BSqR8IMCh1rhAjI7iX8tYjk4qD9BKdLlIFfOhuH
	 v9hw0BlGYRzpMxZDbePM/X4tfEzUTg66Hp5OkMuSpPsVghZHp4XNXsMXv06epWSXqe
	 LbnsZwaYHfRd596FlGFbDXlJCnSTgmXsmm2Y1gdvaJ9wLnpQMqR9pKjqHuS8XAzxXt
	 8ZGdVydbYtAHnJJHs3Eb/gQAjpcKpyCO3dddgJGIRrrI26bB3tlrN+JxZFVsNcP1dX
	 S7WWAKJa+9waQ==
Date: Fri, 27 Jun 2025 06:55:46 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v2] workqueue: rust: add delayed work items
Message-ID: <aF7NEkFJne9Cn1Wr@slm.duckdns.org>
References: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com>

On Fri, Jun 27, 2025 at 09:38:42AM +0000, Alice Ryhl wrote:
> This patch is being sent for use in the various Rust GPU drivers that
> are under development. It provides the additional feature of work items
> that are executed after a delay.
> 
> The design of the existing workqueue is rather extensible, as most of
> the logic is reused for delayed work items even though a different work
> item type is required. The new logic consists of:
> 
> * A new DelayedWork struct that wraps struct delayed_work.
> * A new impl_has_delayed_work! macro that provides adjusted versions of
>   the container_of logic, that is suitable with delayed work items.
> * A `enqueue_delayed` method that can enqueue a delayed work item.
> 
> This patch does *not* rely on the fact that `struct delayed_work`
> contains `struct work_struct` at offset zero. It will continue to work
> even if the layout is changed to hold the `work` field at a different
> offset.
> 
> Please see the example introduced at the top of the file for example
> usage of delayed work items.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
