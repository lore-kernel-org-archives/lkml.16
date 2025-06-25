Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE9223704;
	Wed, 25 Jun 2025 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856628; cv=none; b=PCPXeFpagNvhKF8HC33APi2i+uSsUEDK0DRgbmqAXYR2LzEPBxuEsYVvNI4o8QLF5eBT+AejT0oZ7mpnIx4WShxQAjjPpgFFQ+yrsrdNKN93hNIQvhWBcrYPD6q2m1PKBDZStyxY/Ho4OMpvMIBFONTJPm6VadnrlFmzVDIBxCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856628; c=relaxed/simple;
	bh=6U88q7TOKdSVgEqMDSSDTApj1e+MmNyr/LKmIeBvLt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qata8tXH1rkk0iNAqct593HnErCjE46W38xg2g/OKEQTUZ57Zp9x5SqhdagXywInKCdhhyG5Iqfg/3SV6Ycog1+dxjUjyL0JSUbKHDuNxmUAoFmdF+k3g4e1Vuo6Iuwpvfs3D/4E1by//a+lAjHMyDsPAcEkMRdp5W9rkkXH338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXqM0Hh2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXqM0Hh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750856627; x=1782392627;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6U88q7TOKdSVgEqMDSSDTApj1e+MmNyr/LKmIeBvLt0=;
  b=aXqM0Hh2hCd5g8Src0H4+m3WWZSKNUfteJFHDyxXs9eTRUPr03cI681s
   eJKYSEpMT+L5D80I4kQZP1dW8iISx0pMY4rrVa1mS+ZJRmKSeg+YgWH8s
   5aSCkf2mAxWXnJ5lU7i0IrfC3DyAmJyHXIn4h0pnhNb96I6PaAnbG3PX7
   1sozgn4BRZfhykCoH/gnp7Ff/BIDiw1P3IHF0h0gN1acCxJdXtFC89dSv
   iL8KEuro6xyvUVGS7Gy1Be72qSmJbbAZ+Y0BpHvz1VHbXZyuGCCMDiAYU
   GVAqDW5Q9QP9MbOv3w7xb0VhcokyfMGYLBhDJNshGVD6sy5yWRfuZcikD
   g==;
X-CSE-ConnectionGUID: o+tHfElVRay5KPJewcUAwA==
X-CSE-MsgGUID: UncaI0ONT+mzVQdfAQiTAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64185296"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64185296"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:46 -0700
X-CSE-ConnectionGUID: UHYkEejIRNqw1qeBhngccg==
X-CSE-MsgGUID: TsnVDkPrTDm9joJJ+31IVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151633868"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Damjan Georgievski <gdamjan@gmail.com>, Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250620181119.2519546-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250620181119.2519546-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY 0x1402 event
Message-Id: <175085661917.8098.8803611578218025120.b4-ty@linux.intel.com>
Date: Wed, 25 Jun 2025 16:03:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 20 Jun 2025 14:11:10 -0400, Mark Pearson wrote:

> 2025 Thinkpads F11 key launch the Intel Unison app on Windows,
> which does some sort of smart sharing between laptop and phone.
> 
> Map this key event to KEY_LINK_PHONE as the closest thing we have.
> This prevents an error message being displayed on key press.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: handle HKEY 0x1402 event
      commit: b511bbfe4242e14c27a4f80da95dabc4a99d73b2

--
 i.

