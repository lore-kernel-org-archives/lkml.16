Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A750222566;
	Mon, 10 Feb 2025 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199461; cv=none; b=c3FqMv9+KPjpHCLFxKVw4YhpOKMkBjME2QfK4m3rfx9JN1wBAtGznebFvjZziJLyz5Cxr0lrQFp/L3Bc6JsyCncy6mznCEBUDSS6qy6c1Ve6Gb88nqV1BMLPflMQk618Cj+HcekWTyX4hbGXWuM0gUchUH+wR45MciTA09ByxHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199461; c=relaxed/simple;
	bh=roz7Amt882FN5/NfmsS3VPitTiCQLfLXOgUxYhzn3cs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JwPJ6w7MownvSHTrDmFpiDLq+J/U+Rpj3lvxQXVsqp0/R2RIPfvx2fhTaULSneCwEyjsapP/nCPOGqzXLrRF4BMCHQpLU9xYysqUSNLxf8LSmdVKLVksm/OPmhxA2AysAf6N6m2vHSSTju4fBNYxet9OO8wjkCRVGy+W5oOoDpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6Jj+JxB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6Jj+JxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739199460; x=1770735460;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=roz7Amt882FN5/NfmsS3VPitTiCQLfLXOgUxYhzn3cs=;
  b=S6Jj+JxBfdfw998T9izTbDHhuu+6wCeAB8d2XbPQK3BPC0frSGIVG6K7
   no5ykh9ptv6JClodm7pe3SxO/wNLKdvrjgvQIt2SzzWdBhWMpVU65tESU
   yMNksRW0KHFnrbCvUYGaKUtvBEGavC3lnsQy8b3UEuo46lgLHjGK1+9Wf
   o6g/RJsDJ7ZDqTqnMyZMwUMSNanFYmBUteFPDvA0GYqfWPmPjCbQHr0lc
   UdXUA9rGSkbA1lRrSuwj8YPpZD2dpPwWSERH398wlhArQD+chrUDWrCrz
   Kz9AbmNFK6GiHtyrVQjR7jPI8/yuz4Nepkz4gC4pVc+9uWpgqRpPM5HUy
   Q==;
X-CSE-ConnectionGUID: kHrJ544jTNSp3KOO7g0s8A==
X-CSE-MsgGUID: nUfroH/OQTiQYwLHKX0ZHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="65134991"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="65134991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:57:20 -0800
X-CSE-ConnectionGUID: ZEmIWfSsStChT+zPyvUoTw==
X-CSE-MsgGUID: Cfg6lExASaqFqUSZMitzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113089610"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:57:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250206193953.58365-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250206193953.58365-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Support for V9 DYTC
 platform profiles
Message-Id: <173919942921.8268.14156457834157623584.b4-ty@linux.intel.com>
Date: Mon, 10 Feb 2025 16:57:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 06 Feb 2025 14:39:41 -0500, Mark Pearson wrote:

> Newer Thinkpad AMD platforms are using V9 DYTC and this changes the
> profiles used for PSC mode. Add support for this update.
> Tested on P14s G5 AMD
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Support for V9 DYTC platform profiles
      commit: 9cff907cbf8c7fb5345918dbcc7b74a01656f34f

--
 i.

