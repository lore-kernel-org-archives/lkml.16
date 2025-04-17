Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E641C63;
	Thu, 17 Apr 2025 20:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922386; cv=none; b=aAQLGg4R8vCgX9qwb0CtDKAZAv5q/aetuFaZgycyHyMOn6Z5agr4uHckHD2zhaXV3qMeO3sM2kxsrkVhozEIH0EpmA0zf/JiLFtYndnfwClbFRUG/U7TxP79ljtTHCWQhUS31kXivdYeRk0M6dsTElsl/sPRIE/0BN39kTf/Vjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922386; c=relaxed/simple;
	bh=bTok9hLCJm69hH4JMezsIs0CexcmXt7PVIqgOVapE9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfBs++p6qt/HyYtu+pLsGiabyMi2CJ/tLMQDDfAAA2lOc/UXf94v/IP+IOkSdhUk4IsUFDz6Kf/Xk5ixTVeXlP0APp/SPdQXlfPYmzf0Xh/X9C08V1ZyGYbnx1PCdnVMbEtq6VM4Q1XDeYJQssFI1HVAin6vwv4oxI/0vIJ53tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/Ym9XfZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/Ym9XfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661FFC4CEE4;
	Thu, 17 Apr 2025 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744922385;
	bh=bTok9hLCJm69hH4JMezsIs0CexcmXt7PVIqgOVapE9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/Ym9XfZKW0LuDTYZ+9TldWf1KNwfcg473FDJvlAA3rhXxXkYTTvYdxn/8ZDHR9R8
	 WLgXcYrQsyL0vpnU0EvphHvjplTWJD8JRGkUI+B1yO96+lJfIUvjfBC5DZVu7BrIaq
	 JURsnKcA6/d+UgdLjIK9tiE2QJwuKJUU3NvFlSzrupp4AGi9EqHmSh/T7YYxfFlKao
	 2zUZcFOeAXsMgtR1+atxcW7+0k2OK32ZeSbNTvIMPVDZYM0geUtENrwDIZHAEGM8q6
	 xIO8Pr1EIrLaPzU3rDB6Me+7NXDhQ9Dm3+5CyAkDwNSe/76xcLgl1O3vj4J7R41yvy
	 B3PqTDsMB3s5g==
Date: Thu, 17 Apr 2025 10:39:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>,
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
Message-ID: <aAFnEBv50t11Rjt0@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae>
 <Z_-f7Bgjw35iXkui@google.com>
 <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
 <aAALmSjLyWqrcQ45@slm.duckdns.org>
 <59c1e09a5c47a60e26c5fb10c3305356328a98a6.camel@mailbox.org>
 <aACtqnC7okO7eZEg@slm.duckdns.org>
 <CAH5fLgg3RrsWy-ArWb9502st3O=DsmPsBsXoZ5M_nS7oWggJuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgg3RrsWy-ArWb9502st3O=DsmPsBsXoZ5M_nS7oWggJuA@mail.gmail.com>

Hello,

On Thu, Apr 17, 2025 at 10:26:04PM +0200, Alice Ryhl wrote:
...
> But doesn't that have a cleanup problem? If the work item owns an
> allocation or a refcount that's cleared by the work item's run
> function, then using cancel_delayed_work_sync() will fail to clean
> that up. Whereas flush_delayed_work() avoids this problem.

True, especially for self-freeing work items. flush it is, I suppose.

Thanks.

-- 
tejun
