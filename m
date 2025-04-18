Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF792AE66
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744991775; cv=none; b=rImLagTLFWyQhPF4oAAfpY5yJc/AKqm0Kqhn84On5ASrcWqWUsnnkmazi6SIokzH82bpMEpYxRrdkkvewq6OOAvrhzmvNy0RPX2zdzNPVvAiH4jPXfGrfzlndRXzaI/8YS2EObF2ti2xc5TdgJPapoDgGfeZXQ30C7mDGBZDRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744991775; c=relaxed/simple;
	bh=tsOAAAMLGSdezCn7sGG2WTFk10utsV3HqJVHA8RrSus=;
	h=Subject:To:Cc:From:Date:Message-Id; b=LHcpZXw71Zw1KLSq+RKcatiQBj4HB1iqfjZ1sXvxkXBlmrfytx4+TZv3NYD0jrjVNoXTLL3UXfMmq/SrJu5+MXehceM/yN1EBGAoXZ8GDm8Vm2ah6o4E7uEgjDj+7idiJLmLtSBeyarMcRwDhLV1OeznkJZYbbsAaMhtZ5Tb8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSW/ZguR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSW/ZguR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744991774; x=1776527774;
  h=subject:to:cc:from:date:message-id;
  bh=tsOAAAMLGSdezCn7sGG2WTFk10utsV3HqJVHA8RrSus=;
  b=SSW/ZguRvVS3M4Jphem27mtT7E1EB7UkJ/ktBeyQcfdQBTRDujaaU+pc
   kOe9CcamQzuGQRm4zQYObna3NlbxnuYuxEJm4Wmi/87tFOk6xaowVGXRy
   GDvznMXN6sHH6uOTkIMU0pVgNtxGdqK1Rar6HhkREucs/F0JkpxQS/ep2
   1FZgplT8oZwdwGTVtkxCBiq/51pwn9VrpTBk3PRmEDHYXBBF+7Gl4Tl7h
   AsUtQgpS5MrX00d/5HYUvNzyJB5cw/TjeEckJXCaZ09yNj1C6bS4CU6L/
   c9tNQ0omaDSYzrQHWrXCihdhXhG18gYuAO6Gb51d9OFGbmzJHbTNnIEn+
   A==;
X-CSE-ConnectionGUID: ECk4BEonQueaCyd0am5EsA==
X-CSE-MsgGUID: BKz9W1ZIQIS67drWRx44Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46742606"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="46742606"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 08:56:13 -0700
X-CSE-ConnectionGUID: 4fDcj/suQCWsKiZMGmeIgA==
X-CSE-MsgGUID: 2EMWQbtnTI6ovLfl9rhDxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="168347182"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2025 08:56:13 -0700
Subject: [PATCH 0/2] Minor fixups for PAE simplification
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,tglx@linutronix.de,bp@alien8.de,joro@8bytes.org,luto@kernel.org,peterz@infradead.org,kirill.shutemov@linux.intel.com,rick.p.edgecombe@intel.com,jgross@suse.com,Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Fri, 18 Apr 2025 08:56:12 -0700
Message-Id: <20250418155612.8F276BC7@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Kirill had some good comments on the PAE fixup series that I applied
to x86/mm yesterday. This is to address those comments.
