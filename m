Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA6C1991C9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949482; cv=none; b=Q3uYVoua0xmahiqXA8uWZGdYl04xnoP2q7hgqLf9/n2LF/VAl7tQP4Dw0DMJHy4kGiz9e57TltaJUBD85k7eP8Lb7bfK7XwaV4dSiFzXg+ow80DFtefn/7j5MRLPLApECYmcE2cBeWVHctEzXvn8rYPRehHl+ZWQIJp5orbCPSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949482; c=relaxed/simple;
	bh=Mmn1yLbmQ2R8QRFFBgUrX1KxUQvQaQnrzzBOc5ljbX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwY7IswpaiuKvWcIxuXYv99UqigXyaHq99Y0TpB8e+k5J8DALbYUeTCn565Rw3l3712YoIWkmaPR+DvONPA8GphLyriX4fT/li7MWC7Zal9GKdLPwrEZd190mCxr9AXAHRHbwY9C8WFxzl1yDVzgUt7QH2TK6pa1ExELCN1SVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kP5kZk22; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kP5kZk22"
Message-ID: <f5f19a27-aa89-4e8c-8e11-6fb85588d015@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738949472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hAjhT/tKoHU1T7OMc00EUjjhadQDMHc/p+jVYe8u4Y=;
	b=kP5kZk22x0I7rYHIuBHWsmeQviIPDg+oBKYLlvknsMv8i2vqpBcoEJbbzJx2929f3zmiH1
	tId4gpa06QLfXywYmjCISMc1jW1j6Ko2LjKcAdzo9rcvnXEYfIfj8/hFezP3VOJAZ0bOk1
	XS0z9LkbmWjZdncubsZ3+fSARaE384E=
Date: Fri, 7 Feb 2025 11:14:48 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/10] Add SDCA DisCo parsing support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20250205113801.3699902-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250205113801.3699902-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/5/25 05:37, Charles Keepax wrote:
> The MIPI SoundWire Device Class for Audio (SDCA) specification defines
> most details of the hardware in ACPI using the MIPI Discovery and
> Configuration (DisCo) specification. This patch chain adds support for
> parsing most of this information into the kernel such that future work
> can make use of it to construct CODEC devices and soundcards.
> 
> The most notable outstanding work here, is parsing the separate
> properties for the Control Numbers (roughly equivalent to channels)
> within an individual Control. The separate Control Numbers are
> supported but currently only the scheme were a single default etc. is
> supplied for all.  This should not be super hard to add in the future
> but isn't currently required by any of the hardware I am working to
> support.
> 
> Thanks,
> Charles
> 
> Charles Keepax (8):
>   ASoC: SDCA: Minor formatting and naming tweaks
>   ASoC: SDCA: Add support for Entity 0
>   ASoC: SDCA: Add SDCA Control parsing
>   ASoC: SDCA: Add parsing for Control range structures
>   ASoC: SDCA: Add Channel Cluster parsing
>   ASoC: SDCA: Add support for IT/OT Entity properties
>   ASoC: SDCA: Add support for clock Entity properties
>   ASoC: SDCA: Add support for PDE Entity properties
> 
> Pierre-Louis Bossart (2):
>   ASoC: SDCA: Add code to parse Function information
>   ASoC: SDCA: Parse initialization write table

Thanks Charles for extending my initial draft, LGTM.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

For the record all the definitions in this patchset are extracted from the SDCA public version available at https://www.mipi.org/mipi-sdca-v1-0-download

> 
>  include/sound/sdca.h            |   22 +-
>  include/sound/sdca_function.h   | 1089 +++++++++++++++++++++++-
>  sound/soc/sdca/sdca_device.c    |    3 +-
>  sound/soc/sdca/sdca_functions.c | 1407 ++++++++++++++++++++++++++++++-
>  4 files changed, 2480 insertions(+), 41 deletions(-)
> 

