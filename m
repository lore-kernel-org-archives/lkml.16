Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF2190057
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634059; cv=pass; b=aETzWGBvHg9UEkZeK7OEy//47nsYeMtRQYfSBTJ0PFg8zxygEKZkhJ7sjZuCBAxDlYTG8u3/ByPcwMeBhLgosvsXpN0efAgQ2vMQv3qFOveA2nvnHUp8qinv+36wtpK60V9Rru8FBCasoMV6vGQ0s/SCQ1AULQ9HXdoss/3kKX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634059; c=relaxed/simple;
	bh=7ts3bxrYGRPbYK5wTIlLkFx/VG+olIfNIbyiemUeoTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jQBWiyWz8/9zjYx/VCH+FgBh84TjxllSf/l5Kug2ZGExm6AbMkjPqy49UawRy+QuJtiBtjA8EJWdIy51Esc20Ev5dfzrJa1ePyhVAjqwwcJYDa8mOn7suUP0t6vtG1kkdUOAMTzBH7OZzOnloPqdbN3aYxb4UrXbPyWPLeF13YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=FaY7K9cT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FaY7K9cT"
ARC-Seal: i=1; a=rsa-sha256; t=1746634047; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iHffJ0Y8NXLOAsVbasAzSVQyUPsYvAUbIb43vbddJ6IqU9RaJwA7XKQiXZCsABwkNUmbI/GaeZL38z5Qv53S09HnlAgPJkh7cZ8SVF4uMeJzLFgHaeUI3bwxM3E0SkGb4GGEk4kMCDON3F9ZPuAYSeMpQ3CPibJdDmlww06UVnA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746634047; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VeRE1rp1b8jt+wF2JI9iIDDmMtQzt2VYCRyF+iv1Lus=; 
	b=kLOCY0zyuRpiFcEaI/38vps1D0p+9k6mdLe8z0Y37hqpbdJoDJA37LTOBRvjSX8n3yfs4Qgc4/LhAPACN7bqjCWlA+dSLyHn0zN+uo8ekoDefbcIG+/XYa9RDmt2ORSOWEvXl721zTrOCtqEQQlfwZqBrOrQ0tc5vi4uOOSXJrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746634047;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VeRE1rp1b8jt+wF2JI9iIDDmMtQzt2VYCRyF+iv1Lus=;
	b=FaY7K9cTMVorWJI5AoI5RT+px+vVl1V2dLm9PAv1rB8re2M56p52UOZJVx2q81Wm
	YSLhAsk+nyvR5OOhn3wt9bjDnEUqFfFEhoVfwb/rcOZI7Oa0+bfkdyTux2/NMZJSD4l
	As3E9QeQ4VmggllqMY3AJZoEa15Vci/iIDhhfu/A=
Received: by mx.zohomail.com with SMTPS id 1746634044996726.9956872972689;
	Wed, 7 May 2025 09:07:24 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v2 0/3] Panfrost BO tagging and GEMS debug display
Date: Wed,  7 May 2025 17:07:06 +0100
Message-ID: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is a Panfrost port of the already merged patches
previously discussed at [1].

The differences are minimal. However, Panfrost doesn't have Kernel-only BO's, so all the
functionality that dealt with them has been removed.

The under-discussion Mesa MR that would allow one to test these changes can be found at [2].

The way BO flags is printed is also slightly different.

Discussion of previous version in the series can be found at [3]

Changelog:

v2:
 - Introduced u64_to_user_ptr() for casting user pointers
 - Refined documentation for uAPI bo labelling struct fields
 - Moved panfrost device debugfs struct fields into a single debugfs struct
 - Add BO to debugfs GEMs list right before creating its handle to avoid unnecessary initialised field.

[1] https://lore.kernel.org/dri-devel/20250418022710.74749-1-adrian.larumbe@collabora.com/
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224
[3] https://lore.kernel.org/dri-devel/20250424022138.709303-1-adrian.larumbe@collabora.com/T/#t

Adrián Larumbe (3):
  drm/panfrost: Add BO labelling to Panfrost
  drm/panfrost: Add driver IOCTL for setting BO labels
  drm/panfrost: show device-wide list of DRM GEM objects over DebugFS

 drivers/gpu/drm/panfrost/panfrost_device.c |   5 +
 drivers/gpu/drm/panfrost/panfrost_device.h |  15 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  79 ++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 154 +++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |  65 +++++++++
 include/uapi/drm/panfrost_drm.h            |  21 +++
 6 files changed, 338 insertions(+), 1 deletion(-)


base-commit: 9ff4fdf4f44b69237c0afc1d3a8dac916ce66f3e
--
2.48.1
