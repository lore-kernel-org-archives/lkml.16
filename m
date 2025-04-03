Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8157D2E3387
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 04:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743654364; cv=none; b=d8kYR7hDqmtCeNZFokQ0cro6xDdkPIdTn1QP/1UvTyBvFeuLSFmTGh6dAGkBvcXPHKpfj97aZaCwYo33zHDiAxj2lc3ekn5tdBXmvByBSoT2yAbn4YBkJkOiQfCCh4rJg9m8sd/cZE0bEUTv/iqbu9zu2JWhSCOql5t3qjNizqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743654364; c=relaxed/simple;
	bh=FdE1YZCt7kgBOFlQI4kh8uaWFeyRr7X5EFD8DIScfTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqFlo9rFuSnCkL5X2FRft/s9zwPT7wwb1tvkei5dHdZys8eqiBM/Gad39+froLOAofSXm/DnOZ6t6R5OEdRL2Jy2B/NiWwn8Jct2On5KAYqVGP/Vd95eR+XkbZ8enGYKmGt5vjwDxbE6r9+v6o+ofDbcmyVKha3OKZGRdcZN+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 18AF368C7B; Thu,  3 Apr 2025 06:25:58 +0200 (CEST)
Date: Thu, 3 Apr 2025 06:25:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yaxiong Tian <iambestgod@qq.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	chaitanyak@nvidia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yaxiong Tian <tianyaxiong@kylinos.cn>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v3 1/3] nvme: Add warning for PST table memory
 allocation failure in nvme_configure_apst
Message-ID: <20250403042557.GD22360@lst.de>
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com> <tencent_A06D513AE17E9D4B4AC66E84F447FE730C09@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A06D513AE17E9D4B4AC66E84F447FE730C09@qq.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Apr 01, 2025 at 05:26:52PM +0800, Yaxiong Tian wrote:
> +		dev_warn(ctrl->device, "Failed to allocate pst table; not using APST\n");

Please avoid the overly long line:

		dev_warn(ctrl->device,
			"Failed to allocate pst table; not using APST\n");

