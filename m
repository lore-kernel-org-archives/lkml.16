Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376942049
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079836; cv=none; b=JmFk+IuumxnxGwMqkjy7U3JntGclaZU6ch4SKdTFb/nntIXvKZkmpNkWzGkoU37/DZyK8mwSLHOc+b8w9vRYtPk84MtJdkM4Udj1+1C7WvaAl3sAr2AEYBa8R94d84DneM/hEfcU6dTJFmgtIxEetqwaQ3buQABuQQErbht64bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079836; c=relaxed/simple;
	bh=A4aXslW3tMdSS9KDIVJUYu3oEx1GrGTAqMb/Si2j3Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNEU/S3/640D/X74dCNyHJoLHBfl/qIM3ubqLytsSF/5bwbpV4YTSI5yVLla3AhJJD7oNYz4dAC0D6QhWGGmqcmOvO2ku5V7IZ1M5doFJHW50otduAWWEGjDsSQcSAu+JrZ3qikpZ/w4baNsIU6idkpAG5tAxQV4Ni08JZ2LbvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: tI0fwigyQP+T6peKBgELpA==
X-CSE-MsgGUID: yiEe89/zRpKuTWlnJAz4ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50509656"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="50509656"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:23:54 -0700
X-CSE-ConnectionGUID: ByY1JARDRouKYTX1aIUFhQ==
X-CSE-MsgGUID: CL120DMJREOmmHSvOrx3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131649436"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:23:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u6Ayr-0000000Drcm-2eds;
	Sat, 19 Apr 2025 19:23:49 +0300
Date: Sat, 19 Apr 2025 19:23:49 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: julia.lawall@inria.fr, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Remove duplicate NULL tests
 on pstat
Message-ID: <aAPOFccMEWDHjJ_S@smile.fi.intel.com>
References: <cover.1744990405.git.abrahamadekunle50@gmail.com>
 <016d5429e5db0596a4fc8bb25b1c23ff94ff88b4.1744990405.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <016d5429e5db0596a4fc8bb25b1c23ff94ff88b4.1744990405.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 18, 2025 at 03:41:56PM +0000, Abraham Samuel Adekunle wrote:
> The pstat pointer has been previously tested for NULL after being
> initialized as seen from line 970-973 of the file.
> The first NULL test is shown below:

> 		pstat = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
> 		 if (!pstat) {
> 			 status = WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA;
> 			goto asoc_class2_error;
> 		}

It's too much for such a change. You can do that in the comment area
(after '---' line below), or drop it completely. You can rephrase that
the pointer is checked before the changed lines.

> Remove the second NULL test to avoid redundancy in code.
> 
> Found by Coccinelle

Missing period.

-- 
With Best Regards,
Andy Shevchenko


