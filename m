Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654E1ACED7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864363; cv=none; b=a01efvnd1b1NfLLNoZxIYxKzTdowl+D12KZ+XOBu7sHB46f5+3ueJ3AGlQrrWQmO5eFOzPdh8DuC4wntRoecHMH6/WSoeV/3bgp5XPSTjg9RvzbGBPDmDaw6MbGE9qiO0HR0EuzObeYUIsC3196nzFGrSJ8Bo8YUbeihMIrZEnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864363; c=relaxed/simple;
	bh=XvsTlab4K4tlZOKAcDd6Aps9gg8wfC0OLm1ikUc8/Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFiTsgwxDj06DZ3eOCHwM8/id6o1OX4oRVa8WsOOz5wPwSukKw6HX3iRN9VtvNPcLUEWbD+7PGRpV16EgZHh/ZGvIgDOB+dRToVtjbcoxgSDYxZBZ2ydAeEZTV+CIIAWbDQjPv4cfkjYGiSOp5eo6RIMrIAqwOlHghDKbwpfvVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=aO1cWTIR; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="aO1cWTIR"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7G0MDkzlgTv9;
	Thu,  6 Feb 2025 17:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864357; x=1741456358; bh=Jerx1
	GQg0cQ28o+Q2EdhYR2BtploTBL+BI5HLtHj6H8=; b=aO1cWTIRrjxL1+7N5UOj4
	8R/fBg67aIJEQ2MQB9BzVfzPwZwf2q637VJc33d0CRzQaC0XMdIZBLWzc55uIk5o
	HmRScniYpW8vjl40Gd5o99W59H57fb0Ah9YTu/ZE3r6EMUjg/bi0Z27nH+Gun5oB
	0jP9wtNWeSiqOmIlx3agxpBNEn4uZLxZwa/3L5XFg+tWDpBj2E/430go5vzO4Bcz
	sKy2DDRfwSOkqNv1hTBXfa8d8EDjpwD4OsQ0Xh33FQ5QU4Rx4UeGqb44RsnWymMm
	wpbkiZ9pmLcqT/0NFseI6Ga9Xkoh3CLrA/8IT8W6Re4O4xckyY67HGLOkHaDi/pQ
	w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id WHnE2mexehlr; Thu,  6 Feb 2025 17:52:37 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl771hcszlgTy5;
	Thu,  6 Feb 2025 17:52:34 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH RFC 27/33] iavf: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:51:08 -0800
Message-ID: <20250206175114.1974171-28-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If the netdev lock has been obtained, unlock it before returning.
This bug has been detected by the Clang thread-safety analyzer.

Cc: Jakub Kicinski <kuba@kernel.org>
Fixes: afc664987ab3 ("eth: iavf: extend the netdev_lock usage")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/ethernet/intel/iavf/iavf_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/et=
hernet/intel/iavf/iavf_main.c
index 2d7a18fcc3be..852e5b62f0a5 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -2903,8 +2903,8 @@ static void iavf_watchdog_task(struct work_struct *=
work)
 	}
=20
 	mutex_unlock(&adapter->crit_lock);
-	netdev_unlock(netdev);
 restart_watchdog:
+	netdev_unlock(netdev);
 	if (adapter->state >=3D __IAVF_DOWN)
 		queue_work(adapter->wq, &adapter->adminq_task);
 	if (adapter->aq_required)
