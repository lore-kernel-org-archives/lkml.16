Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E1F21E08D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743365; cv=none; b=G4nQ8Mq4YMqEx4WVzMUSoQtr6/URmmOC06bTsbT1VXP0dWaBcWa9klEuhq/WuwifYUbd5lRknDdisq3uonK9oDS5tPdITforraG0VgHobhOZ6favxUftQW1NSmxBvhs3FrrME2a/9OHqbyS5Y2UtxeYJaJq47T3Y5JX306DcCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743365; c=relaxed/simple;
	bh=tuUEsN6SUnh+jKEGSjkzERovIoSnywGNiBTirdfvgyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptBNz+GBVk1dp/RL3EN0StsruOTs4wtORdLdt61j4EgiGu31DCYfT5WxHgNdTkTgJlabQVElxYpcM9lGAnrjuOHImwKfOgb1TUFq1JdBbCkmJGhmX+VQTm5LCeCoxkqcPqlaicJexPl723Vwi2YQo28Xb0LIV6NbktsM8ydX7C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8QZ1f4y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8QZ1f4y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744743364; x=1776279364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tuUEsN6SUnh+jKEGSjkzERovIoSnywGNiBTirdfvgyY=;
  b=F8QZ1f4yjID8ThttbXlLEavAq5yFu1SBXMuMOf6qNe2XE68YR/pzeCqy
   jjBt8DztUjOrIM+9t4Evm64SQBIHvLstSNGOs2cerR8i80fOv7L64D8tK
   x3q9yWYLjRMG4v/SIPKKVCgQEpNMhuADA5zLAExO7rbcw4l4G2ByiZFdU
   ONu5qovfA476iulFCUqbIKtGOTtu2G9KcBkNF9W3LNt6l3VfzVC9aisVi
   n+s25+FM1HMKGh6JwVSpwTaHs3WQGd6GYI63wCrNk4o/9S8zG4z22wtyJ
   w/PlfTrwlBj7hAuCXhqDqlcMQ6Nl6+VjBtJgp9wHVbFrzm6daZw7rZccu
   w==;
X-CSE-ConnectionGUID: /uu3uo5yRmCqgdMQLSNA9Q==
X-CSE-MsgGUID: Bt9l7ZniSoe3MzwPLczUQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46430635"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="46430635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 11:56:03 -0700
X-CSE-ConnectionGUID: Ii4bpeN4S7a2gamLILHwyw==
X-CSE-MsgGUID: Q0sD8fhzTKCV4hLAqN/waQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130172526"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 11:56:02 -0700
Date: Tue, 15 Apr 2025 11:56:00 -0700
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
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH v8 07/21] x86/resctrl: Add end-marker to the
 resctrl_event_id enum
Message-ID: <Z_6rwLFSHqj_BUPq@agluck-desk3>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-8-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411164229.23413-8-james.morse@arm.com>

On Fri, Apr 11, 2025 at 04:42:15PM +0000, James Morse wrote:
> The resctrl_event_id enum gives names to the counter event numbers on x86.
> These are used directly by resctrl.
> 
> To allow the MPAM driver to keep an array of these the size of the enum
> needs to be known.
> 
> Add a 'num_events' define which can be used to size an array. This isn't
> a member of the enum to avoid updating switch statements that would
> otherwise be missing a case.

I'm adding more events in this series:

https://lore.kernel.org/all/20250407234032.241215-1-tony.luck@intel.com/

Any switches in existing code would need to have a "default:" case
added because the new events are in the same "enum" but totally
unrelated to the existing events. Other code changes in that series
deleted many of the switches anyway.

Patch 23 in that series changes QOS_NUM_EVENTS from a #define
to the last element in the enum without any issues.

> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  include/linux/resctrl_types.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
> index f26450b3326b..654323066174 100644
> --- a/include/linux/resctrl_types.h
> +++ b/include/linux/resctrl_types.h
> @@ -51,4 +51,6 @@ enum resctrl_event_id {
>  	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
>  };
>  
> +#define QOS_NUM_EVENTS		(QOS_L3_MBM_LOCAL_EVENT_ID + 1)
> +
>  #endif /* __LINUX_RESCTRL_TYPES_H */
> -- 
> 2.20.1

-Tony
