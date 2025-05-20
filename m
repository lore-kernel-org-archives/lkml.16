Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A7C1E50B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763243; cv=pass; b=aoOTMTOzIBqW8+D3dadoRUaYCXOVx7d4Omu9aBE2uG1t0qdsAiLFJwy8XmQMgyekb+NJOph00H7hEk8Q7tIrnNUZt3XT5NFGjf0/QC/0ZQkQ42Kfoj958F1sf3qt1r4yx1FmeoUGN95EjVfLpr+4PZExopqaMDgXsVHrw74Yf+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763243; c=relaxed/simple;
	bh=7jb5P1TkIiuGMORBVcqbS+9IpmHDED1+cmSvydiMJCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FNBj5SZsphQUR+bYwWCtTCiQSBc5dAinR0DcTzPbcK9dOOzTKiF46OoAj8FskOcNUVKDKsYbesuwUGi6eOa+L/mlS1K9jeykmZtkpV87AfOgGmgf/iliuDaxwZpe2eTV6hBByleKbWGJtG7OJmWv6CqRAESdeKcTIJnpNqvyu+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=X/76UiXD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="X/76UiXD"
ARC-Seal: i=1; a=rsa-sha256; t=1747763231; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g2ZgPRe4cmwfprE1HFXQDwWM8b4dswdWxsh4WHpAc0CJRtEvE491IC1hHfOaXUdIpoRos0ev5r0oRShCAZqmBkXLRxQD62Hv5pPG7XL937NCWVmDFz5rM5B67IZiD8WrJ2+f88HY4S2QJmMAZnAJp+k5gL4QIvGj9PcSCEE8yDw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747763231; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aDQ6SrXga+RCXednZeIiLfUktB4Ek6GiCF/l39MvB0s=; 
	b=hVo+c2BpqyBR5Mo3SdYfFm1miWFHzIt8oKM4fT3VrA9Z1QJ2+HXcAlLeiAH5qXHX68cPwuZdV4BPT3MQ0wX8XIbDxpNo00DbNEfdKqpy6xT4WpPo1hgYw3j8EbmG/aLUrBcc5QaOPsm095d6xWnDjSlYTasRjC093STaZ7N4/W8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747763231;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aDQ6SrXga+RCXednZeIiLfUktB4Ek6GiCF/l39MvB0s=;
	b=X/76UiXDYv1i0WAvYAixIIAeq+Wk5j3M8Lr0nbmSjpDFH/SnWFYnbW7DfrkvrwlB
	TkHNjTeDS1Z4und6Kk2zi6zjPT2Ex7cCgj5B7PhwGWmE5vI0CcnoW2drddZHYBPo0Qv
	8S3g8S5SwmxAf9D3gvL5GQ6lLaO66yMgOuB8Slp4=
Received: by mx.zohomail.com with SMTPS id 1747763230355850.4262977073449;
	Tue, 20 May 2025 10:47:10 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v3 0/5] Panfrost BO tagging and GEMS debug display
Date: Tue, 20 May 2025 18:43:57 +0100
Message-ID: <20250520174634.353267-1-adrian.larumbe@collabora.com>
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

The differences are minimal. In this latest revision, the notion of internal BOs, akin to
that of Panthor kernel-only BO's has been introduced, so that the perfcnt sample buffer and
imported PRIME objects can be given a tag.

The under-discussion Mesa MR that would allow one to test these changes can be found at [2].

The way BO flags is printed is also slightly different.

Changelog:

v3:
 - Fixed spelling of Panfrost device pointer variable names
 - Fixed invalid memory access bug when freeing Panfrost GEM objects for PRIME imported buffers
 - Added function for internally tagging BOs (mainly for the perfcnt sample buffer)
 - Added new commit for fixing Panfrost Device variable spelling mistakes.
v2:
 - Introduced u64_to_user_ptr() for casting user pointers
 - Refined documentation for uAPI bo labelling struct fields
 - Moved panfrost device debugfs struct fields into a single debugfs struct
 - Add BO to debugfs GEMs list right before creating its handle to avoid unnecessary initialised field.

[1] https://lore.kernel.org/dri-devel/20250507160713.1363985-1-adrian.larumbe@collabora.com/
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34224

Adrián Larumbe (5):
  drm/panfrost: Add BO labelling to Panfrost
  drm/panfrost: Internally label some BOs
  drm/panfrost: Add driver IOCTL for setting BO labels
  drm/panfrost: show device-wide list of DRM GEM objects over DebugFS
  drm/panfrost: Fix panfrost device variable name in devfreq

 drivers/gpu/drm/panfrost/panfrost_devfreq.c |   4 +-
 drivers/gpu/drm/panfrost/panfrost_device.c  |   5 +
 drivers/gpu/drm/panfrost/panfrost_device.h  |  15 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c     |  79 ++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.c     | 186 ++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h     |  66 +++++++
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |   2 +
 include/uapi/drm/panfrost_drm.h             |  21 +++
 8 files changed, 375 insertions(+), 3 deletions(-)


base-commit: 9ff4fdf4f44b69237c0afc1d3a8dac916ce66f3e
--
2.48.1
