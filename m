Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306C433C8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161162; cv=none; b=tnusOuDsc03P7fmoEfLamUffn/5JCVjCBXz29puCOST8kXmU3S+KYKcRKqFEo392HKv/Db2r8SFWHLufyFOpal+9b0U6/ThmWJhtvs9OZshgwggoS4kb6QDdStyHoZRIJSS7ldMnLn5SkEmOgLbV0wF6k/I5/F74x3OgfwC3p20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161162; c=relaxed/simple;
	bh=a+V5ssUTwK9RDYte+eJPjcWuVD9s33LMrbT87XvufXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9+8Ljr+XFWn4FwctjxXWpAbJ4iux2KeS2ci8w1yYNsnBlPn6wO2EPIDFs3eR4heixPBAMt7UoGvU5PlX6G4Ei92cFrNOcOHU+mJ+TQ9hiDn+3RfPIZj8midg+IOn+uBxPQ0MjwyF6FQcXrYK3oX4vZlZURdIR32wXK8X8aUTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSsmk9dg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSsmk9dg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747161160; x=1778697160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a+V5ssUTwK9RDYte+eJPjcWuVD9s33LMrbT87XvufXI=;
  b=GSsmk9dgN1JCYeBZHT+cDVZlgUn5osZMY5KVsrq4tCfiifEPKA81fhra
   J4Xx1oJ9lbgTMbiNCnVGtds/PaTg1i+WJRLoEjlw1VkGFD3P51NNcoCQD
   dLWbGgX7envYds5efL1O4WEcS1JTEs/ux5zzQfZVIYjU1WTdlsbMJxWzq
   2pL62w4XHGciBuW9A69uz6Fk/05I05xZCLIAT6lctX/BRhW1BZi3jZq5m
   5MAyfgJES/d+NABA55efIZswIcFlOQOxpcI59r4WZAuTSk0kSlmJhf3Yw
   xXJJhLkRBL2Ynb7g7J+miMEy2J1PO97zKpGth59eGfHGKi0ckDFGHWF0J
   w==;
X-CSE-ConnectionGUID: 5+gJogGpRgeAqUYBI1Ev4Q==
X-CSE-MsgGUID: Zp35NBmJSvG3vgGdKSVG7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49176337"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="49176337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:32:39 -0700
X-CSE-ConnectionGUID: cRyrl100QdmwQ87GFsEklQ==
X-CSE-MsgGUID: b27AvM+UTSO+nFgQhVzJxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="142891098"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:32:39 -0700
Date: Tue, 13 May 2025 11:32:37 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: James Morse <james.morse@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
Subject: Re: [PATCH v11 00/30] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
Message-ID: <aCOQRW6vAjtdFTTb@agluck-desk3>
References: <20250513171547.15194-1-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513171547.15194-1-james.morse@arm.com>

On Tue, May 13, 2025 at 05:15:17PM +0000, James Morse wrote:
> Changes since v10:
>  * Changes the online domains check in patch 7 to walk control and monitor domains
>    separately.

Built, booted, and lightly tested on regular and SNC systems. All looks
fine to me.

Tested-by: Tony Luck <tony.luck@intel.com>

-Tony
