Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD947263B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367986; cv=none; b=KIjgBoW7Ahb40u0vn1WeB4UBoW5I6zXofj0mebPIeLahkiEuAWlPpomFfTq9oAryLreLakV4N3Vf/JwRH5xb3VXrEHA2cnA+IfNdJAm2vkiG/PiYC0Kg+du+1Z2WbGLXyYj0WFMb+SSric2iHVC6k6h5MhWOCFzZ7g/aqzpbAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367986; c=relaxed/simple;
	bh=xFN1bdLLtNg15+2sSVgVgbQRUlthrimqYQcd7vHhydc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l49XZwDbvU9G+072JYuNx81lo/Hhu3GSZotNuD9xXzJVS0L7qNNeJfq+rIHFFegW5Mvnnot2UjN+hE/zgC0iUi6OIzZXpGc2oMB6dQQAmPqSyUSjEj8hdKtYOp4EO3KozUoNFnB2PY6772mm2DYbj6ZP2PxnXE1gXCRmP6udy20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iCR0DxQx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iCR0DxQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748367985; x=1779903985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xFN1bdLLtNg15+2sSVgVgbQRUlthrimqYQcd7vHhydc=;
  b=iCR0DxQx82Y1H3OjpnW5quru9ryXmO2TU+mHXM89kd2afb9kMQGNJHnW
   6/wvyS6b9adbDgc/KtdQwwbo7NwvtxaqlWWL/Hbfxp/f2Rl0BjpRlJFNv
   Abi2uCKHOwK+dBFTsMglmCjZI3z2mokjBAn+T2SRMC4s5EH33YUXUqKnT
   hQQHf2rc8UJubcKhVe+6l/YHej9JmKzsOU9YzVUXbJecZBzXeQpsFiS4z
   o/cZ6xRdWAtHaZGMn+03x6b7gX6bAl2GjWXXImPaisSr+RKDKmPtTNF6W
   Yx/d2XJFbAr+qiwV3PsY574MfdrvXNaT8Q3bSPZMWajgpPw1j1mrJCw5M
   g==;
X-CSE-ConnectionGUID: 5kro/jrhSV2dDHLb3KIncg==
X-CSE-MsgGUID: xpdLuM3ARJSBPSoFe2OMGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72910484"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="72910484"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:46:25 -0700
X-CSE-ConnectionGUID: vHA8FeCPQA+voNCF4btqlQ==
X-CSE-MsgGUID: 7khp2f4vSwqssqPBSwrFNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147674002"
Received: from bethpric-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.29])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 10:46:24 -0700
Date: Tue, 27 May 2025 10:46:12 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Xin Li <xin@zytor.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	alexandre.chartre@oracle.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Zhang, Tao1" <tao1.zhang@intel.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
Message-ID: <20250527174612.ml4raiueqdophhxl@desk>
References: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cd3b448-e0c7-4408-8a8b-e08bb3b350c3@zytor.com>

On Sat, May 24, 2025 at 09:42:21PM -0700, Xin Li wrote:
> Just noticed vanilla v6.15-rc7 fails to boot on Xen 4.17 (Ubuntu Xen
> package) in a KVM guest.  So I did a bisect, and it says:
> 
> 872df34d7c51a79523820ea6a14860398c639b87 is the first bad commit
> commit 872df34d7c51a79523820ea6a14860398c639b87
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Mon Oct 14 10:05:48 2024 -0700
> 
>     x86/its: Use dynamic thunks for indirect branches
> 
> 
> Attached is the serial console log and my kernel config.

Serial logs aren't telling much. I do not have a Xen setup to test, without
Xen the config that you provided is booting a KVM guest just fine.

Adding Andrew if he has any pointers on debugging this.
