Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF23529C352;
	Mon,  7 Jul 2025 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893902; cv=none; b=B5RqheyL/nk0chuytJEQQd0xICXdQ7VsHLT6vRi4r5PFPG9Z/qeKCau+3FBYDaUonWIdAcy3fPo/WQPQ85Wex3T+LB6bb+TtkbdLEqjfUru9UogJfHR9/vXJSe1RUqK3bHLTATt1sStljllsSmkI6yxCbY02gvbvkwdy0zlgjKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893902; c=relaxed/simple;
	bh=AWmRjDG3Hq8Nr+//UwJFy18MLR/Rfsc86weW3B+7/2Y=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=myDofzdL4UXkHMbXZKHRzfkHjSOU7KlbhYAWckJ4zVPUBMjOhkvWuaPDbvd5T870na8nfcPwXCILwa12/oVEHVFPHHaSOasrnsIsMEGetiWGBO3epkQ2FciiSOYdj3OBNzXZ465N4yVKRKD++6R1XXDzHMLjjNwssCenmsbPDKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbLh6UG3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbLh6UG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751893901; x=1783429901;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=AWmRjDG3Hq8Nr+//UwJFy18MLR/Rfsc86weW3B+7/2Y=;
  b=dbLh6UG3XrEh+7kuSPQjx3K2GkeU1NnVI40jCt+ngNgevzn1mKF3njAZ
   ZRmgp1vvPPVfXlzt3zF3/DePu+NILiTc8EUMqUlSdMTj0UDDa7vhzdKSZ
   QXC8OLbbxo7A/uCIGVzZGBEw4Z9aLmD0ClofjtQck1VYP2AeccUzJkx7q
   MzYO3Pw23W1Rg4AYiwREiA3Me12ux5haUnSOMAb+pM/PBq9J0g99LrqTe
   KwseyM9o1j57uC1L3MVbLs7keWkgtX4zNdCJub3YhOVnHO5CWNex6JunG
   hwRyZSirKQbGtKviziF54/L+w+yOyn1rccyhRur980a7jsbBLAO9CIiqr
   A==;
X-CSE-ConnectionGUID: 3P7eoDhiTfKQ4U7BceFwlg==
X-CSE-MsgGUID: 6rP0zBM8RZim0rw8UJTf0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54235891"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="54235891"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:11:40 -0700
X-CSE-ConnectionGUID: UmUledL3R66JQELYQZzmJA==
X-CSE-MsgGUID: VCs6hDAuQ3i8xzTnu4qMnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="159482375"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:11:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Stuart Hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
References: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
Subject: Re: [PATCH v4 0/5] platform/x86: dell_rbu: Packet data fixes
Message-Id: <175189389223.4826.12947270597345917208.b4-ty@linux.intel.com>
Date: Mon, 07 Jul 2025 16:11:32 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 09 Jun 2025 13:46:54 -0500, Stuart Hayes wrote:

> Make fixes related to packet data list and buffers, and fix a sparse
> warning.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/5] platform/x86: dell_rbu: Fix lock context warning
      (no commit info)
[2/5] platform/x86: dell_rbu: Fix list usage
      (no commit info)
[3/5] platform/x86: dell_rbu: Remove unused struct
      commit: 56036d6af41a473a8129fc960a5ab3673eda13d5
[4/5] platform/x86: dell_rbu: Stop overwriting data buffer
      (no commit info)
[5/5] platform/x86: dell_rbu: Bump version
      (no commit info)

--
 i.

