Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09117A316;
	Thu, 24 Apr 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503625; cv=none; b=NmY9ZYwmGbILW+blqvT5WbkgeyUv92KqapTvfMCSMyhXkDzEinDdJfcz4jrAW0d2GXRd8zlqeTrbfJL3BKX7ePPxY/ELvYQhvbTrn2GepGQPqbi1STfVhcwFgOfYBuDZPA/D8rsVlKd9uM6EbDIwfIYjy3cSaK7VdCjH69EY5gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503625; c=relaxed/simple;
	bh=l9uxteUXwRUtqWXQO0d5MHD12GPOmwnft3l6x62fl5Y=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QQNaRMdivJw4NHraY0sD7I1tcuN4R9dDQKwqWorKcJI5r486a8sHAsj7jQff9w8gwgMCffZUnnFsDcrsORL6EuWupFdkTr22ktOCxJEfSU3uDHnwgT9otQeN4xKOyzzE5IuDvxnFXzBvRoInD/wR1BisNKlAihqXE7hLKbBk7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTN0kyt8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTN0kyt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745503624; x=1777039624;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=l9uxteUXwRUtqWXQO0d5MHD12GPOmwnft3l6x62fl5Y=;
  b=KTN0kyt8iqnS+IekY3sLiH8Ba6liP32FByQ52VVcheQRXphEwvia9uSl
   tmVt6dDIhCmVBjULIfiWTv/MXyks4v9CHySsCD7Mr2hn606IVQ5/M52wb
   7EvTJaUzyvQSeJTCISGdDnvv5yzFnnyLPQWtx3K1+m98bHGIFxwMttQwV
   wMn4rzUeriH1X3DMMOwD825B+xu8Hhq/5e9/F+FH7E0FD9CmnjpDIZOcV
   t2mmEalqKb/N4uUZCKPF5SAZ2L38BTAq9OihTIDNkgAS0QJDY+/FwIXA2
   kcVOmjr+j9FuittiJWe5VjGIi5izPVhXeJl0xI2z94VDj1Sp9ojvW99dK
   g==;
X-CSE-ConnectionGUID: 6qwPgDJfRT+QKIS6sdRbvw==
X-CSE-MsgGUID: GR2/RjIMRG66Hxe+N2ACDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34760557"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="34760557"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:07:03 -0700
X-CSE-ConnectionGUID: eQfsw6JfQOubaowAo76hJA==
X-CSE-MsgGUID: 9XKzVPmFSIqzjcl9WH4w0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132518380"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:07:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250417074648.81528-1-krzysztof.kozlowski@linaro.org>
References: <20250417074648.81528-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] platform: Do not enable by default during compile
 testing
Message-Id: <174550361551.9369.12732089183757711883.b4-ty@linux.intel.com>
Date: Thu, 24 Apr 2025 17:06:55 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 17 Apr 2025 09:46:47 +0200, Krzysztof Kozlowski wrote:

> Enabling the compile test should not cause automatic enabling of all
> drivers, but only allow to choose to compile them.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: Do not enable by default during compile testing
      commit: e99e2c54ea9fcad143837e800beb3468f17f9ce1

--
 i.

