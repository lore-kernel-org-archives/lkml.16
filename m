Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4D28003F;
	Wed,  7 May 2025 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622082; cv=none; b=nuEYB4cWZTBBECam7Bo10B8yBQvApjMvW1SzzfrzwhLsTrqHlB8bU5oirB7twhcJk+uzK3aDDIN7MyLrt1nDZ/ujhWtV5toQmF9Y5KOCi1k0ohkOpCopQkTkY014AhViBDKWHFBk138xH7uHVDlrPOiqc/X+4Vz2R9CQVqGrh5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622082; c=relaxed/simple;
	bh=wn38EI640D1g24fRAEMevwzesmAqXU7j7c0FMEpe4tk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JD0RVwUECcFD7aeHOXv0+EIbBvWC7hF0msvIuM/Ujs3fAPLzIY7R1E0uEKysIyw63kFQwY5UQGAKH+EpS9oTEb9yqUbBWigZiR9BRxR5f8GzRBX1dr+0a3ffvjZpTywYiKtuc8XZKlvx/ByN5Dr9egOfYmHdbx9udy5ly07u/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c04mtJgE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c04mtJgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746622080; x=1778158080;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=wn38EI640D1g24fRAEMevwzesmAqXU7j7c0FMEpe4tk=;
  b=c04mtJgErdOxeCrOzARslZjUeY1jWmm1M9k8iTS2zSasoRuXg3IbS5MH
   hK1+5oBppil1kfcUKnwP3oTas6Dez/5tfpaVVuT56kpE8tRahYbyENYhm
   VCFozQIm+MlGgu5vrDMDaH5Gi2GWE+VJe/Mmi8iYDwxUPeEw0+W9tPj8/
   aK4bbolEbFFocXNuP/qGOdfFpN7jOpYv/doFJt4PH6AWOKniLNqme8WwZ
   ij/0okkEqj1nC05MHR9t2fZ8wO1V/z1jBEMreaIwbJdfQDFyYv1zZ7NNR
   2ciwubwc1ZopEVs5h48rIh4dw5ZcAjxfC42RqBfMuZu8Jr6mBDLm7bGFo
   A==;
X-CSE-ConnectionGUID: e7jM+qz3SbGFV2RQJ+mnKg==
X-CSE-MsgGUID: yNqaVxWlTI25iPc+C+WnWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65879978"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65879978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:48:00 -0700
X-CSE-ConnectionGUID: t31yEBd6Suq0xzj3yTia+A==
X-CSE-MsgGUID: wTo+M8k9QRuCZr1Bqc59ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="139995101"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:47:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Runhua He <hua@aosc.io>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Rong Zhang <i@rong.moe>, 
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>, 
 Xinhui Yang <cyan@cyano.uk>, Yemu Lu <prcups@krgm.moe>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20250507100103.995395-1-hua@aosc.io>
References: <20250507100103.995395-1-hua@aosc.io>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Declare quirk_spurious_8042
 for MECHREVO Wujie 14XA (GX4HRXL)
Message-Id: <174662207156.8998.15057018004940201223.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 15:47:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 07 May 2025 18:01:03 +0800, Runhua He wrote:

> MECHREVO Wujie 14XA (GX4HRXL) wakes up immediately after s2idle entry.
> This happens regardless of whether the laptop is plugged into AC power,
> or whether any peripheral is plugged into the laptop.
> 
> Similar to commit a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard
> wakeup on AMD Framework 13"), the MECHREVO Wujie 14XA wakes up almost
> instantly after s2idle suspend entry (IRQ1 is the keyboard):
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO Wujie 14XA (GX4HRXL)
      commit: 0887817e4953885fbd6a5c1bec2fdd339261eb19

--
 i.

