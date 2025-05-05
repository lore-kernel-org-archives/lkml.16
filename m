Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FD51F470E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437177; cv=none; b=bb0cdu7zHpaDgiuU1jCeCH4j+dbxuzz1PVfrNS1DonwxjNBdaEqpcj368NrK9SodtUDYuEXV/vu20IirM/NnvOLsRWtFU+ocTPIgSh6xBMMypESr18L7PVwujdd40zOYjO+kSiidnbPadsdTx3FE9gyJKZOD5H4fj46CTqo47dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437177; c=relaxed/simple;
	bh=xdEqepopFNMt3QfG3qsg4ulBtT9fvVFhq3Xs9bY+g8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mU+8GRYq5jRkysqfcUUn/2xmIbIF5xs4x1uW4yIZjCxtJ//BZsJeGSJS4/5NyobQe6JWBiizjOswkBFw3s4/B8/gHpA2Mwy8uPjPy71kZrId0AJJErh2pEE/3lXdn8ykKQloYffKkrvyF9jTHdWce/kLYFMwKZW86vgA+czYLFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JNHUwpIZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JNHUwpIZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=f1sTMSOBzu0B7rohGVf8pLqnRhw+Xj/rENtZqkY8DwQ=; b=JNHUwpIZHPEPY+YOqZgFuhj1PM
	IulJ4W5KSjTNyTntfJEuKCKrtRsOHzVxPdZaiMhooiE2cE0UF3GuaBanT8a+wHnfxp/ptQlywliZK
	vkHwEvwXKUkqxfWoV/4YT4Qckiap6nFqhzR4x/dFLpX3ZkeuCTRpKMnpBWqN45yCOeKVHCH+A5Hr8
	TQHAl2oRl0Rpqd65APR6z1h6ZBhVw31j6iLESEd2pJ5vYy8OOVVE4HF7K0zN1TrMOwu1P1xa+Xkwg
	IRXbL50M9JCscIQ2YD5Le1imjSIPUylmqQO1hxikkHQ0pYYYRa3PWWs842OilnyPvXVfOvWjyODDm
	EZqvLwLg==;
Received: from 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5X-00000006ukh-17FO;
	Mon, 05 May 2025 09:26:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
Date: Mon,  5 May 2025 11:25:57 +0200
Message-ID: <20250505092613.3451524-1-hch@lst.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.

f2fs_sync_node_pages can still return it in a way that is not handled
by any caller and eventually is propagated to userspace.  This does look
like a bug and needs attention by someone who actually knows the code.

Diffstat:
 checkpoint.c |   22 +++++++++++-----------
 compress.c   |    5 +----
 data.c       |   13 ++++---------
 node.c       |   43 ++++++++++++++++++++-----------------------
 4 files changed, 36 insertions(+), 47 deletions(-)
