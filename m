Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3170A2571AA;
	Mon, 23 Jun 2025 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685426; cv=none; b=iuI6QebiQA10ifLSXwND6hu5hCMFmb+/PQUrbhh04O5FUAbG67YMLoD/a0Jl5bVsvFQG3I+jyOmvMhSH6t4O2Lw6JHgHMt2X4sWh3yPpZQXurzMf0Qm2gUivlel3AnB22loPpsJA2Tbcajk1SV+YsOhIjmkkTORmKYtY63YQBS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685426; c=relaxed/simple;
	bh=P64FVZCl6D2mo9jeWheiQAUoreBUuMnsrt9KABpA5H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDhxokrHvUNVVNj0/AZVdctRAx4s0ZvjfReG2f3FaM1/dk1v0xwLcJ6L4FV0s9q2D+cwF0dV4Jv/5bWPtrJMoCMAo3HtgP+MJWhVbVmFG8pWSfMHw/KqLLqQelH1SiOsYujBLcKFVkNhYlyjnydCY98zy6civ2C1pSwIOVM8tvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8641E113E;
	Mon, 23 Jun 2025 06:30:06 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7C723F58B;
	Mon, 23 Jun 2025 06:30:22 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:30:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	sudeep.holla@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
Message-ID: <aFlW5zVERnpwIkS4@pluto>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <aFlFw-AjqxXcIuBO@pluto>
 <9e8d0dfc-7dc4-461d-afd9-bd381219422f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e8d0dfc-7dc4-461d-afd9-bd381219422f@collabora.com>

On Mon, Jun 23, 2025 at 02:32:24PM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/06/25 14:17, Cristian Marussi ha scritto:
> > On Mon, Jun 23, 2025 at 02:01:34PM +0200, AngeloGioacchino Del Regno wrote:
> > > This series adds basic support for the MediaTek TinySYS SCMI Protocol,
> > > found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
> > > MT8196 Chromebook SoC.
> > > 
> > > This is used to communicate with the CM_MGR and other MCUs for power
> > > management purposes.
> > 
> > Hi Angelo,
> > 
> > thanks for this.
> > 
> > I will do a proper review in the coming days of this series anyway, but
> > upfront for future V2:
> > 
> > - you should provide some sort of documentation for this new
> >    vendor protocol and its messages, as an example from IMX:
> > 
> > 	drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> 
> Noted.
> 
> > 
> > - where is the SCMI driver that will call all the new vendor ops
> >    defined in: scmi_mtk_protocol.h ?
> 
> This was tested with code that is not clean at all (hence I can't push it upstream)
> and well... I didn't think about the fact that, effectively, without an user, this
> code ends up being unused.
> 
> I can't promise to send a clean user in this cycle, but I would really appreciate
> if you could still check the protocol code, so that if there's anything that you
> can spot I can fix it while the rest gets done :-)

Sure, I will anyway review, but a driver user exampe would be useful, maybe
posting it at the end of the series as a NOT-FOR-UPSTREAM/RFC (something like that)
so that we can have an iddea of the usage patterns while being aware that it is
still not clean for upstream.

Thanks,
Cristian
