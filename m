Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12D1288C9A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299668; cv=none; b=UA5PhVumhQjeJToNWXnKIZY9GKOFtnc6SMcFUK2uLqbCdBJG9Pc3UvpKVmg+3XBRHaaqSiYQ7FcSfgUiUIu0SfvvuGGUy2LRzuAEa9ADXpl6gYu68bI9jHkB1Acil/SwZndHgvMPZdh25Gs0+FOAJdYE1KDjHO3Hz0qgHH45eYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299668; c=relaxed/simple;
	bh=qg2je0jGwPczjxr7UEmyEcBXhwDxjfTpDkAe2rcZ8Zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnnqdSZNfoWXyeCzykvTlRpFuPmMrzVdFffzWXEBaNQfWxprOucOcmKa8HhGVW23alRvvZQiY5/HgjYj8J6yUrs6tnIbKjBjGC+r7lvOz6N2iruLy+/jNK+89YJfJzM5GlR9r7E2F2JEmpu+4NhMt781e/J+Cf9P8jCUvyulABE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mQREhR4+; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mQREhR4+"
Message-ID: <fca05051-56f1-495e-aaf0-997fa2150fcd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747299653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KnDKuPjMe2fUCcW1tV4lBlMzw+7EXjmMesGcn74GA4=;
	b=mQREhR4+7ST03MmzWDJZ3MiA8ALnrMc17zUGVXVIIajCaxIhp6gbhYtojMSw1eH53Llacd
	hzdqFzfqeRk165SZNv8dp4nR+TZ2jNWOaxEa6E9lOuUTHitGbOY61LHajBJgqhd2lAHZkF
	oeGASFMsLnbDRS/egJ3/rYdPa+oTbTI=
Date: Thu, 15 May 2025 11:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] ASoC/SOF/PCI/Intel: add Wildcat Lake support
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, bhelgaas@google.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250508180240.11282-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250508180240.11282-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/8/25 20:02, Peter Ujfalusi wrote:
> Hi,
> 
> The audio IP in Wildcat Lake (WCL) is largely identical to the one in
> Panther Lake, the main difference is the number of DSP cores, memory
> and clocking.
> It is based on the same ACE3 architecture.
> 
> In SOF the PTL topologies can be re-used for WCL to reduce duplication
> of code and topology files. 

The thread clarified that the statement above is for generic topologies. Using specific cores and/or a 3rd party module will force topology editors to provide device-specific configurations.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

