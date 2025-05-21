Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670453CF58;
	Wed, 21 May 2025 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826167; cv=none; b=QcggHzTGFL4ZxuobxsHZ9Y4sU+SKWWMQbgobDwpmHdv3GPYLhT168clv4HEcbpZHOSSg9eZuLenMAz1fJ4A1IXnumUqorrKDbgvT+RJwFhQ8tw8sR8frPf1/IMsE/FxaVFZipkZmjqJiinf+Zbn8ASJVcIPCIEz/trzpy9GsTCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826167; c=relaxed/simple;
	bh=MFYDkB4OiOP3s0xg9Lmc791GfWg3RvLOwt7pbTrsDJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rSqe1nP0jZs+NBMn73ohQTbHIhE8eOmXVvhwxaXRVWXa1yz4JDiyQM6Y4vzgi1tsfd7l1C1zj1YC1SWFAdIpV1c/pjVx/Me6Trh4E4yczQkk+OWrlEWJmYiB3REqqguf+eQOk9ksW7DjYEGYveKMxrBw8zJenC3DTKWyu70Mlbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2WUr5Bm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2WUr5Bm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747826167; x=1779362167;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MFYDkB4OiOP3s0xg9Lmc791GfWg3RvLOwt7pbTrsDJU=;
  b=S2WUr5BmH1OzkyDKOVsqk+tE65lZeEG9ObnelsRViWbE3gJq5X0iavhK
   OsL5oSOthSLuchx4mP2gZo0JExNrvnYq52XTPuopSeV7aVtzUK8koM/VP
   pulwBArJBKnqc6yNIxtS359TLB1njaLr89F4GQ0rLqocmmL2dM+j+Ig3C
   M8zGt+kHtMq+M9LTGIGQkwzwfO6FWOdLa48Q7BnCDOvH667jhQxaLVPoj
   w59gQovootCpzoYeLiX/snDLfiHgBi1xou0KR6JKrlJukcfuhPPsY7AKJ
   Atb+79u/duBwEnfN/LNnteil3pvJugMKGx1XMEWBAv+pN/l+M4k20uB7H
   g==;
X-CSE-ConnectionGUID: OsILRmCGSceNh11N+jrKtw==
X-CSE-MsgGUID: jG7vBgp6R6eRqu+QkvxHEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52425897"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52425897"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:16:06 -0700
X-CSE-ConnectionGUID: RnmvDbZ8Tt2QCaNUeG5oXw==
X-CSE-MsgGUID: Ebua7goRT9ufhW4zklc3Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144013300"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 04:16:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: skhan@linuxfoundation.org, W_Armin@gmx.de, 
 Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250517175626.1363502-1-sumanth.gavini@yahoo.com>
References: <20250517175626.1363502-1-sumanth.gavini.ref@yahoo.com>
 <20250517175626.1363502-1-sumanth.gavini@yahoo.com>
Subject: Re: [PATCH] docs: ABI: Fix "aassociated" to "associated"
Message-Id: <174782615869.1966.1791685145921891234.b4-ty@linux.intel.com>
Date: Wed, 21 May 2025 14:15:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 17 May 2025 10:56:04 -0700, Sumanth Gavini wrote:

> Fix misspelling reported by codespell
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] docs: ABI: Fix "aassociated" to "associated"
      commit: cad37faac66c3822add86caf02fa0884d309a45f

--
 i.

