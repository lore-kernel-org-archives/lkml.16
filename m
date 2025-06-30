Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A382244683;
	Mon, 30 Jun 2025 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275214; cv=none; b=LXUeOkGPHN4hMVwUK7/nVlEEcLrzk8Pd36/OyqzUpiYMNR1CZE/up9Vo6XyfQmWpKKisqXf6F2mvtT8GWdxrnd47M1XEbB3oyKYDc9uSEavD5fqG38lWyoyiqvKwC58+eJPj0TCkLJSlgcaf92w28jLUBE6juJMF+h32oWxT3qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275214; c=relaxed/simple;
	bh=Mnxh7S95aPYMyXut+5E/LrXFcWBM9KTFY05nUBytcYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LRGWs1aXzggIim6XFhCp0f4mKLKjM5w2UMMqUawxKpwLnrsoR0jv6a+0MqqyaFX9AKG95nMhVJyr2sC2DNIM05DSuasS6SBx0NFI5Hk6WI87qUHY77TFb0BPasxmgLeSHm1nM1BO5FqdccrNhdbfwZy0QBwvpKQW6G+QUEcXs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJU6dmeK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJU6dmeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275213; x=1782811213;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Mnxh7S95aPYMyXut+5E/LrXFcWBM9KTFY05nUBytcYA=;
  b=AJU6dmeKYTE5i+1s2qOvhZhbjKW9LoJA1q800Kix+9e/+ssGtLZSIpRo
   JL6Ksay7+YgAJF3eMJiF1zZIC4g1Yh47nJMtKGUkzpxc0DbR8cBu00r+v
   s0jOpaWYOEf/e47ZUv3db6rEv3moFhcnD2pKuXK4tcxIFLimTX9h8Cu6S
   C1tZL7IrnzYCJsA+KV9DyCUeoJ3FsqaczT6rxcZrVHznyZJcMQ8EO7Nwt
   RTXBjL6Mal0o5rZS/x12muOOIpgCSrhPNj4fc8B2jyOLt5fDv0mnvbG4U
   t1ZVdmMYWzcvRD5Sbg/b+eCMP6OfCMfqdz4LeqTgnCMXKtW/NA/T9L2tg
   g==;
X-CSE-ConnectionGUID: F/0Dk8v6Tau15y+0CNDaqA==
X-CSE-MsgGUID: Ln8KrCU1S1O5FCANa7eJCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53434250"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53434250"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:20:13 -0700
X-CSE-ConnectionGUID: wzfjYss+SM+1Wr3kc3dDVw==
X-CSE-MsgGUID: bzd2HcsaTnS92SxDWrcZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="190579847"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:20:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250617232913.3314765-1-srinivas.pandruvada@linux.intel.com>
References: <20250617232913.3314765-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] Platform/x86/intel/hid: Add Wildcat Lake support
Message-Id: <175127520520.2486.15515642255802707801.b4-ty@linux.intel.com>
Date: Mon, 30 Jun 2025 12:20:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 17 Jun 2025 16:29:13 -0700, Srinivas Pandruvada wrote:

> Add ACPI ID for Wildcat Lake.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] Platform/x86/intel/hid: Add Wildcat Lake support
      commit: 690be4bc589a145dc211b8d66b8f851713abd344

--
 i.

