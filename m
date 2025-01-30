Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E61EEA38;
	Thu, 30 Jan 2025 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258195; cv=pass; b=SFSRlIfJWFxK6sdpjykF2+8nWOUJFfvceV1ek7IeOUz+QFvIji4butaCUevUYHWLvrSzFMuU+rPfwL8JkXEe+zcch9EMzmNMBGF5/F1OX5fL/pupInL19W6c4AGC5rcuEFj3E2YXTfdQX2WFifAtqmenIc3t5JKo6UqSgrdfsYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258195; c=relaxed/simple;
	bh=+ytlbxanqKXQoq654hT86yilOdoDjjJKwJIt1kbMwPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dsq24LCgylytyAuvDzZ4+b8PIRaQv/nuISjKeEj3utbD9cCcRHqvjj0TB/PzAVETZy1u2QOlZWbTuZSQxH1df43IE10UTO1ys/sqixSOXzBAmdaoMOTa2ssra+GaPhYXHLdm881B/yAnDJSqcyaF94NDuePfoU1HP9oNccRD2uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=G/W94IiB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="G/W94IiB"
ARC-Seal: i=1; a=rsa-sha256; t=1738258169; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ks8nP71+ZTi8sM9LOrDE9oieuHGkflR2EAeETY6WQpGO926djVJ1XTTYGqRXZkYWP21CHWywAVTdrr8KZoiu+YNokhTiqNjCBmamAnvbJwfFhQZM05aEoYv3HcYsE9ReZo3JQlhY2tGacz21O7lLZ+GuKfGMYMkYY9jTnh6Pfr8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738258169; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=; 
	b=fKyh/LH3OkFLNLO6QWulY7cMQaUvYPP3lps3zRk/nCLUrYH0GFyS2zAwR+xFlHVqezdf6yuEYYZmvhrHTMsx7iUoQWSfwRTKBanuC9mcv8sZPUbEwaXzCaFnFQx0M1su1r2PPyvobseyK+3yWvtPW2rxWdf/+omOStck7aWKzxc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738258169;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=0WA6J/EhS4KkqUnGdo0KmY73cb+vgz8J3JE8d3pK9ns=;
	b=G/W94IiBWevvl+55HsBpJt7bA+XiIHot4po/T336doNsAwyQ0W0ABKVKr8kkK5IB
	OO2I7Hsp6kE6HcK6HDgGYOwINM4oAe4LKWl5p0pmj39JcdmU5Dw4gWO8Y+gEnfuODmw
	JqISOzUcPdnABU4TxFF0Z4ZIbfEMlwV+s3OoDBrA=
Received: by mx.zohomail.com with SMTPS id 1738258166225175.1611096687751;
	Thu, 30 Jan 2025 09:29:26 -0800 (PST)
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
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH v10 4/5] Documentation/gpu: Add fdinfo meanings of panthor-*-memory tags
Date: Thu, 30 Jan 2025 17:28:12 +0000
Message-ID: <20250130172851.941597-5-adrian.larumbe@collabora.com>
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

A previous commit enabled display of driver-internal kernel BO sizes
through the device file's fdinfo interface.

Expand the description of the relevant driver-specific key:value pairs
with the definitions of the new panthor-*-memory ones.

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 Documentation/gpu/panthor.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
index 3f8979fa2b86..7a841741278f 100644
--- a/Documentation/gpu/panthor.rst
+++ b/Documentation/gpu/panthor.rst
@@ -26,6 +26,8 @@ the currently possible format options:
      drm-cycles-panthor:     94439687187
      drm-maxfreq-panthor:    1000000000 Hz
      drm-curfreq-panthor:    1000000000 Hz
+     panthor-resident-memory:        10396 KiB
+     panthor-active-memory:  10396 KiB
      drm-total-memory:       16480 KiB
      drm-shared-memory:      0
      drm-active-memory:      16200 KiB
@@ -44,3 +46,11 @@ driver by writing into the appropriate sysfs node::
 
 Where `N` is a bit mask where cycle and timestamp sampling are respectively
 enabled by the first and second bits.
+
+Possible `panthor-*-memory` keys are: `active` and `resident`.
+These values convey the sizes of the internal driver-owned shmem BO's that
+aren't exposed to user-space through a DRM handle, like queue ring buffers,
+sync object arrays and heap chunks. Because they are all allocated and pinned
+at creation time, only `panthor-resident-memory` is necessary to tell us their
+size. `panthor-active-memory` shows the size of kernel BO's associated with
+VM's and groups currently being scheduled for execution by the GPU.
-- 
2.47.1

