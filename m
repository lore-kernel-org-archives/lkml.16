Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4E15E5DC;
	Thu, 24 Apr 2025 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503617; cv=none; b=uqjT01ma/xDyn4HTgWcNQlcipsiVfe0fU9FeAPhltUnLNWSi7kqsHkSWNcdAEdF/Ovi7DvSICU5DBnGiD6GusFgmRSj56bx67PrDT526Yy4bPl8yKFOnkgaw1TcP9hYCn40RB9DiSRY+mFm0JJPscgLTqyFyQBLjVi/tY+4MwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503617; c=relaxed/simple;
	bh=Q5IY/Mu6aKi7yoYYMtieJmLRNqWv9SMsygOgMrJp0/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o776GXL+2tEa/WR6KNRKIK1s2ejVEGCkmAhUbBUSc0k96OHnmJP9cLme9VPY8r4pVebwtsuQL49CFBkhxsymZ66uBcVuMp+lAgafxiblYh+a45ZeL+zXJWkhi80SHod2vXXH9ucvAVn54sCu23ibn9LPzEinGu4pP8Tz8/Ajwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfutFV62; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfutFV62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745503616; x=1777039616;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Q5IY/Mu6aKi7yoYYMtieJmLRNqWv9SMsygOgMrJp0/Y=;
  b=bfutFV62af3/ecAU8jHXqw+Kwd4LCozm1k68AEJjsuXRVTBo4tGhWSJ7
   I6F5097XP8UCfdFhjqpfClRfpcds5qREDIMoLaOUlcEMB+T8mBJ29gYai
   z17v9kGBZRMb7CFPg3PKUBNlM0MlK4LxARpZSZgM0LRC7GRyhnOeqB9yM
   Tbik6xRtF2c9pXNVIVe4UlfNuMzYgBOElngDeFU0d60rqWXCaf6A8fshs
   Omk7uhbs4bzV+hu9M2heVbsLaVB4Uy8pQj1dt8rDXry7UDDf4aWLxPrs4
   JuUrNmEbdls+7y8Y7genVC/bUWPdAchabW3GCFQJ972mwIuhBl1Uv4ULh
   g==;
X-CSE-ConnectionGUID: h9hIqfmtRpC8smysF982wA==
X-CSE-MsgGUID: SNf5T+8JShmk/iNAmnaueg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34760533"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="34760533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:06:55 -0700
X-CSE-ConnectionGUID: 2lgzKjiJQZeoVQnKTiuJLQ==
X-CSE-MsgGUID: m6ExJB+eS0G8v8wulIkEkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132518355"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:06:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Lyndon Sanche <lsanche@lyndeno.ca>, Hans de Goede <hdegoede@redhat.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
Subject: Re: [PATCH 0/3] platform/x86: dell-pc: Transition to faux device
Message-Id: <174550360804.9369.10436834276962327207.b4-ty@linux.intel.com>
Date: Thu, 24 Apr 2025 17:06:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 11 Apr 2025 11:36:40 -0300, Kurt Borja wrote:

> In commit
> 
> 	35fa2d88ca94 ("driver core: add a faux bus for use when a simple device/bus is needed")
> 
> the new faux bus was introduced. It was designed for cases where a
> module needs a fake parent device.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: dell-pc: Propagate errors when detecting feature support
      commit: 4630b99d2e93a91b304f498c4d543c002fb78ca5
[2/3] platform/x86: dell-pc: Use non-atomic bitmap operations
      commit: 48e21e0226a9325fc75145840d289113fb0c27bc
[3/3] platform/x86: dell-pc: Transition to faux device
      commit: 99fb11d1edb2104f976a672a0863f1ea1ea27398

--
 i.

