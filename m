Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20F22DFA5;
	Wed, 16 Apr 2025 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789899; cv=none; b=LSela/TdEp2u5jxJNiGDSP+pCLVoXZUWH67HtCaPgeUIRT/gho6u3PW1U+f4aHybeET4Vy4hJqgwVzkT2Fm4tZqBJBMGaExS4ES88UxzYpJoUmqySsQb95hYO6DMhpEUnVGFJlvvdYvbFiFIcemW2UUev5msZfhCa/Zy4guB59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789899; c=relaxed/simple;
	bh=lGDsvclGfqqnI4NDqwWIMifw2HNoNXwomoYGArbLBu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=go6E6F9iX6yovWtcNIVAteUlwwKncfZ9NWGcUl3+I4OyHHABQvuQ+0btPDdCo3AZ1+lFR6mz7i3+pGX3cfr/mg1MtKH2cS/duXK2xFj0ZyfhUWWx13RA+iFlA6hlwCDsIUHR2XrzS+GSy3K0Cw7ADnCLK/khEjmkApAh5BAPEg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6aFIr2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6aFIr2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301EFC4CEEE;
	Wed, 16 Apr 2025 07:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744789899;
	bh=lGDsvclGfqqnI4NDqwWIMifw2HNoNXwomoYGArbLBu4=;
	h=From:To:Cc:Subject:Date:From;
	b=G6aFIr2BZXuMv3uDIP61j9l+U5bH+K8WQ7DkFwFVsfrSvIExheZYiWdcaSg067E74
	 gnoujMQq52AExugsQplVvpEC13rUvsIi5Dlc5dzJHIOunrZ74OYwpbMKcRpdOOiUqd
	 8y0kpUbV8ybJsDIEJup9I+A/FehTvNnc7afz9LHT7RT2AcaSBFgpVf8/l+v4lDO1dw
	 G+ZbNwdQ//oAKSO1sLnF04U3gMwr+JQM7XfMgu6Iu6AfxvLzZDNxC14sImMt4B1i6W
	 XSNGL9G5Zh9mCctIrUkCZmuAcHHEgT8EDwYChuL/8g7tGe+ZSzV1LUxEOanEkWl563
	 tUhXSE8T8xYBQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4xY7-00000002m3C-0eDL;
	Wed, 16 Apr 2025 15:51:11 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/2] Don't create Python bytecode when building the kernel
Date: Wed, 16 Apr 2025 15:51:03 +0800
Message-ID: <cover.1744789777.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>


As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
when W=1. Due to Python's normal behavior, its JIT compiler will create
a bytecode and store it under scripts/lib/*/__pycache__. 

As one may be using O= and even having the sources on a read-only mount
point, disable its creation during build time.

This only solves half of the issue though, as one may be manually running
the script by hand, without asking Python to not store any bytecode.
This should be OK, but afterwards, git status will list the __pycache__ as
not committed. To prevent that, add *.pyc to .gitignore.

---

v3:
 - changed the order of PYTHONDONTBYTECODE;
 - patched also scripts/Makefile

Mauro Carvalho Chehab (2):
  scripts/kernel-doc.py: don't create *.pyc files
  .gitignore: ignore Python compiled bytecode

 .gitignore                    | 1 +
 drivers/gpu/drm/Makefile      | 2 +-
 drivers/gpu/drm/i915/Makefile | 2 +-
 include/drm/Makefile          | 2 +-
 scripts/Makefile.build        | 2 +-
 scripts/find-unused-docs.sh   | 2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.49.0


