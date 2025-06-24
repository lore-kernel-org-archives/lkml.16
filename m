Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826E32FCE3F;
	Tue, 24 Jun 2025 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777750; cv=none; b=JqEiBRIyjLl7CwtCyIp3oWfeT9ymME2haw5iyw6/h4EG3Qc8rmSYiYucFqG1wsdK0x//dqYbuPA1MvySnUvNAvuQfLYc7vnN/dxoXZH9WhlaFTvHjUNmvGScrOVNHWLpJl0Jko4SNOqaPNOH9x3bsc77HBGaFZ4BVoz7MJBqsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777750; c=relaxed/simple;
	bh=t3WbTLqr7+6TcQ5KLfFT3f6FYixepUlNaLPdLqQ2+EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFqFvmuqKvr4f9MLyHPTqhZDGjyschxEQXM1BN2YPTPFeMYyKVWQ3E3JQNWJLEIl2rp2xO6oGuSFQNSA/xT9om41LVq23RjXj8XFivwOdxrQQfaQKydFHtBXk5i3lqL69px5XuB14vLqTs71Lmtgls3FZ2YwyXU0d6aglFdO9Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mc0xTQ2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mc0xTQ2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30524C4CEE3;
	Tue, 24 Jun 2025 15:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777750;
	bh=t3WbTLqr7+6TcQ5KLfFT3f6FYixepUlNaLPdLqQ2+EE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mc0xTQ2XiwRqQKNHK1PpjgucSlhtybOXmmewaEz3W1j41+HLD0/ztzxjMJv/lDB+S
	 G6ITwD3ImrJrqRQudv1IkLwqWFgu2r/+PLlv4zHXujcYGqTwxsm2PRrs3BCt1zABcQ
	 fGmrMBRciEy3pgPsLn1rkKTB9zGnWs4OG4vHcejbDyJwdgrlafTnoXSgIWXhCwOTMo
	 uOYVEITaotqaF+vlQVd36X/hQ9GBM6IN36MjdHokpHlXzOaN1hgJE4nDuwqXiCEg3J
	 2p6ZO7xufHGbYc181SQu093TuKcknTcSh6DuxU5sCwOz/c7HvtX08yUQDxe9vkAO6B
	 OrucLoJJx2urA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 55/66] kconfig: gconf: replace GTK_STOCK_{OK,NO,CANCEL}
Date: Wed, 25 Jun 2025 00:05:43 +0900
Message-ID: <20250624150645.1107002-56-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are deprecated with GTK 3.10. [1]

Use "_OK", "_no", "_Cancel".

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.10.0/gtk/deprecated/gtkstock.h#L827

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 28953449a1ed..32d1815b425e 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -686,11 +686,11 @@ static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 					     (GtkDialogFlags)
 					     (GTK_DIALOG_MODAL |
 					      GTK_DIALOG_DESTROY_WITH_PARENT),
-					     GTK_STOCK_OK,
+					     "_OK",
 					     GTK_RESPONSE_YES,
-					     GTK_STOCK_NO,
+					     "_No",
 					     GTK_RESPONSE_NO,
-					     GTK_STOCK_CANCEL,
+					     "_Cancel",
 					     GTK_RESPONSE_CANCEL, NULL);
 	gtk_dialog_set_default_response(GTK_DIALOG(dialog),
 					GTK_RESPONSE_CANCEL);
-- 
2.43.0

