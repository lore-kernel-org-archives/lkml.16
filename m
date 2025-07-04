Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357E82C60
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636706; cv=none; b=V2SgiSIMNxEBzm9M3Tmp+ymrc41iC7ax+iW4oLQDjnwz3KQVxsRBPfWP+kJH+oKzzjFH8hkSVBrQxjHILle16/Qr/OxDp0pPodlg8VrBP2kSaqUU/QRjC81V3s9csWmSsfqiOHqyKwk/foXuoKz937Owutx2c6ZzrLBx2X0AH/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636706; c=relaxed/simple;
	bh=U3nMWen8wac9iRLyb1hTreClQwaB6dhklFoVx7XgCxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtU3xWNL9t9/CQYD+57mLotq3E41R6JBRRDq8aIANbDzbt40lOP/L5YBmPYjsQcwhUu3KutJuhN2xrh3R6r6VsQUxzz6ROghVW6ghLuhximcnROQfpZ8mvagSMasxoZfEKJ3BkY5kGq5QHz5ZjN0G6LYa0D7EbpuutvSIMP2wXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H9cCz12L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H9cCz12L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CC6C4CEEB;
	Fri,  4 Jul 2025 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751636705;
	bh=U3nMWen8wac9iRLyb1hTreClQwaB6dhklFoVx7XgCxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9cCz12L7UL3Wm63FMSHtzyWrO82sqYhk62jOZ27qF2IsO50Me4cehWXDvZt0Y0vA
	 NyFqkUiCIklIJ4FyLMN0RyFCfwNIiSmoc220wY5QQhOPqi0k99NyNoj5Z3zfQxiqKx
	 EEJxPh56pc2i0XE1DLPzSpiP6M9jdaLH0mA00sf0=
Date: Fri, 4 Jul 2025 15:44:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Jeffery <djeffery@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Stuart Hayes <stuart.w.hayes@gmail.com>,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Jeremy Allison <jallison@ciq.com>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
Message-ID: <2025070408-starlight-pandemic-0266@gregkh>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250703114656.GE17686@lst.de>
 <CA+-xHTH2rxWwAao0EuNbhubqA2mrXOTZ7r1p-hcTieieomx75g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-xHTH2rxWwAao0EuNbhubqA2mrXOTZ7r1p-hcTieieomx75g@mail.gmail.com>

On Fri, Jul 04, 2025 at 09:38:15AM -0400, David Jeffery wrote:
> On Thu, Jul 3, 2025 at 7:47 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
> > > Address resource and timing issues when spawning a unique async thread
> > > for every device during shutdown:
> > >   * Make the asynchronous threads able to shut down multiple devices,
> > >     instead of spawning a unique thread for every device.
> > >   * Modify core kernel async code with a custom wake function so it
> > >     doesn't wake up threads waiting to synchronize every time the cookie
> > >     changes
> >
> > Given all these thread spawning issues, why can't we just go back
> > to the approach that kicks off shutdown asynchronously and then waits
> > for it without spawning all these threads?
> >
> 
> The async subsystem fix is something that should be fixed regardless
> of async shutdown. Async shutdown's use just exposed its thundering
> herd behavior which is easily fixed.

Great, then please submit that on its own and get the maintainer of that
subsystem to agree and accept it as I have no way to judge that code at
all.

thanks,

greg k-h
