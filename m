Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E04414;
	Wed,  7 May 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614225; cv=none; b=tgooJU739/aq+pSGyiN1UGbBZzLVmvm+vEOpsPRuwdqm+itx0/OB1EbWQ9SAAp8QfYQkeDI656lD9CPu59TlIz0HRSQY4mTKfwOPiJFlri++lsrm6aeqsfORu4OZajmPwNNnVHkuCzV5OF1lWuiyD6hRFN6CJpLeJG0Mik8Hkbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614225; c=relaxed/simple;
	bh=yAQptFS1B8zM23KlbHfl6fkx2aL1DpvCux8kms5o3X0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cparqFTrKv2v2ECsLgmrRnTdRDr8T1y0gHecPRWxqiNTEjNjPVMigh/tST7Qet2x4Cb4cBIYeNUmu/0VIl0qiCbmIcUNjvX0pMarSJ+YYjHE7dylOnQ+Qgqk/dNn53Jr0tpFEV+ANFn8RIMuj60yue70ucwq5CY1+HvIarkJ9sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ckpd1/zb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ckpd1/zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614224; x=1778150224;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=yAQptFS1B8zM23KlbHfl6fkx2aL1DpvCux8kms5o3X0=;
  b=Ckpd1/zbRTHuZEOITYogDw2eVzYQBTuCZ+CjhnNDqtOFHOp1ZRiSjz90
   xGXi+iAN/OgZs1bKWh5+SDJdt7qeNeTsRB5nYpqjjL5rGdWSSN+5h21Uf
   /gs7KDqRDVUQBtAtIdePjRQeLLZVjoXklBuJtCFvDwQeZQHVpbNCF2X52
   5bmZ/p56Ro+kDAVOW0beqqnl4aF3PmTQnXpoXVjgnF4nHXlBcvCJumrg0
   1kGw99+O8y7GA5Z/fQBU/rOJiVo1Qr5mjC7mp29MHf/SzLOaKjgRSlqln
   NlkcXOsM1k40EmnSAUwiaMml1WIu8Kz4/xlf73xcRm5JeJXlrOTWVE6Y4
   Q==;
X-CSE-ConnectionGUID: +QzHCP22Qt+RT15pNcHsFw==
X-CSE-MsgGUID: 4XkIVjipTMqaHqLyk3khkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48239655"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48239655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:04 -0700
X-CSE-ConnectionGUID: t9aZt4/JTi6HMLpJ14h7Gg==
X-CSE-MsgGUID: oLCeiMoKQEiFWpVDRJmyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136438696"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:37:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505-awcc-gpio-v4-0-edda44c3a0dc@gmail.com>
References: <20250505-awcc-gpio-v4-0-edda44c3a0dc@gmail.com>
Subject: Re: [PATCH v4 0/2] platform/x86: alienware-wmi-wmax: Add support
 for GPIO methods
Message-Id: <174661421671.2744.17735064647207719106.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 13:36:56 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 05 May 2025 15:43:30 -0300, Kurt Borja wrote:

> I found a great blog post [1], which described the reverse engineering
> process of the GPIO control methods present on this device.
> 
> In summary, these methods expose some debugging capabilities of the RGB
> lighting controller present on Dell gaming laptops. See [Patch 2] for
> more info.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: alienware-wmi-wmax: Expose GPIO debug methods
      commit: 8e27c47983c516a4d9e85199c0904e2da4c447df
[2/2] Documentation: wmi: alienware-wmi: Add GPIO control documentation
      commit: c959bee66489a41555bd2be43a93da8be16b4acd

--
 i.

