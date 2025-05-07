Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D3F4B1E4B;
	Wed,  7 May 2025 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622073; cv=none; b=jLn25/SowSYpy80h7PTFkaH8zjq/NgwPy7Lhk/xFdEpjiYI/dnmnAVS6Br7JPZT4MMRTaKVLvDulE1ji4E91F6eDziaqqYaY9BKSEAvgHv1kNCcMl7gfQUJqKb4MH5hbrv7Ghx/X4h01s2Lf8wj1kzSOCMpkCtv5MEsVI8tFrao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622073; c=relaxed/simple;
	bh=Xpgh+ZzL6jiUJGQCm47UfWObzIhcpzc+Qm808OOYWmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K7GrN5GE1oukUD0jlrEG7/b1k8bXgs5tfQQIYsNzsgK+XHVFPRvZts+hopBQnxjFXFRCIVGiABh36VlzS44ho+F846fcupG46TI14LJqXvGKdmGqswVomA2GOaCDHdGKdZ+6vKy0GSKhzOsEjq7J1Vimf6ClumOsaaHi78fSaxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfoO8AMh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfoO8AMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746622072; x=1778158072;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Xpgh+ZzL6jiUJGQCm47UfWObzIhcpzc+Qm808OOYWmI=;
  b=HfoO8AMh4UREbspSSTJ5EbsY75J374Hid9i9+jgQPt6cAQKfkayk3ZSa
   hpSA/IfBBZ+emWCrzTgATvnAAfiHPGwMvqwcdkZ5Xk25wvpJht/xiYAn0
   BUTZtdBfvjzokTd1DhQG7cGcxdhn+eF1o+BcfjRyJgljm03UfHo0DV6sG
   y75n/8zdO2fqvB2t1Ky8n/RDR42phqhuaPR0x1NoaNtn/kV/7Av90tRoA
   Nfo1olMWPXR6aQd8jyZbjYUC2wxu5g4WepIhiWUyB29RHkcsyw3eraeZw
   ps6CGMZySQEceqZm9BVaBCbO+BP8oge+r+n/9gzi11/48DyHCiSPWY/t3
   Q==;
X-CSE-ConnectionGUID: NQhDWfYtQcKBKBh6PjqpVA==
X-CSE-MsgGUID: Rh0ALjm1QwyMGy+9Y3DFrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65879959"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65879959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:47:51 -0700
X-CSE-ConnectionGUID: qKVvxeSrSCSsnpQZxrzRhA==
X-CSE-MsgGUID: cUQxy6WBTNiaNB5FYM8o9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="139995083"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:47:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 John Chau <johnchau@0atlas.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250504165513.295135-1-johnchau@0atlas.com>
References: <20250504165513.295135-1-johnchau@0atlas.com>
Subject: Re: [PATCH] Make thinkpad_acpi to support also NEC Lavie X1475JAS
Message-Id: <174662206452.8998.2210787705344593041.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 15:47:44 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 05 May 2025 01:55:13 +0900, John Chau wrote:

> This patch changes get_thinkpad_model_data in thinkpad_acpi.c
> to check for additional vendor name "NEC" in order to support
> NEC Lavie X1475JAS notebook (and perhaps more).
> 
> The reason of this works with minimal changes is because NEC
> Lavie X1475JAS is a Thinkpad inside. ACPI dumps reveals its
> OEM ID to be "LENOVO", BIOS version "R2PET30W" matches typical
> Lenovo BIOS version, the existence of HKEY of LEN0268, with DMI
> fw string is "R2PHT24W".
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] Make thinkpad_acpi to support also NEC Lavie X1475JAS
      commit: a032f29a15412fab9f4352e0032836d51420a338

--
 i.

