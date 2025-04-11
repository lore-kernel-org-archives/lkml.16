Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA257238C2A;
	Fri, 11 Apr 2025 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374253; cv=none; b=mWJG0Qlr1xZKjuTV+NWbhbhNrCg0aOizBIiQ0DuxDISTRgOlGVGrYDbXMbIVsu1tdX7n5f9iYec5j25CE4V4/4BGNxfVBAZOHl2HaEwFqS5Vi0aDHrI1SjKSN/qsRAJG8CIsQQApL/mwFCJ4StAXTUfOBw8XjTIibDGo2q8Ef30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374253; c=relaxed/simple;
	bh=TyNwYEBdWR5fqEAAEXSvx4kVPUa3di9as/9z76d8w7g=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RosLzuqwS1lDXsfBEnWRSukN40RRpywoyRxNN97lK08Q0KEgaAk6NFRMPMIvzf6KzGW2ZXsQzL4g/D5bvceDTCutmzQ41MYQy5EUsIPuYbJyuQmFBi2iSfimzezLQ/8ej+bbgJ+nIEgMeCnaSXtRY7z22dQBf4abHlUJDasbB3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN6TfLG9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN6TfLG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744374252; x=1775910252;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=TyNwYEBdWR5fqEAAEXSvx4kVPUa3di9as/9z76d8w7g=;
  b=PN6TfLG9a7wkFO3vN0YJHMNYa7m935MAgl60lqb5gwNPt7CNlwN2S4XN
   sNdAiwcuX5933izANk7Opx4Y9cQv5Q56eJxHQYNVoXipJPC4mmFNUtMIe
   zK7BmKzoPLLqHk5oofH1ZgMZAzul5HY6NCekLyJeCI6grbIbYh+IeXvRJ
   D6+svMQ5pXbuwoW8E4odo0megCq6TbEK69QMylyDeFSJ/u7RAmI+TdLR2
   pbrwNlB2sCFrDLbt8UMtwLccJ3DHBImYZ0BgpQ+WKwLwUbjpawurFWW2/
   jGidCEXDb1c5R1jjS0eEeqYeK7nrG5yNtIeungOavQwEhkdkUuUh87sfR
   g==;
X-CSE-ConnectionGUID: mWRzPJ9nTEWF4EjQQSR4TQ==
X-CSE-MsgGUID: bzw144PdSyq53GTXgV1exQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45937037"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="45937037"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:24:11 -0700
X-CSE-ConnectionGUID: ovdPSiv3SDG5YirIWwweHw==
X-CSE-MsgGUID: GFegA0xTSuCiO01vYVXoFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="133942417"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:24:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 Kenneth Chan <kenneth.t.chan@gmail.com>, Mattia Dongili <malattia@linux.it>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Herton Ronaldo Krzesinski <herton@canonical.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20250407170839.2153-1-ilpo.jarvinen@linux.intel.com>
References: <20250407170839.2153-1-ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 1/1] platform/x86: Use strscpy()/scnprintf() with
 acpi_device_name/class()
Message-Id: <174437424256.3859.4771813935553634203.b4-ty@linux.intel.com>
Date: Fri, 11 Apr 2025 15:24:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 07 Apr 2025 20:08:38 +0300, Ilpo Järvinen wrote:

> Replace strcpy() and sprintf() for acpi_device_name/class() targets
> with safer variant. In one case, scnprintf() is necessary but the
> rest can use strscpy().
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: Use strscpy()/scnprintf() with acpi_device_name/class()
      commit: 8625c4c06a79ddddcc53ead898bf721cee618e4e

--
 i.

