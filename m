Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E872BD5B0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932206; cv=none; b=RkjlBOpMoLouc5otjS0g2l0TpY23Ql65DRbKPs3vMtczTlBaeybpeWImbLRuAm0AHVIUtIt4PkyxeBmuh4Y5fTOJaGuNk7Mz1YoLUMiI+NwPHxG5qX4fhwOvZ7ctGOmit16RoBvqBdkn9n8XsRFKpCcRQm3iL8X8a6MNhlLOo4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932206; c=relaxed/simple;
	bh=mZjMxrhZX3PqZC48WDq0iIbfVoV5QzA01VRsQ1C30T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZQ5ITCd4P32mHnV+ATJJjy92/EobdvR7jG/NEEBiGhNXiZWUrJuOt4Q+e4vr/oQOMEmosdo3l64ZsD5nrPgwUJqDsvDleLBCLTciUi3nqL0/dPSDcmGlkYxXxkaBt+tQKOz+6YQH9LjCmxp3FtvExVyXOmyJKqklP6Bf5Bwkpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A172668AA6; Tue, 29 Apr 2025 15:10:00 +0200 (CEST)
Date: Tue, 29 Apr 2025 15:10:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: kbusch@kernel.org, linux-nvme@lists.infradead.org, hch@lst.de,
	linux-kernel@vger.kernel.org, hedgehog-002@163.com,
	rugk+github@posteo.de, sean.anderson@linux.dev,
	wangyuli@uniontech.com, zhanjun@uniontech.com,
	niecheng1@uniontech.com, wentaoguan@vip.qq.com
Subject: Re: [PATCH] drivers/nvme: Add quirks for WDC Blue SN550 15b7:5009
Message-ID: <20250429131000.GC13970@lst.de>
References: <20250424024010.308175-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424024010.308175-1-guanwentao@uniontech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

added to nvme-6.15.

