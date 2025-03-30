Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D988489
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743310763; cv=none; b=cUj7nvolggaXmd2+K56KCD46X8TkV+VQa9aDDuwdL/4Rw/MxQLUtHVJoefOQF2fyyHlxICaBmc4i1mQYx0badXnM03T0dkDmdI4JkHXguAXYbQhRuAfmWK4a0TjIqokTiioNLIApUxKMK+wKxWqBPZGXEyfs18qCK3hPVM8ug2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743310763; c=relaxed/simple;
	bh=f0Gm4jZzdq/5vnapq3+atvRFnvkB630l+xA5eo6Jg2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q48/2Lons7F7u0KKUm9FWWZCQ4miX8l3SWR2iOESNHbk/sQhD0/mhR7oE6m46a8xvKS/RFMeG6sB1rzTJcWcvtzAH/GJH2MyNib/inz7kraF/OAVHLnYFrBIQ976ZNvdon9Xhho96SMp72gDS3JunMp6WiqcyAEz2IDo1LPw0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqCvESs/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqCvESs/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0B3C4CEDD;
	Sun, 30 Mar 2025 04:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743310762;
	bh=f0Gm4jZzdq/5vnapq3+atvRFnvkB630l+xA5eo6Jg2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqCvESs/bF4EQ7ixgG7nBQLbXTv5WzIMalXX3uN/2Hmx3xQjxaQ8w6+Dnokipb6O+
	 eC62vN/gR7HTTeYV9DdxRt0oVUJLk1jovc/yxezfQsh8B7eACsdcj+NNNcvomVIVbf
	 6805lfU4ud8yRswEx4dKStHq9ON4kxKWz/JMr6Kggprk3jCYibed+F+3yMsYLvRMgW
	 fHB1VlB0e/LgZuu1QYNZ0Z+psQC6MOuZ6Q33TysuNIdNk4210lgFpL+5NXBujV7o2L
	 +bxCOQf1amHy/vhSxFJLS2aj4UlaaB/zxgPzGYKLXmcL/9w2OjA4Ovzc0eEnuK78uM
	 dMoh5aNQPFKMw==
Date: Sat, 29 Mar 2025 21:59:21 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: syzbot <syzbot+f3c6fda1297c748a7076@syzkaller.appspotmail.com>
Cc: da.gomez@samsung.com, dave@stgolabs.net, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mm?] [fs?] BUG: sleeping function called from invalid
 context in folio_mc_copy
Message-ID: <Z-jPqeKtno_267th@bombadil.infradead.org>
References: <Z-jCVfGaNHmLVN2i@bombadil.infradead.org>
 <67e8c6af.050a0220.1547ec.0089.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e8c6af.050a0220.1547ec.0089.GAE@google.com>

On Sat, Mar 29, 2025 at 09:21:03PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> unregister_netdevice: waiting for DEV to become free
> 
> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3

B.A.T.M.A.N. Advanced Meshing Protocol --> networking.

Seems like others are seeing this too [0] and I cannot think of how this
patch series affects networking, specially for that issue. So nah, this
is not caused by my patch.

[0] https://lore.kernel.org/all/314522ae-05a4-4dfb-af99-6bb3901a5522@amd.com/
[1] https://lore.kernel.org/all/67deb092.050a0220.31a16b.0039.GAE@google.com/

  Luis
