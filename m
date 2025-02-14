Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05F1C861E
	for <linux-kernel@vger.kernel.org>; Fri, 14 Feb 2025 21:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739568434; cv=none; b=bqcdJp52ULPJHQIYpOq6N2znCSk5Hpp7/x0u7dq4/GkUcRR13oeEm5oqvotf0RY0Ir8itNsnCTwkzociehV1eNDCTmJz/DX1AmabO7hTPSIPO4DHXV4tOz2UnZIY7D8W7SFBW+dZg1mdJU43hPv1oRtY3i5dkD0BJma4OWDMqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739568434; c=relaxed/simple;
	bh=LxTLhoBJdoXXGNY+yZ5eiK4g2XkgRoKuBiTWWjJhl8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kBkKLdDoJ4FgomsCJ1ZMAf+RZprshkuAMx3kGyx3GSNEdGDcDean9JQMySDa9N/7V56NaDdfRqna+CeQpUwxiGfWuoWnvKG/PzYOZqbYrV3RTRUF2YgkqBrdAWAFrwmdYLW9uCjnCxpF6C+heHuvQR8u9Fk6Ls9WVaty+bYVLMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tYClZI4n; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tYClZI4n"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739568429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2HvK3KACg1xo76IcMN6cxcxvRYECoBQVtmolGvFTK1Y=;
	b=tYClZI4nrW6qzqwOUtHUbrpRwlUlqGd1xbU8QJUnu2VYx4QTEQqZU2ybGzaDuysOGPWdSY
	ZL88KRHTlveVifmWbCD0g+dx9nx81rMlHWMn/oHwPt7YZMzM0F6SwLExjYBgzakh1jXF9h
	hAHc5Jb8psp1CVjpQbOVRTrFn9Ohdek=
From: Sean Anderson <sean.anderson@linux.dev>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next 0/2] net: cadence: macb: Modernize statistics reporting
Date: Fri, 14 Feb 2025 16:27:01 -0500
Message-Id: <20250214212703.2618652-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Implement the modern interfaces for statistics reporting.


Sean Anderson (2):
  net: cadence: macb: Convert to get_stats64
  net: cadence: macb: Report standard stats

 drivers/net/ethernet/cadence/macb.h      | 130 ++++++++--------
 drivers/net/ethernet/cadence/macb_main.c | 190 ++++++++++++++++++++---
 2 files changed, 235 insertions(+), 85 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

