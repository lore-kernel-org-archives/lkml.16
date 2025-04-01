Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCD81FAC33;
	Tue,  1 Apr 2025 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743507338; cv=none; b=X0kaClrQHnKKwU/oI04N4o4WiF9U2j67bUBWQr11aVsdN56v0HJPmoOBoc/rC3ds9Yg0OWxvAS2IPImBP+6ycmPjUapiFy1oHrhjRofJx8YgYD01M4azQQwwY7v3pAXcG6fAWUYar+VDrH5QR/TtEBxCPtqe1a6xbVNbIThPrA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743507338; c=relaxed/simple;
	bh=EqqHPhlOsJ5EUZEIbHWJI4gdFMk8gH7jAoXk624g20k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DKY4CXo0zRJQHEaBWVKxCHnI39sX7oUTFGT7n9gZWWCQK8J9vK7XWYfOd/T1Ica13cb+vHaN1HS99cULM8QKmTMkKDIBs9sE/kgZYby+mATCpfYFkkm24hogNHiJ8bHe0PRFS+pS1ar3MN+hBwc9EHMxiaUjtKWsFthdm0KQaRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUVNavZl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUVNavZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743507337; x=1775043337;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EqqHPhlOsJ5EUZEIbHWJI4gdFMk8gH7jAoXk624g20k=;
  b=QUVNavZlMdfXS2ZVIM/YRuurZWABV8YzkV0yD9iRwI105+wyiaHvwfvR
   7jmxE1opeiH2ait4ACBnsAV25Cwq1etLhF0T8lsNf9RDdBLW/4HzD6DEw
   1GCn5ccuyHsATeisRLA6HGqOwjPXOryaGxZ4vn9fTeBVdAqRMUdF6lIvy
   AXYPDdipzYVtCZk7vyAEq9x7rX3jowG/Fx+61JrKhWRip9yolwNFBNiZR
   zYUolX2rOH6CwtNMjA8Dh8d5KxI4YQJFdixePtwrJCk9N04kfoA1Xn4X3
   1+/KbCauZEGljH8ojz7C7YX7sm0TiMA3P4tzO7zbkpTEgqk2r6KWocRWY
   w==;
X-CSE-ConnectionGUID: p3GQ6M9oQouF1D5S6mGr/Q==
X-CSE-MsgGUID: 7vv8XX6PRX2oRkB82EjlFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48616246"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48616246"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:35:36 -0700
X-CSE-ConnectionGUID: Wo7B6xvHTMGqmzfHVsdQvw==
X-CSE-MsgGUID: Lq3D12uxQdq+2Yp5IYd/+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126120341"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.126])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:35:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 chrome-platform@lists.linux.dev
In-Reply-To: <20250331-email-correction-v1-1-4c0e92862202@weissschuh.net>
References: <20250331-email-correction-v1-1-4c0e92862202@weissschuh.net>
Subject: Re: [PATCH] MAINTAINERS: consistently use my dedicated email
 address
Message-Id: <174350732895.2494.10706035467305506055.b4-ty@linux.intel.com>
Date: Tue, 01 Apr 2025 14:35:28 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 31 Mar 2025 20:29:47 +0200, Thomas Weißschuh wrote:

> I use a dedicated address for kernel development.
> Unfortunately at some point I used another address and later copied it
> around to other places.
> 
> Consistently use the dedicated address everywhere.
> 
> As the old address does in fact work, an update to mailmap is
> not necessary.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] MAINTAINERS: consistently use my dedicated email address
      commit: 566d3a52b8f618d22664171633d7106a630f46b9

--
 i.

