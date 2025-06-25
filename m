Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1512725A337;
	Wed, 25 Jun 2025 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856613; cv=none; b=JQ23E/FILDA9300KJosvdxdPh7eAxkM63GZ0uqir5idb2cud571kyGGsoHyO+A59KTAhWk1NlKKLML60TwrcB85c5KT44TuPHFgT+/5HV79odkAYFutPeuTn/OvSNdNr7268lVOnIO+BXb4MCh4D7OcsKr1J6qKn+wtRJhDpWt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856613; c=relaxed/simple;
	bh=zJUtDDXZZsNgnHWXi945NdyeR509h7c3lPJubouFxcc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mN99lk/es61OBd95JIVNW5f8VzkHTjN16Qm1OnDqT2Bzq8Zw7ry97C+fLM7luXbZiP3B5t6XF+PqbRGltuiksjT87PvcGKnoMwmarz497hDWHH43WSuHeE60E2KIohYCwexIRMonfOQqjC8PJFoAM35RXuSFB5Sf/2W/mtP3/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jk5bwxxn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jk5bwxxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750856612; x=1782392612;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=zJUtDDXZZsNgnHWXi945NdyeR509h7c3lPJubouFxcc=;
  b=Jk5bwxxn94mudCy+ERzINrsupHW6af23tl9NMrfZSRvvRYGsL3KlL6jy
   qGAuySWtf1i7Jd/HQFCsnfBKQmOmvWw6FPP8w22s4HrE9aKah2Ra0AMI4
   sN2GBBx4mmj8KjdmbjzfmKhaq/nkMayOlrSjahdKJTPHYBGerFMHomrV5
   LkjooLZWO/l3rawHs8KLtOUev1KJiHHNAdmiKegjmqc2T5gxDU47DWUf7
   +t23usl0W5rSITed6rkgnyum4XoAJJb2PgCUIK0x7QDYhDHD4vIVCa/lL
   +Oly3DzV/ewRsMh5/JTGKm8e0NRZO/WR3fk0E/yBdlQJF9xZIL56ypm9Y
   w==;
X-CSE-ConnectionGUID: MJSgloBcQ+qONk3+R6OcTw==
X-CSE-MsgGUID: V51Q8rk7QeeLc9vtQkP4Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56909532"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56909532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:32 -0700
X-CSE-ConnectionGUID: ZPQSt1bsQhC9r0sar1c0WQ==
X-CSE-MsgGUID: YS/irz4ISkCMrptFHrQ8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152922531"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:03:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250622080721.4661-1-pmenzel@molgen.mpg.de>
References: <20250622080721.4661-1-pmenzel@molgen.mpg.de>
Subject: Re: [PATCH] platform/x86: dell-lis3lv02d: Add Latitude 5500
Message-Id: <175085660320.8098.14462069839144981994.b4-ty@linux.intel.com>
Date: Wed, 25 Jun 2025 16:03:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 22 Jun 2025 10:07:20 +0200, Paul Menzel wrote:

> Add 0x29 as the accelerometer address for the Dell Latitude 5500 to
> lis3lv02d_devices[].
> 
> The address was verified as below:
> 
>     $ cd /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4
>     $ ls -d i2c-?
>     i2c-2
>     $ sudo modprobe i2c-dev
>     $ sudo i2cdetect 2
>     WARNING! This program can confuse your I2C bus, cause data loss and worse!
>     I will probe file /dev/i2c-2.
>     I will probe address range 0x08-0x77.
>     Continue? [Y/n] Y
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         08 -- -- -- -- -- -- --
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
>     30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
>     40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
>     50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     70: -- -- -- -- -- -- -- --
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-2/new_device
>     lis3lv02d 0x29
>     $ sudo dmesg
>     [    0.000000] Linux version 6.12.32-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC Debian 6.12.32-1 (2025-06-07)
>     […]
>     [    0.000000] DMI: Dell Inc. Latitude 5500/0M14W7, BIOS 1.38.0 03/06/2025
>     […]
>     [  609.063488] i2c_dev: i2c /dev entries driver
>     [  639.135020] i2c i2c-2: new_device: Instantiated device lis3lv02d at 0x29
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-lis3lv02d: Add Latitude 5500
      commit: d0f8ee81a8fe63cd29d01b905eead72b88326ef2

--
 i.

