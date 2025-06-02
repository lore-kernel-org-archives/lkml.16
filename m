Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90F21FF39
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872341; cv=none; b=R3JjxIbdvfOLuH4UxNHisp9U/rfYTNXfBy/Sd1zNfr7RUuFBkbeBe3s3L5TIqb17W1z2JpxfOw7H5rOAeEB+cOampKKtSTvbPjBhoritjQz64YSXR1gnOa0SzuE9jRACgsE73zw8JDKLz2uteQy8p8s4VxKbZsYf1T5kbl4r3II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872341; c=relaxed/simple;
	bh=VX+brQuLSUXwQnFa2cZROecstwOgBVT7lgDrOyMrLEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBpY4wvkTO4d7SKR6DkauTBt/gfkRXPiH3J8nZI2q59ffiGDHt0RJOEUhhu2cGXoym1Lf0PE2wZidEMR0LlQTPRkBI2JWl90cCReGsrM1A5jI2lns2b6N2RJyz8XpuStEpJxrM/4Wc4iuY0/jM++QeQLTwclEy4Rv+SbIf/IRUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=cUy3PkhE; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="cUy3PkhE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=wT0xSehkFMhJxM+xwntmgLgxS4/GaYJns88pyew5XvY=; b=cUy3PkhEzwaHIpJh
	yNau8oXC45In7BO2agAsQL74YVhi0KL9Umvwelib+DDtsn5Jltc9cT8pqSu7zBxilhOj1wexRc1bR
	rxiAZ+opCmk5DH+60yk8KSUq2kT4w6ZcjrjjnbgG9SUJuHfUTthE9abrOR7/9/piAMzjGFe4MMa8I
	ZcKurPhecFDpjsvGsrl/NCOb09JB8k5FOJz7Tya7m+NI+ZqQx1PkJ5yw+breQXoEoPXgXU8EN4ucI
	mikjq1+s1O0LbNYnEaGJ8qUwO3q//nWhCfh6KpOW1ysJvzj/dR2eKFeqNAw1nXXS0FkXRTKuYpDyi
	F/qZFSpigHhyMoS2Pg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uM5a9-007CLX-1W;
	Mon, 02 Jun 2025 13:52:05 +0000
From: linux@treblig.org
To: dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v3 0/3] DRM deadcode
Date: Mon,  2 Jun 2025 14:51:58 +0100
Message-ID: <20250602135201.207466-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

This is simply a rebased repost of v2 which was posted
in October 2024 and had a Review-by on the last patch by
Dmitry, but otherwise hasn't moved.

The only change is of the order of the commit message
in the Revert, as commented on by Dmitry.

The original v2 thread is:
  https://lore.kernel.org/all/20241029234706.285087-1-linux@treblig.org/
Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  drm: Remove unused drm_atomic_helper_commit_planes_on_crtc
  drm/sysfs: Remove unused drm_class_device_(un)register
  Revert "drm/client: Add drm_client_modeset_check()"

 drivers/gpu/drm/drm_atomic_helper.c  | 72 ----------------------------
 drivers/gpu/drm/drm_client_modeset.c | 35 ++------------
 drivers/gpu/drm/drm_sysfs.c          | 32 -------------
 include/drm/drm_atomic_helper.h      |  1 -
 include/drm/drm_client.h             |  1 -
 include/drm/drm_sysfs.h              |  4 --
 6 files changed, 4 insertions(+), 141 deletions(-)

-- 
2.49.0

