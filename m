Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6222D190C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932186; cv=none; b=DUpv6w492X0qoVThjkx7bfK4YmNZaG96SF9AYu0LXl1NJ4eTyOwq0H25jpbHxnXFM+3A79nJx1dtz3eWCC+45xdDbBWY5XTPUL8ZkrFqqxEstynKKxJe7MqDdJp9GiyIIkav6sS9rsfN6YYkf0ZHFqndGYzQ2S0HuaP6J9ZT4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932186; c=relaxed/simple;
	bh=mZjMxrhZX3PqZC48WDq0iIbfVoV5QzA01VRsQ1C30T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdlmGzDMbVUNl7RwIHbNvgUJiYGW/4uIL8IHDFUkEFq9BFuHj57wsbBznESRPtFvmv9AFj5RAKP7uF4CYZi0caheQyvfSNcMG0bHFCsfLaUOUNq0YMEwh7bdaxynPtkZ/+HBqH2cq9XFZrgJqfFpeQ9lYdMjVQe4OMS2LOyTNs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AE46068BFE; Tue, 29 Apr 2025 15:09:37 +0200 (CEST)
Date: Tue, 29 Apr 2025 15:09:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alistair Francis <alistair23@gmail.com>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	csander@purestorage.com, shinichiro.kawasaki@wdc.com, hare@suse.de,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH] nvmet-tcp: don't restore null sk_state_change
Message-ID: <20250429130936.GB13970@lst.de>
References: <20250423060621.632581-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423060621.632581-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

added to nvme-6.15.

