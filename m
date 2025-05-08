Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A286323
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681328; cv=none; b=Kg4vzTNH7BZIQ5zXKzfxZ5vWgZ9vVFd0I0JrDRpUiNxOV7bxWeeUUaGK0yRTIzgOpZusdhy63tHgkfvmAnLAkpeuhbh56+kdmKdXfyx4O3ofEtk3ta+TiHp+ZZo7Q4R/M6RfIm4nuBkYn568NEdsQdoaXYmMy2uEQ4n+3hqhvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681328; c=relaxed/simple;
	bh=/hARkMOKpnqTRO5qCGYl55JwrDlM4e9qcCsjRnN5ySI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqtUYIAFiiKk5zkfRiQTdEcpM4EMzJSPTeWuyqA+5ehU9apVzzxxDY4nU7o1BSD6XPQrzLqEEeFUlyO/m43DXo0qyq5SrX2hHgoTtFjUipj35KvI1+bPUpNNWMn2zL3QOb4smZ4zB9TEqSTpYKdUTLNowRKFJZBZnXoVSfBUdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wOfMyt0M; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wOfMyt0M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Pjw6YWsk0efYji0LlHk8VhgxhNm4WKtk4AAmmmvIayA=; b=wOfMyt0MehTzL2oR5WGNyFQaXJ
	Uh3Z5lVUqcBvEbz8e3KC/jZ5oWQjDcmeLtG6VVDcsXLqzKG9gZeEZ4w0LFvWNZMyHjhJpZgzNBUQp
	+ZnnhAuZOTJLYh7UOFduq1JQ3hQnKfA8cqF/oIGyZDKqWqpiugzRXEr4NY6LtjGH0kUBd2CkqCimN
	zUFRhXVQkoC5Xq8iKjZxMCIru3mLDf8p9pJkxzLZq5LEGNG9F3bQ/yWh37ASEgSQqtXgUGs6DFhRp
	PiH3JmRX2kZF1IETFdLBLAigi0HRsJrk/Plr4EDodv8i18AtON4dnsEYpVP3sUzSDuVhu5fTCqpOc
	AOAdh2Mg==;
Received: from 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtbR-0000000HLfg-1zgp;
	Thu, 08 May 2025 05:15:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs v2
Date: Thu,  8 May 2025 07:14:26 +0200
Message-ID: <20250508051520.4169795-1-hch@lst.de>
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

Changes since v1:
 - pick up the bug fix from Chao as patch 1
 - release the folio batch on early exit
 - remove the dead for_reclaim handling
 - keep the ability of the caller to exit early for the redity case

Diffstat:
 fs/f2fs/checkpoint.c        |   36 ++++++++----------------
 fs/f2fs/compress.c          |    3 --
 fs/f2fs/data.c              |   23 ++-------------
 fs/f2fs/file.c              |    1 
 fs/f2fs/node.c              |   65 ++++++++++++++++++--------------------------
 include/trace/events/f2fs.h |    5 ---
 6 files changed, 46 insertions(+), 87 deletions(-)
