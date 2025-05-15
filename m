Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4A18DB37;
	Thu, 15 May 2025 11:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309853; cv=none; b=dqxoJoBhtHnBztnL8lzcauBLjFc5vh448H9QDRRmR57YQAeaivSpMjib2dWz5BeGjLXlTd7yxLJqF/O/KTIuQlUOvtD1pEkfD+tpTG54rhiBxoFJOXZm7gjmERqgLLVzE5tACZPA2WJw4n/gW2ubkA92iZYKkKXUN4rTekL7A8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309853; c=relaxed/simple;
	bh=bKYyTxv5YhTr38Tw0lmHeGET6gKhl4kSCz6UhMfQUsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LsDtFZhAxsRD5QRVikW04HnOlx6xzsw3DZYt9MjQRKitt7F9xJfaRSleenC8volRjIpUp5fetZ35M7uttK1gOsxbFfQhac3P0ZQt6evaSi1n2xqbXvMOjHX75GptrTLptb8Gmv67EwWt6MHVIuWFiHE6w8gqjpx+b5gN+CAWIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6y7tjcC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6y7tjcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747309852; x=1778845852;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=bKYyTxv5YhTr38Tw0lmHeGET6gKhl4kSCz6UhMfQUsM=;
  b=H6y7tjcCrwf9GZ6J9TFkVHzUIEGrZ6hGoNBrtnRj/9oJn/7+EP8dEK1A
   RwiKL4HCUXFvzCG3Wey+Uzjs64LJUe34zWgFqM0a2VslveyO5Mhgw+o7n
   vSGv4sJn6HkrlgF1SPJLZF8ttJethpi26Uh4XGEb2KiD5IpSu8D+/y/D3
   qiEierhUbYAfsg0kmeIYgP3CoFjNAbNf1tCdD4/NQRh/r/GcVdNs9nU2m
   8y9T1ucyuAnB98Vt5Wa7ujAU4jXUOaklyJGSH2sLPhyfm0jWPiSH1B+mt
   ++RFL0rbqMK0ACe+isXGrhHmxGuXcwp/klE9KtwLICsgnuuUxmf2nasdI
   w==;
X-CSE-ConnectionGUID: 2bXRn5yiQNO2QNUhF4dZag==
X-CSE-MsgGUID: Gh0g6ZcsQoG/cZAAlzPQuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49354198"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49354198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:50:51 -0700
X-CSE-ConnectionGUID: DFNWBbTCQy2BklEQPU01Bg==
X-CSE-MsgGUID: 0/JQmvzLTKCg+f8hJ1cDLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="139244064"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:50:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: alok.a.tiwari@oracle.com, hdegoede@redhat.com, W_Armin@gmx.de, 
 mario.limonciello@amd.com, Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com, 
 king.li@amd.com, dantony@amd.com
In-Reply-To: <20250514215623.522746-1-pratap.nirujogi@amd.com>
References: <20250514215623.522746-1-pratap.nirujogi@amd.com>
Subject: Re: [PATCH v15] platform/x86: Add AMD ISP platform config for
 OV05C10
Message-Id: <174730984157.2231.15808775923608626252.b4-ty@linux.intel.com>
Date: Thu, 15 May 2025 14:50:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 14 May 2025 17:54:59 -0400, Pratap Nirujogi wrote:

> ISP device specific configuration is not available in ACPI. Add
> swnode graph to configure the missing device properties for the
> OV05C10 camera device supported on amdisp platform.
> 
> Add support to create i2c-client dynamically when amdisp i2c
> adapter is available.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: Add AMD ISP platform config for OV05C10
      commit: 90b85567e45736b662d034be536a76ba0f4c7ca8

--
 i.

