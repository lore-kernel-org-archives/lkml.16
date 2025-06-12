Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D53275114
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740835; cv=none; b=PEjc1KEp25PzJIuRIWJ00Pwoafb70uxBYXGs9MUlzumVI1Iu5LQXBZb+jwyinyIuVVcgzZYrlpOIYFyZIBMVJjUmdBCiVZSKz4V7kmaNWuAcI/Q4T08s74ymGZUOMe3JFK1PobA5fq5srOzLdI8+O9o37LVNIbBxQ2+puEwArUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740835; c=relaxed/simple;
	bh=A8ID2siI1cROgork7uvnNzSAYJ0WqXVEfFZMFQB9lI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyZY3w2m9eiFwqVEVwbYydwqqZdvpncFh/EnNYK0GKwHH9/L0UQUSWH9B+9AUymgKlMWgYhOeH4AeITsG8nt3L5Hv19/9KgbDGIlYqJ8Tb5PWIL5c+GYJX5ih+Xcl321OH0QpDPXgeFrLhKMosseX3uJS3RwwleVH7i4OIUqPb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV3tDyBn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV3tDyBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06539C4CEEA;
	Thu, 12 Jun 2025 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749740833;
	bh=A8ID2siI1cROgork7uvnNzSAYJ0WqXVEfFZMFQB9lI0=;
	h=Date:From:To:Cc:Subject:From;
	b=CV3tDyBn2fCnXExgzOB/bF7XCfWN3NGGLRm+xrXQ0FfzxWRig+/IzeEWJeD51fJdx
	 8ALedBkGy9XCJkASKxQWoaQ3wnb4uaKr1/TTPxnZOpcA9HsEFSOjN5nVDKjKwigXwS
	 DPCA/Vw7iNqP+6LWAJlJkJiTW2OjF5OydKFD7zhn01FD0vQapq8JLmKp/lHUsOmrJR
	 cjKTjILRcPskLV/EWvUkHP18BV6R9zXOOuz+KbFMRY20e3EsAqoaIN4C6foP4truzK
	 et3GzRo6Q2BAiatdNwp2UWIvmvmNM/lukw21ZB6pjSgbdzF/yYbX94vZ1S9AlLAni+
	 QQMEIXEzgIk+A==
Date: Thu, 12 Jun 2025 12:07:10 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: [PATCH 1/1 fyi] tools headers UAPI: Sync the drm/drm.h with the
 kernel sources
Message-ID: <aErtHs3T2hdPjjHx@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

See further details at:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

Picking the changes from:

  c2d3a730069545f2 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")

Silencing these perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/include/uapi/drm/drm.h include/uapi/drm/drm.h

No changes in tooling as these are just C comment documentation changes:

  $ tools/perf/trace/beauty/drm_ioctl.sh > before
  $ cp include/uapi/drm/drm.h tools/include/uapi/drm/drm.h
  $ tools/perf/trace/beauty/drm_ioctl.sh > after
  $ diff -u before after
  $

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/include/uapi/drm/drm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/include/uapi/drm/drm.h b/tools/include/uapi/drm/drm.h
index 7fba37b94401a6d5..e63a71d3c607a673 100644
--- a/tools/include/uapi/drm/drm.h
+++ b/tools/include/uapi/drm/drm.h
@@ -905,13 +905,17 @@ struct drm_syncobj_destroy {
 };
 
 #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
 #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
 struct drm_syncobj_handle {
 	__u32 handle;
 	__u32 flags;
 
 	__s32 fd;
 	__u32 pad;
+
+	__u64 point;
 };
 
 struct drm_syncobj_transfer {
-- 
2.49.0

