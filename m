Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E59E1AED5C;
	Thu, 24 Apr 2025 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490127; cv=none; b=ttUbn7u+wNcY1MzwWxxMyU3cKoCD1bj8WLzw7tz/AbIoOcLQLfIPnB0fsQkGkx25IlzPQeU6RzX2sbZXHEMPhaW3YwyJI7XNF0XC5XM6qClpBIKxwZ5Bt0FbkrqQfl6b/utaZkThOVOJIbpz2CPsy6rky2U/+pf0/S9hAN03ogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490127; c=relaxed/simple;
	bh=5e8ktb/NQ43XVpcShbVdpz+YZCXkLyNhLoKwr5Y4x98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8EdMsydPnNCRP+q1Sr0UpuG6IkGAy7wOQU8F9byUuaXB0e73B7QVcjSPwyOnD4itKV75yN/iiJMXZ9DhDNveFcDYjQSa7hnU/0U3oMw8G0qrlG3tVA5PwMKJESh3JXrcBbwzLNLLv5FKP+wWaFCu1+bRAT6rsBWsNMAQ+QKTVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+hxFAWQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+hxFAWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745490125; x=1777026125;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5e8ktb/NQ43XVpcShbVdpz+YZCXkLyNhLoKwr5Y4x98=;
  b=i+hxFAWQBw8Exp/RvC4VGpMLAV//sjCx9mqqcalWRl/+4i7FNuzLZWSq
   lxMsIKO8QDcKAl43jna07B4weBHYuQMBrSdsoJFNJfQLFGy3cZ7BWqXwG
   EmtEga9wyIHEbpUhYYdFBwQXUadsZlgwuwskFIbSA/TXo2IhsbPaDoSCR
   Ho/YDSAN/SZoLIA/s49E1QTf9r8j8se6WfvKDMHQ20/HaJbCJ9AtA9xXy
   bvjULPLQiykZePh2rtq9EUI1tBdpzEZbMPoVOIBCA8b9Bo/AQ3PIC5vq3
   QSBMCFOV17VXsMFm3oASpujAUjOoi5meRiRbTq6dOgZfdyBCXTFLX9mrB
   g==;
X-CSE-ConnectionGUID: 9i34+qBlTCWnepPqjZkxTw==
X-CSE-MsgGUID: Q4JciHdrSqeXng1zEm+Tqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="69599963"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="69599963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:22:04 -0700
X-CSE-ConnectionGUID: 9rYJc79DScyIzN0FN+mkhw==
X-CSE-MsgGUID: rB0PBI6aQReGHdkRkn+IlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132557752"
Received: from sbockowx-mobl2.ger.corp.intel.com (HELO [10.94.8.84]) ([10.94.8.84])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:22:00 -0700
Message-ID: <ebf0ccd0-9429-43b6-b56b-73feeb856593@linux.intel.com>
Date: Thu, 24 Apr 2025 12:21:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: intel/avs: Use pure devres PCI
To: Philipp Stanner <phasta@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20250423082858.49780-2-phasta@kernel.org>
 <20250423082858.49780-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250423082858.49780-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025-04-23 10:28, Philipp Stanner wrote:
> pci_request_regions() is a hybrid function which becomes managed if
> pcim_enable_device() was called before. This hybrid nature is deprecated
> and should not be used anymore.
> 
> Replace pci_request_regions() with the always-managed function
> pcim_request_all_regions().
> 
> Remove the goto jump to pci_release_regions(), since pcim_ functions
> clean up automatically.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   sound/soc/intel/avs/core.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 8fbf33e30dfc..dafe46973146 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -445,7 +445,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
>   		return ret;
>   	}
>   
> -	ret = pci_request_regions(pci, "AVS HDAudio");
> +	ret = pcim_request_all_regions(pci, "AVS HDAudio");
>   	if (ret < 0)
>   		return ret;
>   
> @@ -454,8 +454,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
>   	bus->remap_addr = pci_ioremap_bar(pci, 0);
>   	if (!bus->remap_addr) {
>   		dev_err(bus->dev, "ioremap error\n");
> -		ret = -ENXIO;
> -		goto err_remap_bar0;
> +		return -ENXIO;
>   	}
>   
>   	adev->dsp_ba = pci_ioremap_bar(pci, 4);
> @@ -512,8 +511,6 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
>   	iounmap(adev->dsp_ba);
>   err_remap_bar4:
>   	iounmap(bus->remap_addr);
> -err_remap_bar0:
> -	pci_release_regions(pci);

Hm... shouldn't we also drop call to pci_release_regions() in 
avs_pci_remove()?

>   	return ret;
>   }
>   

Nitpick: If there will be v2, can you also align title with how it 
usually is in this directory:
ASoC: Intel: avs: Use pure devres PCI

