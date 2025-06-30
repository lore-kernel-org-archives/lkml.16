Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34BB23F26A;
	Mon, 30 Jun 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275209; cv=none; b=ZC8dH2LGAY7cL3lzhkUg5zxkutPAXyqPkaEOlx4vxrszBXQEuyd1T0sS2WfWY/Q8UQHV/0dKmT/BaOxJmMWbTZvGcp5hMTeylq3lmzjNpTkgu1pWs47pEf4YdzTCUbU2nJWWVF9+CxK83ey6Ai3ArAXkookll/ly+riWueG+bBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275209; c=relaxed/simple;
	bh=YoNI27eq+8uxF74HNx51QGQAvqLd1DX3N55HWkVTSeI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ss9R9aHPCx6fNKzPEtHhFVeTVHXocbIvvdTuY8Tjf7ze7UV/o9ftElHQVbKvOsLnXYUcfNmw4jndMb6ItGw/LMw2yFubSsGFs+ma3+nwcNEZr9Z8lJbEAcohg6dqCZguED3ZjZ58DyICtrUtXK47QE1zymvQhd86WCpKiUgBqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc7QDcSk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc7QDcSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275208; x=1782811208;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=YoNI27eq+8uxF74HNx51QGQAvqLd1DX3N55HWkVTSeI=;
  b=Bc7QDcSkxnxYsoxl6MtV4bwCP8ej3sxRHeQMR6SlA6FfgEinY6KEQOXz
   f7sibQlrE5ImaAC9W70AdSZkXl1r1jCkyHuleOhxddm/Crs5i+ji8HRBQ
   ETaJP6Si6yGiw2HUGsnwZTVvt9SR+KyV4rbCj4268mULHUHRuR559OE3Q
   0GGA4XFY4960vxpRulC66MELQRFA/zZVV49wcGMEMw3a2elhxz5hCmOC2
   hg0dLVU72gZU8s7JH85W/N36iMrko//RKIQMk0ayr2Wj3k7DSt3Q3+RwS
   FlH1QiFQ07LifJlsp8/ZzBjEBP4OotWyh5aUchOXpYpAUeCtiOV05/Qc7
   g==;
X-CSE-ConnectionGUID: dA5a3d81T6Wpt5aOovgRig==
X-CSE-MsgGUID: RDFc5YZbT3OiJzQ4XeyhsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53434226"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53434226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:20:05 -0700
X-CSE-ConnectionGUID: ze9jNLqmQyyhhLlZuS7MaA==
X-CSE-MsgGUID: +5mT76IMThqRzx4UVVWkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="190579742"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:19:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>, Hans de Goede <hansg@kernel.org>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com
In-Reply-To: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
References: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
Subject: Re: [PATCH 0/3] platform/x86: Fix fiwmare_attributes_class device
 unregistration
Message-Id: <175127519445.2486.1805631575200409826.b4-ty@linux.intel.com>
Date: Mon, 30 Jun 2025 12:19:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 25 Jun 2025 22:17:34 -0300, Kurt Borja wrote:

> Using device_destroy() for unregistering firmware_attributes_class
> devices may cause issues if there is more than one device under this
> class. See details in the commit message.
> 
> This patchset fixes this problem for all users.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: hp-bioscfg: Fix class device unregistration
      commit: 11cba4793b95df3bc192149a6eb044f69aa0b99e
[2/3] platform/x86: think-lmi: Fix class device unregistration
      commit: 5ff1fbb3059730700b4823f43999fc1315984632
[3/3] platform/x86: dell-wmi-sysman: Fix class device unregistration
      commit: 314e5ad4782d08858b3abc325c0487bd2abc23a1

--
 i.

