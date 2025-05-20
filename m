Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98F20E6E2;
	Tue, 20 May 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731378; cv=none; b=t3kPvTX5iZPCQZDs3I9sDM7BnQNJr4o0aq1gyaYJbbSvAbdf2NFyyCfFYQVJzepZwZ0i9UV1OreeVgm1q4UVBa/IHRO5ZLb1IGKmQEcqmHzYybuq6Q2vVb6peEFpZ1G8yRwaaGuMBuIfS8+wtOkJ10YGvDir6/1UITdXZagBUCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731378; c=relaxed/simple;
	bh=Rxfbn0+VsapHr6eykBqf7/DEWPYZ/O0gt6qu1igEI4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvc8mCpgmu9J0V+U5ETwOT0z17gAyyAS9PyYkQB+tEJ9aCc+yMNw/a+G2ZOb0kfCNn6yeuSbfXLLYc2GCX3SvLVgUJRTR9M54T+2zT/bD70Qogc0rttdgCs8VSocIOr2y+OGVwNGBbEOlLcyaaZRrrC7PIr+0SGxwK4HqXiU4LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Socqvp1/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Socqvp1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A392C4CEE9;
	Tue, 20 May 2025 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747731378;
	bh=Rxfbn0+VsapHr6eykBqf7/DEWPYZ/O0gt6qu1igEI4k=;
	h=From:To:Cc:Subject:Date:From;
	b=Socqvp1/EPmRsrnx2yOye+mFBzZRhAF8TfROJ1TDG4I2DHG9yGh44MXgpQNAoxtRo
	 0hL15xGoe8cfZ92clK5+jq8FsNgfAvqvG5zpE61qkZzHqz518X4HYlHtD2nCLYcXtB
	 ywPVfCieEBeOnREROC7J8NIdYmnhWRqau9qV+c7XCeh7Je1WpTz7a5H3YBCGUuMvc6
	 RhN96c/aGnwaESzTZkFKYKtI7gEyeA4YbwT7/wSEWiev2jlanTTcyJwZ0mmTivcq/a
	 xTrMG7dEdDEhXJo8sn946JwW5x0p1mL5Q6Zhbrgo5xELEeuDWIj9qxBzBJnvVepNgq
	 AYyAIdOzM29ug==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHIlj-00000006U8A-0iF3;
	Tue, 20 May 2025 10:56:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: Better handle kernel-doc class
Date: Tue, 20 May 2025 10:55:45 +0200
Message-ID: <cover.1747730982.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, there is an issue with kernel-doc KernelFiles class:
if one tries to add a kernel-doc tag to a non-existing file, it
will produce a KeyError, as KernelFiles.msg() will try to pick a
key from a non-existing file. Add a check to prevent such error.

With that, building docs with broken files will work as before(*):

	$ make htmldocs
	...
	Cannot find file ./drivers/gpio/gpiolib-acpi.c
	Cannot find file ./drivers/gpio/gpiolib-acpi.c
	No kernel-doc for file ./drivers/gpio/gpiolib-acpi.c
	...
	Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree

While here, also better handle errors at the kernel-doc classes.

(*) IMO, this is the wrong behavior, but let's discuss it in separate.

Mauro Carvalho Chehab (2):
  scripts: kernel-doc: prevent a KeyError when checking output
  docs: kerneldoc.py: add try/except blocks for kernel-doc class errors

 Documentation/sphinx/kerneldoc.py | 21 +++++++++++++++++----
 scripts/lib/kdoc/kdoc_files.py    |  4 ++++
 2 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.49.0


