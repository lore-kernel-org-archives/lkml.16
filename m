Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675562749F4;
	Tue, 29 Apr 2025 22:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965636; cv=none; b=RtatZEF74+jE5J1DRJv955jhGmYnft8aLdFLw1dge6KqBf82EgMU1m0037XoLU6xaTTcC/Ae7n+oTqwHb1vxN6tBlIMIIRbh2Hm+ta3RCMD+Ai9X9YxKYNzo/JUu23tJSDLP/JdWqgPRZe8eAR1NfLitxcsWJdiR1bQbuAsN/lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965636; c=relaxed/simple;
	bh=LK4pCfl0K+6c1i+y3R3elNM5ujTGhpTge6xB1wPFtqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc79skWakNnCzj0chWCgqyRxg17YknAT3wwwrR7eBKE4VpwSjwyln2k7x0Jc+Rgx2TNtBYjYWT0CRubVV9zFV952nPcaErcwGjVDESPo/iMU4KSDPTMRWKSM9knSKVZuoCcN8X3zgPzTEmilzpXvi8RQAnjVuogZbbqga86BgpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hyx7b01U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hyx7b01U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F668C4CEEA;
	Tue, 29 Apr 2025 22:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745965635;
	bh=LK4pCfl0K+6c1i+y3R3elNM5ujTGhpTge6xB1wPFtqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hyx7b01U6NiTLqkMPVPND5d5MO6EMD/iSd7uiuewWF7mc+jhVaCV5iDzJU+XE5Q3P
	 YgpWXQMdrwa26dBfg3vOET86foct+PXySbD/vmBcohwhdEJs37qGmoT4yylywBQxqh
	 jwZ/nStVitLyNfwpHEe5AL9rEkgcdfMYIOhN3oEQ=
From: Shuah Khan <skhan@linuxfoundation.org>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	rmoar@google.com,
	corbet@lwn.net
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kunit: add tips to clean source tree to build help message
Date: Tue, 29 Apr 2025 16:27:12 -0600
Message-ID: <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1745965121.git.skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tips to clean source tree to build help message. When user run
kunit.py after building another kernel for ARCH=foo, it is necessary
to run 'make ARCH=foo mrproper' to remove all build artifacts generated
during the build. In such cases, kunit build could fail.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 tools/testing/kunit/kunit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 7f9ae55fd6d5..db86a396ed33 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -583,7 +583,7 @@ def main(argv: Sequence[str]) -> None:
 						'the options in .kunitconfig')
 	add_common_opts(config_parser)
 
-	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
+	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests. Successful build depends on a clean source tree. Run mrproper to clean generated artifcats for prior ARCH=foo kernel build. Run 'make ARCH=foo mrproper')
 	add_common_opts(build_parser)
 	add_build_opts(build_parser)
 
-- 
2.47.2

