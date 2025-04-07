Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEAF23815A;
	Mon,  7 Apr 2025 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023029; cv=none; b=feFD3arRrz9QJDzs6Dq4e+XqC2KeSZu8gB7lnz1QYnmhS+XzgK4EbR71nLDsyTvMCdbMQ3r3T91xXzdzUOXYJPl5Su/fiVKGc2Hdl50dlWrQRzn7J8eqhSAdZo3EHao6eWpUOqQ4h9BY2/127wdMpyUecjbzIB0ccuXtfC1ZjJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023029; c=relaxed/simple;
	bh=Gszh3eqxlJO6JcJ+S8IHd+SMm1KIYAxiLl0NsfPIPec=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iLSTppG9FAHShxrKsHHlwON7KDxD/Pg15p1bWLaB7tttTESDfT/gd2FKhio/gIgYuHI119GwpaJ5vRDWKuRhpGKc5PS1sweblniOvHMJCLalSVDrJF7MGRqHcXaZJZvyYNGb+ydbCQGiU5RYwOfl3hKULiKvKxuWB/kgWKhF044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dxp0mSjS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dxp0mSjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744023028; x=1775559028;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=Gszh3eqxlJO6JcJ+S8IHd+SMm1KIYAxiLl0NsfPIPec=;
  b=Dxp0mSjSP94Ijzhf0NcpH0hWuCPiSqCHZhACrO5f514l4F+TPj5l40kO
   ilB8z0qW+l47+uopSJ2h7x7iZw7m4gi80BJ1bdCPYy+3JpBKdIg8FcYuf
   nFmksCEPsu5Lslt1v9loW1YvVsUkpgyji66hxGEG8yvIFq2/fEjZWUDB9
   4QTRLSt4w5le7iK+LgZeXB2wJnzupB7uvhy6TbJ36EVUPfwhNJjqmxXGZ
   8FlZrrsaW+wmdQgnKDw7Stwk5M+iNbccvXpFHhrPoAHOaEfTF4+B73ai0
   PGD/F7rAFDDBbPrQGcmNO3V4lXIqI+B/yqltig2whoA/Lbu7E9r28NiVj
   A==;
X-CSE-ConnectionGUID: OYUAcLoQSsGK30xjslY4oQ==
X-CSE-MsgGUID: C8pb2WeURbK6+DmekaQMCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="67875039"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="67875039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:50:27 -0700
X-CSE-ConnectionGUID: 6L10EDg6TaGjRaElhF5k9A==
X-CSE-MsgGUID: EcxYejMiRWWEyzGYNXPaEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132058478"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:50:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: mitltlatltl@gmail.com, hdegoede@redhat.com, bryan.odonoghue@linaro.org, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chen Ni <nichen@iscas.ac.cn>
In-Reply-To: <20250327025244.1790897-1-nichen@iscas.ac.cn>
References: <20250327025244.1790897-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] platform: arm64: huawei-gaokun-ec: Remove unneeded
 semicolon
Message-Id: <174402301956.2251.11043011225525757063.b4-ty@linux.intel.com>
Date: Mon, 07 Apr 2025 13:50:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 27 Mar 2025 10:52:44 +0800, Chen Ni wrote:

> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: arm64: huawei-gaokun-ec: Remove unneeded semicolon
      commit: 70081121e24cacbef8b3be849cc13bea31f8a158

--
 i.

