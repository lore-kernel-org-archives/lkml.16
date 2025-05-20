Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A251DE2CE;
	Tue, 20 May 2025 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756651; cv=pass; b=jx1pcYMJxam6PHRar8f6SMXz1RqjH34VGhlc6RTDCIVezoqP2zqz6jUmKJv0ErvZ3tXBoc0CJuCRpiBDS17jaYJXT+etmrU0mVH0wFTu4URhTp8f5d9wTeX8pi1BKvsKHp5JNWozpFcnC1kEb841ur5EZ1R0Q42cNNDO1lESvw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756651; c=relaxed/simple;
	bh=v9zQJEyTHVl1Upf27BmSemUeoxDmaocWCzUCXnyOGz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XiVjW6qyzg7t/xUPoUzqsqtE1FOYVB5Iy3umJVvgavFeQYp0YN+Ob+8gcaQQpN2OjnDW2Y+msToE39kyFlN0Rwmttr2QrzFKEl7hW7QhqBxBheYZf1uk/dcfTWmkpaJ5sYrvEmYs7mcPe3GIkkexqIMRd/yvZYzc7C6pxgo7MwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=fYU2XLcQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fYU2XLcQ"
ARC-Seal: i=1; a=rsa-sha256; t=1747756641; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FAuuPs2EGEjrF5/ijPrNNQPHljXOs8+RhblsbzzN0psEc8kw1/7iO1MPacJy39tHpnXUpimhdQSGzzPnVXIRQYk+xnC5bR5y6DGr4NxvUuWa6OyBOi5ojNDNr4b0Dm2LOh33SAePlyYYJApXQWFU5GOK0cfqdZ2hEorwWAZwk8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747756641; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZqO3M2O/Ab6tmQah55wUM/rusa8GvhCdTSgFUG8XpAU=; 
	b=XMgLIJRxDgm/7BFdJ+azqusLdYp4wzlbupb5q45bmq/ZiIpbTKQM2iQzsnumGOquUpZ2VzM+c5PYD9nOnt8zUkTDdT4YKOVsk1pnhYiwKB38z1pAbFCNqUkyDgRrJ5MA40cnNFuPpalRCU7tF+eKroq0wWV+05pksOkitY0G6LE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747756641;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=ZqO3M2O/Ab6tmQah55wUM/rusa8GvhCdTSgFUG8XpAU=;
	b=fYU2XLcQXxBHXM4sLUR7GMBJdjRFJOih/LaX09r3lobZ1i+/9AJs5NhtoSz7ngb1
	7QIDPXYmGgQtQRSK0qbOjvWFfapMFGSZL0Of1Y8u6AGwXCxu2g8QUZpamKcXat7g/7T
	Db3JZWJ+eQutnu1ggBaQoHNQt0d1YWOTYRYFK+Cs=
Received: by mx.zohomail.com with SMTPS id 174775664091859.76751643415673;
	Tue, 20 May 2025 08:57:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/2] Add linked list documentation, and also documentation
 documentation
Date: Tue, 20 May 2025 17:57:13 +0200
Message-Id: <20250520-linked-list-docs-v1-0-db74f7449785@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqmLGgC/yWMywrCMBBFf6XM2sA0JGnir0gXeUx00LaaVBFK/
 91gV5dz4ZwNKhWmCudug0IfrrzMDfpTB/Hm5ysJTo1BotSoJYoHz3dKbeoq0hKriKSD0yYpgxK
 a9iyU+ftPXsaDC73erbweJwRfScRlmng9d15rE5K1MjhlZe7DQB4xx4xDdiH2xmWFKloY9/0Hh
 TUjfK4AAAA=
X-Change-ID: 20250520-linked-list-docs-ce5b956d4602
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

This series started out with a much more ambitious goal of documenting
every undocumented generic kernel data structure. About 6 hours in I had
to tell myself that maybe it's better to do this piece-meal. So here is
the first of what will hopefully be many similar series: documenting
linked lists.

It starts out with a mostly unrelated docs patch for sphinx usage,
because I couldn't help myself.

The main patch follows, which is to add some rudimentary documentation
for linked lists, to test the waters on how receptive the community is
towards this type of documentation.

Should this style of documentation be seen as acceptable or even wanted,
then I'll continue in subsequent series to expand both this document,
and move on to other underdocumented data structures, such as
hashtables.

Based against lwn/docs-next, but b4 should let you know already.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (2):
      docs: Document how to use the recommended docs theme
      docs: document linked lists

 Documentation/core-api/index.rst   |   1 +
 Documentation/core-api/list.rst    | 390 +++++++++++++++++++++++++++++++++++++
 Documentation/doc-guide/sphinx.rst |   3 +-
 3 files changed, 393 insertions(+), 1 deletion(-)
---
base-commit: a556bd882b9482f1b7ea00fcf07f9bc169f404c8
change-id: 20250520-linked-list-docs-ce5b956d4602

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

