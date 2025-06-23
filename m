Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A091A3168;
	Mon, 23 Jun 2025 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672546; cv=none; b=i6EePhJmfUXSaKElV6uYi5djzpzMEH2M4BNe9OFV+znD8wEHXU9MwI49Q4YuD0Hvq4vTl5v0UCLAxAMIOTvT/qwL+OVstOoJjxTMIwlEJOwA38K1reaePdhIGgHNalj0CwZk5V3QVWMLZBjU5zcWPNRcIMesRvNEgy7MAXco3DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672546; c=relaxed/simple;
	bh=9M7BbB01WOtAkXTPQpJPngDN1HHgKfgvGyGRszvAwF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BokXIpc5/sWrj2TEBnYvuVyOskJ2/eyY7rxrbm78XK2IFAnqFWv7FmTWRI7W5eloxb3sVY1GrkVd7m1SHJAU4lfapmANsLBFRxAbOqGw/832zxZSKWCQHIu7IohfOSxovE34bXcLkd/od513WJjDoldpRLY1fLkkbJPppMK232c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1viZK1W; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1viZK1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672545; x=1782208545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9M7BbB01WOtAkXTPQpJPngDN1HHgKfgvGyGRszvAwF8=;
  b=a1viZK1WCorFxTSJkICWBeKrKBbiQmr+e/c6XVzoJSLZwDO3rnvWwiSP
   9tsU4kVO/UGMIiRMSU79LX4Is5MQsy7JR2s1MIobwALxlBWKZPDPUHob1
   e7HJkKcxRi4qkSf6UBOOsnZ8tvUzdxed59l9itg7LcKJuxp9nEFhNmbCD
   SrE65LE/2AOfvf4VMkbz/RpWTnsRpO214K4bDNGwGNyT21ZAW3t3Vq5Gf
   4yqu6g5guSopz4ux9pyuTUp/rclML0JPl4hDKuZL7IJxH311iT9Ml56+E
   OUvEn9cp7LgKp4K0YUq9GM8YQXjcZ4MCIrI0y+SewhdjANyPxtcAofCJN
   Q==;
X-CSE-ConnectionGUID: 5ybwpa6PSnirtfPhYPVGXQ==
X-CSE-MsgGUID: gYgdpyH3Sji+k5JMnaIuIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="51988470"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="51988470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:55:43 -0700
X-CSE-ConnectionGUID: JKwFAesBQ6GpUtE4Cavxng==
X-CSE-MsgGUID: Fkuss6LsQFeb/upUr8HM7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="182422317"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2025 02:55:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 24415108; Mon, 23 Jun 2025 12:55:31 +0300 (EEST)
Date: Mon, 23 Jun 2025 12:55:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, westeri@kernel.org,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: Fix redundant Bit masking of
 ADP_DP_CS_1_AUX_RX_HOPID_MASK
Message-ID: <20250623095531.GX2824380@black.fi.intel.com>
References: <20250622171705.4148948-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250622171705.4148948-1-alok.a.tiwari@oracle.com>

On Sun, Jun 22, 2025 at 10:17:02AM -0700, Alok Tiwari wrote:
> The tb_dp_port_set_hops() function was incorrectly clearing
> ADP_DP_CS_1_AUX_RX_HOPID_MASK twice.
> According to the function's purpose, it should clear both TX and RX AUX
> hop ID fields.
> Replace the first instance with ADP_DP_CS_1_AUX_TX_HOPID_MASK to ensure
> proper configuration of both AUX directions.
> 
> Fixes: 98176380cbe5 ("thunderbolt: Convert DP adapter register names to follow the USB4 spec")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Applied to thunderbolt.git/fixes, thanks!
