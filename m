Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A01EA7FF;
	Tue, 20 May 2025 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736120; cv=none; b=E1YpmQ850h+KhM63m9t/cAg8Du71KNFmkPVU9AXxHF90hWBwmPzwmBiIS5jRM2FGAGbSE6s03ZV61UxhtfPHfiY0jo47JHDsNzLGtuIlPnFam9P9zudMbr68iw2g6Q6vm6Ck00AYH/w5gggQS0Fd2UdhJEuGwZ3wzwQDh4bZT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736120; c=relaxed/simple;
	bh=PcrQz+183ljK1hQ/XNWCXWQbSr+ggu/4ZFnGTVIjrh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IfAepOJvQDu5jlcflmos2dURZOw8p7+24yAq3fKZppp62fCtU2kX2gel5HnEwfHo7UC3tB6kYOJe5IdYH4DV6dyUTHO1ReyVE10QwSebPmv0pSTqr3TUHeqATTIU/J2QgnPAanxcdIhTsZd0o6/kPj+qRyEtv/7UnZ5FVjPR9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQE+z7k1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQE+z7k1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747736119; x=1779272119;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=PcrQz+183ljK1hQ/XNWCXWQbSr+ggu/4ZFnGTVIjrh0=;
  b=aQE+z7k1j25ug0mtY4XaIRS1SHklRQvdqo/4ZjsWI0LVnQ+t835lNpXM
   HGY3yHo8B0kn3HtAxxEER7QzLrgWheeZSGIRpPdSxH0HMihxoqGxq9q3R
   gXDAlx1Efmz3P9pvEmScfmalyh5/jzR8CRQsPTE+1qJtfwfXf5aSrzjUx
   mSSy5hdZXG+/+IIhaiwTJ/Xrkw6BaC1T3AhbC6YdK/0cr0RH6vW37TBfz
   Zofi+S8Dc9bC6H418njdQkdE9uznMg+U4hByawji4/iVnGe9lgfd46Pqf
   +jI42iIpKRjhcnUh9dCCJH0RRuSEGvjEMbQZOMjEppQSqZkXWRAWMe3he
   w==;
X-CSE-ConnectionGUID: xaiL+qTsRhWro8RwI72Y0w==
X-CSE-MsgGUID: lF2yk+BXQGiL5PmcqkgPTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49360199"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49360199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:15:18 -0700
X-CSE-ConnectionGUID: nPLiF8OASJOm0vzBvDc6dQ==
X-CSE-MsgGUID: 4Fezwh6jTOu/EZEldwbvbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144637122"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:15:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hdegoede@redhat.com, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Derek Barbosa <debarbos@redhat.com>
In-Reply-To: <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Ignore battery threshold
 change event notification
Message-Id: <174773611073.1880.16721567091299499613.b4-ty@linux.intel.com>
Date: Tue, 20 May 2025 13:15:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 16 May 2025 22:33:37 -0400, Mark Pearson wrote:

> If user modifies the battery charge threshold an ACPI event is generated.
> Confirmed with Lenovo FW team this is only generated on user event. As no
> action is needed, ignore the event and prevent spurious kernel logs.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Ignore battery threshold change event notification
      commit: 29e4e6b4235fefa5930affb531fe449cac330a72

--
 i.

