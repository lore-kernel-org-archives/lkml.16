Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F89C382
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748640595; cv=none; b=pS59aAxxFagnES14me/dzWYnfrMIpCmiDfDNmS67TSDYBKFjHjZnsHIHa4Fy7z6qTT38n8p6a14Hx7ool9Ct8/7wI1yqMiF+8J2Ie53uvmlOkCcNad1IiPiKPOX4Vi/nQeQjsEj3qSGvgfue6moAWnuTYy9Bg3jgwY7BKBRqRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748640595; c=relaxed/simple;
	bh=qxI1nPBFXlDWYIyS/HG4wTUjFN4qu9niquR33w+8UDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCdLw5VY4hSZz6NGucp6VYh/E0CbKVwQCSmZOLJgm8XgDde/pl8J6YR1uZcGpLTJptzRdx61m6XiSNa+KPFK3swcbEySs3rl+JhYbjuoEMrTfrj+6az/zonD5KyKI62415J8Vt7lQeWDXCfR37/jR8FoG14E89pyAgbXul4zbYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpoe2aZd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpoe2aZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748640593; x=1780176593;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qxI1nPBFXlDWYIyS/HG4wTUjFN4qu9niquR33w+8UDA=;
  b=gpoe2aZdxCukEALr3y3DnNsZTSRWF3OLF22SRBi3xBrRHye4sM7rfBSG
   +933r7yXxxGgasPd4v8O+iM3KGWIyjg98buo4x3vPHeWy1FtNFt7GF7WG
   h45O3NXlzSZXsEX5EGQqxRYzQT4BivnFjhcM9yA3dQYTjhVnxQ1wzpYt4
   bJ4CAUd72bkbT18BYIpAn3NqbeGhFKGsxJRuQEe0HqLSh0QDEne/IhuCD
   h/NLr1gY0ZhaX32WGpJVqeocEG8/ioJonuSKQJ5VJZsSdgUcD1OqHwu/P
   SQnrtFRuXVjIODWKHQAAfJ+RgOA6668zaA9LI/Lw2ovuIdlMOBW9PBd5W
   A==;
X-CSE-ConnectionGUID: +uUnyqVdS66I76p3WFdvig==
X-CSE-MsgGUID: uw1n7xV1SrOSp+9g/IQtEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50622402"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50622402"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:29:42 -0700
X-CSE-ConnectionGUID: 2iHv+MqoRDG4W5BLYO86MA==
X-CSE-MsgGUID: H0fLElL3Rg+i1miU9qGqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144626145"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:29:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Date: Fri, 30 May 2025 14:29:26 -0700
Message-ID: <174864052958.2498160.13310755033812764996.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529172355.2395634-2-lucas.demarchi@intel.com>
References: <20250529172355.2395634-2-lucas.demarchi@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 29 May 2025 10:23:56 -0700, Lucas De Marchi wrote:
> The XE driver can be built with or without VSEC support, but fails to link as
> built-in if vsec is in a loadable module:
> 
> x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
> (.text+0x1e83e16): undefined reference to `intel_vsec_register'
> 
> The normal fix for this is to add a 'depends on INTEL_VSEC || !INTEL_VSEC',
> forcing XE to be a loadable module as well, but that causes a circular
> dependency:
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
      commit: e4931f8be347ec5f19df4d6d33aea37145378c42

Best regards,
-- 
Lucas De Marchi

