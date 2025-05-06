Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FE1DE3BA;
	Tue,  6 May 2025 12:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536018; cv=none; b=AhOgWZBW+Oy8KahrOmdiPXdwVKJf2E/y3LemTt1ydGKMDn6gE5mUL4ar904el13iUy932FM9l+MdHyV9VJ/ynRSRlOFHghNeQTY0JkNXdyfmsKW6w9554dirlqcbUbb478AowSoikkq2DNGIiz65hkMV1YwcBJmXX2aX3UuXOUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536018; c=relaxed/simple;
	bh=h1EIhCd6bHwvSuMXNvXaDji7JQ4YOhT9xPXJbh87Hgo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SufaI6606SpNtWQjsIxpDTxmk4Gf8ILwjDVy29eKjAUQ40KSPxeFapoNPgWpxG4RONZV3/IN8SRqTy27B2lZS6OEuyb9kfzoThpnoGTwE8CQWiFXbEQ6ELI/WUV6QBVQ8RIdPu9ypl1gJUubpPzkEo91oE2KBcohrQLE7IhRqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qhij4n9h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qhij4n9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746536017; x=1778072017;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=h1EIhCd6bHwvSuMXNvXaDji7JQ4YOhT9xPXJbh87Hgo=;
  b=Qhij4n9h3U/JpauQ747UNnyHoedmWcFw+5sXLWfLA0y/yXHQXfLBtK8Y
   eoZF2mBArFPEBmeulzx9hyFrRfw0RVrwYnzKb4jiNtbjabW7kIyc8Uc0k
   L4CGb6olFs+4AmBbGORyZLQpGzBHxjo2dOcknuydIDd1EFAsri7aKvHCQ
   hrcuDv6ARr5qc7/fk9lvoTC8M2x1yzUNyRH4WwQckksYtpLbzpWSUpZRc
   FyGIeHFl6f2/ht+mFfwmLiNbi6dFdFIwo3H3R9MiA4TqPl76hRBbD4wtJ
   V7lf1cN3onlaWhDf+cwmHaw19m/VnDXNCzm4woccLMfjQneB6v748lP3D
   Q==;
X-CSE-ConnectionGUID: RMLvY30rTmyZb6mfWhLWug==
X-CSE-MsgGUID: pfteo7WGRl+K87PD7s1MNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58831468"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="58831468"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:53:36 -0700
X-CSE-ConnectionGUID: gwoTogEsQaeVjiHisKeAJw==
X-CSE-MsgGUID: 75itBPkyQfW0sHCBlXMiig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="140730700"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.207])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:53:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 May 2025 15:53:28 +0300 (EEST)
To: Ilya K <me@0upti.me>
cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <9061d5a7-c1f6-47ad-b60a-226e48021d62@0upti.me>
Message-ID: <21c9d764-4945-4837-93dc-ab58f22f8668@linux.intel.com>
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com> <9061d5a7-c1f6-47ad-b60a-226e48021d62@0upti.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 May 2025, Ilya K wrote:

> > +#define AMDISP_OV05C10_I2C_ADDR		0x10
> > +#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
> > +#define AMDISP_OV05C10_HID		"OMNI5C10"
> > +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> > +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
> 
> Hey folks, I know v12 might be a bit too late for this one, but I've got 
> another device here (Asus GZ302EA tablet) with a very similar camera 
> setup, but a different sensor (OV13B10), and it looks like this driver 
> just assumes a certain hardcoded configuration... I wonder if it makes 
> sense to reorganize the code so that more sensor configurations can be 
> added without making a separate module? I'd be happy to help with 
> refactoring/testing/etc, if people are interested.

v12 is not too late, and besides, v9..v12 has happened within 5 days 
which is rather short time (hint to the submitter that there's no need 
to burn patch series version numbers at that speed :-)).

I'll give folks some time to sort this out if you need to add e.g., some 
driver_data instead.

-- 
 i.

