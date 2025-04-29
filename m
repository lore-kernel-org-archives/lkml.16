Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE3227E95
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948531; cv=none; b=Be0gvBNL5fcaRamipmer3n5JPt5VHi5HMQMsLRQbLUdlhfjEIwFFu8ZFX7PewKaI15IzjCc4Lc/yHgGb2BwmG6z72DfDiP6uXeg87unsWEId2yQtD39nXBWhwLo2DovnO4PeQz16axVHow03q87jw+JripTpV/SF/qXR6SI11SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948531; c=relaxed/simple;
	bh=quar4LJeCruYrX9mBAaOzHlPxFGeSLXNozfLVYsglV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R80zbcSqRm8EgciOYQGrdMfnM/9Pe5Rihpu0zjFx8guK2jViAN6QQY4eSsyiNtuHrODiaE4zaXY4mv7KKrU86LVcrjD68iT7VkhNtc+1beuxqjTp1Yn0RmsefKLFwOb/R8t5Hhrfq1edoKkdwjNaVhK4thg1vpD77kiK82vIBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzNKVNu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzNKVNu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F008AC4CEE3;
	Tue, 29 Apr 2025 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745948531;
	bh=quar4LJeCruYrX9mBAaOzHlPxFGeSLXNozfLVYsglV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzNKVNu2gMHClOAN448Tz1U/PliJnckepyn8YPpt4E6jjZ05Iu06qj0XV8NZVzODe
	 GfejOtPBsNklyJ/o3rEmE5VSLydln2y5/VhK+ym+Gp5enTPZI06g5/OCc1wCJStdcC
	 RNdP7gN8nNKXwbYRVIhl2vGC/b2De68yaKSdJl8RqMdjkoRFifC+X9WCXSFQiiOV57
	 W0gilylwxillM+HNkIsM4uX/Jea4x+DzkuMa02oy4Vken+sTRPFGM1p0h5W8mgPsYy
	 USq7bOkXjJi2vByjZAmc9BhJ1+tAVczcTmnFwXvOoObjKkry+Ih/41Rbe09BAgFdRk
	 ndleoLsspNeFA==
Date: Tue, 29 Apr 2025 10:42:09 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Alistair Francis <alistair23@gmail.com>, sagi@grimberg.me,
	kch@nvidia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, hare@suse.de,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
Message-ID: <aBEPcVursIG8fab6@kbusch-mbp>
References: <20250424101333.2908504-1-alistair.francis@wdc.com>
 <20250429125505.GA13574@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429125505.GA13574@lst.de>

On Tue, Apr 29, 2025 at 02:55:05PM +0200, Christoph Hellwig wrote:
> On Thu, Apr 24, 2025 at 08:13:33PM +1000, Alistair Francis wrote:
> > Ensure that TLS support is enabled in the kernel when
> > NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
> > used out of the box.
> 
> How did the code even build before this?

The nvme tls code doesn't appear to use any symbols that depend on
CONFIG_TLS, so I guess it would compile but wouldn't work at runtime. ?
