Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64231367
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575861; cv=none; b=Mqwop9gecotrlzmii+qTBl0Wnb6hMSdN4B77QQ8IyP4jJMYyfR4Q5ju0neHPb3vGnVqOR6y4nDsFvMQggrh8h5v2AVwzWmawhyMWPFY4VxGd+ofhZe97f6sferHVvbwaougbciuEdtf/9Y+C0P3yz4tB8dM0Yn1HODOOpqWSAjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575861; c=relaxed/simple;
	bh=WQlmqeAwSop+3PWdK6x4DTTcUGtrLCljoTGVHUMCDT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrTcG1aXNfCMEIeFd6eb+mLeyNhw+zr+hi7Coj7XVgkssif2Cg7IypRLqE6axDt3YnG7nem8XVbqp8fRlGjf6+sKm4k5DkxXgOtxSyrqZdoqlOTXe+9LoTBN6YLeGZUSUC6yKUEZUDEhgUjXqo4oB78Cgw0Apf8BlQJd8vv8QdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfB7fKcg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfB7fKcg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9C1C4CEDD;
	Wed,  2 Apr 2025 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743575859;
	bh=WQlmqeAwSop+3PWdK6x4DTTcUGtrLCljoTGVHUMCDT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfB7fKcgC3eY7a8bAguJV+7u7G7OfadeUdwoaB+LMGeIf2lUBPPsajuKLad/WQf+t
	 gi5mRdgp/aFovws4dtaA3jYvrwGEliskvu16qxE6/Q1SJHunKti/1cS1dAuN6c+gSP
	 vf4/TuHGUfi9E6ygsw2VWrDgZIo6w8xSiwccLXnBgdpeGMabyi+KI4T3EJloROqWj2
	 +EwdjTrViCuyZOtJLW5uaWoSqobkVCfh+HDqikXiSisdLjW4fmCTn1DUXQTR3HZnpu
	 vTkRcm1WwlpfUo/tCrDwtuL+kX+gud5F8qynslBFQh5UUIGdKh54L/CoJ5q8+oXCKl
	 s6WzCyeFucViw==
Date: Wed, 2 Apr 2025 08:37:35 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Kamaljit Singh <Kamaljit.Singh1@wdc.com>
Cc: Keith Busch <kbusch@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>,
	hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v1 1/1] nvme: add admin controller support. prohibit ioq
 creation for admin & disco ctrlrs
Message-ID: <Z-zbLx9h0IbOEmbO@ryzen>
References: <20250328213640.798910-1-kamaljit.singh1@wdc.com>
 <20250328213640.798910-2-kamaljit.singh1@wdc.com>
 <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com>
 <Z-ueG-wTibsSu5lK@ryzen>
 <BY5PR04MB68496CB7512F91FEA30DFF86BCAC2@BY5PR04MB6849.namprd04.prod.outlook.com>
 <MN2PR04MB68626A7C2D254018FB37851DBCAC2@MN2PR04MB6862.namprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR04MB68626A7C2D254018FB37851DBCAC2@MN2PR04MB6862.namprd04.prod.outlook.com>

Hello Kamaljit,

On Tue, Apr 01, 2025 at 10:57:36PM +0000, Kamaljit Singh wrote:
> On 2025/04/01 01:04, Niklas Cassel wrote:
>  
> > But to be honest, the code did previously
> > allow an I/O controller with just the admin queue and no I/O queues.
> Agree. Initially, I was able to use that hole by forcing nvme-cli to
> allow zero IOQs. But based on your suggested driver change we don't
> need to patch nvme-cli anymore. That's slick!
>  
> However, from the nvme-cli's perspective it does feel awkward to be forced
> by "nvme connect" to use -i <non-zero> for an admin-controller, even though
> its now being overridden with this patch. We will have to come up with a
> cleaner and standardized way to connect to an admin controller.  A standard
> port number for an admin controller might be the way to go but it's not in
> the spec yet.

So, with this patch which overrides the user provided value,
if the controller is an admin controller, you need to use:

$ nvme connect -i <non-zero> ?

Can't you simply omit the -i parameter?


Kind regards,
Niklas

