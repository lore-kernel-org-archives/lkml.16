Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93919230BC2;
	Wed, 16 Apr 2025 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786696; cv=none; b=TbLNiIkLgHZvVySJEffeSnkx76csomS9ftwi3/b/hMD35BZ1BVGAh8DifxUH1GOjKrjCOcSAx6NN6yR1eSaFkSe19xL0dh6A1YAj+9MCLgph4TmbDNsC+yckKU5UfgheBDt4YUcJf379b8IvrytL7AOdrgdGD5prC70mVIocTzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786696; c=relaxed/simple;
	bh=TLP2FSFMoyG9Y7Er0eXeMEKJSa/MXE0h9kNS8YrZeK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXB/AXkY7OyZC3esZ/LtpKkKAxI/QqDdtFc8Nj4s/3y3EcsW0Y4ZWmdoOzbOvBCNFlEEDFhYQdqrG+yme7ozXbJMHg+Jo0jE2wgRMNMz2UbYmco9UI8DuSf4pU6KnMZyPlO2+RAF/UDRHAl7oO+xK/beD+3ibIoCiHv4UpH8a+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXXiB3Xt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXXiB3Xt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8F2C4CEEC;
	Wed, 16 Apr 2025 06:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744786695;
	bh=TLP2FSFMoyG9Y7Er0eXeMEKJSa/MXE0h9kNS8YrZeK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CXXiB3XtqKeigtEkdWCmvP6gjJEKB+/EmarowCD4j+95xm7S2QAS1NUSJcTTNMHS5
	 QCwH+djEyTgeq6oPeKc/tMOMlx1Un/Yewy7qmMjwuaKaYpok3F4rShMOfaI4uS0vCT
	 LSTD9lCglqM8FNDK5/ch7XnHCVQ6ni0SZFZwY5SLox+pVS1bzCqT+v3xtkAVUczz92
	 oE7IZPrVwvc+BW/PzTy13/iE36kdG9koNhBoRDEhSLsQiQ4BAiP2/Gwefk+y2jF0Nw
	 y0cOKzdwG3gRRghQnvwDy1ZCDqyu9IguwACfocwWyzm5iZbPzbGHAkvuPa2IhWG0bX
	 pET3Ty56IOrHw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u4wiN-00000002kO9-47Wp;
	Wed, 16 Apr 2025 14:57:43 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Alcock <nick.alcock@oracle.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] .gitignore: ignore Python compiled bytecode
Date: Wed, 16 Apr 2025 14:57:39 +0800
Message-ID: <eb7c854d1bddab19ec1105b928463bb1845d4d50.1744786420.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744786420.git.mchehab+huawei@kernel.org>
References: <cover.1744786420.git.mchehab+huawei@kernel.org>
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

