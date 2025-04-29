Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263C32D0266;
	Tue, 29 Apr 2025 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935976; cv=none; b=WNSE6eOpmu4v/vnyzHm7vDzmpijkyxarNi96S5RLIvYFl0w5ToeQk+OXef+J6+jolDLy7HKv6mScA5gOz5y1c/oh4zPtINYaEUkM4SbHoMPVaEaVrimPDNO2kIipgwF7MzdMTe7tk/s0lZZ2JAK+U5thsEwjW0a4VjrrhGqVetQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935976; c=relaxed/simple;
	bh=muXTm9wDVAIJJeZ9IH6+XNG5qsyEjKdvbSnaCtn+u+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o9WZKokS9/W5NhNBXadptLEDsf+Na8OoPpA5UCzhcrJ0mTIagf2Ts3h49WFiw+2LdOlym7nkIsodmr5NEh2uHlNWe4RbA6pSwZZfMiyeEXPPQKPqB6Wmzlb/oDYGjh2vsOmOJ99eF1MhYJaG1APIzq+NdHV4uZ7RQTXO5RbJ/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SsXv8qql; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsXv8qql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745935975; x=1777471975;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=muXTm9wDVAIJJeZ9IH6+XNG5qsyEjKdvbSnaCtn+u+E=;
  b=SsXv8qql2nRY7dIySq3pZmaoUWAk4cSLqckCs9/vuhWcLAzzNembuJmo
   3wzEgYjE2qEST5VwS2IVxhwEwMdpxuNKd7caVPD/7aHVLXk2AB574xqOk
   LmNiWDLxlK4kYgynoRlGqXVCgGUEXKQqFJZ1XtKcNPZWxwsdKtQQ7qQkw
   vYZNZrI8xmJZUJEqbBJPlIeDRb/S06bZ6iGu73lgpla6Kl0BoUYKtvS9g
   XWWyaR3aNyHjbS6iGiBci70KTQxKaWR+7YiPzmvLD33KXf59Q+4Sw5V4u
   2hf/SVonzq0t45VXlYUK+GcRDOoLch6y5OtCiYSseXHhBqzfjf5VCOwng
   w==;
X-CSE-ConnectionGUID: p3wqiwyZQ063Kj8xs8vebw==
X-CSE-MsgGUID: k5M4aRT7R96Z4lHBV5rsVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47470752"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47470752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:12:54 -0700
X-CSE-ConnectionGUID: 15JNqUZhSkO1H6Dyx8foKQ==
X-CSE-MsgGUID: tMznLff2RPGfRfNcxhOpWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133737329"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:12:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
 Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250425-temp-id-fix-v1-0-372d71f732bf@gmail.com>
References: <20250425-temp-id-fix-v1-0-372d71f732bf@gmail.com>
Subject: Re: [PATCH 0/2] platform/x86: alienware-wmi-wmax: Fix unitialized
 variables in awcc_hwmon_fans_init()
Message-Id: <174593596566.3233.15347989048257843102.b4-ty@linux.intel.com>
Date: Tue, 29 Apr 2025 17:12:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 25 Apr 2025 12:45:05 -0300, Kurt Borja wrote:

> These are based on the for-next branch. Thanks!
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: alienware-wmi-wmax: Fix uninitialized bitmap in awcc_hwmon_fans_init()
      commit: 8bb4c64d07c294899189a1f9a61cbef706ae91dd
[2/2] platform/x86: alienware-wmi-wmax: Fix awcc_hwmon_fans_init() label logic
      commit: af6e2f91cc534e8ec1afdb458cf6efd4064f394d

--
 i.

