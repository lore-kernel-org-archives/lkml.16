Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F4C1DB361;
	Thu, 17 Apr 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909224; cv=none; b=NLwe2PS655UzysniU8s6Q5X46ZJBL+/l6QKfxe18AOt3BbGaKmB3ppbw5Ke4mbMSePdvIOaVTVEpHL4U89RugTQzeV1xfqmQHz9hEs1OdH5ofMynPGOwxXCSChRPVHl+KRTtvaY1WmDIdHazwz6KZYLFMAoBGNd7SGuAuYi+1+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909224; c=relaxed/simple;
	bh=HKsSDrqiEWnS0MmjpCiVllLph0EJlntMiDVlyRHwyMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CCrm4EacRB+o2KMJ1JhCKvKXkkIzRR8MEi9yDNkR0XvGKexlXJUwBX3YMqc4SrERKnkQbGdrd+ahO0H1MxKWYgrFz1qfXloa06tQTj9qGgtvOx/6lzisbUU7hA7KejLX5y2dxXYhLxp2UQhZmGz3JMd66TFavFdl7K7ZwQSzpTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLipUy4P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLipUy4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744909223; x=1776445223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HKsSDrqiEWnS0MmjpCiVllLph0EJlntMiDVlyRHwyMw=;
  b=iLipUy4PJGNPkhV03qS84+s/hD6eFqU0qIxxxlsaH01G3X55znI3MTzp
   4FFW0IdYw9M6lVAmW9C68TPoqqSKwtJUtE388m8hdF06ioqm8ueHxQgoa
   l2fL4rA1U59S5zssYnSqYn5WO1tg31HhxJzy3izOEcDN3KyfYvifrGWHR
   qWItq715DTabUPf/YsJA91zeUzLQJLRzU1h1TiwoDk0AVoj+IUX8M2MHp
   zdW8wgBZ/g+C4hj4k+CWjTgA4Nqj1bkxiyrYLyCDy/1nmRcTKIWPeUNGg
   xKQgpep4wUhTitlt2HrgW9ujnSfPQm4E1yi8E2XgrHLD9zSMm6KD/20zb
   Q==;
X-CSE-ConnectionGUID: kiegDgfzTmGoRcu8adf8ug==
X-CSE-MsgGUID: iCTLhsyQQqCTHAv/GEfSBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57896199"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57896199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:00:23 -0700
X-CSE-ConnectionGUID: iheOcRUqS/y0oDwkEVYWfQ==
X-CSE-MsgGUID: 1YFH5QufQael+i9E3B0Pjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131411691"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2025 10:00:22 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/2] platform/x86: ISST: SST PP and TF revision 2
Date: Thu, 17 Apr 2025 10:00:09 -0700
Message-ID: <20250417170011.1243858-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SST PP and TF revison 2 support.

Srinivas Pandruvada (2):
  platform/x86: ISST: Support SST-TF revision 2
  platform/x86: ISST: Support SST-PP revision 2

 .../intel/speed_select_if/isst_tpmi_core.c    | 99 +++++++++++++++++++
 include/uapi/linux/isst_if.h                  | 26 +++++
 2 files changed, 125 insertions(+)

-- 
2.48.1

