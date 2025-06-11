Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562E82798FD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638084; cv=none; b=FvqAjn9K5FQ6MAA+LBhh12x9qTMhIFYJn2gQArOO7GiuDX0oi4roouHk6aitq2Dwh5/w+XomB7727n4knjzSSSXHKXPK9NGMdIdp7EoSkLuVaEVVuvPc3pG95E5eg4kQF8E39VSn9lAmADNOy58yKzby1P4fKFDLIxH1R09s43U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638084; c=relaxed/simple;
	bh=q/SZLjSqTibh2hypBF9kUWxN4M5BbdYEvmWzASdB61U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ0JGOIsQlhJRJbfdZwUvTGJ89a70gDg96nSBaQwmgrOE5XOMzUWMcI5HL9VBFyvDamdkcTB9+yilIq9wnHQaX/CsD26+1E+ZAJKDNMTzDcN38pOSAcjGGH/wXdQYR3d8TTBT8Dogkj03py7bJeBdpIlzuJGycCQ+iAr2Dakpwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl+i6huM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl+i6huM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A849C4CEEE;
	Wed, 11 Jun 2025 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638084;
	bh=q/SZLjSqTibh2hypBF9kUWxN4M5BbdYEvmWzASdB61U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cl+i6huMsdpAPHDNSeGnNThyPYDnkxolHoTM+0keMZFolomjiwUCvL3Zi25Gw1rGL
	 fRCMV8drQ3++PAq6TGc8oxR6pKvYrLCfx31j3BuiyggzZFlQJLQnSGayoGpa1FHUEU
	 kY7tnOqnRDQa9gfoUZubj14y/55XdKF7tO6JDLJ9imYfFLyVv3RbMyZAqNG+FHkNlk
	 BuFTB5txGm/VePh0me5kBn4bbL9oCVsJvWmj8BBavpxpOI70rpJHS+Gt6H2ZOrUHiW
	 bmi2BiuOhTyBSnwB5bwyIhib+kosFLS5TcMAjZqRXcVRvcNg9s6HTZnSP0SwE/tgOm
	 AMU9uycGW+/cg==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] modpost: Add modname to mod_device_table alias
Date: Wed, 11 Jun 2025 12:34:30 +0200
Message-ID: <6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1749637146.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749637146.git.legion@kernel.org>
References: <20250606041029.614348-1-masahiroy@kernel.org> <cover.1749637146.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point, if a symbol is compiled as part of the kernel,
information about which module the symbol belongs to is lost.

To save this it is possible to add the module name to the alias name.
It's not very pretty, but it's possible for now.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 include/linux/module.h   | 14 +++++++++++---
 rust/kernel/device_id.rs |  8 ++++----
 scripts/mod/file2alias.c | 18 ++++++++++++++----
 3 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 24fe6b865e9c..e0f826fab2ac 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -243,11 +243,19 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
 /* What your module does. */
 #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
 
+/* Format: __mod_device_table__kmod_<modname>__<type>__<name> */
+#define __mod_device_table(type, name)	\
+	__PASTE(__mod_device_table__,	\
+	__PASTE(__KBUILD_MODNAME,	\
+	__PASTE(__,			\
+	__PASTE(type,			\
+	__PASTE(__, name)))))
+
 #ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
-#define MODULE_DEVICE_TABLE(type, name)					\
-extern typeof(name) __mod_device_table__##type##__##name		\
-  __attribute__ ((unused, alias(__stringify(name))))
+#define MODULE_DEVICE_TABLE(type, name)			\
+static typeof(name) __mod_device_table(type, name)	\
+  __attribute__ ((used, alias(__stringify(name))))
 #else  /* !MODULE */
 #define MODULE_DEVICE_TABLE(type, name)
 #endif
diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
index 0a4eb56d98f2..365d8f544844 100644
--- a/rust/kernel/device_id.rs
+++ b/rust/kernel/device_id.rs
@@ -154,10 +154,10 @@ macro_rules! module_device_table {
     ($table_type: literal, $module_table_name:ident, $table_name:ident) => {
         #[rustfmt::skip]
         #[export_name =
-            concat!("__mod_device_table__", $table_type,
-                    "__", module_path!(),
-                    "_", line!(),
-                    "_", stringify!($table_name))
+            concat!("__mod_device_table__", line!(),
+                    "__kmod_", module_path!(),
+                    "__", $table_type,
+                    "__", stringify!($table_name))
         ]
         static $module_table_name: [::core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
             unsafe { ::core::mem::transmute_copy($table_name.raw_ids()) };
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 00586119a25b..13021266a18f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1476,8 +1476,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 {
 	void *symval;
 	char *zeros = NULL;
-	const char *type, *name;
-	size_t typelen;
+	const char *type, *name, *modname;
+	size_t typelen, modnamelen;
 	static const char *prefix = "__mod_device_table__";
 
 	/* We're looking for a section relative symbol */
@@ -1488,10 +1488,20 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 		return;
 
-	/* All our symbols are of form __mod_device_table__<type>__<name>. */
+	/* All our symbols are of form __mod_device_table__kmod_<modname>__<type>__<name>. */
 	if (!strstarts(symname, prefix))
 		return;
-	type = symname + strlen(prefix);
+
+	modname = strstr(symname, "__kmod_");
+	if (!modname)
+		return;
+	modname += strlen("__kmod_");
+
+	type = strstr(modname, "__");
+	if (!type)
+		return;
+	modnamelen = type - modname;
+	type += strlen("__");
 
 	name = strstr(type, "__");
 	if (!name)
-- 
2.49.0

