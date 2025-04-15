Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F122615;
	Tue, 15 Apr 2025 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736662; cv=none; b=IwVO1G5l/+E2f6b0+KRPX3MlZEYljFiRsswS8HqA3a/q9Y/6RH6e5sa8qjtMV3RvLDM3V0Imh+LH4gwzaW2Pea36OPrfR4feuHrjfV7I1dO5BiXGkJaQjfkMjJZrifKqex8IDcEwF36zmu6bmhBnH5DQc/TQ1W+nvky9G3gqL0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736662; c=relaxed/simple;
	bh=47ahCshuOULopMYqAcAwbpmTbe527MjVTPRCZH5QYY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVQXOPdyItFIN+zkN8wAjaVdOc13wBY9EWVkW+ZyZgjMHSDTcID2aG/JJ5zbKeNnWOAW0SaaqbSc29HPBGu/yYz2kRTlf1W4rSTYfBKT+Dis6vTsn3pwbrUwD+4fBnL14+FxvgFOddIqjIAaVojd+mUjBeEZutLH3tsUmLoFgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHmPEZes; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHmPEZes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D741C4CEE9;
	Tue, 15 Apr 2025 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744736661;
	bh=47ahCshuOULopMYqAcAwbpmTbe527MjVTPRCZH5QYY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHmPEZescGRYWNxjJMaYmGNn9xm74AN4f64cNi9DVBu+zY9wjaReUOC6T4/rBT1DS
	 CgfV8A1Ld/S1A/5/cNgBBpnH0DTFPAaILRW8YZ3S+6n+C4UbKwxsev6Ngc7hk3teZ9
	 +vtI0Knxu80YJVuCth4o1OY0M61U3+vt0rAFK6nNuOcbw+rK8FSq5g1mHf0hg/MgZH
	 tuPdtKxmrsVa129+gJCHWqENBLSYR+W5jtofIGmWFZ4Mn6tuGUS4PuvNKIeExKXIbu
	 K4zwUAZ1zWDBC3N2butznKP6Od9TZgs7DGFWbzSA2f5MOBkuHNYdkXxAI6geZmQlNw
	 8uYOnI1c7WC6g==
Date: Tue, 15 Apr 2025 07:04:20 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add delayed work items
Message-ID: <Z_6RlN63O5peuCC2@slm.duckdns.org>
References: <20250411-workqueue-delay-v1-1-26b9427b1054@google.com>
 <Z_1KJ98k7WL5qWfS@slm.duckdns.org>
 <Z_4lLEFjobzEWT77@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_4lLEFjobzEWT77@google.com>

On Tue, Apr 15, 2025 at 09:21:48AM +0000, Alice Ryhl wrote:
> On Mon, Apr 14, 2025 at 07:47:19AM -1000, Tejun Heo wrote:
> > On Fri, Apr 11, 2025 at 11:12:29AM +0000, Alice Ryhl wrote:
> > > This patch is being sent for use in the various Rust GPU drivers that
> > > are under development. It provides the additional feature of work items
> > > that are executed after a delay.
> > > 
> > > The design of the existing workqueue is rather extensible, as most of
> > > the logic is reused for delayed work items even though a different work
> > > item type is required. The new logic consists of:
> > > 
> > > * A new DelayedWork struct that wraps struct delayed_work.
> > > * A new impl_has_delayed_work! macro that provides adjusted versions of
> > >   the container_of logic, that is suitable with delayed work items.
> > > * A `enqueue_delayed` method that can enqueue a delayed work item.
> > > 
> > > This patch does *not* rely on the fact that `struct delayed_work`
> > > contains `struct work_struct` at offset zero. It will continue to work
> > > even if the layout is changed to hold the `work` field at a different
> > > offset.
> > > 
> > > Please see the example introduced at the top of the file for example
> > > usage of delayed work items.
> > > 
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > 
> > FWIW, looks fine to me on the first glance. Please let me know how you want
> > to route it. If you want it to be through the wq tree, please let me know
> > what to do about the dependencies (I just applied the "remove
> > HasWork::OFFSET" patch to wq/for-6.16 but don't have the other one).
> 
> Normally I think it is most natural for workqueue patches to go through
> your tree, but it may be easier to take it through Miguel's tree with
> your ack as an exception this merge window since the container_of change
> will probably also affect other work.
> 
> It sounds like this is also the conclusion you and Miguel came to in the
> thread on the HasWork::OFFSET patch.
> 
> (If you're planning to change the default workqueue configuration from
> PERCPU to UNBOUNDED this merge window, then please let me know because
> it might change the calculus here.)

The rename is going to be a while, I think. Please route this through the
rust tree.

 Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
