Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB83AA167;
	Mon,  5 May 2025 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487104; cv=none; b=ccxYUE6izyBbFpnjqViGEWWCX9+7lRKdv1bBw9giFEEKAXHMfA2wXu5lJaSEAPNF7G8P5vAYfTGawAWCkp8M+mw8cSgvLXjrjTQ9FALWaXbIdhmUQcnxAUB9ne4XrJrdZcE5oGtnbRVjOlWGm7lvl0MQZCszBoAH/J9RsDHaejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487104; c=relaxed/simple;
	bh=zEWgyvgE0K3/6juLqJn8ugmpW06gemNbsD2fMXiHnzM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t/owmNni298l6eV+0sRzUlLr7jtr3VIUA0rAc9iuRLXbl2te4JYTUdXcABo/7g1a7x41DwVWPM3Il4V+PRSPTEZQtMfoLhQCTj+NXqGnG5m4+KMTcowH7GTfjSs1n/4TtnmoxZKabIp35zwx7mpvtNyF8oMlcifpmvyb4CbhCQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2zPjEek; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2zPjEek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F43CC4CEF1;
	Mon,  5 May 2025 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487104;
	bh=zEWgyvgE0K3/6juLqJn8ugmpW06gemNbsD2fMXiHnzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2zPjEekaW8EO1MfSHybTR+0SAp1w0PRBrIrdgSabG995cfBjBbHZ+y0cTYrTMO7c
	 ZepMpWCDiUC2q5ql1hyB0huJLp3OmCsXuqS2SZx9ZDGsOv2LH44nZx4QebMFb0RmIL
	 TwDsFiDTdMR7SmX8ts/ksxMr0YP1XOaYsd4G1afPVGvlBovYUvNU4GL99IREvahZxn
	 O+ScW0BKcEf7jrVfZf9YLOpiosBhWZJGVy+i4M7+OJOSXJYxt7WkQ7KiaCgT17A2py
	 ylYlGlfFFxaixtJgnPwy+qCeBOhh0f/Zd9fR41wj2h51buRHaqH4pUy+mnFjEjigAg
	 uozKE4chDAqaQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.10 003/114] mailbox: use error ret code of of_parse_phandle_with_args()
Date: Mon,  5 May 2025 19:16:26 -0400
Message-Id: <20250505231817.2697367-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

[ Upstream commit 24fdd5074b205cfb0ef4cd0751a2d03031455929 ]

In case of error, of_parse_phandle_with_args() returns -EINVAL when the
passed index is negative, or -ENOENT when the index is for an empty
phandle. The mailbox core overwrote the error return code with a less
precise -ENODEV. Use the error returned code from
of_parse_phandle_with_args().

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mailbox/mailbox.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 4229b9b5da98f..6f54501dc7762 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -350,11 +350,12 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 
 	mutex_lock(&con_mutex);
 
-	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
-				       "#mbox-cells", index, &spec)) {
+	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
+					 index, &spec);
+	if (ret) {
 		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		mutex_unlock(&con_mutex);
-		return ERR_PTR(-ENODEV);
+		return ERR_PTR(ret);
 	}
 
 	chan = ERR_PTR(-EPROBE_DEFER);
-- 
2.39.5

