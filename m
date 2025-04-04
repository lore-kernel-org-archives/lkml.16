Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14AC1FF5F7;
	Fri,  4 Apr 2025 00:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725198; cv=none; b=qRGzKbQadx/7+W4uWgjOU9MFUn+nC114T2v6c3mncoqjevgqgayX21F8wPyXgxDvgyDOd9U0Rj79E8ebfe8nCHpVdBv332wa6tvQEyytMDgF/KJvOG/yPZUqnBgJC4ek+I8kls2dDkFsLEBU6MkOqYsp66GRwIysxUsoF7sEKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725198; c=relaxed/simple;
	bh=ud2Clr4L7/Ow8mwhn8PqJLa4EDYkFflm4euIQs6jsiI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZFUjtUvVbQ4Z2HR/xDJbuf4wkduRkrjlZyCe/cT2k17kiJZoEklbyDYIXjZfKuGMI2sFWIgVuI2t61ZP2Q1am2C7maSvNlAhWd3JmkI0fkZVCJ0n7JlMk3juC0dva7qUtXQ+29NIi2xdtd7HXV10pHOa6AoYkvcoOVhpn2U1hfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHpmo3iF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHpmo3iF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFACDC4CEE3;
	Fri,  4 Apr 2025 00:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725198;
	bh=ud2Clr4L7/Ow8mwhn8PqJLa4EDYkFflm4euIQs6jsiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZHpmo3iFxaEJl7a51IcfAgWn9JCYuWJaUJIOGg+WfhTGczRAx6ZFvcmNzzraLA1+X
	 HLCr7oegvX237xkwnrYcW7MmS5f9hGJoCQyxRCu4yVn72bjdWTERVX7E/hOM2CFs95
	 oqQI9BGqOPkbyMAJzXxN3+lt9t3e+Id0CsooSNnDhPrJry0cVhmI3RJjH+NQoUrNEP
	 v3bqte3sf8En6/he1vu5et7wX2Zl2/WsZlkNtn2+iC9Ygsqy6R7o72oJD+0I3LxUh+
	 zrVozvxxDUZJVknl6CWktbhOaxtcIUM2qPwKllZIFft5P/Pae+BA3JpmxPjjRHxMw6
	 XDn3ovYptVPcw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kaixin Wang <kxwang23@m.fudan.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sasha Levin <sashal@kernel.org>,
	sre@kernel.org
Subject: [PATCH AUTOSEL 6.6 05/16] HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition
Date: Thu,  3 Apr 2025 20:06:13 -0400
Message-Id: <20250404000624.2688940-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000624.2688940-1-sashal@kernel.org>
References: <20250404000624.2688940-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit

From: Kaixin Wang <kxwang23@m.fudan.edu.cn>

[ Upstream commit e3f88665a78045fe35c7669d2926b8d97b892c11 ]

In the ssi_protocol_probe() function, &ssi->work is bound with
ssip_xmit_work(), In ssip_pn_setup(), the ssip_pn_xmit() function
within the ssip_pn_ops structure is capable of starting the
work.

If we remove the module which will call ssi_protocol_remove()
to make a cleanup, it will free ssi through kfree(ssi),
while the work mentioned above will be used. The sequence
of operations that may lead to a UAF bug is as follows:

CPU0                                    CPU1

                        | ssip_xmit_work
ssi_protocol_remove     |
kfree(ssi);             |
                        | struct hsi_client *cl = ssi->cl;
                        | // use ssi

Fix it by ensuring that the work is canceled before proceeding
with the cleanup in ssi_protocol_remove().

Signed-off-by: Kaixin Wang <kxwang23@m.fudan.edu.cn>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20240918120749.1730-1-kxwang23@m.fudan.edu.cn
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hsi/clients/ssi_protocol.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index da6a7abd584f7..f8ccb29c63807 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -401,6 +401,7 @@ static void ssip_reset(struct hsi_client *cl)
 	del_timer(&ssi->rx_wd);
 	del_timer(&ssi->tx_wd);
 	del_timer(&ssi->keep_alive);
+	cancel_work_sync(&ssi->work);
 	ssi->main_state = 0;
 	ssi->send_state = 0;
 	ssi->recv_state = 0;
-- 
2.39.5

