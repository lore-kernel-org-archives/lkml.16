Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451D25B31E;
	Mon, 30 Jun 2025 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281667; cv=none; b=jzyL5+vviJ7SxZSX3PHltkaiq7YUf45zf6XNFRQwftV2o89J7POhsxZrnoFCnvFxP7HszdCi1WeJwpnTl6hu4xa0H+W5UWd/sGP7K9vs3bKSDgTvu9WmxJPj0ocl1JCFYJiOem11qFXOLU+nKM+FAprsLPu+hSoUhvm01oDbWS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281667; c=relaxed/simple;
	bh=Jw3goajdMsMvrZTpeRxGmnLH20qRFlwTNMqKiaeCF64=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jIEX1mQnbGuL4iODVfHtsC9ptbO1hhfqs1ajmjWELStwttkpFI/kICVmffJMsFPxeWI3n0126/Bz8MvLbuBOMh34PZf//JrkKz9jTrBDPk4WAny3StHKZevrHlXctxyBeNwGqpQUI1gd2GrtdGvk54s3Cotu038XxpfO+W+rwoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjYcCcFx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjYcCcFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751281666; x=1782817666;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Jw3goajdMsMvrZTpeRxGmnLH20qRFlwTNMqKiaeCF64=;
  b=CjYcCcFxOonzFQqRnxiXCaKh1O5VcJ2OVT0PBPIzC/RGLiccULSSmmdb
   MNnlXHHgXOaoXhMEMaCog0BcZlCPeBnyVJpX05lVVnuEJ1vK/Ox87vx73
   vrhxC7R1xXlcyDPnmUi8u1GIiqZYdY29+gkNYBQhxf/vJz8/HapWCvPdn
   2fqNXn/z7qAyhSsgnVPM3lp4caVzUQLP59iLtV+I01oBIPhhGdwnWGlO4
   NrEEAh4C+MCZkdmHzeWoHQh9nudYU9ap6MIZFr2pSk4ZduJjXsUe571T7
   Knm6wr3/OyciZGfKf13PH1RjAB7dpVOPBN5NpH48N1CsSjqzNXynEoRcY
   g==;
X-CSE-ConnectionGUID: 9zcsAdkaQPSxRMiJ14huEQ==
X-CSE-MsgGUID: UXqf8RN1Sgaf5j2Ttqcp2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53627080"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53627080"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:07:45 -0700
X-CSE-ConnectionGUID: p0yK+f8oQ7uVlOTVeGUfLg==
X-CSE-MsgGUID: u7S+pl0ASgCz4QerspO3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="190595410"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:07:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, vadimp@nvidia.com, 
 platform-driver-x86@vger.kernel.org, Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: darren.kenny@oracle.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250630105812.601014-1-alok.a.tiwari@oracle.com>
References: <20250630105812.601014-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH v2] platform/mellanox: mlxreg-lc: Fix logic error in
 power state check
Message-Id: <175128165916.8413.10898065665792776275.b4-ty@linux.intel.com>
Date: Mon, 30 Jun 2025 14:07:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 30 Jun 2025 03:58:08 -0700, Alok Tiwari wrote:

> Fixes a logic issue in mlxreg_lc_completion_notify() where the
> intention was to check if MLXREG_LC_POWERED flag is not set before
> powering on the device.
> 
> The original code used "state & ~MLXREG_LC_POWERED" to check for the
> absence of the POWERED bit. However this condition evaluates to true
> even when other bits are set, leading to potentially incorrect
> behavior.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: mlxreg-lc: Fix logic error in power state check
      commit: 644bec18e705ca41d444053407419a21832fcb2f

--
 i.

