Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA862D23B2;
	Fri, 13 Jun 2025 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809713; cv=none; b=TTCCN1cH0x1oi6c3Fzv4768hdXvJVe1RQoAOTK0aMEEldv4NHjUuxxGo68MZHFYws7AoBgeRDFVCAtxThrNbgWKX2+8uY+WOvRD8UxdXuHUyX94dEkB3t1LkanXNtnp6r71F3e7vXN4G/hzrLrXYzs+boxEIXkQGGP1aVq702VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809713; c=relaxed/simple;
	bh=Mmx2wiHujPu/dQ2+A7mZP3qk4H3KDRZF79BQL/Bhfx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ip4d1I7p63jRK/efvmxap2BvrLg7Ibi491loqy9VnGLLrVDjAai2AfA4/qlgRoQ7LvgN3pDpjrK9JHKSe9FkAQLuJsIBSHoZffkIJzXaOgKB/ljmaWj8e5JUbqxI8FM2Iidm6QXrUTTG+4ji6nfK2syCAkqzkq/YB5yi55pZzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pi0t6+BN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pi0t6+BN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749809712; x=1781345712;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Mmx2wiHujPu/dQ2+A7mZP3qk4H3KDRZF79BQL/Bhfx0=;
  b=Pi0t6+BN5QbZKy0c+V8aRc6gTaw3m6txMA1Me76F0L//94c16nW4v8Rp
   FUBSPCfWRuKmmk9ondUcJ9l7xJVvwFqJ4K3ZUTo6r1REj/DYXa2sAK1Ic
   isnE0ZS3mdwFKcMjnlhDUAhZyJdTxkOsATfTDlRjokUDHcZMabPB9BsXc
   0nxFl6A761IGcratxh/qBPMUm99xN+EdwyuC+V094og5GExnf9uzHGcKs
   5f+M3qiOd0+IodJWVE0AAy6Ar5SvwEVg1OTDB6fJ6n0SU28UMaWTeeA7T
   Ve4vp6k9YBxN9Neu7w8Rt7t8WmGq83+cyDA3HfhPVzJBPCK0aV+j26EHM
   A==;
X-CSE-ConnectionGUID: dY4/PBCtThyLyggm1nHXaw==
X-CSE-MsgGUID: 4qeVeGCtQ3eWG8CMORz7ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69595223"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="69595223"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:15:11 -0700
X-CSE-ConnectionGUID: fM9L2VxHQGKMqkw/wYZJbQ==
X-CSE-MsgGUID: vM/HAJK6TtecF+C6VezkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147635800"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:15:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Dell.Client.Kernel@dell.com, jithu.joseph@intel.com, 
 Armin Wolf <W_Armin@gmx.de>
Cc: hdegoede@redhat.com, corbet@lwn.net, 
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250610055526.23688-1-W_Armin@gmx.de>
References: <20250610055526.23688-1-W_Armin@gmx.de>
Subject: Re: [PATCH 1/2] Documentation: ABI: Update WMI device paths in ABI
 docs
Message-Id: <174980970219.26331.6171635150526759589.b4-ty@linux.intel.com>
Date: Fri, 13 Jun 2025 13:15:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Jun 2025 07:55:25 +0200, Armin Wolf wrote:

> The WMI driver core might append an ID to the WMI device name to avoid
> name collisions in case multiple WMI devices with the same GUID are
> present. Update all sysfs path referring to WMI devices to inform
> users about this important detail.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] Documentation: ABI: Update WMI device paths in ABI docs
      commit: c9de2e5c15cba9e9be7fd124a74b9067560d4746
[2/2] platform/x86: wmi: Fix WMI device naming issue
      commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8

--
 i.

