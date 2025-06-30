Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD1152DE7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265342; cv=none; b=YKsyC+f0CwdtQHwxfubkfW7inSiUCp8/os+EZdo1UqMaPCDy85yBK/dyZApK0nbADA6MmDhNR904I+suGZZjDrhcYE0U/K7XMR2ijFUNVRMFZ/grfvjb4AjRVneYgODYFtcK8jrVWg6Cg0/nDuHuZbg6IcwLqSrP54rWpcg97RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265342; c=relaxed/simple;
	bh=xE0j9n72gctkZuppa2bHDilGxHLRS9I8mZtoIfCbiws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaKbsW60WXE7Cjl2rBSJVDDsV3ll8rf4QAWH48tpGHNDxQuifXjYY9BEbeok9jiwlYxkP+NCWIuEqgxf+R4fXyP0erEj0c+BStRZp8nxL2fSaKGXqPEo3FVFt0VfVsTai0YLpVvpyZSamnk4BS/i+jm5pnz3wlw1b9ZEHbzUHEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id C814268C4E; Mon, 30 Jun 2025 08:35:36 +0200 (CEST)
Date: Mon, 30 Jun 2025 08:35:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	martin.petersen@oracle.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, darren.kenny@oracle.com
Subject: Re: [PATCH RESEND] nvme: Fix incorrect cdw15 value in passthru
 error logging
Message-ID: <20250630063536.GA29624@lst.de>
References: <20250628181234.3978844-1-alok.a.tiwari@oracle.com> <20250630063430.GA29582@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630063430.GA29582@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 30, 2025 at 08:34:30AM +0200, Christoph Hellwig wrote:
> I fixed up the commit message to include a Fixes tag and drop the
> mailing list reference.

Please ignore this, it was meant for another patch I applied.
