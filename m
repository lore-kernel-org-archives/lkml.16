Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59921CCEF0;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=DqczleZ9U4kpG/hbKLTcIUEpMoXxaawBCX1LIajbEFVwgAy0zVsCyO5Te3fwTmFV2jy3AmuLQJ4fC8Td5jwYPhRQThMnv/1bvYYllYIng0QVjQn4r5ASl7Twrqy3A3qzyYgMzSdekuhj/KPcczv6GTJfPW2uWjvK5demeA3N6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=spRvL9h02iTAJSEHfQOVuBNItXh/grPCVfWPr/wssWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8gLj+h6h2dBubt8k3FDFCkBgTXcTPsZsMW3lNUhNFdc0WjBnOBiec6iorKAmZVVqrmArfdD7cEcyI0D/1SdIanfgxExoUzhq94JkqqQcPvj5bHutMy7qSsyXU9DS5Z28WL2grTo+745Tz2Ic6APE9H0d9qPhk9oe9vedShsB14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHo34MQI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHo34MQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B1FC4CEFB;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=spRvL9h02iTAJSEHfQOVuBNItXh/grPCVfWPr/wssWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHo34MQIYvI4tRCMSCstmstYvqbBEfTHMQXmKUIGTec6Yrl9EsfwMehg16PPsfcyM
	 0XlLnySYsqBKvs2hKTxDbcNtZLoZoU8yFd/cPQbddJyEzjHdKPvZPATc5XgdXfCJif
	 0VEkmRoSAUcoVTQJLf/CS7TVndRl3/0rfafbg3sSb673cgLL1tor+BoIGyR+knusdh
	 0rq0rBdmf1/jm0F8eUIZ74ZLROSIt/HhY+d2UQGRD2w8ux8Wb8RUe/NWrCyvTAcdst
	 jJorHi3+H4lBnEckXCLEqpDOyhRfLP/V8yLTtZ6r492QlAKTvgOUKPAo4OkkVBVZrg
	 PnrynWeeWfC0g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006CjE-1Ivf;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/27] docs: sphinx/kernel_abi: properly split lines
Date: Mon, 10 Feb 2025 11:18:06 +0100
Message-ID: <d4ad5b977799616544376210364d5cec686119ef.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sphinx doesn't like to have lines split with str.split("\n").

Instead, it uses its own splitter, with handles line breaks the way
Spinx expects. Not using it cause issues at the output files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 742ebd35454f..0a4057183208 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -36,7 +36,7 @@ import os
 import re
 import sys
 
-from docutils import nodes
+from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
 from sphinx.util.docutils import switch_source_input
@@ -105,7 +105,8 @@ class KernelCmd(Directive):
             old_f = fname
             n = 0
             for msg, f, ln in self.parser.doc():
-                msg_list = msg.split("\n")
+                msg_list = statemachine.string2lines(msg, tab_width,
+                                                     convert_whitespace=True)
                 if "debug" in self.options:
                     lines = [
                         "", "",  ".. code-block:: rst",
-- 
2.48.1

