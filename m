Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA266227E8A;
	Wed, 16 Apr 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789893; cv=none; b=ROTp/QDk2vzMlE7wA3paoiHjA2GsycG8I3Cve7Q2E5u/4SH9yQhpYgk5SJlfQ5nc5xFDMABLADKjp51Rrqj5sgRX+RTxpNoOUsDV7/AHdmqIn2Ly77pBBu7pWTPCdjbGYcWvs5YzrqyPge5APYIx9UNvngA2evvn1EBvpvz/0pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789893; c=relaxed/simple;
	bh=TLP2FSFMoyG9Y7Er0eXeMEKJSa/MXE0h9kNS8YrZeK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMyz9k8rosxT1eaWSuTr4H9azatkTpa0bIXF3XbevZyJgxNg9Oo51N5dNWBjag+JZrrPrRx3TOx0PwuwtiVnhtTqsqx3tjC4iLgEDgR+eQjK3rjviZEF3j3nBlPrw3owTTEhPooBpUl+ijjrQVSjDNKRoyNAMBhpjbuHEk77aP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQTDzeGN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQTDzeGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223D8C4CEE9;
	Wed, 16 Apr 2025 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744789893;
	bh=TLP2FSFMoyG9Y7Er0eXeMEKJSa/MXE0h9kNS8YrZeK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQTDzeGNB0iXQPSfl4wqv+aZTwuaXyWW6D7atCdzEEgcbMUbdcGMDfGC9pZtZoIGk
	 iktdsuF4ao6fH60H/4flvtX/aASJIhHLKgQmpLEyQGvc9we9xNG+EtDUNc/e2TL56L
	 NMHPEqNTG3uc0YUJNQkmrw32IwZ/sRMP+Qjy4exn0/5IL8zQqXglO1XkJG3iFJtvMe
	 ut5KhlekAQ3dvuW095oq1YCfMx1xLRVdwHQ3QInQ99o/bElvfdowUsoC+onbAJS/2/
	 jkaeoWFdcLi6bLboV3OdwUENcV4kughZ4J4CAfarumo2o4NcqcHUa9Ha3t0krxYMiR
	 Xmi1y4rF1hpYw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4xY7-00000002m3I-0s2X;
	Wed, 16 Apr 2025 15:51:11 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] .gitignore: ignore Python compiled bytecode
Date: Wed, 16 Apr 2025 15:51:05 +0800
Message-ID: <6f597205d5b2ec0e4d07c47f4b66c9df5da8203d.1744789777.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744789777.git.mchehab+huawei@kernel.org>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
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

