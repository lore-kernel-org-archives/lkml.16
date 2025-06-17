Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8922DE201;
	Tue, 17 Jun 2025 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163985; cv=none; b=bBMGKOFeM/czKmTjJ8KLZiptV9mkShlHb32xUxAOFqzszJYmEtjkOU0sBqUOLcfP52ptR7ctSDWgvP7ke8cbiKMKh7Ne7CYuzy/tpHFaEM1boMKJ9geTMPnkHSleXs91rtButcIAgBwYByXbQuS5VUDoYwJ9ZncEkdAO0eDf46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163985; c=relaxed/simple;
	bh=FxF78pfUEwcnldmVITYLPHptbKq/FCT9ZAiwHo4FQvA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hyHAfa2z/VA9oimMjA7451E2iIhu3pZWQepk3PF+jG8d/0Xyse0pMqra9GX9dv/ooGHhxuQhrsXAkj4YzUbE2F+WdtNpqhkMdB0kEldE2B8Fc/aJ8D9sSUQgIBAo/jGdu0rSuQT2kRMSv2GkQmOoheT8Y5KJwhcTTa601O9xt9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcep2lKz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcep2lKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750163984; x=1781699984;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FxF78pfUEwcnldmVITYLPHptbKq/FCT9ZAiwHo4FQvA=;
  b=kcep2lKzO9DlSmjqNL5P6MKMJoSFuZDF85IH83LYODN6iu06B0PfSmeb
   lX6M5CXFENdDHIzwVCw+064rPFstKSSNHHmvBu/VqHoL5j3zLQONBpa3w
   s61KtP3RgALd4mPhcCvFRrD8+DHIPOA+wRADrDSj4WAuT3EbMEgoMcAKa
   0DWr0O9qeqy7bpDLzrL7wZKDg0zTeM4R+CjKI8TQsxSwDv/SkjJXxSU5I
   yKVCnKzv6A5jLSJaovAQxp+om9YDt3UvtynXX4PjXusVJa7jhD1ynmGVP
   ftNk+PC1ZtPc7IerV52/eqsdeyhi1c86MTJF6+qTjWADSOuJqklgA0vZu
   Q==;
X-CSE-ConnectionGUID: bO9J0mIWRIi7U2B45fHhlA==
X-CSE-MsgGUID: ur0EjqlHQvKvkALU8nz0nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="62945778"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="62945778"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:39:43 -0700
X-CSE-ConnectionGUID: SZO0S/QESiy0O1aJJMZNAw==
X-CSE-MsgGUID: sQeJtb+uQv2jnSbdzfq1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149134140"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.164])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:39:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: vadimp@nvidia.com, Hans de Goede <hansg@kernel.org>, 
 David Thompson <davthompson@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250613214608.2250130-1-davthompson@nvidia.com>
References: <20250613214608.2250130-1-davthompson@nvidia.com>
Subject: Re: [PATCH v1] platform/mellanox: mlxbf-tmfifo: fix vring_desc.len
 assignment
Message-Id: <175016397593.2117.2399113137810241629.b4-ty@linux.intel.com>
Date: Tue, 17 Jun 2025 15:39:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 13 Jun 2025 21:46:08 +0000, David Thompson wrote:

> Fix warnings reported by sparse, related to incorrect type:
> drivers/platform/mellanox/mlxbf-tmfifo.c:284:38: warning: incorrect type in assignment (different base types)
> drivers/platform/mellanox/mlxbf-tmfifo.c:284:38:    expected restricted __virtio32 [usertype] len
> drivers/platform/mellanox/mlxbf-tmfifo.c:284:38:    got unsigned long
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: mlxbf-tmfifo: fix vring_desc.len assignment
      commit: 109f4d29dade8ae5b4ac6325af9d1bc24b4230f8

--
 i.

