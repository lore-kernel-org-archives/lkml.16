Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1A1F8728;
	Tue, 27 May 2025 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325419; cv=none; b=N1pq55qtxjsw/Lq8nZ4AzTW0+cOE5nhh2qjgU9GU18bPkoiyITp4Mo6eRP89cHH85zirCoS943I81jGRaIWoIDuMKV71YM8gDTknF7L2jCuhoXji9h9GjLrRXQyHb0u0Dg4JVvbNDgi9ZjeDeqDnvJRAiZYx1QNvwMo2fJHfzvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325419; c=relaxed/simple;
	bh=+RtpvvQG0Z4gu30qZOPGTB+igEKhZe/d02FiLwh3jXE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kFXUqE8s9vP/V3iOaVxiL9rIYgEw3n91XjZdQ6IvpwyIHj1W4oXW8u6BWuwiowmyRPn8t4BkNsgiPdWHqFsbZWlyBJncEN9I2w0mJF3MFN4xhZpJjtRxHnvhK3SWHt6nOC8w66hJvAyLizDfXL/KrTYd5iUG+q0KkK4lhzWAX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nyz1H7T/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nyz1H7T/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748325418; x=1779861418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+RtpvvQG0Z4gu30qZOPGTB+igEKhZe/d02FiLwh3jXE=;
  b=Nyz1H7T/5rFW2kiIoQ/OJW1UPTaGoaBRhp21tE36nA9sKqan++gH8qi2
   mAsSmynb4comrDL6sJizM7fNuM8Aut1qb+xylQ+1pgPZhnyjY7ga+dXwh
   Q0y2wxu6OCXwn1O/0yYXv+ybltYhM2YggEom29+F+AVEwirbLPxxMM6v0
   oR6nN+C2MXZkpPX9ujf2GW/+wgycALOt45mHtNQmRkAVYfC7J2+HqZNaL
   SHJzxkBrhi6VlquAOa2YmCuPqBQmtaTtuBv9e7zMWaSHTx11UbQLSIZsW
   A25FjfWGwHU+VL0DB6NsRvmDVMLIwGo8NsVYR4FwX3779Q9DWrzWALHh9
   A==;
X-CSE-ConnectionGUID: NFZh2/zoQVKpUeprbAvGgw==
X-CSE-MsgGUID: RxbZNT1xQyWstVjkMYo33Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="67710404"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="67710404"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:55 -0700
X-CSE-ConnectionGUID: +N8qHD+CQ0yJjz2EEMcQ7g==
X-CSE-MsgGUID: zoGlzFi2TAuRW45V3nEVnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147919445"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 22:56:51 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 578521202B1;
	Tue, 27 May 2025 08:56:47 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uJnIu-00275S-31;
	Tue, 27 May 2025 08:56:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Akshay Gupta <akshay.gupta@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 0/3] Document Media Controller IOCTL number assignments
Date: Tue, 27 May 2025 08:56:45 +0300
Message-Id: <20250527055648.503884-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

The Media Controller uses IOCTL numbers with '|' type up to 0x81 but the
range from 0x80 upwards is documented to belong to samples. The samples,
however, are currently using these values. Solve the problem by bumping
the top of the MC range and the samples allocation by 0x10 as the samples
don't require a stable IOCTL interface.

since v1:

- Improved the commit message in the first patch.

- Added a patch to change the IOCTLs also in the Rust sample.

Sakari Ailus (3):
  Documentation: Bump media IOCTL reserved numbers
  media: uapi: Document IOCTL number assignment
  samples: rust_misc_device: Bump IOCTL numbers

 Documentation/userspace-api/ioctl/ioctl-number.rst |  4 ++--
 include/uapi/linux/media.h                         |  4 ++++
 samples/rust/rust_misc_device.rs                   | 14 +++++++-------
 3 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.39.5

