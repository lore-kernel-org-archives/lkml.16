Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC0219A7C;
	Thu, 17 Apr 2025 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874924; cv=none; b=HSaPfGIAuf+lkfU83RLPpvlJGEKk0JZe9YhSSVumXMUtqsT4bLwRCJ1B+e3SXS+j/kMh9K5vECzTn/Yq6ll36U3af2aB+fDzgvG2QEj6rgwjaZz20QYZfrjgUGWNhM+k0R7onXyJptuNmeoVIKhcvusXJPtBGHgyMdfWqsWAXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874924; c=relaxed/simple;
	bh=48DVHn8P1TmQVlNrRz+qCpk/VnxoExt76EuXvFNTdwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jc+F73Z5dMG9ArJsFth2++irEWb92oU+hsPT3F+QWFySym9f4cCzsMJhpcqxZ3HJpTcTcJwkfCPulAKlgNY0+ICcAPpu7kL+PA1Bbm4EwIv/CMkL4pwXIVqgUbK+aBGz47qQG8T52UQDsuXO/ppfZongL9cfKuZZIM8oUE1uxvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ae+ilbz+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ae+ilbz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041C0C4CEE4;
	Thu, 17 Apr 2025 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744874924;
	bh=48DVHn8P1TmQVlNrRz+qCpk/VnxoExt76EuXvFNTdwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ae+ilbz+kcFVIO7Z4HMhalIJC6y9er5xNAsDqW7CzQ02SRUHp3ZQGoZUHGZQ9Y45f
	 iWVZmsxGjcbiBLml3zJ4yau0yIFEqY1QY1IO7rV/nyG+M15Lx5iPnMdWmIS4acPvtz
	 AgaM1VTnERohxpulgCUyvDyO7JPbrSo7k7kep3losvfL4NH63BLEz5r2lUCqnVqTh1
	 rspYx3xDIXioNmjuRztsI+EVkdl/W10Twv7h+0uOCKuBNQXO9WgVHWRl9DL3wJwHBX
	 08sJr2uqoczbheVkSM57yn+STeXuTeRodUEYayIiHIJpE7emQf++nFdkM7iyJaPWto
	 4+hR9qb/KF7dw==
Date: Wed, 16 Apr 2025 21:28:42 -1000
From: Tejun Heo <tj@kernel.org>
To: phasta@kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aACtqnC7okO7eZEg@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae>
 <Z_-f7Bgjw35iXkui@google.com>
 <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
 <aAALmSjLyWqrcQ45@slm.duckdns.org>
 <59c1e09a5c47a60e26c5fb10c3305356328a98a6.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59c1e09a5c47a60e26c5fb10c3305356328a98a6.camel@mailbox.org>

On Thu, Apr 17, 2025 at 09:22:40AM +0200, Philipp Stanner wrote:
> I assume you, ultimately, mean that the list of delayed_work's would be
> accessible through workqueue_struct, correct?
> 
> And then destroy_workqueue() could loop over all of them with
> cancel_delayed_work_sync()?

Yeap, I was thinking flush_delayed_work() but maybe
cancel_delayed_work_sync() is better.

Thanks.

-- 
tejun
