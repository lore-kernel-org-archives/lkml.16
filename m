Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD64D19C554
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937054; cv=none; b=ADLlQZQVy6H+MT6VU48neC8qzXYUEkiptiZ5MgZWOmnDbLgUCrP2XAI07Al0Lv/JYIbfk/j8I9+3wcGw6FAY1ng8w0aMUoHsvg9hYRur7cxfnfQq9NoZJ2K1UIoL8+r4SZPzieXfy44jcd9zlKRHDWrwngayxfihoxlmK7cOXGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937054; c=relaxed/simple;
	bh=LcT2p4P4qvyPV4p+CYgvYOhpRLDPOouyYXsVnJSmR04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5M04sCEE0WJhJJre65mO/45gtDS3vbonk60bO9Rn7YDafgxlx3k6IEu2BVLtxVE/S37hFXkxIVxw6B5w80uxJmWO8k8rCBjkEyD1OMJPJiI0cbyQllc0RmBf8Wbqd+1YzW+ogw3CxJAzOGY+wYEzZQ7FnOel5KqLQg+vBNM8eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYjvCUz5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYjvCUz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747937053; x=1779473053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcT2p4P4qvyPV4p+CYgvYOhpRLDPOouyYXsVnJSmR04=;
  b=XYjvCUz5CKDUj0S8il75nK52en+MkhysOvStauRfssreXyM26peUdmbD
   CcBgWJ698ImU60WMaZpYEXXs/Y/rJ8ji0g1rZxGPyDNYRV8pTpnBtqjPw
   jdf1Iiamvm0kBongRTlXTSOdzWIe5Hs63t3+oVEqewaw2LlJFvFAYcFXg
   T5AuDSFPo9Xop2aZlIziBKT0yPFZQoOv+ImsGcNaMLKKvkWWK8S2n1F11
   8toqom8MqOkYIYAn3g5Zjmf0qfLw4KRYHSuWJQs4YDcsKeg0XX2QBR1DV
   SA/vGotcXLjcIL6JUWoETZM8TJuHaPKsnlfHJqIO5tJ+OFfRxgv7CqdfL
   Q==;
X-CSE-ConnectionGUID: 0ADYeDMTQDyRqXC/LabO3w==
X-CSE-MsgGUID: cf9TjrJ2QKyvZKpVUWhZmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49900177"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49900177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 11:04:12 -0700
X-CSE-ConnectionGUID: SnPXLNQQRh+TwFTSKle+6A==
X-CSE-MsgGUID: WJJcUy8yR7Gdh3pPZEKixg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145658207"
Received: from lindenmc-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.24])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 11:04:11 -0700
Date: Thu, 22 May 2025 11:04:06 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: x86@kernel.org, David Kaplan <david.kaplan@amd.com>,
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 4/7] x86/its: Use switch/case to apply mitigation
Message-ID: <20250522180406.fb75u63drvoxj7vb@desk>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-4-70e2598e932c@linux.intel.com>
 <fdcf3b14-2a9b-4f47-a574-7716d9b38eb2@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdcf3b14-2a9b-4f47-a574-7716d9b38eb2@suse.com>

On Thu, May 22, 2025 at 02:15:36PM +0300, Nikolay Borisov wrote:
> 
> 
> On 5/22/25 05:45, Pawan Gupta wrote:
> > Prepare to apply stuffing mitigation in its_apply_mitigation(). This is
> > currently only done via retbleed mitigation. Also using switch/case makes
> > it evident that mitigation mode like VMEXIT_ONLY doesn't need any special
> > handling.
> > 
> > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> 
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

Thanks.
