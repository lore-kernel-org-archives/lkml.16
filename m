Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDC27979C;
	Mon, 19 May 2025 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660479; cv=none; b=NQiqxOcRdShz5I0d9z161dX/pd7CdNRGDQq+4JNt/079/OVEIiag6Xo36SxRbqPts4Hz1v2315T7pBGJcIZJ6o3SqZlGv0TUzKDyfAxo0Uc05JZvcpDKowM1x/40jPse64Tb4c9v5s4ydPQB54ZLiLAJensFtLs6OAgzBDB/Zmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660479; c=relaxed/simple;
	bh=uShxAUxcxPdbOfd/u4AtqcQod/Y/hU2CBAFvjqiM1w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czq94HSiec/Xokc8zCF9frPhmzVbkb47YYhC+jdA+UUmftkdgqctGyeVwwkTl6DFoFoZVvvvHnExOyuJ/PUbscEC9p9RJQvj2igACIO4xui0P4REylen+cJiqBr2s1rIiRSCSF5mcaPRJbnzFzNTfrCZyyWTtvm4+WDZjcGl3kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmtinjsE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmtinjsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747660477; x=1779196477;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uShxAUxcxPdbOfd/u4AtqcQod/Y/hU2CBAFvjqiM1w8=;
  b=UmtinjsE4gRYC5tt5Jd4CJlxAxfgVQJOBeDT87qmjBiZVill/E8W4HOj
   4CsHJuM2Bmp3eGiaod8rN18v1b+Ffy6880Vv7isRCdi3pZlQp9Q4u6pkG
   f7qQ9Ny6D9arxs5ktxYa1BrkxxbD4K0pwraeB0EGmOLEeqSY7yJJov/zk
   mNV0E1BsG2B8GQuK2aY3NSb7d5wCHlaLdvOvj2+fMVY1QTjpOfKt/okO/
   l8gDRw5calOiA7ZCXoaUl4eU5fHa1pUTmxR9K4tpzdW4TdFtTbteBraK4
   ZNaZeEgcBChORE81n0S7SFV2EwRPlWp9ISlyUjKY+OK699WZhcVOdadTj
   g==;
X-CSE-ConnectionGUID: GboEk6SyTQGTvH3PlPkkpQ==
X-CSE-MsgGUID: mxbmre61RCideA5HtG0mKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60194120"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60194120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:14:37 -0700
X-CSE-ConnectionGUID: Vb1VrETuSKusmjLX1RCtUw==
X-CSE-MsgGUID: Up3uOHhlRdW2rIMYzV8ihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139408918"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 19 May 2025 06:14:35 -0700
Message-ID: <e87a80d9-9603-4d27-99a7-a34eeda8c6f5@linux.intel.com>
Date: Mon, 19 May 2025 16:14:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device Command
To: Jay Chen <shawn2000100@gmail.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 jay.chen@siemens.com
References: <20250516033908.7386-1-shawn2000100@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250516033908.7386-1-shawn2000100@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.5.2025 6.39, Jay Chen wrote:
> According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
> TRB Length (avg_trb_len) for control endpoints should be set to 8.

Maybe add here "But section 4.8.2 "Endpoint Context Initialization"
states that all fields of an Input Endpoint Context data structure
(including the Reserved fields) shall be initialized to 0
> > Currently, during the Address Device Command, EP0's avg_trb_len remains 0,
> which may cause some xHCI hardware to reject the Input Context, resulting
> in device enumeration failures. In extreme cases, using a zero avg_trb_len
> in calculations may lead to division-by-zero errors and unexpected system
> crashes.

Would be good to specify here which exact hardware requires avg_trb_len to be
set before the 'Address Device Command'. This way we can later create a
quirk for it in case it turns out other existing controllers can't handle it.

So far it seems other hosts can handle it well, and quirks may not be needed
at all. Thanks to Michał for testing.

Thanks
Mathias

> 
> This patch sets avg_trb_len to 8 for EP0 in
> xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
> and improving compatibility across various host controller implementations.

I'd skip the 'compliance with spec..' part as spec is a bit unclear on this
issue.

Thanks
Mathias

