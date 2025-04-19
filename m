Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1117FBAC
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745094626; cv=none; b=JyCLgRfLm2fRVdj5mimMvnBeJVsgP0ok6Xq09DnFK5OKFrt1+SR6nzsxBDEqXHAZt5HjP1fzrIAH7U+eoy3YZSvdZPwOg5g24I/ZCjTxIDZjE4Iz4L3iBO+KAKMQbTFPmfYu00ukrGf1h4vySFfRNrq60BGh9BvvAw/BfcaEjRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745094626; c=relaxed/simple;
	bh=AT5cQz843+ttCFmLen/Jb1vAKaClfrRIV+pvoXaRpp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3RjkyAhNCzF9hUbdcAx2l52jXTV6hWDZmGK0THGUFfSY88htt9OJRBb0d7iwKcpStQEvBoWNT25BuOJ8KvP2h2QmDry9RdNSFIB2IUF7bhXxuJr3+r1jD8ktlvX8RcnqDkUNgep+dgNGHz3SVJerodJhu8vgQtalCOxoBY4AQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ryGY9t+A; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ryGY9t+A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=v88t7GWkaif4LUCwqSrNJ8oLhptnquOidooGC1aX/Pg=; b=ryGY9t+AqOGXU2MY
	Nrl18M23AuT3xJj0Mv+eLvLPzauHeByEBoCo0w8wCGm5DQOcLH2JB0KjE40HjQ7UbFdwN3MG6ZgHo
	54Wx5DQ350oVe5SQBzDMwt1R5Rsx41uVx5N5ilvmDM8XStidvgkro+bEd4l65H8dEVAuIguCu34+Q
	Hz5b72lf9elcjCDCoYQXk5AhaD3fLsjCD7cy0rqbUkT2GilSQVB03fBuBW7QNtQbnf7z9Ba7D9teN
	PnjmFU/W9jUo83hPQ6ku0XerZ/jM7MAN3oIjcQ7qaSiP+t/L9h0yPDxP8dWu4bEnBrANk2OafrZlM
	D/HUkC6M+cuaV1mlPQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u6EpJ-00Cg8b-0p;
	Sat, 19 Apr 2025 20:30:13 +0000
From: linux@treblig.org
To: akpm@linux-foundation.org,
	mporter@kernel.crashing.org,
	alex.bou9@gmail.com
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/2] rapidio deadcoding
Date: Sat, 19 Apr 2025 21:30:10 +0100
Message-ID: <20250419203012.429787-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This is a couple of rapidio deadcoding patches.
The first of these is a repost and was originally
posted almost a year ago
 https://lore.kernel.org/all/20240528002515.211366-1-linux@treblig.org/
but got no answer.
  Other than being rebased and a typo fixed, it's not
changed.

Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (2):
  rapidio: remove some dead defines
  rapidio: Remove unused functions

 drivers/rapidio/devices/rio_mport_cdev.c |  20 -----
 drivers/rapidio/rio.c                    | 103 -----------------------
 drivers/rapidio/rio.h                    |   2 -
 drivers/rapidio/rio_cm.c                 |   6 --
 include/linux/rio_drv.h                  |   5 --
 5 files changed, 136 deletions(-)

-- 
2.49.0

