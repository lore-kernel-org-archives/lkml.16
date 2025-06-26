Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10F2ECE84;
	Thu, 26 Jun 2025 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951208; cv=none; b=tbTrZkbQ4IUQt6OcL1yXOgYdNaK5xPolFbhjqy8SLkk68Uz4X1EPVI0y2CrCZqyA2dv+4bfagHOVsDDZdxSZSxAT8aykdbxDhkhVIbzj3+g7qewISzLeF2GHaiubnL5AYsl2AmYb+l+pccwK/Ln2PCXBpSGS2X9pRtw5CRFj5gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951208; c=relaxed/simple;
	bh=xiHqNaryMZY1Vlue3/o9IeJwX5wVDhvDE9lWmpGK+bM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GDDILhauLfbjc7DM4hfCSuB44y6+2lB1l2Z2S5NEHgag7+BOEoY0ZzRsUmeZdzLnDxgws5US9nbKd3Jl1eewjcRtkzSz97AWtbCADnFP297ZGlkhwIoQ7EVTfz94rjz5O4Rr3UCOONzArCDeW53qsaifFhiZ3YwX8/htRHYPO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2qCX4A6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2qCX4A6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750951207; x=1782487207;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xiHqNaryMZY1Vlue3/o9IeJwX5wVDhvDE9lWmpGK+bM=;
  b=m2qCX4A6iPi/zbcbwlAK/6N7WaKSvTXxmECcp/GyWTvB0GZR3dBa3evs
   7wszUMSlKNqKoNAuPYyVt7hBZzfm6cKC2LNoEDDVqdRpBiCpORnq812US
   QCIpHry54liGKtkbhdo7tr8fH1cCnN0AAb9Yui9E2m86myF/XTyMzBzPB
   p93Xz+gs7+1ogj676DR4ZjCjeML8IjLt/mQQFhLAA+WFhn05EeWNQ3KsE
   WdPBczeU9n9b/CrgK1E0niofQ/aR9Sl+OzhiAYT5lb5y/TWdgIk8FyZYV
   einGuIysdT52eBuWsbC1zpRHkjArRBxr/wVv9xhe3+8h4dQdNHBAEwGOH
   Q==;
X-CSE-ConnectionGUID: ScYuf/5JSqy6SsJuCMbnwg==
X-CSE-MsgGUID: 9ysKEQLoTgKLGCqQG2hMaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70823168"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="70823168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:20:06 -0700
X-CSE-ConnectionGUID: /TET1BU0R56Lp243fcqujA==
X-CSE-MsgGUID: HsLu0ATiTMGEPCIHFzotDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153044475"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:20:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: dimich.dmb@gmail.com, kuurtb@gmail.com, 
 Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Cc: corbet@lwn.net, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250619221440.6737-1-W_Armin@gmx.de>
References: <20250619221440.6737-1-W_Armin@gmx.de>
Subject: Re: [PATCH 1/2] platform/x86: wmi: Fix WMI event enablement
Message-Id: <175095119881.2233.10447558196456889460.b4-ty@linux.intel.com>
Date: Thu, 26 Jun 2025 18:19:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 20 Jun 2025 00:14:39 +0200, Armin Wolf wrote:

> It turns out that the Windows WMI-ACPI driver always enables/disables
> WMI events regardless of whether they are marked as expensive or not.
> This finding is further reinforced when reading the documentation of
> the WMI_FUNCTION_CONTROL_CALLBACK callback used by Windows drivers
> for enabling/disabling WMI devices:
> 
> 	The DpWmiFunctionControl routine enables or disables
> 	notification of events, and enables or disables data
> 	collection for data blocks that the driver registered
> 	as expensive to collect.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: wmi: Fix WMI event enablement
      commit: cf0b812500e64a7d5e2957abed38c3a97917b34f
[2/2] platform/x86: wmi: Update documentation of WCxx/WExx ACPI methods
      commit: 50b6914fc53c718c5426fb6e9cd9484f9ae967c2

--
 i.

