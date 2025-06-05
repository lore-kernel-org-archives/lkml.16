Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E933062;
	Thu,  5 Jun 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146983; cv=none; b=hRqmPVAN5K/RwlQoTxIhnb/ZibPL7Yo2vg8+5HW6Q9WFuwqcChh4znP/DBQvLVpVLBbUJvv09YGy6fhJcCoEUBNPGJn6WjoyySa0AQf/i4HgGyaGsrbPVkIgiKDMutwGqpzL8MhjlyS4OF+XJ0LMQMX/zUsQVBsuYbN+tpM2rW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146983; c=relaxed/simple;
	bh=Rp2VDa72MCyKBoxXJqaWDSMumT5wb8LDONRr5pQZTqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UmtQX3dNRZPWOzxpLZ9FuTLDwbluocWaLCJYtduqgGepNxc6o1pAlZXdBoLRPxQkLsDwIXOopscWas8jwXiqo7xKJqEVaZsNWEutOhHpBS8m61lelWcSK2dQVl7OrIYhrtLB95zmh2jyZLqs4GdhFVbnBhiUuQ75OKqG8/tw05w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/1gYSKT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/1gYSKT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE71DC4CEF0;
	Thu,  5 Jun 2025 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749146983;
	bh=Rp2VDa72MCyKBoxXJqaWDSMumT5wb8LDONRr5pQZTqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=h/1gYSKT8EpyqssVMG4psXkPPj6CLurGETBSJ5OGMCzvlSI4CcpfTs2xZOTrKM6RU
	 l45Ejquii55LDJPI1yN6Lx/LLQo29Al1WNlMVYWz7mmW7TbMv4JF3ldN5/KuKQvrlV
	 J8rPPBVTx6bdi5sZQK+BPkhYbZzK537EITiclBNWxeW+o3MBg0Ylsz96PQSGCKpXgN
	 zcT1YcdqtIGxkQ8YulMiErs8tMKsWjcfEelgXXs7ZEf3VnJbHieSZ/qeNUUItrhmnM
	 qbS0S+b0rIAO4trDVIfChYkj+iVSStMKQ6FR2aJUlQXrTqFf8SkCdIuT6/3JS/F1tV
	 8FMeRGolEY3sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DE5C5B552;
	Thu,  5 Jun 2025 18:09:42 +0000 (UTC)
From: Jake Hillion via B4 Relay <devnull+jake.hillion.co.uk@kernel.org>
Date: Thu, 05 Jun 2025 19:09:26 +0100
Subject: [PATCH v2 1/2] x86/platform/amd: move final timeout check to after
 final sleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-amd-hsmp-v2-1-a811bc3dd74a@hillion.co.uk>
References: <20250605-amd-hsmp-v2-0-a811bc3dd74a@hillion.co.uk>
In-Reply-To: <20250605-amd-hsmp-v2-0-a811bc3dd74a@hillion.co.uk>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sched-ext@meta.com, Jake Hillion <jake@hillion.co.uk>, 
 Blaise Sanouillet <linux@blaise.sanouillet.com>, 
 Suma Hegde <suma.hegde@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749146981; l=1850;
 i=jake@hillion.co.uk; s=20250530; h=from:subject:message-id;
 bh=DcrUhCb55n8ASrZIC4qqjZnNnLTtVJQObbV09RavYQs=;
 b=QHsNbh+TvHcLUDzYRlqrQXjev8/VDGsMktMbzSUpCFE2NN8u+GBR9hb0BMT4zBOYj2Yg5N6Fx
 vBH3Hn04eEND0TSP3MCWZ8656DBJwaxeUwYxevnfHx6GHvQEQaMqzp2
X-Developer-Key: i=jake@hillion.co.uk; a=ed25519;
 pk=8cznmqtMcMEcU8QH55k8DrySboD889OBB/BEUMJh3dw=
X-Endpoint-Received: by B4 Relay for jake@hillion.co.uk/20250530 with
 auth_id=419
X-Original-From: Jake Hillion <jake@hillion.co.uk>
Reply-To: jake@hillion.co.uk

From: Jake Hillion <jake@hillion.co.uk>

__hsmp_send_message sleeps between result read attempts and has a
timeout of 100ms. Under extreme load it's possible for these sleeps to
take a long time, exceeding the 100ms. In this case the current code
does not check the register and fails with ETIMEDOUT.

Refactor the loop to ensure there is at least one read of the register
after a sleep of any duration. This removes instances of ETIMEDOUT with
a single caller, even with a misbehaving scheduler. Tested on AMD
Bergamo machines.

Suggested-by: Blaise Sanouillet <linux@blaise.sanouillet.com>
Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Tested-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Jake Hillion <jake@hillion.co.uk>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index e262e8a97b4542a389e09a82dad71f7d2e8b2449..f35c639457ac425e79dead2515c0eddea0759323 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -99,7 +99,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
-	while (time_before(jiffies, timeout)) {
+	while (true) {
 		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			dev_err(sock->dev, "Error %d reading mailbox status\n", ret);
@@ -108,6 +108,10 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 		if (mbox_status != HSMP_STATUS_NOT_READY)
 			break;
+
+		if (!time_before(jiffies, timeout))
+			break;
+
 		if (time_before(jiffies, short_sleep))
 			usleep_range(50, 100);
 		else

-- 
2.47.2


