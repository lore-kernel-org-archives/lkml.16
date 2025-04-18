Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2B253F35;
	Fri, 18 Apr 2025 23:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020231; cv=none; b=Agb+6mRY82f4HIiFnw9ggPHhIEY5vZuEbIE6NJAX2K+JDbHBtJFs+isrbrP8nzkVzVqBj3OMMpf8EyyJxMHjupaW2YVKq21FuzNXdz2IYqMPbdCyI75xPymlXzrNW4lxRQ8xu2tU/PAUZoASvjTrfSSyTQi5SL5V54VEhry6mTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020231; c=relaxed/simple;
	bh=TLP2FSFMoyG9Y7Er0eXeMEKJSa/MXE0h9kNS8YrZeK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAn6/0Xx/zgQO3Wh3dM+zlhi/i4epB4mGBpuElRBqgtKuFx3BujgrO1JWP4r76L5peuHjwmIxVpTdjT7DINqjli45Lz7DKEyWWjOWym/vLO0TU1RP8HRAK/1/ah7yF1zlx+hPT8C5MdQP8HDEWGCeR/hfrkyuYtoueDf7UAywJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDL7uy7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDL7uy7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A10C4CEE2;
	Fri, 18 Apr 2025 23:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745020231;
	bh=TLP2FSFMoyG9Y7Er0eXeMEKJSa/MXE0h9kNS8YrZeK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GDL7uy7QwalO2pJiH+7A+Wgm4sVMLhNVbDAbJp/yOcvq5xlKt1voHhjQsQA1RF6SO
	 WG7SyMnX6Q5r6tqgw7pdGMuEuQmjWAEOce/9IBGP/DCPQ5UglLa2HyAxrV3TQaIqdG
	 IqAahLr+uKz1/6dj5S4Kxl5rTVzSxouEeQdmIpVcwSf5PnB5aUbSFmGiLdATwx/KDT
	 6XFRluZkM3lZA0VZUKNKZqm0l/Cb95Y7MWhpCZs0muT1DWa4xoZ5AHIi7+R8EHSQgV
	 ZFpDfRGq7m7DGczTNeydB7HmSpdUt845RVMWw5IyVA1q+GDm2a3KzbvaBOimQIj6S4
	 KQBRQ00sq6ouA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u5vTL-00000003KFH-3UGk;
	Sat, 19 Apr 2025 07:50:15 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] .gitignore: ignore Python compiled bytecode
Date: Sat, 19 Apr 2025 07:50:05 +0800
Message-ID: <9bbcb399f6b6f68e6525131fea41dd0fc9c6978d.1745019660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745019660.git.mchehab+huawei@kernel.org>
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

While the building system doesn't create any Python JIT bytecode,
if one manually runs kernel-doc.py or get_abi.py, Python will,
by default, create a bytecode and store it under scripts/lib/*.

This is normal, and not controlled by the Kernel itself. So,
add *.pyc as an extension to be ignored.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index f2f63e47fb88..2e01bc0b2d2a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -39,6 +39,7 @@
 *.mod.c
 *.o
 *.o.*
+*.pyc
 *.patch
 *.rmeta
 *.rpm
-- 
2.49.0

