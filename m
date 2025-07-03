Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8882D3EE0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533561; cv=none; b=NxMdkiJtxuIiZQ2X/spMZxv/3FIJcqoPdb+XBtyALh/8XbIy3SHuNtS3Ch7I4c1D2beiMiTjQJmkzpAxajZI9Nw+UjwYl5D4iUZzeIf886c0hn3sGETT51IMdGC9JvQR50KvezQ2kJx/oejPPZAfvR+GmeQRnsvZQ+50GCQ4eWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533561; c=relaxed/simple;
	bh=FeJ9o3pAbPhVrTcYe7UddUwgRdaPYR5sm7vooA+Rii4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKC/WKyOMtZknuLpYbpPEUYhBzq5AMDXgME8ilYynEOspATQUisLao6FLXyKxsswUzQ6JpJoymcMyfbHPdfaFlp25rAaQhmQ/ZiWoLNsJMFZZ7VIMAUEKOfPe0nT5xT20DJ3X4nEzaWQib7I98eYMXOhF4Qaa72naqUEGpNW2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 374F268B05; Thu,  3 Jul 2025 11:05:55 +0200 (CEST)
Date: Thu, 3 Jul 2025 11:05:54 +0200
From: hch <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Kamaljit Singh <Kamaljit.Singh1@wdc.com>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, hch <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"cassel@kernel.org" <cassel@kernel.org>
Subject: Re: [PATCH v2 3/3] nvme: prevent ioq creation for discovery
 controllers
Message-ID: <20250703090554.GD4757@lst.de>
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com> <20250702005830.889217-4-kamaljit.singh1@wdc.com> <c168acff-66ff-4692-b21e-093c0aa592a1@kernel.org> <MN2PR04MB68626BDAC087B4CC8CC1A1A9BC40A@MN2PR04MB6862.namprd04.prod.outlook.com> <63310a08-e01f-464d-9f46-54bb817f2121@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63310a08-e01f-464d-9f46-54bb817f2121@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 03, 2025 at 08:59:47AM +0900, Damien Le Moal wrote:
> Why would the controller vendor or its fabric matter ?
> If the controller type is admin or discovery, you want queue_count set to 1. So
> I do not think there is any problem.

Exactly.

