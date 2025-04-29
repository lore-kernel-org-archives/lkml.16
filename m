Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D02777F8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912053; cv=none; b=SNrYIsiJBfdG67oIAALFZWC6rhq0oDC+/+CAwEdtuaNlhVVhqUKaDGSI0YwPRlszR0Q3E4gODrF6O0moVC/whm1HshDtxrTAifwjQYZkcmeX1ZqDxL5blwRVKc/RAqntoGBDC+ZdOC4GtN5O3ncd8zl19Pp/KbfCw7D9rwM3Ch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912053; c=relaxed/simple;
	bh=7KwvjwqWpt7P9mIGSbCQc3XS85MpJcNT6e7j/JyjGvo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XUQGa11RUZsGCpUvSqakI1hUn67BaV1Ldxa8WhyGMsQmfGC6AehgTlHV6ciAA/L/npjkb8uNtj/wMFXVDI0xaguITLkdzEoeEIumjVmkDrw843XlsQueZI66hsT+mTpsNphd5jib31YSdRI4U5oZibziHELs0YXc07jthOh5v14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJWiWUbw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJWiWUbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24DDC4CEE3;
	Tue, 29 Apr 2025 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745912052;
	bh=7KwvjwqWpt7P9mIGSbCQc3XS85MpJcNT6e7j/JyjGvo=;
	h=From:To:Cc:Subject:Date:From;
	b=bJWiWUbw1+gc7ZwHGNzpNiPuY8TEvxVkuCnmZDU9twKWflTmLBifTNeILSwaHHsyn
	 GuYvPCjkxgeSk6BrRE9w8e2x4i+ts/NzCP4ZqzMStCPoVO5xcWEq5DBbc9Xqsxk3Z9
	 MZgeYdJr6kaKPI/fdODiTvyNv8CM8s/8ntgYBbrEuRl/Mtv1mfthw6RdQ6xE0zKWML
	 vT4zkZ/7WgmglVUSau9GWBeNmW5dF9YiayzeqfSWiqsggjcXlv9s+g1WTl/jd0i4Ff
	 9n1/mIqS6sjyuuOzljFI1Xv2Inn4s7bNlYmnKqr2QJ4q+ISIp+6IOfK5htdv33Xd3M
	 xfYnQRTb5368g==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	John Harrison <John.C.Harrison@Intel.com>,
	=?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe: fix devcoredump chunk alignmnent calculation
Date: Tue, 29 Apr 2025 09:34:00 +0200
Message-Id: <20250429073407.3505712-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The device core dumps are copied in 1.5GB chunks, which leads to a
link-time error on 32-bit builds because of the 64-bit division not
getting trivially turned into mask and shift operations:

ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!

On top of this, I noticed that the ALIGN_DOWN() usage here cannot
work because that is only defined for power-of-two alignments.
Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
link error and hopefully produces the right results.

Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
this will clearly fail on any 32-bit platform and is also likely
to run out of memory on 64-bit systems under memory pressure, so
using a much smaller power-of-two chunk size might be a good idea
instead.

Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Please test this with multi-gigabyte buffers, the original code
was clearly not right, but I don't trust my version either.
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index a9e618abf8ac..4eb70e2d9f68 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -177,6 +177,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct xe_devcoredump *coredump = data;
 	struct xe_devcoredump_snapshot *ss;
 	ssize_t byte_copied;
+	u32 chunk_offset;
 
 	if (!coredump)
 		return -ENODEV;
@@ -203,8 +204,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
 	    offset < ss->read.chunk_position) {
-		ss->read.chunk_position =
-			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
+		ss->read.chunk_position = div_u64_rem(offset,
+			XE_DEVCOREDUMP_CHUNK_MAX, &chunk_offset)
+			* XE_DEVCOREDUMP_CHUNK_MAX;
 
 		__xe_devcoredump_read(ss->read.buffer,
 				      XE_DEVCOREDUMP_CHUNK_MAX,
@@ -213,8 +215,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 
 	byte_copied = count < ss->read.size - offset ? count :
 		ss->read.size - offset;
-	memcpy(buffer, ss->read.buffer +
-	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
+	memcpy(buffer, ss->read.buffer + chunk_offset, byte_copied);
 
 	mutex_unlock(&coredump->lock);
 
-- 
2.39.5

