Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258E28137D;
	Mon,  9 Jun 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749455603; cv=none; b=Wu1nGjnd8luOPjgyPkiFBbz4D3ij5VC82WH+O7KTiIMBCdtMHv9PrpreE/nAqxzdqb8a9srshSmKh8DeOV6DH4G6aVUf+mPU/dyWG0Jd0bb1K2C9uXrXlDm2de5pf7s7HvmFvuQHC1bSOZp3xIOozqngAfQrfk8isMOs3V0BEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749455603; c=relaxed/simple;
	bh=7LijH0SPeNUjBldUSejfieceyNximr4tVLZLdK910TQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UgmpaqMhbWtxn6JmaohvteLXPxRx9nv0PFgy/gM2tfzHxwjTWQsr861paXvj7RNf6sWtvh/h4VCNcGycQPdl/MKUfb5zUR24Nx7+gtSzHUMr6bY9ANG8eeVcf6Si8m1nzEtF/GBqseduucIpK8QE/SV7LykxoKD4rDryZbNjmDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2BKJTZb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2BKJTZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749455603; x=1780991603;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7LijH0SPeNUjBldUSejfieceyNximr4tVLZLdK910TQ=;
  b=F2BKJTZbmpuqEgU+CuzTBdRVw3vRLu/pNreVrRTPxe6lCRzPctI9YR2v
   EATzKa7+iorYmGasEmvwcZB6v6b0XvJ7oUdytn78DYR4G9YnU6wih7lRg
   anpjPfHg1iFuEvDva9EiWqEQpWr9P5I2I8FmPGI60Q0xLw2C0kB+mmG0D
   PjkmmmyNPIjGSqOsbFFZidXPJHGvgd/B0XKH+3+gDX6lNYWZVliEbifDq
   gqRYKLZ4k7lnSTqxIELJqAYU/58c9n88ppCrCkaz+PcZkePDi4wjR207y
   kYCYVMOPW4tIvtk5CazBZHw+9uDfV+IZYXDVr1H/hQa0i0eNWdvrsG6PG
   Q==;
X-CSE-ConnectionGUID: XhjlAaf0TdOI+c1USvIuiQ==
X-CSE-MsgGUID: GYXUIw9gSCanbAjXxhCYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="68973433"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="68973433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:53:22 -0700
X-CSE-ConnectionGUID: 9Gi5XOEeRO61pud+b9myAQ==
X-CSE-MsgGUID: Jy9aPLFdSjic6eJM+WAapw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146325004"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 00:53:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Jake Hillion <jake@hillion.co.uk>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sched-ext@meta.com, Blaise Sanouillet <linux@blaise.sanouillet.com>, 
 Suma Hegde <suma.hegde@amd.com>
In-Reply-To: <20250605-amd-hsmp-v2-0-a811bc3dd74a@hillion.co.uk>
References: <20250605-amd-hsmp-v2-0-a811bc3dd74a@hillion.co.uk>
Subject: Re: [PATCH v2 0/2] x86/platform/amd: better handle scheduling
 delays in hsmp_send_message
Message-Id: <174945559319.2685.13353516764058471154.b4-ty@linux.intel.com>
Date: Mon, 09 Jun 2025 10:53:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 05 Jun 2025 19:09:25 +0100, Jake Hillion wrote:

> hsmp_send_message currently relies in 2 places on the assumption that
> usleep_range will complete in well under 100ms. This is not guaranteed,
> and is prevalent when running sched_ext schedulers or possible under
> other high load conditions.
> 
> These patches alter the behaviour in two ways:
> 1. Checks the result of `mbox_status` a final time if the sleep took us
>    past the timeout. This gives a useful result under test when there
>    are significant scheduling delays, rather than -ETIMEDOUT.
> 2. Removes the 100ms limit on awaiting the semaphore. This allows a
>    second thread to compete even when the other suffers large scheduling
>    delays.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] x86/platform/amd: move final timeout check to after final sleep
      commit: f8afb12a2d7503de6558c23cacd7acbf6e9fe678
[2/2] x86/platform/amd: replace down_timeout with down_interruptible
      commit: 784e48a82976ee0b645788750343cd1b28a372f3

--
 i.

