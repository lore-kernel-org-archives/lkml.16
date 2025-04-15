Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C046F146A66;
	Tue, 15 Apr 2025 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736581; cv=none; b=HuXWKV/zzUQrQ3sx/LH7jqJGM5nqoRCF5AYFgp9YJVeMeqBWbBjy3St02t3qxjedmU4va9uIAZi2GkTE4O05I/wfm4B8Wjji4YMeGuxgV2x/TDmR44RRy1lWEsSvxYmLjhFEvBGVygyLCNZJ89RBfe8a0cMfdGX/ITcIQWQU9ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736581; c=relaxed/simple;
	bh=hKggJoWSut+yNKtVTO9dykIoVPIpJIOskKeQM6LrOQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDLv5sOggGuxRHd3W70bvmFKIZme8a9rGL6YLVl3W6s/I8kRuHBEvvnsidKZe5T1aVQaHKL3qwAgtQ1d//p1DGdX/eNL/Uf6QdaW+6JZXekiN3OY5qstDDfz/LOmGdPttPRbG2NcOVAODlQmOaSi15C/lzzYTebSYtdTr3AV5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwtteZtZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwtteZtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F1AC4CEE9;
	Tue, 15 Apr 2025 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744736581;
	bh=hKggJoWSut+yNKtVTO9dykIoVPIpJIOskKeQM6LrOQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwtteZtZOodgp9pDhchQNMOulgRNBXtcIQXzjdtnBPKe3mBCtUR0yrUmc0pmKHHyD
	 iy7qeJTfWCCsG9AA5Eaya7vL23Z3Eh7rb2iO2OXHEbIZxDmRLHO/eaI7l/WntHgMIE
	 T5/LHS9oywBCJbcxkRWrZtoFNMD558M57jxEDTMeZE8lRCP/qNdNpLvScVmbfnuwHF
	 f+2aMyH2k7ICq4ij3itH/ee3iAMnfKE3LntVmloU0VqS2AMl0c0omBIg0AushfCvHc
	 RV4bppptpCp4/csZrpSFDyNAL/iXo5LDbKpTiBMtSZHkXK3gy3HD6aOZ6CBVOfZYis
	 oyXVK4rhPndtg==
Date: Tue, 15 Apr 2025 07:03:00 -1000
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
Message-ID: <Z_6RRHj5rWvux600@slm.duckdns.org>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1EnkPiBKakGYtM@slm.duckdns.org>
 <Z_4hTBFdodhXkArL@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_4hTBFdodhXkArL@google.com>

On Tue, Apr 15, 2025 at 09:05:16AM +0000, Alice Ryhl wrote:
> On Mon, Apr 14, 2025 at 07:23:42AM -1000, Tejun Heo wrote:
> > Hello,
> > 
> > On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> > > Creating workqueues is needed by various GPU drivers. Not only does it
> > > give you better control over execution, it also allows devices to ensure
> > > that all tasks have exited before the device is unbound (or similar) by
> > > running the workqueue destructor.
> > > 
> > > This patch is being developed in parallel with the new Owned type [1].
> > > The OwnedQueue struct becomes redundant once [1] lands; at that point it
> > > can be replaced with Owned<Queue>, and constructors can be moved to the
> > > Queue type.
> > > 
> > > A wrapper type WqFlags is provided for workqueue flags. Since we only
> > > provide the | operator for this wrapper type, this makes it impossible
> > > to pass internal workqueue flags to the workqueue constructor. It has
> > > the consequence that we need a separate constant for the no-flags case,
> > > as the constructor does not accept a literal 0. I named this constant
> > > "BOUND" to signify the opposite of UNBOUND.
> > 
> > Maybe name it NONE or DUMMY? Doesn't affect this patch but [UN]BOUND are a
> > bit confusing and as a part of the effort to reduce unnecessary usage of
> > cpu-bound workqueues, there's a plan to flip the default and use PERCPU for
> > the cpu-bound workqueues.
> 
> Happy with whatever you think is best, but what about naming the
> constant PERCPU, then? In fact, by adjusting how I declare the flags in
> Rust, it is possible to *force* the user to include exactly one of
> PERCPU, UNBOUND, or BH in the flags argument.

Oh yeah, if you can force a choice among those three, that sounds great.

Thanks.

-- 
tejun
