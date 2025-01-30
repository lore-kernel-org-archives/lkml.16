Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5C1EE7C6;
	Thu, 30 Jan 2025 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738256217; cv=none; b=SECBxjsiMV6SsxDK/ZwVBeChu4p9gdkwwutbVAq8wICmO63GF5JWTX/KCVkmCGbjzP8wY9fTL8W3/RVcRFG3LwIbA1P/8jSeihC8FmkpXwvVoN/zMY2bT/iBApizljiNq+HRprMj9XQD6FyEkBsbO9+L4XvsniSY9Fju1i5XS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738256217; c=relaxed/simple;
	bh=e3rPCfftpKG5F6e3nkzKBeR4qdUstLasOd1XdxoIG/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cdD6FQYYQHjckmJ20iidk8PZZXZVrG17DPM9OPTV3PbfNKKKX1D2vrRnO/1myo9s+zohqsnIeju46LmLnsEc+lHDMb/NKKvdwc4Dw4KI4iJMYKRE3hfPD5+DDOCiQzHjKQ5/EN+vC+pGsTaTQDKD2ylVa4ho6zC/6u8VreUID/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KfUIdEXj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KfUIdEXj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EC505404E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738256215; bh=wwzwM1vSUakgnP0IQS/nsASYkVQuwwlo7tSgSrrXrpA=;
	h=From:To:Cc:Subject:Date:From;
	b=KfUIdEXjHQ3IetVbSpJJa3yV6yLuktQmcz5ecISk7xT+jnylRqcVagL7ewRT101LI
	 8EHTQoknGeF7PvIym5GNFvq8vvNcFhBoopnuJ2CAfFfGao9fqIhlUn+ESc66+0D29/
	 v7ar1dLwInzttkJLjcWR2zjRBTOX+MM4yk9dZSOJIy02eS0mhry5f9Fydl6DLgr4xn
	 iUFJk4Hkfq0nd3cqTLJZNQ6JqNePxb6h7n0vQ6odtKZnk+jRIHmvioarP7XpHYxZmc
	 yPk8Mv3HWPxcicEo4+7WRaA4TxqmRxsHLwv6msfkOnnE5X0W1KyX/sFKbbh8yi+9iJ
	 bWZBR6xYu9g7g==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EC505404E2;
	Thu, 30 Jan 2025 16:56:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [GIT PULL] Two documentation fixes for 6.14-rc1
Date: Thu, 30 Jan 2025 09:56:54 -0700
Message-ID: <878qqs1bqh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 6912bdb7c676019b6dd4520f555079c4d3ab1bdb:

  Documentation: Fix x86_64 UEFI outdated references to elilo (2025-01-16 11:21:29 -0700)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-6.14-2

for you to fetch changes up to 96720ce8b1fa72659ab03544516ceaad6bd1ebc0:

  docs: power: Fix footnote reference for Toshiba Satellite P10-554 (2025-01-28 15:02:17 -0700)

----------------------------------------------------------------
Two fixes for footnote-related warnings that appeared with Sphinx 8.x.

We want to encourage use of newer Sphinx - they fixed a performance problem
and the docs build takes less than half the time it used to.

----------------------------------------------------------------
Bagas Sanjaya (2):
      Documentation: ublk: Drop Stefan Hajnoczi's message footnote
      docs: power: Fix footnote reference for Toshiba Satellite P10-554

 Documentation/block/ublk.rst  | 2 --
 Documentation/power/video.rst | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)
