Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E1028E61D;
	Tue, 15 Apr 2025 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721690; cv=none; b=TRlT8qV1e/BobZSxg5mDS7AMwpOGRIDz5bsp1omCuQpu8etL4jwmBbPBKu0xLmF7BErO7xkbwnjASDzOLJj+CM+hCY9jjO8iS1kBCB0L1ddhDqR1ibcMDnX67cLdVKkBSQoinpdNF9WxvSouNRsL2HHfysT43B96iKIkLFfq7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721690; c=relaxed/simple;
	bh=HGrWIoTsXW23ORzr/01CwyVyKKEln9uQb75WdrtkNT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMJPnL1OJ5X+uZxwjdEmB8fqTqveXiust8mTHzbOKmREgokUe1jQEJA+64xKFGv51H5EW1y95tAiO6Abih/Kz5E61cMrIostf0PkFmSpcErvc7sc+BAuXpTBYI4fOQdYqgWvMAsus4dBROnTWTD6ps55al8Jdm7xPnon/vdk9PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qGP4skOa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qGP4skOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBB3C4CEDD;
	Tue, 15 Apr 2025 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744721690;
	bh=HGrWIoTsXW23ORzr/01CwyVyKKEln9uQb75WdrtkNT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGP4skOaMlQOOeM4WLFVsMspOjB2XNKAx//NWPkWC52NG4cO/lCaaFppmHdF6Czs6
	 kWvcQzJeqVCgR+GiLXZlgrk+BkAsboTHRKJjQjsWYj/acSsAy3Rx0VwGwk7ztAcUWt
	 U25NloIAAxaV52Wz8Aka0/asrLVQ78DmFPC7DwSQ=
Date: Tue, 15 Apr 2025 14:54:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Auxiliary bus Rust abstractions
Message-ID: <2025041543-resident-disarray-a983@gregkh>
References: <20250414131934.28418-1-dakr@kernel.org>
 <2025041559-regulator-mutt-e8ed@gregkh>
 <Z_5UTvuMpYhRN24T@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5UTvuMpYhRN24T@cassiopeiae>

On Tue, Apr 15, 2025 at 02:42:54PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 15, 2025 at 01:38:29PM +0200, Greg KH wrote:
> > On Mon, Apr 14, 2025 at 03:18:03PM +0200, Danilo Krummrich wrote:
> > > This series adds Rust abstractions for the auxiliary bus.
> > > 
> > > It implements the required abstractions to write auxiliary drivers and create
> > > auxiliary device registrations. A driver sample illustrates how the
> > > corresponding abstractions work.
> > > 
> > > The auxiliary abstractions are required for the Nova driver project, in order to
> > > connect nova-core with the nova-drm driver.
> > > 
> > > A branch containing the patches can be found in [1].
> > > 
> > > [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/auxiliary
> > 
> > Looks good to me, want to take this through a gpu tree so you can build
> > on top of it, or do you want it in the driver-core.git tree?
> 
> Yes, I'd like to take this one through the nova tree.
> 

Please do!
