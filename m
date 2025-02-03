Received: from mail.sysgo.com (mail.sysgo.com [159.69.174.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5C22557C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 07:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.174.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738568344; cv=none; b=GZ478L/0cVOdcrcgizm6j3CnIaUh5VKpXaS6o3HjgANQFEsHQIznER7IyDZtQ7yE1WpHLEvBlD/5Gqu99SMwlYDoldl54EcNhy2/bFIMJ4Wv8bP6FsSauB3pId6lNwgRzn2fU1RbQc0BKYK4oSUOdMqnUQH0DqO9IbKXRrM3oh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738568344; c=relaxed/simple;
	bh=CrunVFMierOZmosYpli1kFuhs1QzBegjKdQNawGyhlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j+AGflqObAjug0X+7yW9Ula/Mv3ir/xg39bKzleMXMz4O1izkiUYqW+nQ5ZysKJkH0rEOqecjN+ZS7iZkKLX3Zmu0TqvuF3lwFd64VBOwQNKW50jHdri5oWQgQk367vzJI2g3xvezcJgEY6Sdm8cdReciGcfbh14is7ig3KbWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sysgo.com; spf=pass smtp.mailfrom=sysgo.com; dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b=j0BP/YFR; arc=none smtp.client-ip=159.69.174.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sysgo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysgo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sysgo.com header.i=@sysgo.com header.b="j0BP/YFR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sysgo.com;
	s=k1; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=nsNWHqUwrijQ2Ji+F5XCPCp/StkkqtUxtdRojXqtqE4=; b=j
	0BP/YFRcTHHA1+3u85CqnVFBCeIxVB6olArcugLHoDK/nyDkNVfZxiJ13Qge2qdmiKd/Tqa1YIlzK
	atyw1RtZOnCsOxzSVivIY97kLW0dRdt5agGxos3euuTRjsr6OP0eGA70lDt7bDwUfUhNthPwpkJx3
	fCtlFbpVRvubHfJZXfY0OCftn6rkWo9DoUmqYzx57K8M5Wl7UkCoF4ZfrH/EX7aFQdnOz68kaFIHK
	cLlAOxZQg35wbZbOAJIGUDc7ZpUPHhkLpDwdA10aa7p1ELkKj9tngcPAmwgNBwwSWa6kZjm4X73qd
	P25NTd3upiSIOmVGmILcuvbHZ8NP/Nw1Q==;
Received: from lantia.sysgo.com ([172.20.1.5]:53486)
	by mail.sysgo.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <david.engraf@sysgo.com>)
	id 1ter0d-000000003od-14Dg;
	Mon, 03 Feb 2025 08:36:43 +0100
From: David Engraf <david.engraf@sysgo.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	David Engraf <david.engraf@sysgo.com>
Subject: [PATCH] objtool: Hide unnecessary compiler error message
Date: Mon,  3 Feb 2025 08:36:10 +0100
Message-ID: <20250203073610.206000-1-david.engraf@sysgo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for using old libelf prints an error message when libelf.h is
not available but does not abort. This may confuse so hide the compiler
error message.

Signed-off-by: David Engraf <david.engraf@sysgo.com>
---
 tools/objtool/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index f56e277275341..38609e3612ba1 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -37,7 +37,7 @@ OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBE
 OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
 
 # Allow old libelf to be used:
-elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - | grep elf_getshdr)
+elfshdr := $(shell echo '$(pound)include <libelf.h>' | $(HOSTCC) $(OBJTOOL_CFLAGS) -x c -E - 2>/dev/null | grep elf_getshdr)
 OBJTOOL_CFLAGS += $(if $(elfshdr),,-DLIBELF_USE_DEPRECATED)
 
 # Always want host compilation.
-- 
2.43.0

