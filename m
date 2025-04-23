Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E331A0BC9;
	Wed, 23 Apr 2025 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408316; cv=none; b=YoVNB0mrE3pP5Utw+As5Ryy9qH+LljSfDvOnWNihs1mhkTsedyZypbND4a/3zAxjjk9hOKLIjetpwnEZd1W7ql9cmOSFlXptw6PUKZtMIii4Y0bkRUEwdsB3LdDJkcSCG+uM/bwXSiYan4QyP/yswkHuR6BEG5bg7N+VwpbclkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408316; c=relaxed/simple;
	bh=2jsNSqoqr4SLItbmPp3TF05/VDI3m4NXY828EBtiYrM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lb/WojqA7CXl+0EmaQOT/uQBDE8YJcl0Ud+Jxgzfea3qtOxls4jGCsxGrCmBsSY+E6DSEUEcPbb3DyuEREsjxhuIf1RviW7mRl89wGpXn5sCckQliUwa4K8T903c9rjCYrs2MXXscOlXa0S1/4wqmWdbhUSzp9x8IrkC+TxNIl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8dng1WO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8dng1WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745408315; x=1776944315;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=2jsNSqoqr4SLItbmPp3TF05/VDI3m4NXY828EBtiYrM=;
  b=W8dng1WO15pzOVgQvkip4Ey+buW/eIQs4DmcpBbExGJ+oacosERw47i2
   mGcCKvHRqLyF2oTkTrUaFUt4CW0v4WwCCdZOD6y8xkqVUXmANub7M2WdN
   77QREXvpSny6yHKqiahoUmnBKdgdhxfzTktyOOJhUtiIk1M8e9g6Pq9MX
   GqbIHDxlsCURH//8i/OPnHF2lJ/z5bSVynDYy82muOG1am+S3c3dRFBLu
   4x0fDM/LAoPCKHaIrJQf4Bs8E8AK6fQuKUirjqKGvkF5FBOAAB2ICV9PF
   ohEt3BVb+kcYQYEJCJ+DdxDYC+p0bfv4Lh0Pzsml2ArWRZpjJDF/Sjejr
   g==;
X-CSE-ConnectionGUID: jQyLDvaQS+u7U0cgnDZ3dg==
X-CSE-MsgGUID: nYFdWP38RZSNtdI2/DO0SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57652727"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57652727"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:38:34 -0700
X-CSE-ConnectionGUID: 1Ly0TI3ESkq3dNPEsBV6Rg==
X-CSE-MsgGUID: lRo5+lbrT1yJyAu7sM0v4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132212792"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 04:38:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Nikulin <pavel@noa-labs.com>
In-Reply-To: <20250418140706.1691-1-pavel@noa-labs.com>
References: <20250418140706.1691-1-pavel@noa-labs.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Disable OOBE state after
 resume from hibernation
Message-Id: <174540830836.2601.1999835549878989759.b4-ty@linux.intel.com>
Date: Wed, 23 Apr 2025 14:38:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 18 Apr 2025 20:06:08 +0600, Pavel Nikulin wrote:

> ASUS firmware resets OOBE state during S4 suspend, so the keyboard blinks during resume from hibernation. This patch disables OOBE state after resume from hibernation.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: Disable OOBE state after resume from hibernation
      commit: 77bdac73754e4c0c564c1ca80fe3d9c93b0e715a

--
 i.

