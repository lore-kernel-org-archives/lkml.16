Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB4EEB5;
	Mon, 26 May 2025 01:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748221883; cv=none; b=WO0IIVQczYIxq6u5zTqHRthCN1WEtbEN6bVxfXhYNHywF38Jwf0Ri3leBrh1sl+IgzQOTMoEf+17Mj7K6A14zS0TfSum+JVDFD2MAkHweoH1KyKF8KAhEW0n6zHdTjLLFDew1NO/vQBQK73yh3uOJx86h2gLs93d95LECOv/JEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748221883; c=relaxed/simple;
	bh=qRqEQb252iaBK7d6Hgik+7uMTw2Xwx0bPvuaYn2hEdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDOPTWJnkaT2n2ltV4KPhmFEc05ixbYGLNFmVd1yML9avnWDoyEPDX3twbgzX4+cbNUYtDw7WTPLiRQz2SNTadGjAhjSn4hyxVyEz2wC8gp1W/3ab37YHUVpNmAgPpqm3iSU1AiBloRXMt1UWS+GSp36CZm7ZfkrFfDnDCN6j4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEifvHuG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEifvHuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748221882; x=1779757882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qRqEQb252iaBK7d6Hgik+7uMTw2Xwx0bPvuaYn2hEdo=;
  b=iEifvHuGW2ZUtqbx0z26YjqE8/kwnF+aZi8eLTzIRJbaimcpd++pALqi
   l4OaMU6GNumGyReYvEL9QkbTzo68rRyKbeG2xr6rEJdaXkVr1RNvYF+KB
   /3pigrGXUMaTFDKiCOkRZyS8/GHIP0GEkB6v+p4Tg8lR40bUra5mxLvQI
   NTWV7P7KSzhPC+/gzIjJkk6PeXBEadl+z3FJK6djTu08FL3WB0v11gmer
   k9sx6Ru7g03Bf6ykmbxWLGkkr6p6x5ILjFC7J62QfMl8rL5j2zOO0NP0Q
   G6USfH/J7OodNgKtKc1Vj6E8L7Tl7zEneZUT6QnmJ5HmsBl5dUuHpWG2r
   w==;
X-CSE-ConnectionGUID: Uox+4q76SmaVDEwZLAMXHw==
X-CSE-MsgGUID: D5BtXZvtTNe75h8tqVFilQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="53993793"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="53993793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 18:11:21 -0700
X-CSE-ConnectionGUID: QicwbyTGQPCDmw7tSpgWCw==
X-CSE-MsgGUID: SuG/HLrFTwq0RP67UwzE9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="142156035"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.105.120]) ([10.246.105.120])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 18:11:19 -0700
Message-ID: <8b31c5a4-14ba-42ef-812a-b277656c5250@linux.intel.com>
Date: Mon, 26 May 2025 09:11:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: intel_ace2.x: Use str_read_write() helper
To: long.yunjian@zte.com.cn, vkoul@kernel.org
Cc: pierre-louis.bossart@linux.dev, sanyog.r.kale@intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
 ouyang.maochun@zte.com.cn
References: <20250523141910793yUFpjomfu0byK_yFddHQu@zte.com.cn>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250523141910793yUFpjomfu0byK_yFddHQu@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/23/2025 2:19 PM, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> Remove hard-coded strings by using the str_read_write() helper.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
