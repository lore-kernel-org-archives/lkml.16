Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587AD2D1F5F;
	Fri, 13 Jun 2025 10:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809687; cv=none; b=t2CH4zMFIEsKyEZcn/oPq+GZezYM3BLj3iuSFgn3JHui1d2+sWpML7dcc3grdse9uw2duolsII/DUzipCq+dfzbJ7hCccP8VTIm7THD0+rOw0XqhSe3Kh0Bz9NED0djcdkcvPMcKDPxYTgDMl6bihI/JbciZifboJPOeoJGJCUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809687; c=relaxed/simple;
	bh=4PXBZO04opD/wBfL2h2RTgzrnGkZgP4j262Lo/o0zwQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Yo9RhZj03eDpCxqzQIOrzhISPsPUT6ZzkAoX0Moo+PfRFOKQf+6xOT/CazEFANNmhtumg4LOfW9AZI36te3B/q7Pfrvakl/5AiAehdz7x6YXn3VQLFlTrUE4eiy3xHFv3aXrkqXC1mbWxqwS2/JtxCd1YhFi0Rl8vEwXJijg5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHtwSwGA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHtwSwGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749809686; x=1781345686;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4PXBZO04opD/wBfL2h2RTgzrnGkZgP4j262Lo/o0zwQ=;
  b=GHtwSwGAIPtlLcsLWtGdWGcj1SthfiHY5amufsVvIUGUEUzgXejd4kNt
   Fg/OZjjAnNVZhRQKIiHAO+OnbVE90a9Qj9Ed0h753IotGBhr3S03liZv9
   N3jYj93Usk4kjbPH/L8jHgyXD/nALlMLaqyUrfPIjzqFxFjzjAo2dsf5Z
   6PjQjmNm34tRnPpNCtm3MrWu5r6L+bzcmLQQp0N/IjwyPPMJZZyuEFCWy
   Co+713shvSgZmVDVKH9M6AY1ED3JzQuNjcCgI05/SdQKnZmGou+2FNaJu
   m96yQ5ETw2kpxX1ZXSBhQMm0tVRjAjuw20w+JbRw+8/lLZhbpVtS3j6yb
   g==;
X-CSE-ConnectionGUID: 326HBSfsQV2Vb6oZVkZt1w==
X-CSE-MsgGUID: RWn+bD1QR6KFa0OTKNK/OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69595184"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="69595184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:14:45 -0700
X-CSE-ConnectionGUID: REIgfaB7RfS0olbE5MS39g==
X-CSE-MsgGUID: owxhD4eqRXK/U98/bE6mMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="178690131"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:14:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250609-lenovo-yoga-tab2-pro-1380-fastcharger-devm-pinctrl-register-mappings-v1-1-fb601f2b80f6@bootlin.com>
References: <20250609-lenovo-yoga-tab2-pro-1380-fastcharger-devm-pinctrl-register-mappings-v1-1-fb601f2b80f6@bootlin.com>
Subject: Re: [PATCH] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger:
 Use devm_pinctrl_register_mappings()
Message-Id: <174980967823.26331.6507720358049401157.b4-ty@linux.intel.com>
Date: Fri, 13 Jun 2025 13:14:38 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 09 Jun 2025 14:34:49 +0200, Thomas Richard wrote:

> Use devm_pinctrl_register_mappings(), so the core automatically unregisters
> the pinctrl mappings. It makes the code easier to read.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Use devm_pinctrl_register_mappings()
      commit: 05651018f04ab00a84da8a47feb3a605ec1c7e41

--
 i.

