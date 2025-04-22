Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A06C28FFCA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335727; cv=none; b=XheMtdg9jaRpK7KrpqdhzMSQeE3o8dID+Oq/fPWZx7BTQeqtRJzKaEeTXY59H/i3mHoRpSOSuonpCVOJo3trsSOoZ5RjRbfPS/aCwHR63wa7m4WjMYQzWY96nySoDQgijzom1Ve+tLLvZikWbRPLHc3qysoR4YMFmjIbAK06QyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335727; c=relaxed/simple;
	bh=QdrJE9vyC67nUmt0F6DHeor+ouXda1sjEMXvGas1Ofs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjN80myI5RYmyqNcSFdH4uMAmJlHPyq0Adb72HsuJPhEL7tBDwjCAzSPIebtxZOM/KFjGwhJmu82q+6xD8G4tFlsBuucPQRClNDorrRJNrDV8enFJITcdn+erOfYCUsYOeIXJAez/rW9td2p2ABkznxDMGrTNmfN+CQTic+t2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Box4j0sM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Box4j0sM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745335726; x=1776871726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QdrJE9vyC67nUmt0F6DHeor+ouXda1sjEMXvGas1Ofs=;
  b=Box4j0sMgyO3iL+QdI8ZOdt6IonlvbKjMSGxaPeJs+J5Tjj7YqxpKUds
   huRfveYnEycr8FXmqQs4ddLiogDgX+LjYL7EKu4s6g7ITcVZ0qqZQCGFx
   LzFok0F4dOMUJg5InbfjZuQ2mgWtoUBm03duUbk4yd5/7RuvX9saw7HnL
   Bz/4tG0YQCrO4IK7pNnyWCvkV/nQ1T/78V8/0w1TQjMyOur7MBmtfx9pc
   WA5jEqKj3c33aKp8YATISecUuM4k7Z4A0DYNRoJRwg+iWYQmdQk8JahKc
   BeYq+LvwR/JWYpRiPG7I6uvwawzE2rqwV1J2EIflNBy2NhE740k28oRBc
   A==;
X-CSE-ConnectionGUID: aPK97xSnRXSfnZqpHi+Gvw==
X-CSE-MsgGUID: P5Uz28hTTeuE/6acqL1B1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69390922"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69390922"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:28:45 -0700
X-CSE-ConnectionGUID: TsrwLYhmSfmBS1XI1zrD4w==
X-CSE-MsgGUID: v0ziZSCRSQi4W4C8t38lOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132366463"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:28:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7FY8-0000000ElVo-1qXn;
	Tue, 22 Apr 2025 18:28:40 +0300
Date: Tue, 22 Apr 2025 18:28:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: xiaopeitux@foxmail.com
Cc: linux-kernel@vger.kernel.org, john.g.garry@oracle.com, robh@kernel.org,
	xuwei5@hisilicon.com, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH 0/3 V2] logic_pio: clean hisi_lpc and logic_pio
Message-ID: <aAe1qJR2gK1_dgwC@smile.fi.intel.com>
References: <tencent_AB44A8723B522941A2792D9C58CDD9B8B60A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_AB44A8723B522941A2792D9C58CDD9B8B60A@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 07:28:47PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> 1.remove unused head file.
> 2.add comments for logic_pio.
> 3.export logic_pio function.

You have a problem with your email tooling or how you created the series.
The cover letter is detached from the rest, please, take your time and
fix this!

-- 
With Best Regards,
Andy Shevchenko


