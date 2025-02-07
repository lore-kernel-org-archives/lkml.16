Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B123C8DA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949475; cv=none; b=REB3SVVAT4vTSkm6NC3gJmOO0d2dS/jlRLDEAsLmI6hsyy9WCC4LLPsYVn+u0JsnHMenqkz7S5PQQd/Bgpcv8vbMiAjg4E3twMXvcYXEc9c6gjLR1nZsYwx+FaW+vtPUbRrLYB8NbScvpHIMYkKiqxm2da5HwKbtHkJtqwE+T8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949475; c=relaxed/simple;
	bh=g5+xXx0JzOl/kazoQjp0AnGWnG+9meEMceu21gLaKOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfPzGs2fZzqiXisolivg0MrFZoBrrX6O9nmveIW86cFCAao5UZrJokRgB2y41W7y/CaoLLLIfPBMNirro4fkqb7WsbPFtAkVT/RR2hh2kSaoYefwqakykYRuWYlLr937As7MhZxqKAHRUUBJyFvgmQnyPNOutBXVFUnN97QNtWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CLeGa8rx; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CLeGa8rx"
Message-ID: <48cc5ebc-bfde-4ac3-bc9c-40886a9c576a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738949465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0IofJIBpnloCq6DeOQtelOxKQvFhfMM7wSho7WrKWw=;
	b=CLeGa8rxt1ci1Ywyoq4GIcy+61UXUa98sDUEt0cpapmHCRYjQIVSD3NxyjQpH3ojoEZdTK
	EXv2WM4bOKPInlIr/3PRC8cv0S6G6Ef45/bRw0JU9uU1+1POI1LRNLfdVL6Z/egG6eAhKf
	0RvIJofIcvA/IiYqluK3dNXMc3l12zE=
Date: Fri, 7 Feb 2025 11:03:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] soundwire: Intel: support more then 1 sdw bus clock
 frequency
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, bard.liao@intel.com
References: <20250205074232.87537-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250205074232.87537-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/5/25 01:42, Bard Liao wrote:
> This series set frame shape and divider based on actual clk freq to
> support dynamic clock change. The revert the commit that limits Intel
> platform to use fixed clock frequency.
> 
> Bard Liao (2):
>   soundwire: cadence_master: set frame shape and divider based on actual
>     clk freq
>   Revert "soundwire: intel_auxdevice: start the bus at default
>     frequency"

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

>  drivers/soundwire/cadence_master.c  | 22 +++++++++++++++++++---
>  drivers/soundwire/intel_auxdevice.c | 21 ---------------------
>  2 files changed, 19 insertions(+), 24 deletions(-)
> 

