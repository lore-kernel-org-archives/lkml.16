Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326E137E
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739040687; cv=none; b=JLI9wXCZhze9DXuhaX+lasy2HAnnSAuS8CoBGpfHazjwr0lEVaDClU6nFC9ezQjsTvUyeicpufnjDSYo1ayWZFaWXrch753SXi9Jm8DppqzYNHpEMVFEllptV9puxF8KBJ1+N29btZHrd/ebx44pPQSArj9WjzH5XI9zYLP/nRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739040687; c=relaxed/simple;
	bh=ocQtBMyOozySwQUoJT5XoGfejv3UAKO+w7LOrRwBmi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mtw8VgClvql9kLMI3Y6i0aFH1BzXZHiJKmyyyVEHqdPOHR5G1zB9ABfKnjcqjhu8drqVJCAPNZOLqVnjGBt9vagybs/tgTh9KIYJpwrAvCuqqpP0loNMERPT01l2GuOru8ylN1/8rTntxNJTyIO1slAeQ9BjbTvZku3JwewOG0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSLxDSiN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSLxDSiN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D750C4CED6;
	Sat,  8 Feb 2025 18:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739040686;
	bh=ocQtBMyOozySwQUoJT5XoGfejv3UAKO+w7LOrRwBmi4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cSLxDSiNI9z7JD5E3qbP2Q9bNIajFXQ8nkWOG0DQD+LvxmAybYhZY/We1rTFe5WN8
	 H/4gqZ2VlwqkDBFVwDD3gA5gAMnNLiLWx4EAULgyUmNoDIK6Ge9ISJxTFfS5ZhCwq9
	 aQnCXZxmxhxi0gL37uUSrJvwnqNAg62ZSNW2zIOesqeCSgH9mQSTiRqD/JzWTv9zvv
	 m89R7lubffnQ5AgmW8dKkBUfl39ayKvX+wUlpNzRXw75uGBjwhPMci+6nDTgDShB/H
	 C7OHSJCoix8XmXrpktZ9PU0yR9LuqbX6szaUwsLTaWYw+e8cjLbHDFxl83ys3IPY5v
	 pn6U8As/qI7VQ==
Date: Sat, 8 Feb 2025 12:51:24 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, rafael@kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH] nvme-pci: Use NVME_QUIRK_SIMPLE_SUSPEND for Qualcomm
 Snapdragon 8cx Gen 3 platforms
Message-ID: <20250208185124.GA1120888@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126050309.7243-1-manivannan.sadhasivam@linaro.org>

On Sun, Jan 26, 2025 at 10:33:09AM +0530, Manivannan Sadhasivam wrote:
> On these platforms, power to the PCIe bus is not retained if the SoC enters
> its own deep low power state called, CX power collapse state during system
> suspend. Once the SoC resumes after going through CX power collapse, all
> the PCIe bus state will be lost. So the NVMe devices on these platforms
> won't resume properly, rendering the machines useless until forcefully
> restarted by the users.

I guess "forcefully restarted" means a power cycle?

> +++ b/drivers/nvme/host/pci.c
> @@ -3162,6 +3162,16 @@ static unsigned long check_vendor_combination_bug(struct pci_dev *pdev)
>  	if (dmi_match(DMI_BOARD_NAME, "LXKT-ZXEG-N6"))
>  		return NVME_QUIRK_NO_APST;
>  
> +	/*
> +	 * Qualcomm Snapdragon 8cx Gen 3 (SC8280XP) platforms doesn't retain
> +	 * power to the PCIe bus after entering low power CX power collapse
> +	 * state during system suspend. So shutdown the NVMe devices to have a
> +	 * working system suspend on these platforms.
> +	 */
> +	if (dmi_match(DMI_PRODUCT_FAMILY, "SCP_MAKENA") ||
> +	    dmi_match(DMI_PRODUCT_FAMILY, "ThinkPad X13s Gen 1"))
> +		return NVME_QUIRK_SIMPLE_SUSPEND;

I certainly acknowledge that this is a big problem for users.  At the
same time, this seems like a maintenance nightmare of
platform-specific hacks scattered through endpoint drivers.
