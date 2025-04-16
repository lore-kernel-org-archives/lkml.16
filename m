Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35541547C0;
	Wed, 16 Apr 2025 19:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833218; cv=none; b=Gdv5Qtk1h7ojT/UjFA2tkKQ4VF/8pbxekfOtTyqhR5dpE6XduZWs5ZzwLKPwSJBCw0uE+W4hE17drW4MiUWNAdMNb03MZDUkSa5hPNyrapUBVzL/EJYZIpRvsYe2c2nJ86V1mP0/xnEe//mY9hTDkYeAATbVtdx6/EPzAfLria0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833218; c=relaxed/simple;
	bh=yP1ekXf2eEKa9IZ5iowOPho931DVTw/Qef7+CNL0YdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZQbiKuC16izP/9XmulvVDGmoCw5fPL1lIeOLnjKv4Op0/SVxquJiz0Ty36Agyo7shc1Z5I16AKB4/FoROFUlis0JVj+tKGmmZBwq44WjfESBMRfiRgyoZJe3Psb/3Y0KV39e5yRqoRQbN4Pr2APxVmgdA33ZbM0X0VXgwPt0nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EistGkgU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EistGkgU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34540C4CEE2;
	Wed, 16 Apr 2025 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744833218;
	bh=yP1ekXf2eEKa9IZ5iowOPho931DVTw/Qef7+CNL0YdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EistGkgUVdsTNKXRbV2U732WkfBzI1e6cZnVituF+gMAB6MpI1YcQ2ngjs3PQXbSC
	 Tx7ZTPMpjultbQZcG7iL8vYuoW3x7eR8J0q9TIm33S+89pnsNtgE1ym3La6THpz2GP
	 5QNZWXVtDqbdm/jiORfnTo1F2sXsNU11s6TPJlCHqdcC/NQY12BGVTCOs+8kygi1jZ
	 FAdHW7f3KkT5S0F7gM5gfaKL0GUOwjMHLdzPmrcQv1SJZ+6PRUxxPA8ItJCIzfmZXY
	 a/StJe8ukuIOw5tTakdeLvIKbP8Cqgl90pK47IPGZ6gHMpWSu9aYsTTVNF7oN1K5mw
	 p1h3G2MHDq5uQ==
Date: Wed, 16 Apr 2025 09:53:37 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
Message-ID: <aAAKwTj9egoFdq6G@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae>
 <Z_-f7Bgjw35iXkui@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-f7Bgjw35iXkui@google.com>

Hello,

On Wed, Apr 16, 2025 at 12:17:48PM +0000, Alice Ryhl wrote:
...
> It looks like panthor handles this by only having a single delayed work
> item on each queue and using cancel_delayed_work_sync before calling
> destroy_workqueue.

That sounds a bit too restrictive.

> Tejun, what do you suggest? The goal of the Rust API is to make it
> impossible to accidentally trigger a UAF, so we need to design the API
> to prevent this mistake.

This is a hole in the C API, which isn't great but also not the end of the
world in C. I think it'd be best to solve this from C side rather than
working around it from rust side. e.g.:

- Have per-cpu list_head per workqueue (or system-wide).

- When queueing a delayed_work on timer, add the work item to the cpu's
  per-cpu list. This shouldn't need adding more fields to delayed_work given
  that the work part isn't being used yet. Also need to record the cpu.

- When timer expires, unlink from the per-cpu list and then do the normal
  queueing. This wil happen on the same cpu in most cases.

- Flush the lists from drain/destroy_workqueue(). If using system-wide
  per-cpu lists, we'd have to scan the lists and match the target wq.

This should be pretty cheap and we can probably enable this for everyone,
but if the overhead is noticeable, this can be an optional behavior
depending on a workqueue flag.

Thanks.

-- 
tejun
