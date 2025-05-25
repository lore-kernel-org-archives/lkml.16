Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E2139ACF;
	Sun, 25 May 2025 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748211255; cv=none; b=UhZkjkHUF75swHTBydSx0S8D2jb9NmTAGbuGtIaIQgg5m0LKq1aaSLT1mMwW7C3hkkr2p0g2KBVBjDH3DvvuhWw7PI/BBirHdiHByFRqWz7XoDHBLvNNRaxTaW+QmuFoBVqSRYl40LAwT4HQk7L3CjmVfg7I9iL72AR/4erGuyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748211255; c=relaxed/simple;
	bh=TMFhzal/+jzSrh6o7w/W516gZ7kIY5D+cZBchfp7QeY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LPklfQPsFHq8O296EoqwGSaQh1FHvyyHQN4fyDHBDd+6z/nIUwFV6+ljIe9vW964kWOOivd2MHxYrpHVk5RTxFzCY4mdCEsJXyhik+M7f9M3FYOQb3hkPeYpUVKyrfuFcdKPTeVHvOiCVTmgUTrH8dCScqUCPm9jpEMuriv3Hmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqKF7sf6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqKF7sf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748211253; x=1779747253;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TMFhzal/+jzSrh6o7w/W516gZ7kIY5D+cZBchfp7QeY=;
  b=ZqKF7sf6vU4RzBO4Y7yJXl4wzBRVJKYRYQLnEegx8mZbAnxMmg84k9IB
   yVMQFLBYZAtNlwvzZ3GcsOLTelk2LFtsNag9Y/BAx/XAuO7pMdHGqMN5/
   o5V8YkLj83XQJzOV8XVBH2C/VuDb7xqlaUW/Qmn1hlr9l75wa+jf1Ja7b
   hwjsscAnjHN/HAfFR74Eb8s2Owb3WU6wIiBHTNMaGwaF8CjZW1cRMuCAR
   TnLzTVF5ShiKXotiiijOeAUe1ArgD1AXcrxoA8QIaTLJygGfwKB5fejLE
   18ZYD7rwRDHreNFeRauDdnFtjpycZmSblH9Fc2sCWHSynw5esuL5jGYvz
   w==;
X-CSE-ConnectionGUID: I1FgtFEgQi+LUU8mg6yeBA==
X-CSE-MsgGUID: Ow+3m2X8RXqz+7fHpK/3BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50293493"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="50293493"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 15:14:12 -0700
X-CSE-ConnectionGUID: waCve7QVRsWwxi6olYtr4g==
X-CSE-MsgGUID: RXLuUwNaTaeOgTyeZpQLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="142668998"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 15:14:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 May 2025 01:14:06 +0300 (EEST)
To: Stuart Hayes <stuart.w.hayes@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86: dell_rbu: Stop overwriting data
 buffer
In-Reply-To: <20250522200937.9578-4-stuart.w.hayes@gmail.com>
Message-ID: <b975c429-25e9-3cff-8d43-d2b40f8fb9bd@linux.intel.com>
References: <20250522200937.9578-1-stuart.w.hayes@gmail.com> <20250522200937.9578-4-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 May 2025, Stuart Hayes wrote:

> The dell_rbu driver will use memset to clear the data held by each packet

Please add () after function names.

> when it is no longer needed (when the driver is unloaded, the packet size
> is changed, etc).
> 
> The amount of memory that is cleared is (currently) the normal packet
> size.  However, the last packet in the list may be smaller.  Fix this to

One space is enough after .

> only clear the memory actually used by each packet, to prevent it from
> writing past the end of data buffer.
> 
> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>

Fixes tag?

> ---
>  drivers/platform/x86/dell/dell_rbu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
> index c03d4d55fcc1..7d5b26735a20 100644
> --- a/drivers/platform/x86/dell/dell_rbu.c
> +++ b/drivers/platform/x86/dell/dell_rbu.c
> @@ -322,7 +322,7 @@ static void packet_empty_list(void)
>  		 * zero out the RBU packet memory before freeing
>  		 * to make sure there are no stale RBU packets left in memory
>  		 */
> -		memset(newpacket->data, 0, rbu_data.packetsize);
> +		memset(newpacket->data, 0, newpacket->length);
>  		set_memory_wb((unsigned long)newpacket->data,
>  			1 << newpacket->ordernum);
>  		free_pages((unsigned long) newpacket->data,
> 

-- 
 i.

