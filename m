Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E89324C07D;
	Mon, 23 Jun 2025 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680989; cv=none; b=MZjnGhkGXKCoiK0NA3o1fXxcWvqvTY6Vc7ioXjy+5vxrRZuKJzg3xZfgHumcXQWpaOzPUX27whgyvU2qS0BuvGrYDLos21dt2f6iR03cbXBgmBarfqLpSIOZ/UEmqUMinRAiZBowVScVpt/KQ4KG8kPq6F0uikmotHftewQ49Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680989; c=relaxed/simple;
	bh=F3TE2pSM2qDh0JUG9JA+D+LvrldgmljJtQRyIO75nz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY5iMIhXbPnUv+t8MEECtmlW0ShgxNkFzUbxV/mysD5L35XdLCc2cGp6oAW7Wa8DNNq3SOuAQz877dSdkjrhNd3nxhSZOB4y6BKSDjbZgP+0UeB7I5wHWVCmUwtM0hxy+Ybadq2a0NLOVDbrSOGEekgPVobVpg+5CaB+/3JxHq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8501113E;
	Mon, 23 Jun 2025 05:16:08 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3C8E3F58B;
	Mon, 23 Jun 2025 05:16:24 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:16:21 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 2/2] firmware: arm_scmi: Add MediaTek TinySYS SCMI
 Protocol support
Message-ID: <20250623-free-puzzling-wrasse-0fdb7e@sudeepholla>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>

On Mon, Jun 23, 2025 at 02:01:36PM +0200, AngeloGioacchino Del Regno wrote:
> Add a driver for the SCMI protocol extensions for MediaTek TinySYS.
> This is used to communicate with various remote processors in some
> MediaTek SoCs, which mainly handle power management related tasks.
> 

Please provide the detailed documentation for this vendor protocol/extension.
Refer drivers/firmware/arm_scmi/vendors/imx/imx95.rst for example.
It is hard to do any useful review without the detailed documentation.

-- 
Regards,
Sudeep
