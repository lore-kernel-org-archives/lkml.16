Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD818DB37;
	Thu, 15 May 2025 11:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309742; cv=none; b=iw7uWMjSQcBzPc7fXlbZG9WV7zVTizPcF8kVZ6vw40anTry6xatF6E7OQyXx3e5tRosySQGU+FBSwuNqtsPHELUIusqdb2XmuYmNP3gBJd6CrSvodegYT1yAk1CQDT9/rVJHueRRXoM9vmFdKBYVJQSrR/WDUS/x9J4XowiBUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309742; c=relaxed/simple;
	bh=+UrfJA0kWpQhsXymgUbijz4kmy6evjIkw5lKxUYPVSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ERCF66gNAqwql4vViH/Cmr6ni6sPBhMDqHK11Umfu9xJ70E49oUd4MLHKoKuVzKbMBkykOEIfwgMt/kNeOx0QuvO3EKAQHoaIhtzu44fdmR8AfbosN9mt2ZgG87PNewNgozQ5wmjBP7Tmdw2yBFSREXTC1dxREK8nNfx0IVvYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWFhqUFf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWFhqUFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747309741; x=1778845741;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+UrfJA0kWpQhsXymgUbijz4kmy6evjIkw5lKxUYPVSk=;
  b=WWFhqUFfnDK+jf4mk613KkIQJBet3aI66ZDASCmDiwgAhNntJETgKcGi
   9Eivr05oJo9sGxEMWBB8hoQwRqXLUXpxB6+N1hzk4fDoBOIz2oRQe/WYR
   HwOi0ECBa7Pg/y5iEVLmTpG5q1ha4dwu3MfjtY9uOLoPymyohmtPLv5PG
   secSvtf62ZC5VoOh1xkqZjoHFeguZPdkuD03JBLawIsJ5l4ucs8suQOiy
   bS652cFH3gsL7jlZsYrlTrTXJ94EONy5Bvb1IG5ktRPDUPUO95cUG1Dko
   pItrF5B94gR761r+IF8kSRYQkIjjmYDydEvxp4yVmAbyNRuZyhpDcc/Tl
   g==;
X-CSE-ConnectionGUID: Nt+DQEdiRcqIkV/mmv1jEw==
X-CSE-MsgGUID: oZJHM1kYSMK+MMy0Rfyivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71750349"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="71750349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:48:59 -0700
X-CSE-ConnectionGUID: P1TP7DtjS2ep0rddaKbbwg==
X-CSE-MsgGUID: t4Bo2VtESbKcexAMVdiBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143452561"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:48:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
References: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v3 0/5] intel-uncore-freq: Add agent_types and die_id
 attributes
Message-Id: <174730973209.2036.3411257270314629381.b4-ty@linux.intel.com>
Date: Thu, 15 May 2025 14:48:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 08 May 2025 16:02:37 -0700, Srinivas Pandruvada wrote:

> Add two new attributes, so that orchestration software like Kubernetes can
> target specific dies and agents for uncore frequency control.
> 
> v3:
> Patch 1/5 has changes to change to loops
> 
> v2:
> In patch 5/5 fix grammar as reported by Alok Tiwari
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/5] platform/x86/intel-uncore-freq: Add attributes to show agent types
      commit: b98fa870fce2335433f20b2213e526b8d99e15dc
[2/5] Documentation: admin-guide: pm: Add documentation for agent_types
      commit: bfbe7729d6dd2e2c8ef44f9179ad11ab766150e6
[3/5] platform/x86/intel: power-domains: Add interface to get Linux die ID
      commit: e37be5d85c602e07c1e2930c2cc98ebd46f9ecf7
[4/5] platform/x86/intel-uncore-freq: Add attributes to show die_id
      commit: 247b43fcd8722914282fbd432e9cc41cd3971e31
[5/5] Documentation: admin-guide: pm: Add documentation for die_id
      commit: e636e3f7421b2ff8e706a835f78f071cb0d8e197

--
 i.

