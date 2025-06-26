Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99BC20127B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958450; cv=none; b=n6Y0HIKCW5yhINY2f048s9bkt5aMTy9nACYNh0iPRq/+GASq98N+4Ra3AedcHvYxxJJTfrW2xu+1ky4oVLZSVca+sIX++f4XZZ8VAve7k/i79ROII08GN9GQjtWfqu4Q3d0EAA5hL6JjUduClbzrvrTyEU3TR+u57QIntJQcWVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958450; c=relaxed/simple;
	bh=ZpNp5uX6l3WWkoGDqP3OscDyl3hsSvOk7NW5Lh2rF0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAOShSwp9RJVC2HBeDSx1HaL2KiJ8TWLLB0Sg00idnsWWbQRBfzKa2jLk9yJtMJfdKihX5+KgEyErvMs+3u+L80GU7Cts4AVOy9bpUcV0ClHSOiTM/o751WEq3Piwqz/VnnbUZyZLKkJKSF7zhbt+ZZHBr+olIU2Q9yTpTfy6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibB5ft1Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibB5ft1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750958449; x=1782494449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZpNp5uX6l3WWkoGDqP3OscDyl3hsSvOk7NW5Lh2rF0o=;
  b=ibB5ft1ZQr8yV+/lBO9RnU+6LIxAGnSI+fG5M2Fyfkmwy7QNEyuz9cTk
   eDEPj+KFdBYVif8GE643/6dNK4cwcT8Z4LixRhFUXNYtVvKmzWrJ2AlIc
   Hh2jAuJvSWMS2ef4bV8eaQIyE4iB2tQ3bv+L2LbsZhTP8qqrm8IvPQH5S
   X53mykqpgarOO2AqMTdT3dlSxjxURUC6GqWByM9QtBaPYMtAbbMGwzfBE
   jaPn6L4d67S1FnCVuDX732f9JaqA8WFjOcwcKEZjVvkpj2nwB8hkw38TS
   Q2Ry5ImvfN60UbeTcPJBKTTbQxy7WRL2zd+YS1+idn9SEiL7qjnoABSp6
   Q==;
X-CSE-ConnectionGUID: K2AcM8srS2SfIPPATMYoyA==
X-CSE-MsgGUID: AHPY9FtSSXeb3mZGprvhbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="55890565"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="55890565"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 10:20:45 -0700
X-CSE-ConnectionGUID: zTdBtQl1QSq6zkriSZQ7Ug==
X-CSE-MsgGUID: IvA14ZQtTJKROHO9fA7caw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="158068524"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2025 10:20:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 382632AD; Thu, 26 Jun 2025 20:20:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] firmware: sysfb: Unorphan and fix header
Date: Thu, 26 Jun 2025 20:18:59 +0300
Message-ID: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears that sysfb files became orphaned, reverse that to make
the changes visible for the maintainers. Second patch just to drop
kernel.h which is not supposed to be included (in the headers).

Andy Shevchenko (2):
  firmware: sysfb: Unorphan sysfb files
  firmware: sysfb: Don't use "proxy" headers

 MAINTAINERS           | 2 ++
 include/linux/sysfb.h | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.47.2

