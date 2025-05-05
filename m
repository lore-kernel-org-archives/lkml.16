Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D5434D670;
	Mon,  5 May 2025 22:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484796; cv=none; b=M0+ffbg2DKPDnvWPP1HoARKO8baTBUw9oEfBYFBm9psBQXlXLR8M/QCL4klocWdEzoiL7y8Vzw2NiO0e+1NYPI7mfVzCTri73yLlmUQ9G4InEyDkfhb8iays0xQMU+8B2nhgdtPsTMUSBBD+N+nA6f+FB8hDpwGavNNMYJ0dYK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484796; c=relaxed/simple;
	bh=uuO6mDXQclPqjp6WfVLBdD0/cjM2MYWsa2dDKUm0Bpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QutmzvEm/oJjtepszaz1gGwPJj4d7Mv8UEul6JchgB9V5tfTemsAcBLyB06a3IwU5Nz6wQ8oC9MsDllfRqBmGl6K0D24N2HGdcEkGWKwhoKMnkMk6eIZtfTLvWvXny93WDH5IzUPbnkqikyb/zlCENYyZwJXJgRX2+h9f8OxxI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFLvLCbf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFLvLCbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EB6C4CEEE;
	Mon,  5 May 2025 22:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484796;
	bh=uuO6mDXQclPqjp6WfVLBdD0/cjM2MYWsa2dDKUm0Bpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KFLvLCbfadgd6RB86uv/tEuXoDnMeoQDcHWEj5yCuJBQWTOCrs74qpu9O93ZqtZ26
	 Alrh4AfVUbgv5ZJYqj+HSnYF3a+bYTRHR0BgUR2aOONqwIRozzODwwf8yfHnc11PMJ
	 4XaIUMrKyWoo9Ze4kmSvIyIq9FMjYimrOZ+23BxJmvwvYvbOZTI2DYnEOorNkU7QcD
	 k6pbT46rAO0S7ZPjKjs3Nfpa+De/+KD2pAtbWffpvG8Rnk3qPkOZ7gZdGVjZcuLd+j
	 957MWfFSSSQwk+bWbuB10GGcNCGZ2BeZnzkXLsSinyMytHC6MD7n117cV7HLW21hhG
	 HZi6oY1oxoWHA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.12 020/486] mailbox: use error ret code of of_parse_phandle_with_args()
Date: Mon,  5 May 2025 18:31:36 -0400
Message-Id: <20250505223922.2682012-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index d3d26a2c98956..cb174e788a96c 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -415,11 +415,12 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 
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

