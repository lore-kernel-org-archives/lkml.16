Received: from gmmr-2.centrum.cz (gmmr-2.centrum.cz [46.255.227.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66001AF0D6;
	Fri, 28 Mar 2025 13:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.227.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169725; cv=none; b=WoBdql5J7IPQGrD2j1RretYlRqXi/sDy5fepYJAaGJFXSL+Irc/oYJV2jkjeVOWbTxyaotq1M4JKkC5AjgldExFA81b49LesrxOvCzBJ2yyVe8lpE4RJL/ngKNLxTba5QTWrdTS9CCitZLpg3GhfFKCowlneHeNz+eARjkst7Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169725; c=relaxed/simple;
	bh=q0K01qJsYFOFiG0iZ2m4U1klsVF646bLGLD1xDAPFPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PZLfcAy2Gp4lV5Ci0mOS8bYMnByukH6sIuY3cNypEqs+OI5G6UsfqmNb+KWt248AR6Ia6YFjxoSha5vQQWZWnk6VczmJ3ptJru3PAjYsBKuPe7vM8oBa/PGHRJ4X+QOPcYlwmEHOHi2/Qb3hulfWL5FSEA62ncG+AtLdV4Vr+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atlas.cz; spf=pass smtp.mailfrom=atlas.cz; dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b=Q+rQeu7L; dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b=Q+rQeu7L; arc=none smtp.client-ip=46.255.227.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atlas.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atlas.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b="Q+rQeu7L";
	dkim=pass (1024-bit key) header.d=atlas.cz header.i=@atlas.cz header.b="Q+rQeu7L"
Received: from gmmr-1.centrum.cz (envoy-stl.cent [10.32.56.18])
	by gmmr-2.centrum.cz (Postfix) with ESMTP id 18355200BC3F;
	Fri, 28 Mar 2025 14:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1743169600; bh=UlBw9/qeUcHj0FTkB0/+Oy9DVtY5u5gfvTikwDv089U=;
	h=From:To:Cc:Subject:Date:From;
	b=Q+rQeu7LkRj/WcLfDzbrUmXEM+X1OkkobVwoAT3cCsIxI+ZzJAenX3wQlvJrwsDBJ
	 bHPz43aR6yAbeuKCaFTbLxSrhvbVMXPYtAsZP1LXjXl8Fu40VOwVDPBKkj4oATP8f7
	 cWTqdbyOl1aryGdAEs8oW8GLS5ZTCDpJ1dKsJ4OE=
Received: from gmmr-1.centrum.cz (localhost [127.0.0.1])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id 150C31B4;
	Fri, 28 Mar 2025 14:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1743169600; bh=UlBw9/qeUcHj0FTkB0/+Oy9DVtY5u5gfvTikwDv089U=;
	h=From:To:Cc:Subject:Date:From;
	b=Q+rQeu7LkRj/WcLfDzbrUmXEM+X1OkkobVwoAT3cCsIxI+ZzJAenX3wQlvJrwsDBJ
	 bHPz43aR6yAbeuKCaFTbLxSrhvbVMXPYtAsZP1LXjXl8Fu40VOwVDPBKkj4oATP8f7
	 cWTqdbyOl1aryGdAEs8oW8GLS5ZTCDpJ1dKsJ4OE=
Received: from antispam32.centrum.cz (antispam32.cent [10.30.208.32])
	by gmmr-1.centrum.cz (Postfix) with ESMTP id B2106D9;
	Fri, 28 Mar 2025 14:46:39 +0100 (CET)
X-CSE-ConnectionGUID: pyp5bXrhQ7eAqW///7xMxg==
X-CSE-MsgGUID: VNyVFBIfT1OE2CfFrsGxcQ==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2FIAADPp+Zn/0vj/y5aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQAmBSoM0gXGEVZFyi3mGM4EgjEgPAQEBAQEBAQEBCUQEAQE+A?=
 =?us-ascii?q?YRIiygnOBMBAgQBAQEBAwIDAQEBAQEBAQEBDQEBBgEBAQEBAQYGAQKBHYU1U?=
 =?us-ascii?q?4JiAYQpDwFGKA0CJgJfEoMCgjABAzGwEoEyGgJlhHzXdAJJBVVkgSmBGi4Bi?=
 =?us-ascii?q?E8BhHyGKYINhH2ECoEGgw6CRyIEhk2BDIwghDSES4UxgnGCJ4tRSIEFHANZL?=
 =?us-ascii?q?AFVEw0KCwcFgWwDKgsMCxIcFYFFe4I9aUk6Ag0CNYIbJFiCKIROgQeDN4RDh?=
 =?us-ascii?q?VCCEYIEiSeEYC1Pg0AdQAMLGA1IESw3FBsGPQFuB6MaOoNTUSBaNFuVH7NFh?=
 =?us-ascii?q?CWETZx7GjOXUh4DkmMBhTyTQiKkKYRogX6BfzMiMIMiUhnaQ3c8AgcBCgEBA?=
 =?us-ascii?q?wmCO40tNIFLAQE?=
IronPort-PHdr: A9a23:TH+bRBbQ+o96Y7pSy2ME0bv/LTH414qcDmcuAnoPtbtCf+yZ8oj4O
 wSHvLMx1wWPBd2Qsq0d17GempujcFJDyK7JiGoFfp1IWk1NouQttCtkLei7TGbWF7rUVRE8B
 9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUhrwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9I
 Ri4swndrNUajZdtJqosyBbFv3RFdupLzm50OFyfmArx6ci38JN/6Spbpugv99RHUaX0fqQ4S
 aJXATE7OG0r58PlqAfOQxKX6nUTSmsZnQNEDhbK4h/nRpv+vTf0ueR72CmBIM35Vqs0Vii47
 6dqUxDnliEKPCMk/W7Ni8xwiKVboA+9pxF63oXZbp2ZOOZ4c6jAZt4RW3ZPUdhNWCxAGoO8b
 pUAD+wdPeZDsoLxo0ICoQaiCQWwAe/izCJDiH3r0q0gy+kvER/I0RI9EdwAs3raq9r6O7sdX
 +2u0KnFzi/OY+9M1Dvh6oXFdA0qr/GWXbJ3dMrc0VMhGB3ZjlWKtIfqMCma1uITtmiY8uFtU
 vigi3Qkqw5rpzig3N0sh5LTiYIJzlDL7z55zJwpKty5UUN2Z8OvH5RMuS+ALYR2Xt8iTH9yu
 CY80rALpYK3cSwUxZg6xxPSZeCKfomG7x79SuufLjl2iW97dL6imxu/81Wtx/D+W8S10VtHr
 yhIn9jRun0N2BHe98mKR/1g9UmiwTaCzw/e5+BeLUwqlafWK4QtzqAumpcRq0jOHC/7lF3og
 KOLeEgo4Pak5/r7brn8uJOROJN4hhv6P6kvnMG0HP42PRIUX2eB/OSxzLjj/UrkT7pUlvA2i
 azZsIzCJcQcu665HxdZ0oY95Ba7CDeryNsYnXweIFJefRKHk5DpN0zTLPziEfiwnVKskCtxx
 /DbO73tGInCL3nbnLfge7Zy9VJcxRI8wN1e/Z5YFLEMLfLpVkPvqtDVDAU1Pg60zur/DdVyz
 IIeWWaBAq+DN6PStEeF6fg1I+mPfoAVvSzyK+I+6vH0kX85nUUSfbKz0ZQLaXG0Bu5mLFmBY
 XrwntcBFn8HsRAkTOzpklKCVCRcZ2ypUq0m+jE7DJipDZzZSo+xgb2NxD27EYFOZmBaFlCMF
 m/leJ+LWvgXbyKdPNRskj8aWri7TY8uyxWuuBXnxLpkNubU4DEXtYr/1Nhp4O3ejRUy9T1yD
 8SA3GCBVnx7nmQUSDItwqB/rlJyyk2Z3ah7nfNYD9pT6O1NUgsgMp7c1eN6B8joWg3dZteJV
 EqmQtK+DDE1T9IxxcIOYklkF9WhkB/DxSyqDKERl7GQGpw0/bzT32LrK8Z+1XnGzq8hgEciQ
 sdVMm2mnKF/+xDVB4HSi0qZjbqldbwA3C7R82eO1WWDsFlFXw5zUKXFWGgSaFPZo9v3+E3MU
 6OjB7I/PgRczM6NMLFKZcHxgFteXfntINvQb3qqm2eoCxaF3quCYpPydWsSj23hDx0AkgYO7
 TOFOBI4CyOJvW3TFnptGEjpbkeq9vNx7Du/T0kp30SGaEZJybW44FgWiOaaRvdV2agL6wk7r
 DAhJFuhxZroAtwjpEI1db9faNY0+n9OyWbQrEp2LMrzfOhZmlcCflEv7AvV3BJtB9AFyJByx
 E4=
IronPort-Data: A9a23:wVeOYK8h5u3FglkGFVm9DrUDhH+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WoeX23UPamDNDfxfYp+YY3k90gCu5PTzt9hHAZt+39EQiMRo6IpJzg4wmQcnc+2BpeeJK6yx
 5xGMrEsFOhtEzmB4E7rauW8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2LBVOCvT/
 4quyyHjEAX9gWMsaThEs/jrRC5H5ZwehhtJ4zTSWtgU5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxH4
 I4U6cHvE1dB0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQAOShQZCCZh9vpzZuida4rwZszCdnkadZ3VnFIlVk1DN4pRNXYRrnSvIYe1zo2mtpTGLDVd
 aL1axIzMlKaPkAJYA1ITs1j9AurriCXnzlwoUiWrK8++UDa0Ah4y/7mIrI5f/TTHZQPzhzD+
 D2uE2LRPDcLCvK16DS5q1WB3MTBszngd5IZLejtnhJtqBjJroAJMzUfT1iypPCjokeiX9tEb
 UcGkgInvaI1+WSoQ8P7Uhn+rH3slhodXcdAVuE94ymTxafOpQWUHG4JSnhGctNOnMs3QyE6k
 1yEhdXkARRxv7CPD3GQ7LGZqXW1Iyd9EIMZTXNaC1FYvp+5+t510U+nostfLZNZR+bdQVnYq
 w1mZgBl3t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:CDIFkqxJmmhhjxqnCTv4KrPwPb1zdoMgy1knxilNoNJuHvBw8P
 re+cjztCWE6gr5N0tPpTntAsO9qBDnhP1ICOsqXItKNTOO0ACVxepZgrcKrQeMJ8SHzI5g6Z
 s=
X-Talos-CUID: 9a23:PnKBvGNZraC33O5DQDh/qUQkAMAcLXD01UiXZAjnGUN5R+jA
X-Talos-MUID: 9a23:0eXJswhOdhHuE1uNq5Kh98MpCuF53YqEKU4xyLIr4eKKGzZrFCeWtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.14,283,1736809200"; 
   d="scan'208";a="109282367"
Received: from unknown (HELO gm-smtp11.centrum.cz) ([46.255.227.75])
  by antispam32.centrum.cz with ESMTP; 28 Mar 2025 14:46:34 +0100
Received: from localhost.localdomain (ip-213-220-240-96.bb.vodafone.cz [213.220.240.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gm-smtp11.centrum.cz (Postfix) with ESMTPSA id 322BB100AE2A3;
	Fri, 28 Mar 2025 14:46:34 +0100 (CET)
From: =?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
Subject: [PATCH] Documentation: fix typo in root= kernel parameter description
Date: Fri, 28 Mar 2025 14:46:21 +0100
Message-ID: <20250328134622.15917-1-arkamar@atlas.cz>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes a typo in the root= parameter description, changing
"this a a" to "this is a".

Fixes: c0c1a7dcb6f5 ("init: move the nfs/cifs/ram special cases out of name_to_dev_t")
Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5e351ac52cca..6049a2f30baf 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6224,7 +6224,7 @@
 			port and the regular usb controller gets disabled.
 
 	root=		[KNL] Root filesystem
-			Usually this a a block device specifier of some kind,
+			Usually this is a block device specifier of some kind,
 			see the early_lookup_bdev comment in
 			block/early-lookup.c for details.
 			Alternatively this can be "ram" for the legacy initial
-- 
2.48.1

