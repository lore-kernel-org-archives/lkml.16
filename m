Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447EC145B27
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161587; cv=none; b=bp873/sat8TLQqv7WTuqmoDJHUCjqICXdDRy0VOTMCqwj5T2irV5um/4l16oTKR58YEe5yBp+sXpsY/TKAAUiaNesditcJn4ajV1hlaROi77zM4/FuQoNFURvF/B4poNjOsxN8f8ALlgcNcNXt+O4kuQ4/zoXksmFByW8IZnlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161587; c=relaxed/simple;
	bh=ZmVcFblvwDvGIiJOpIyvSRxBhBv6ZjB/aFH3w9ChoI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OM/C8t8mi5thG9iXHV0jRntv6a/qt1q4p9j56nbC7ak1HSDg89f9KAtUZI2u7ybGOGOcNaP5DcirFkJuC5c17Pijcd0yZTO+sHtlsvs9yBWay2Yj4lbG15KU8Isdmw81+AeY3vAHwc7mqfk8QaNpj05A8NJGFHxavEQ2I6izRew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxxmfSb8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxxmfSb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54647C4CEE4;
	Fri, 28 Mar 2025 11:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743161586;
	bh=ZmVcFblvwDvGIiJOpIyvSRxBhBv6ZjB/aFH3w9ChoI0=;
	h=From:To:Cc:Subject:Date:From;
	b=GxxmfSb8MD0gOjSU0y3T8PPq9+jCECYr3XYYEvYClD2W3NQA41wAZ3A9Eeuh9YxSh
	 OqtLNjWrXm0qgHDTWxKZXqd6On9VhoOouCQMDG8k+VaZtopERdy1dnk/JbE7nD1fGH
	 NJLzjhyeMtpN1KZyZ0A7CFm7at3gHugKw3LpxybYCLDcWPh9HJAf4QrZkMBwLdLfiF
	 wl0sqODTcCmt5FMMcuwz68XTwk7o1lX8w/vXl3lmbJuRKtjkvCE3OImmBpYymiz/G9
	 6JiHgzPvsh/J7TGfI9KlgdpRXlS3GioTCRniBV0ouxN3OAfq6RSDNtUCgn4qDKLGZK
	 dLeyyKNISOS7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] xenbus: add module description
Date: Fri, 28 Mar 2025 12:32:59 +0100
Message-Id: <20250328113302.2632353-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Modules without a description now cause a warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xenbus/xenbus_probe_frontend.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: change the description as suggested by Jürgen
---
 drivers/xen/xenbus/xenbus_probe_frontend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index fcb335bb7b18..6d1819269cbe 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -513,4 +513,5 @@ static int __init boot_wait_for_devices(void)
 late_initcall(boot_wait_for_devices);
 #endif
 
+MODULE_DESCRIPTION("Xen PV-device frontend support");
 MODULE_LICENSE("GPL");
-- 
2.39.5

