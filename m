Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442F28A3E2;
	Thu,  3 Jul 2025 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568256; cv=none; b=hL+buV3deva2HpIPVO43wlZtpH98h4MmkbZOi1QUzbRCb7yd6JFIgjjAp7Lv03IhcjIfcuul27tSpMha6UnSvp4VqiWk0CoPxvVpBiIoL8D4P3DFVVHWrHviCNCwDlEjt70uDRksRzigEp2LSqFEEyshKDJ2Pc0oq6rOf+cwp0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568256; c=relaxed/simple;
	bh=FVOLHHZHd2C9uvgDs/zyzqaSzLl2qujF5amlXTP5oX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IjOV0WPxsylIh2bWLr3fvmwmsM/vNUExuuuEhYiBWal5hpLp/tPTKRK/OdEkzy55Bt30AQvO9v7pSa+7cf2yhPVgG7P8OrRn/HG62HWsQL0rYbztd0czox1nZ9lQza5dQeyIiIJXRTqxzB9qnCLAY9HLPUGYX7UVyg9aLV2/6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=I2SreSEe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="I2SreSEe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 71AA1406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568254; bh=nlvopnacSM2lGWC2WAHCoF0AwSyF0ASO5CFf8B9aZKg=;
	h=From:To:Cc:Subject:Date:From;
	b=I2SreSEeoevL1LpzQGpg0pXlgpayLR+u+JJqpukRjYlT4Co1ic5AJ6sfXNzBbhR3J
	 NZwM8HSn5yIqdj7s7oTYLmptP05Wqob48C6sIHbSadbQ3uDnH9xxJCNbkC6Y+BTeVD
	 /q3nw/sc2loyKccV/HvTjh/O5xtq/pYh7klM+pg12nzlGH8DViu36XlIMNxZJDMk6J
	 nXAREjRASUJ/O7e65ROk+EiX7Lh1a4+NN9QLBu48/p5wHDp7nszS1bCOZ4xfFDEJoW
	 JXGrXH0aZ/dfAeesv+jJfugMexksNGxWKSFPwo+Qdhe3aS6nQyS260pBadDF5JBdHz
	 Qd85ghmn++/gQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 71AA1406FA;
	Thu,  3 Jul 2025 18:44:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/7] Further kernel-doc tweakery
Date: Thu,  3 Jul 2025 12:43:56 -0600
Message-ID: <20250703184403.274408-1-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a set of miscellaneous improvements, finishing my pass over the
first parsing pass and getting into the second ("dump_*") pass.

Changes from v1:
 - Apply tags
 - Rework the KernRe microoptimization to avoid exceptions
 - Fix the stupid white-space error in patch 7

Jonathan Corbet (7):
  docs: kdoc: don't reinvent string.strip()
  docs: kdoc: micro-optimize KernRe
  docs: kdoc: remove the brcount floor in process_proto_type()
  docs: kdoc: rework type prototype parsing
  docs: kdoc: some tweaks to process_proto_function()
  docs: kdoc: Remove a Python 2 comment
  docs: kdoc: pretty up dump_enum()

 Documentation/sphinx/kerneldoc.py |   2 -
 scripts/lib/kdoc/kdoc_parser.py   | 150 +++++++++++++++---------------
 scripts/lib/kdoc/kdoc_re.py       |   7 +-
 3 files changed, 79 insertions(+), 80 deletions(-)

-- 
2.49.0

