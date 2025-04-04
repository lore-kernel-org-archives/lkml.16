Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B9F1F0E5D;
	Fri,  4 Apr 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776734; cv=none; b=l+B7wbkcFUHu4oP9z2xAGWYBlHl2ihrZZxQla4lypKXmih8xvdgMekcT7+CBNH9tgxZqF0meUhvRdg5oxwR769qaYD9cNTFAzj0drw2IwTpySFiYUJjY1hWiGdgl+iOng5k5VcWYnpZaBM+79Ww7zTlTqgSUV+F5Z4xiol6R1+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776734; c=relaxed/simple;
	bh=QsmLFt7EjGOu0E7+wEGHOEm9tfhJmkWpMEUJ/Tk8ZGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9Qqm0i+0OG04AJN2GSgktjr85zFKOcqQotduDe7RSjNRJDP0fvxBsSGnKb7Lvib8JUgLl9e9SJaQ67m2zRHnKslk0ObOYo6JfnvlPpfsXP+2wCyYtgVg2nUXvOFaIVc0A++a36odkXoxq2XnZgahNtsCbOEX87hWqzYTmyJ77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS4lrJC9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS4lrJC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743776732; x=1775312732;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QsmLFt7EjGOu0E7+wEGHOEm9tfhJmkWpMEUJ/Tk8ZGU=;
  b=OS4lrJC9icfEyQ5fC4bFHpruIflEnfdUfHXYaUOE8Fd7sbymjMgJ1apd
   5LdyTdFHAW5dol8TRibzxre/gJQ9a2UYZWxGGKMDc3GvgDkXvQqYjn0Gq
   TItcaOukbGLtxoqU26DOlwxdrxn3dptUGH/hIKMURGgDV/E47ltdcbyGz
   krjkDSskkWhGcyog25Ub12L/xe54xkgZghxK75fVrqeXojVXmZXob62qm
   qwSKEJyDBcnKhyvlexplkEi1952jSMSqVve0cwdlnGVeLoDq4WB1SpHyO
   UwMNeXz1B+wsh1Y1C+UGraMrBOJX3Z3WUwrjx9f7wJJmq5DcsrE+ZyEXl
   A==;
X-CSE-ConnectionGUID: RergILhgSISSNhm/U868bQ==
X-CSE-MsgGUID: EsQqmavETKSTCuSQKBJMxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55851612"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55851612"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:25:32 -0700
X-CSE-ConnectionGUID: MwVuWQEIRzyk0NbW7McFAw==
X-CSE-MsgGUID: eOoob3K+Tt2XiDa9y12Gfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132035673"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 04 Apr 2025 07:25:30 -0700
Message-ID: <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
Date: Fri, 4 Apr 2025 17:26:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3.4.2025 21.02, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Just a heads-up, that connecting an LMP USB-C mini Dock [1] to the Intel Kaby Lake Dell XPS 13 9360 with
> 
>      00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller [8086:9d2f] (rev 21)
> 
> resulted in Linux 6.14.0-12966-ga2cc6ff5ec8f logging the warning and trace below.
> 
> ```
> [   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
> [   74.916241] sd 0:0:0:0: [sda] Media removed, stopped polling
> [   74.916634] sd 0:0:0:0: [sda] Attached SCSI removable disk
> [   98.803081] PM: suspend entry (deep)
> [   98.813999] Filesystems sync: 0.010 seconds
> [   98.819226] Freezing user space processes
> [  105.534176] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
> [  105.606437] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
> [  118.822270] Freezing user space processes failed after 20.003 seconds (2 tasks refusing to freeze, wq_busy=0):

Thanks for the report.

Looks like it's triggered during system suspend.

"The Set TR Deq" command that fails here is queued when
- endpoint stops to remove cancelled transfers.
- endpoint resets to clear STALL or other halt due to transfer error.
- canceling a transfer while endpoint is mid stall or tt clearing.

Looks like there are at least some gaps in verifying endpoint state in endpoint
reset handler  before queuing the "Set TR Deq" command,
this could be a possible reason.

If this case could be reproduces with xhci dynamic debug enabled it would help
narrowing down the real cause.

echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control

Thanks
Mathias
