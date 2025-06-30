Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E4F23F27B;
	Mon, 30 Jun 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275196; cv=none; b=dRLKD597abOyfXaJ7rd5rbesN9eckxuKCclLIZvQHlFPiMG+hD7dKa3cdJthcNMPX35+NFmVr24hGG+O7MS0mG+dwzkLTFuSRc2lBYCTzLOADI8O3J6Z54uNyq6+yo7p5btBPgL9fbjyKNqnvISVsIet3bQ72vUVBURMqHo4vCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275196; c=relaxed/simple;
	bh=OYn3aetuqBdYt+o51dvofYHK8kaRrWeuKWjm5NLIGtE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lwoFIHvySqmZ4Ng1nB3bA3Saj0aOOBv6Ehz22wkHVXpEGSvxbkZeHyevYTe/MP8kzge0EqA4mh7ftvhXFX2vlcMet13qxiXlBtjrGFzvm3fQsG+dyuAWL+X5u0yuAz/sxbU23V1mtDzhoKdsWsfpg/tAMdpADD3uI0h8mcAs2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2cdAJXy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2cdAJXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275195; x=1782811195;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=OYn3aetuqBdYt+o51dvofYHK8kaRrWeuKWjm5NLIGtE=;
  b=T2cdAJXy4/VVTSRu6jMSv71ngHB8sSqyN7lEzrGPrTqLSKNIkUvMnDgG
   esHL8+DlgMCQ6YvsHj7dVhUq346xSpEBvKbuTsZj2Yu1xx5tFzUBZAm9L
   QNEr9NaOG8A1nJOE08hXOW5a1LBWun6sWHYfHuTHyWk9hsfmeCaytwcja
   0nqks1jdiP/AYUiZ6sCDMTKlv9lXqIqOOW6RSGPqnfEkvrwj1qisOdghh
   MwhMz5gz1t8gcnPVrc4dYYZNSrILg5sZf1xSfZsmnLKsOKQ8ynwpFHUih
   jDiIZ7KMPM+u1nuh0Gs2se93yovXHGX1dFvnUnfuCZq+/jtrfcMCi1RSS
   w==;
X-CSE-ConnectionGUID: K5fny7UPR4yN9W11W7vlFA==
X-CSE-MsgGUID: mS8bE1hASoiWG9EyguFZSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53434214"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53434214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:19:54 -0700
X-CSE-ConnectionGUID: TGY92SIhSgyzJEcPCa/WIA==
X-CSE-MsgGUID: AfZcAwREQiCMfEdyrYaicg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="190579716"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:19:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: W_Armin@gmx.de, mario.limonciello@amd.com, 
 Hans de Goede <hansg@kernel.org>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com, 
 king.li@amd.com, Dominic.Antony@amd.com, Phil.Jawich@amd.com
In-Reply-To: <20250618202958.3934822-1-pratap.nirujogi@amd.com>
References: <20250618202958.3934822-1-pratap.nirujogi@amd.com>
Subject: Re: [PATCH] platform/x86: Update swnode graph for amd isp4
Message-Id: <175127518473.2486.7831984908188662697.b4-ty@linux.intel.com>
Date: Mon, 30 Jun 2025 12:19:44 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 18 Jun 2025 16:29:48 -0400, Pratap Nirujogi wrote:

> Existing swnode graph format is specific to sensor device
> and is causing conflicts when accessing standard property
> variables outside the sensor driver.
> 
> To address this issue, enhanced swnode graph format with
> dedicated nodes for i2c and isp devices, with sensor node
> added as child to i2c node. This approach allows to have
> standard property variables (ex: 'clock-frequency') with
> values applicable for each of the devices (sensor, i2c and
> isp).
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: Update swnode graph for amd isp4
      commit: e1af6f0146d64fc4fb142504ba128a97cd171558

--
 i.

