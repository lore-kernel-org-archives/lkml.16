Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666423ABB2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668679; cv=none; b=PKfNFz404kJuBYYxlYCXPf3jQifciq9qxS4EBBHwku46kL3aSQghW3uJu+EacXOvu2mvbF9Sfa4gSgBKaGEVuQFn7wBdSjH2sK1S7yLM+d4RVfCAMBvJoY+dw5RCRzUXYz62gYxCocRE4ysypIR/s0AocNxSenPvhdubkdlI65w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668679; c=relaxed/simple;
	bh=L8GWG2KH1o0/TnFj0G0JDU/9Qiu2V2pg/7sTEYriwcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2caWHivKTZ3n8rp3s5yzyvIbYuvfaEQ6/6S6lbCR7fGqsndtRlWvn3EICGfExKJ0vdtY3RcEzy0jWObStpqZW5YDGUVt+MzCMJycURNXFYpdYmDGrq8xmXTqPR41OjDhomnCtnycqnyZIuLHvJ1A3BnJ0Ci6v37TyZqYHRI5BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovllNfrr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovllNfrr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616CCC4CEEA;
	Mon, 23 Jun 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668679;
	bh=L8GWG2KH1o0/TnFj0G0JDU/9Qiu2V2pg/7sTEYriwcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ovllNfrrWktLR/MezyQQ8zYxdaQbBLfJeWps47/Fzg1dCIa+0PVGIEUtwbaAsMYXL
	 QaKr/KhBq6F05iFLJraSzmIdnTuhfxZi315/kFgue++OLNPEKrTHhYvJc0jvX3L0x5
	 /wsNFbnkigP+8ro1t6t1853XDEPne7L0f3oySztsu6lFvvNf4vq6MFUfPNcQZv2z4t
	 wkWUQQl4jiVm21GTwOAvCC8a80uZSwi1bhHpksK9lj+bqRHXS+ZKLn9lw1YEL1jUDh
	 WpvLdcX6nwmOJG1mrkXIDR9wtiNuj19Obc4LdFiUMhTRggS+u10T99LUtYMQxjzqFI
	 EY0DQAPqORipA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] mei: bus: Check for still connected devices in mei_cl_bus_dev_release()
Date: Mon, 23 Jun 2025 10:50:52 +0200
Message-ID: <20250623085052.12347-11-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085052.12347-1-hansg@kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mei_cl_bus_dev_release() also frees the mei-client (struct mei_cl)
belonging to the device being released.

If there are bugs like the just fixed bug in the ACE/CSI2 mei drivers,
the mei-client being freed might still be part of the mei_device's
file_list and iterating over this list after the freeing will then trigger
a use-afer-free bug.

Add a check to mei_cl_bus_dev_release() to make sure that the to-be-freed
mei-client is not on the mei_device's file_list.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/bus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..1958c043ac14 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -1301,10 +1301,16 @@ static void mei_dev_bus_put(struct mei_device *bus)
 static void mei_cl_bus_dev_release(struct device *dev)
 {
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
+	struct mei_device *mdev = cldev->cl->dev;
+	struct mei_cl *cl;
 
 	mei_cl_flush_queues(cldev->cl, NULL);
 	mei_me_cl_put(cldev->me_cl);
 	mei_dev_bus_put(cldev->bus);
+
+	list_for_each_entry(cl, &mdev->file_list, link)
+		WARN_ON(cl == cldev->cl);
+
 	kfree(cldev->cl);
 	kfree(cldev);
 }
-- 
2.49.0

