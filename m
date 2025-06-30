Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E99244664;
	Mon, 30 Jun 2025 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275186; cv=none; b=EspCC6mlUoBLRgzFeNzoebx8os9v2z2VwrxX97Df7lHUIcTHczINsEQoEHnjsiBL6iUAmqkOhiVT2JbNoLhA+JfwcRIVWlpB6UxfQkVs2pLO8tLiubBxXSvjWnJs1X5dLeQK6I9mWOZeWO1PyhyxgkeWt9vtsnN3NqRrgTz354U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275186; c=relaxed/simple;
	bh=HzOC8ReOOr/Gp7Sb4wbuD5vyKncI41XqdTEB56Jw3Y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DyFfvDpKpm4TAlRsfK466qOMW7LRuilIPBIWtIXtGM0iypSG6GPU3fgU3zU3+Zbn20vYuCTLumsGOCDbZH5snBWRyeiRt0NhY/JsMceHxDunSWUlgP3KR/yqordQPQ9om949z1ZNfqCo3CwRVMXHS13qfzZ3zmsVBqwcDWN+ozw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rv8FQoEW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rv8FQoEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275185; x=1782811185;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=HzOC8ReOOr/Gp7Sb4wbuD5vyKncI41XqdTEB56Jw3Y0=;
  b=Rv8FQoEW95gOuW8aqbEna2CL+30pukPBolGRDedIPgV/s09fCrpOgvEW
   /wA9jmOiRc5tbeeQsMTY7Qomd97A5LWbNqNJcE/sH5q4Zdc0A37xbrQNa
   vRqmZCqJkA8WihTNDQYm6uTYbyw4n7eNTePQVrfJ/nylG84SDaF/lT7I7
   qGwJGrHBoa1zussRGdBd3jhlsZKZxzzO1nuACrDbScxyBeykq/CaZxBPX
   JSlPa3MCSynvvdOoi/pytSNaJv8cSsKYOXXFSvat2jS4CpR8QfERQPkER
   575MkpSkZuy5l7qg0hs5nhAyOtIRCP5+LaxyqKT3FVy5XyaU1U8sgufLa
   g==;
X-CSE-ConnectionGUID: sG/ZPK91StOKoFMFq56wFQ==
X-CSE-MsgGUID: 2wtQJRpYQ7udwK97riqSzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57300481"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="57300481"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:19:44 -0700
X-CSE-ConnectionGUID: rqR/kIFiR+CdjSPBv0dkFQ==
X-CSE-MsgGUID: uPkVVIL+QrSDjXHLO1XxXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153499264"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:19:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>, Armin Wolf <W_Armin@gmx.de>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jan Graczyk <jangraczyk@yahoo.ca>
In-Reply-To: <20250630-sysman-fix-v2-1-d185674d0a30@gmail.com>
References: <20250630-sysman-fix-v2-1-d185674d0a30@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Fix WMI data block
 retrieval in sysfs callbacks
Message-Id: <175127517470.2486.17723027460891485584.b4-ty@linux.intel.com>
Date: Mon, 30 Jun 2025 12:19:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 30 Jun 2025 00:43:12 -0300, Kurt Borja wrote:

> After retrieving WMI data blocks in sysfs callbacks, check for the
> validity of them before dereferencing their content.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-wmi-sysman: Fix WMI data block retrieval in sysfs callbacks
      commit: eb617dd25ca176f3fee24f873f0fd60010773d67

--
 i.

