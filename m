Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0480122C358
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754936; cv=none; b=mP8CwjTF2wgYdGM1bqiR8A9WKOKq3XNZ/Tx+/oAWZ6jgXqr3M/yFutvRWfbVCweRAAm/94jrx/aTeOFl5hYhLQjDSu5ZC2eaW5JyrvX/SJDB0XdBBQuJp0C6a/MqOZ35qrX7Rx07y5KrsbX/reu9+UiWA/XPCpaw5zYwPyXjvV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754936; c=relaxed/simple;
	bh=O1aww/25Ib/9ufqzgyjLojX6pG7aKW6Kt/44ee2Xtso=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IGZQADqFdUgXDma0+QaXT/rvg/eIMRuC8LOlRovJuRsG5hSS0NxF2R2E7+9Z+HXiRsJGDePB1ZjHlowpTKTcckndJbFfVYgXKc6lEWhtZ0MTdhy1wW3u0ifIfiDzUXNTlXfFNvxjpplOGFiUjXLRZC7cAnZsRlqkluCbLH7m5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEcHSKCL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEcHSKCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738754935; x=1770290935;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=O1aww/25Ib/9ufqzgyjLojX6pG7aKW6Kt/44ee2Xtso=;
  b=KEcHSKCLZTvvSFy1DnUVppe+ir0pcbcWbJypWqtKdNcs2I4Mr4nqVgh1
   uG5ygj6BEzjNUMZaqhjXPTpkwedwGr1o11Pnz5PQRLrZG0MQeeZ+7BKSl
   /a6fUSEKw5HsCn4OTMmIgNg/GdXINWTns+oxsonnE0FhlrLAPBsYoR9Uo
   YjymwVQrnypY40FBzjOlsc98lMl7SeV4Gv9KQjQAiWMlnrUJUQ13NjXAA
   5CpCMnRIBmRVAY5tAd7Nfvde2cJJN4b+iBu+aIwCo/lAobOBEk864Xafd
   JcE4rwj3NSdR1mslHEwQuMu3QVTf0KT7LlnQv5CWAG3WCrSPie0CRDbKG
   Q==;
X-CSE-ConnectionGUID: LKulfQhWRB2lvWs3p5kldw==
X-CSE-MsgGUID: /P0hvoh5TrCfXjT3HZBvQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56855175"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="56855175"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:28:54 -0800
X-CSE-ConnectionGUID: dOqy+XJiQj+H0ds3j5JwWw==
X-CSE-MsgGUID: X+Nxs4EHQQKdTdczHq7iiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115871049"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2025 03:28:50 -0800
Message-ID: <fad86d8c-cbf5-47cd-a144-ad803ee67417@linux.intel.com>
Date: Wed, 5 Feb 2025 13:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i3c: mipi-i3c-hci: Use I2C DMA-safe api
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>, alexandre.belloni@bootlin.com,
 pgaj@cadence.com, miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
 wsa+renesas@sang-engineering.com, xiaopei01@kylinos.cn,
 Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
 <3ff01e2c-fd48-40cd-b130-a515925418fb@quicinc.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <3ff01e2c-fd48-40cd-b130-a515925418fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/4/25 5:16 PM, Mukesh Kumar Savaliya wrote:
> Looks good to me !
> 
> On 2/4/2025 2:47 PM, Billy Tsai wrote:
>> Use the i2c_get/put_dma_safe_msg_buf for I2C transfers instead of using
>> the I3C-specific API.
>>
>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
