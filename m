Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88D2D0292
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533455; cv=none; b=EUBuK8pCn9Wo5NURI6sDgKz20dAvrJdArlgaqKUL92nSUMzyRjDGxNlh6SY706PtsOwluZokYYBZkOfOxZ+AdA15YuBeZROY1nMi7apk//G6lJGC7UxKYxeQbSzVhn2tzpLJAAgMbc+ggwAbaErUJRrhAcjnoLqz+Hy5ZhJ/ZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533455; c=relaxed/simple;
	bh=L+Pb8NdJFXEleDGoRwNqem8F3z5Rl7a0a5J02MzIdKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8dkR6FqDfSPxOA7ijp53V+Zqut5njk6g0/KzBYAm0U36siI5ZRTbcAB22nra4r2zTymuL9Xd7iK2aYn70BFDHhTqMIhc20uYJc3QaKduozQItj0CozrkT+PGeu/+gvwpdwc+00UYSOqDhqbLykhyKDUx6HPjQ6dZ1+9NFn2SA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id E89D568C4E; Thu,  3 Jul 2025 11:04:06 +0200 (CEST)
Date: Thu, 3 Jul 2025 11:04:06 +0200
From: hch <hch@lst.de>
To: Kamaljit Singh <Kamaljit.Singh1@wdc.com>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, hch <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cassel@kernel.org" <cassel@kernel.org>
Subject: Re: [PATCH v2 1/3] nvme: add capability to connect to an admin
 controller
Message-ID: <20250703090406.GB4757@lst.de>
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com> <20250702005830.889217-2-kamaljit.singh1@wdc.com> <22f8ec86-2d50-4237-9313-79bfc93c8e3d@kernel.org> <MN2PR04MB686294B136454530692AEC1ABC40A@MN2PR04MB6862.namprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR04MB686294B136454530692AEC1ABC40A@MN2PR04MB6862.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jul 02, 2025 at 06:39:09PM +0000, Kamaljit Singh wrote:
> >call this in all fabrics drivers.
> Like I mentioned in response for 3/3, this can affect other drivers like apple/fc
> and I don't have any way of testing them. If you're okay with that, I can move
> nvme_override_prohibited_io_queues() into nvme_init_subsystem(). I did some
> analysis and nvme_init_subsystem() seems to be covering reconnects as well.

This should go into generic code.  Apple does not support admin controllers.
FC should, and this does the right thing for them.

> >> @@ -3215,6 +3231,11 @@ static int nvme_init_subsystem(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
> >>               kfree(subsys);
> >>               return -EINVAL;
> >>       }
> >> +     if (nvme_admin_ctrl(ctrl))
> >> +             dev_info(ctrl->device,
> >> +                     "Subsystem %s is an administrative controller",
> >> +                     subsys->subnqn);
> >
> >We do not print an equivalent message for other subsystem controller types. So
> >drop this.
> I left that msg in there for debugging purposes. I can either change it to
> dev_dbg() or if that's still not likeable/cluttering, I can remove it.
> Please let me know.

I'd leave this as dev_dbg only.

