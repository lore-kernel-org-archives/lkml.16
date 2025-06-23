Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA1F1C5D62;
	Mon, 23 Jun 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681041; cv=none; b=Thvxq2UuuqpbwqrImmqo6D32+YxcSitKtLm0rpcKnAvN1ddM+WgbNy44XZSbQGHWmRhox5B6rANSbXjz7hZboI5/7ZesDHkaK796+yLc5P3rSJYCin9TQTrxO6q/wG5Eg79rrvozUBrnlwJ//O3/jTuzhuKR1LV0n7qBiDMsVMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681041; c=relaxed/simple;
	bh=Zxr5h4VXpm/XSXrlkMN5GFq6pd8xMsA/nBGdgDogvus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDK5UEk/HJOWGgtmTlKnNKO1ZheGayxgt1kaRWuT0pHc+lJNOGt/UwIBFl3QlFKVhJxQwG5Cn/kz5o1QNLN8FkLYiEkCwHxKJ4BoCYezv2dkYQHjb8pbzvOs/oYRdvn54TvjmP9jWh5WH7HFwpSkfWcuGlYBlCk2ZG3qKcihj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3D78113E;
	Mon, 23 Jun 2025 05:16:58 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B5A43F58B;
	Mon, 23 Jun 2025 05:17:14 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:17:07 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 0/2] firmware: Add MediaTek TinySYS SCMI Protocol
Message-ID: <aFlFw-AjqxXcIuBO@pluto>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>

On Mon, Jun 23, 2025 at 02:01:34PM +0200, AngeloGioacchino Del Regno wrote:
> This series adds basic support for the MediaTek TinySYS SCMI Protocol,
> found on the MediaTek Dimensity 9200, 9300 and 9400, other than on the
> MT8196 Chromebook SoC.
> 
> This is used to communicate with the CM_MGR and other MCUs for power
> management purposes.

Hi Angelo,

thanks for this.

I will do a proper review in the coming days of this series anyway, but
upfront for future V2:

- you should provide some sort of documentation for this new
  vendor protocol and its messages, as an example from IMX:

	drivers/firmware/arm_scmi/vendors/imx/imx95.rst

- where is the SCMI driver that will call all the new vendor ops
  defined in: scmi_mtk_protocol.h ?

Thanks,
Cristian
