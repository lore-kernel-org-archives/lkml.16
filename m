Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE02F2E8884;
	Tue, 24 Jun 2025 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777704; cv=none; b=lFiPnwzKrjzkoUJQmUB+MRfeviuwg5hLdgxTtK4UK+8KlPGdCqdpaAepz28IDCcsVY6E8+x/CozB/5kM79YA30YZdm3FCNKVrQ53emJiwYv+D8qo/0hS0zCi/ezh6AmCTZf/1S9uxORkImkomnXut2Hp9yn1CVwkJJ6+ixMVXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777704; c=relaxed/simple;
	bh=KVe0746hXNPejZk1YodN3h2TERUQYGYoz4tNbuhM7b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbSVCDI5vjirb4F0Dr9G3f3WUuCY42TuKpLyihiE1PqRO/YQdMb1L34Yh386MNxk00LoNBpKeE/xdSRsh4mKwFp7h+cpjFR6p5knLYINWs2Z2+cuisyrfYSN1q+ZkHnE07/wUp/zhO8tO7RobcC+e+5FZKdypymRoNIvGUxxYkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRuzZuba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRuzZuba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA0C4CEF0;
	Tue, 24 Jun 2025 15:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777704;
	bh=KVe0746hXNPejZk1YodN3h2TERUQYGYoz4tNbuhM7b4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uRuzZubaP0wbgErwqGmwxaaUeEVMwdBDRcsiizi5ZmC+lI05jm2/z2oCpoa/Ucuho
	 pAWNL3NNLfKJZaEuFiNyUdlaydb+WBF0gxaPSbQMABBCnmvMVle7Eunqc5+eY66J7y
	 2xRfxwlnCYUJ4xORQPDFHyYbwAwfYVFAgMGS15hAIQv8hrskuOmdIy/RH66be+Irlr
	 0nZEMBuUxfvyCDT7Vn9HrVcvl+96rXm/3v+DJDI7nksyvYrkV6BzYOasSQyQElrfet
	 Nm4SLiL+IzAaK5pWArYovre/4mt7HNb44TGxGGtmBi+g/vvVSVdEo9vartYzWpPXs+
	 J0sKsGaJ26Lxg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 33/66] kconfig: gconf: avoid hardcoding model2 in renderer_edited()
Date: Wed, 25 Jun 2025 00:05:21 +0900
Message-ID: <20250624150645.1107002-34-masahiroy@kernel.org>
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

Although this is only used in the right tree view, it is better not to
hardcode model2 for consistency.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 2d7a556eddaf..66c58a15b717 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -486,19 +486,21 @@ static void renderer_edited(GtkCellRendererText * cell,
 			    const gchar * path_string,
 			    const gchar * new_text, gpointer user_data)
 {
+	GtkTreeView *view = GTK_TREE_VIEW(user_data);
+	GtkTreeModel *model = gtk_tree_view_get_model(view);
 	GtkTreePath *path = gtk_tree_path_new_from_string(path_string);
 	GtkTreeIter iter;
 	const char *old_def, *new_def;
 	struct menu *menu;
 	struct symbol *sym;
 
-	if (!gtk_tree_model_get_iter(model2, &iter, path))
+	if (!gtk_tree_model_get_iter(model, &iter, path))
 		goto free;
 
-	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
+	gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 	sym = menu->sym;
 
-	gtk_tree_model_get(model2, &iter, COL_VALUE, &old_def, -1);
+	gtk_tree_model_get(model, &iter, COL_VALUE, &old_def, -1);
 	new_def = new_text;
 
 	sym_set_string_value(sym, new_def);
@@ -1391,7 +1393,7 @@ static void init_right_tree(void)
 						    "foreground-gdk",
 						    COL_COLOR, NULL);
 	g_signal_connect(G_OBJECT(renderer), "edited",
-			 G_CALLBACK(renderer_edited), NULL);
+			 G_CALLBACK(renderer_edited), tree2_w);
 
 	for (i = 0; i < COL_VALUE; i++) {
 		column = gtk_tree_view_get_column(view, i);
-- 
2.43.0

