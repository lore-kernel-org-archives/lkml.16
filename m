Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB132AD14;
	Mon,  9 Jun 2025 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463454; cv=none; b=jmTF9c24+/6q9eEDvV4etX4W5Yt4C6IfRfMiJi87Q/WcTJ6//XOJ9rg3PapvoxuJxfeRBD35FmpHsuD36SWjNZgNzM9deWlKNBicoJVuXgHHijFQZ2K0Pcfhjkt4GnVrizbxwkwKKgJlFu+hyPUSKejq95j8WOb4LJFD8WKnZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463454; c=relaxed/simple;
	bh=DcfWQ8WuvoWVvzXXacl9MwOIK9utEJa2GkFgOn13qmc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gHt5AmHDllgptwckwB4E0HbYQWBf14npaOR8TbkbN0AmlmGuLEpovgodTmqpoVcI+Grttqd9akaA5SjLeU7yzjWNZ6FXfc0MKG+BBi2G5u9z4lSkqoU1XJsAulKUpddy3wFBE0KYu8U75E0sXMofSq9EbwKqBXSrq1DQLzM/8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXRwmf8t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXRwmf8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749463453; x=1780999453;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=DcfWQ8WuvoWVvzXXacl9MwOIK9utEJa2GkFgOn13qmc=;
  b=ZXRwmf8tduV+DhnM0T2TWz9KBoYjZGb0QxHtrZCGygFqg7cub8RuKUPF
   xNzD0k+5upcvZemZnFMsOhhdELo6lF+5SxD4bElMJ7SemlqYOWnpfi9Zo
   uS06xGMTooOTQ+aZVwX4UYPGvhuWVsOOkt8VahTgK3LLdn7NCBhSDIaZI
   WegqS+7VPyTfkv7uEI8Z7K5cKUndCJ0o01o4Qw4PTR4UWG34eK09IxV5z
   dovkYTvqd+/8k9zJzClsDfKJbP5m/NEYFQvHob0Y6UdoaoJh0D7xqgYlN
   VdEVPv3z22itd2vLjHEeZ4VO3yCW6T3cgZRgCN4NB9ck8JLBANGe6MQax
   A==;
X-CSE-ConnectionGUID: NGThPRKlT9G/zPstLYhOlg==
X-CSE-MsgGUID: TlTE/X8pQYyRJsYESXK0yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51529367"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51529367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:04:12 -0700
X-CSE-ConnectionGUID: OuM8fpN9Q8qe0hKoJeYK3w==
X-CSE-MsgGUID: Nio30dmvTSSI4WPEY3434A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="177406069"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 03:04:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250528-awcc-labels-v1-1-6aa39d8e4c3d@gmail.com>
References: <20250528-awcc-labels-v1-1-6aa39d8e4c3d@gmail.com>
Subject: Re: [PATCH] platform/x86: alienware-wmi-wmax: Add appropriate
 labels to fans
Message-Id: <174946344463.3675.6845474867091457192.b4-ty@linux.intel.com>
Date: Mon, 09 Jun 2025 13:04:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 28 May 2025 07:47:22 -0300, Kurt Borja wrote:

> Add known fan type IDs and match them to an appropriate label in
> awcc_hwmon_read_string().
> 
> Additionally, add the AWCC_TEMP_SENSOR_FRONT type, which was inferred
> from it's related fan type in supported systems.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: alienware-wmi-wmax: Add appropriate labels to fans
      commit: 844d8e4c7f9a3eeb681493f12c55de0392510fe3

--
 i.

