Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0152BD5AE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931318; cv=none; b=eqidDvGLIOsXGRbX/RbryMJlrAGA/uGJEx4bXaCPXxX5gcg/ZyJJ0vA6TJuBBHKV2Eq2+9uQQ/gzHhS9JGo4g8Fr3eDFkUikuT7Yy5azjVu7QLB6QZPshCOvpBsz+7DB55f+yVOPmZyijvoZ1vRdPlFpiVlV/2QTQHgJ6erxU5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931318; c=relaxed/simple;
	bh=oy9o2rIX4i09EViyQN9eLw3vgtgrV2Y6NXSLqJYZNLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWAulvnzfxEHbwZfbAaihEE3kp2+HaIdVOH+V/3ZOizDSBPdeHIaImr09QGwtabNUh8uemd/j2ChBrFSXJSDIdtut5vopw6c9NcvRWuoDEqcrM/JjwVNZf6c1m2xwj25+3D9Nlns5bTpnF1VMa6rGmLt0slIu0mKQ9Rp8HQngrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id CE04C68AA6; Tue, 29 Apr 2025 14:55:05 +0200 (CEST)
Date: Tue, 29 Apr 2025 14:55:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alistair Francis <alistair23@gmail.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	hare@suse.de, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
Message-ID: <20250429125505.GA13574@lst.de>
References: <20250424101333.2908504-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424101333.2908504-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 24, 2025 at 08:13:33PM +1000, Alistair Francis wrote:
> Ensure that TLS support is enabled in the kernel when
> NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
> used out of the box.

How did the code even build before this?

