Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC491E284B;
	Thu, 30 Jan 2025 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258187; cv=pass; b=Ndvu06Trs1X3gdn5qTZW+iMSbFHOn2l605+6QMd+HDwWZBI/vpiWX+JEv3IUYF2n23vL2QVZaqC3OOKBMimfDeHT7unG/yPGUTOcVMlJZPmD3MFx5hrIXdziJ9kW3AypbtzZrahJlCVFJHrABZ7YHqEyDnM2CFPCWkIwPddE6Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258187; c=relaxed/simple;
	bh=++sDyCZc/yi0yL9Y3edgcU98BfXwKTCf2/oKnn7rR3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDkVMjj3MdCIMJQQnuzLumBgsMUPMMcqXdOGB2mmOfGaGS0URovcmglfEd5XGXfz7NampjUbdus1m/R9671/kQQvPtVGbxxk9oiM3n11M3BAT1XDdMGtuXO1k4r/DVeUtB554m/26LpayaWLnRpfYWn9r/c70gjBa+AI5v7BNds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=N1b8U1vt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="N1b8U1vt"
ARC-Seal: i=1; a=rsa-sha256; t=1738258157; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K0mcm3ZZVkIa2qRv/vGsJQ793dJM9sTSGClvlhjgb7nlQiljTSYKPq2+dFb+66Lx0Fl9H+p4bM1qqz6xm4qWpBUHGXtXvmHe5y2m32zu7xY0Lod9gxyz/BNb0BtLmT8RFAWa55K00B+HePHoaeD2QgOt52nbnPrJyC4o8KRT7J0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738258157; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5MJd8R69SbdNulHkmKCs63pHS989RsRUWoZsRccqpIk=; 
	b=R3FgPIwWME8kzcb/kMWiplOu/72pttiwcSh91NcL6siTDq545SXDOm/woqp7ZZH1UKXXXF47gweklearZjyOhd83ytB0p3iD++ZI/J+v64VXJY0tymlkFbynRWnh18QZtHCDcrIO9m+dlR3Aip7HtIgRy4tnJyV/3ALZIX/TFng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738258157;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5MJd8R69SbdNulHkmKCs63pHS989RsRUWoZsRccqpIk=;
	b=N1b8U1vts3zaRJ7wBx9g/6YhEWhcAUo6SlGINMK4ryqPiRflSKQHpmPhIZLMdpNI
	id4aoG8htyZDl/T5pIanEpqbGYDgGxBAjLZHj3dckZZcFyRv+Iwg3Kyeq5sgNu+pklo
	pynxEqnruF+SAo42pS7mt9++i6bQ+rn9J0gT+TYM=
Received: by mx.zohomail.com with SMTPS id 1738258154340806.4685254117666;
	Thu, 30 Jan 2025 09:29:14 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v10 1/5] Documentation/gpu: Clarify format of driver-specific fidnfo keys
Date: Thu, 30 Jan 2025 17:28:09 +0000
Message-ID: <20250130172851.941597-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130172851.941597-1-adrian.larumbe@collabora.com>
References: <20250130172851.941597-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This change reflects de facto usage by amdgpu, as exemplified by commit
d6530c33a978 ("drm/amdgpu: expose more memory stats in fdinfo").

Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 Documentation/gpu/drm-usage-stats.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 2717cb2a597e..2b5393ed7692 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -21,7 +21,10 @@ File format specification
 
 - File shall contain one key value pair per one line of text.
 - Colon character (`:`) must be used to delimit keys and values.
-- All keys shall be prefixed with `drm-`.
+- All standardised keys shall be prefixed with `drm-`.
+- Driver-specific keys shall be prefixed with `driver_name-`, where
+  driver_name should ideally be the same as the `name` field in
+  `struct drm_driver`, although this is not mandatory.
 - Whitespace between the delimiter and first non-whitespace character shall be
   ignored when parsing.
 - Keys are not allowed to contain whitespace characters.
-- 
2.47.1

