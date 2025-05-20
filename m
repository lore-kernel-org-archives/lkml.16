Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9321A2C11
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731378; cv=none; b=GNh0fevA79VjUSQyBETfwxbZSMKpC9SxjNt2A53Hes0bHh/CzIkRDPvtSQiRapwExkHmv7R1ep5jQZTtAc48R7zTpr70X179CDjB9PA1Qw6hVQelKBZ88sHj5fYRAngfPXn2lhLx6dGtiMfQtr5rI3S5Sb9pekAlISn0gLWANb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731378; c=relaxed/simple;
	bh=zrs4cXgnOa//B/Txk8KhjILwuaI02i9DB4tFgWygRDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFct9/QxjcZqXmFFRKI0m4MCCmoxrF995NshVT9kvumMig/zHtIwCusL+6tS37cH+Z7u8fzFEeS8Cn+CS/qT+4357Ly7pbH8DdH3Ng9m4Evuxy8dvh65VY6J2kxNc0WDxsfQ7eVb5v8VUwf7it/CqvxhtnRqoIHq3PoB28Uz0aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic84TmVf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic84TmVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6BEC4CEEF;
	Tue, 20 May 2025 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747731378;
	bh=zrs4cXgnOa//B/Txk8KhjILwuaI02i9DB4tFgWygRDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ic84TmVfLRSHgCuwKEB0fSzqZqtOzLOApk8I+bsQdlT5jUPAVpYyhr62ETWyKvQ61
	 XJpCRRPL3GEb9CIgsgmqPSMsQ0Ugv6d8b7RX0L4nfZ5mV4uD3d6Ugyx+Wv49rHAw/s
	 5OTl0clfLAHAdCVdYwDBD68UI0DrymrhVKjN+jqbfam1YUmwZb6RQhwqZa6vIRqZwE
	 FSsw4zPvBTocHLIE21TDd7SGd6IIMyj1gJLfcBhp6xGEsvoTdqHRMpJbiNmNFBaUz4
	 oW8p5Gyp9G0LA7dQtBHZxeNi4QgP5h8eyXJIQIkzD55LibjQeM2cUBoa1mSue/tdvB
	 jOckvwNbLRzyg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHIlj-00000006U8D-0nMy;
	Tue, 20 May 2025 10:56:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/2] scripts: kernel-doc: prevent a KeyError when checking output
Date: Tue, 20 May 2025 10:55:46 +0200
Message-ID: <d97e86c7176f671405b4c15d75cb951349022a23.1747730982.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747730982.git.mchehab+huawei@kernel.org>
References: <cover.1747730982.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

If a file sent to KernelFiles.msg() method doesn't exist, instead
of producing a KeyError, output an error message.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-doc/cover.1747719873.git.mchehab+huawei@kernel.org/T/#ma43ae9d8d0995b535cf5099e5381dace0410de04
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_files.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 630aa5ca6460..9be4a64df71d 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -271,6 +271,10 @@ class KernelFiles():
                                       no_doc_sections)
 
             msg = ""
+            if fname not in self.results:
+                self.config.log.warning("No kernel-doc for file %s", fname)
+                continue
+
             for name, arg in self.results[fname]:
                 m = self.out_msg(fname, name, arg)
 
-- 
2.49.0

