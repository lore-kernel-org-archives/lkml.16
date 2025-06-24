Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6842DFA51;
	Tue, 24 Jun 2025 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777666; cv=none; b=JFq+uDcdKhpmNpGV8rKDlo7K/aoZlLTJN9O+Emg496WP9hRXJhd5aRZvZuZXsNaveIhAiWioy4PNRCKlyOKa4q2Zm9gTX2rIpI4p/M4KpcC4Qwn9n4qLOQMeDCddkBtFwS9rmPeSyn9FkPyzUOf8yTWerqHQr+LTqnfCEWxhDT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777666; c=relaxed/simple;
	bh=lQ7e7UVZWB4GWvI2mdfJ7vf4PsqCvuiTiYnRRyrFWYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PyMX+ryRlxivAUoyUccjT3JFGuYUBXbgdTZv8gYwQd8BE6HMQ9+sNgGPsfwn1ss5iJrlq4S0/xmnSPLGLUJ3OKcku140kvhM7bq2hjFdeo0rQ2b7EoxL7wImGOnMfRWbIqcq0BiNmj5ykeSQrD9YY58r2TaLVpIdJHb5McvnDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zunbh6y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zunbh6y7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394A8C4CEEE;
	Tue, 24 Jun 2025 15:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777666;
	bh=lQ7e7UVZWB4GWvI2mdfJ7vf4PsqCvuiTiYnRRyrFWYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zunbh6y7aksbmEUReufrPlX9PmjbvExXkNttVIsEz+NaiBskoDWjhVZRbxUyho56B
	 R+d/FlIJUcn8p2JHwfftPd8O7abK6p/CVjwef0Z89uC0akik12sEQXJkQcBuyMV2Nj
	 bAnC6E+OJIjPSvJTXjS4G5CkTlxurSJwUX08I0ix9+hZ70RC7ozBQce3Y3A1/iiw+h
	 wJ1DT+9KB+OvcRCYDHkLUIU4VT6vsFt6Ffi6eGsyCISOX7jJeX9Zw5fJj2ywRKvk0J
	 ognlk4Vkve6prIGsll4tmL6RelPBLyB5fVeKOmPgSnCVQrmwGgi5UHomJv4X0VqCMl
	 3yFLu+KsfGCkw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/66] kconfig: gconf: remove gtk_tree_view_set_rules_hint() calls
Date: Wed, 25 Jun 2025 00:05:03 +0900
Message-ID: <20250624150645.1107002-16-masahiroy@kernel.org>
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

The use of the this function is not recommended, and it has been
deprecated since GTK 3.14.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.14.0/gtk/gtktreeview.c#L11891

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 3f9b9957f089..4bbc8f87deb6 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -189,7 +189,6 @@ static void init_left_tree(void)
 	GtkTreeViewColumn *column;
 
 	gtk_tree_view_set_model(view, model1);
-	gtk_tree_view_set_rules_hint(view, TRUE);
 
 	column = gtk_tree_view_column_new();
 	gtk_tree_view_append_column(view, column);
@@ -230,7 +229,6 @@ static void init_right_tree(void)
 	gint i;
 
 	gtk_tree_view_set_model(view, model2);
-	gtk_tree_view_set_rules_hint(view, TRUE);
 
 	column = gtk_tree_view_column_new();
 	gtk_tree_view_append_column(view, column);
-- 
2.43.0

