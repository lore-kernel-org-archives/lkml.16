Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1235E22FE0E;
	Wed, 16 Apr 2025 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786695; cv=none; b=fC3CRow1jNmiVzJN+QZlBNAbs4LG9UoO93fYkGw6XYhrd9CZka2orncS3Sm51ITdDmyPdHJbFhw+XMkj2jYWLSbrKYLnIqGn2EO6Pcat0wSxI1rfKT2cUrxeSr4zyv+eJbob9/ivVv+0DspSU/Gstu42uSji+JGEJjZoZNBubmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786695; c=relaxed/simple;
	bh=jpugi8e27Z/kdIEtebaij6yO6Fpa6Eww1j0SfpkAUFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0TcFhSNbWGpLZVsTXqzSyeiy/UVqrj3l7VlxPebHAik+WiIT/aGsH+3/oFq3+iRjUoMSxPcjBnvfopkiSOsy5gJmZIHJpxojTMuaVZMIHcZDDHjQqCehmfjgvZDqWvcFeZPCNGEavNkMSXNiHqEI32JWTG3SoIqfjwUkExjHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s15bmqiw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s15bmqiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AABC4CEED;
	Wed, 16 Apr 2025 06:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744786694;
	bh=jpugi8e27Z/kdIEtebaij6yO6Fpa6Eww1j0SfpkAUFA=;
	h=From:To:Cc:Subject:Date:From;
	b=s15bmqiwV28PXAkmAdxRYYpOba7jNZNHomcWboPJgJ47Ay0PZHKlY2+BmRa0sidKz
	 ri9fduJ8afASG5nenH++l2F49AWz5I1yQ5HJswxpDIF5zvXiq/ASMvxgPibJ8O23qa
	 SlDoK6gqU2cXIMMB6Ghmm2U8gT4M7bnF4872kLNN541tpwPXHS7skFkI/vuPjPjNDq
	 3ynPezXKX6eYFXQm252rE6UWUpGmr7hvUcBO4QLS64b0VVaZ8pjFWtJdqdvjS8MQrc
	 Vv4zwFX2rdMaK1Er6QUvq93G3xT30xop33JlM8VkvLhIsmHG71FlBzSKAY5k9w5aMB
	 oJLGpCKDmECYg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4wiN-00000002kO3-3smf;
	Wed, 16 Apr 2025 14:57:43 +0800
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
	Maxime Ripard <mripard@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/2] Don't create Python bytecode when building the kernel
Date: Wed, 16 Apr 2025 14:57:37 +0800
Message-ID: <cover.1744786420.git.mchehab+huawei@kernel.org>
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

Mauro Carvalho Chehab (2):
  scripts/kernel-doc.py: don't create *.pyc files
  .gitignore: ignore Python compiled bytecode

 .gitignore                    | 1 +
 drivers/gpu/drm/Makefile      | 2 +-
 drivers/gpu/drm/i915/Makefile | 2 +-
 include/drm/Makefile          | 2 +-
 scripts/find-unused-docs.sh   | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.49.0


