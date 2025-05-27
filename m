Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018F19CD16
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355825; cv=none; b=bfDd+jy55ls316ckuhq7smv6ve6vF09SxyUoEHSuFIplgVSlW+Ze6IH8tdGf9PebXLdwwg0boPRnDBm2Da4EoBvtQg5qR/6Ff7adMp8iDnWe9LlaJNeCZlGImC3K+BeyqkIONTcVtX4rKOJEzXKU6bsuAgHC0bpZq74+wBNZjgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355825; c=relaxed/simple;
	bh=1b2v/c0DKM/AjXvU+XYHFgHzNKVCeFNe8WzHm7DLXTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PgP62ifQK8naFNfPb4hQGWEknH9n5+Wi9xKZN5aqlNN7AXfDyYZwf3oNoNs76n9fPw8H4Kj7TlewN3WtDBiyz+cSyjEKxrkmvBcTxFvCqryulKYvU3a+sSJzGXQDWSpT5MV82bnVKel72dASRQAHgDhkzX/BmGLQeCq4PX+0lFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bI9fyVba; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bI9fyVba"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4c4e6a0ccso2620341f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748355821; x=1748960621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6n1uaYpmB1kOr6JIFMyXy+K3N7piDSdguvD1FRtdHTo=;
        b=bI9fyVbaB8ZfsKj2gRTdDuSX7t/6BLWjPsHS8ScCaBJn0sGxVWN0tR5Bu+2Vbfh3py
         Domz8EA7qqN4PmVHQ7QD9T9Ibb1/cm/Wy4hYI18zgfNoSX2uDtkmKDslv0km33QKwU53
         sAPhyktjvtroSOcS2oklRdNfsfDTVHVHSo8BVix4QDYQQXCzOG5pcTJ+46qXlxxXSGx4
         1b/D6nI9q39iyzoAFG5fGb9HFbqWUs2Zs63X3l2kSDXxFoSDLb6xISpGfvFDvSY6Jczq
         9LIaSqqNHVRV7p/3LWToot+jEU8QlWnV9M+PkqYPMqYZw8gcUpryxPCPegw5ujcZkowd
         qajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355821; x=1748960621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n1uaYpmB1kOr6JIFMyXy+K3N7piDSdguvD1FRtdHTo=;
        b=DfIJ9Po/wD8a7pvLo5o4Zc2eWT5sH7Xo13Ft6iwQOXQRlBa9lYrLyuRdiqsg+A2NxJ
         bvWw44zs3qZdLMeuoBiMpunNP+UwYj3tv6QT7Q5hAvNpnMtBkkcGMdcNBz5H2grVayvo
         Wd3ONTyNlb8N+qFKSX/nOUBszagTk7g9GrgaemByvgwCfFXwqMJ7tde17Ieq1Ukyv4r9
         DzQ6E1jPYmpQLJPXLWmY547qn3uxxJkAefvoE2b4GWya8thRL87hNRNRN7rXxGsuYler
         Ea7WArA6IvdeW67ttna/AL8wLV7xus2HtrVAAim7MMr5pNucfxPX8HzeXfGXSSCLhixI
         kRig==
X-Forwarded-Encrypted: i=1; AJvYcCWBkDapZkLzCRUPurjPQvXc9MWcYONueE2XtoHtetg2+mrpTtI5eb2kOBgwvqQEckIed1TIYdzxo6F5Bx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2JzCJO0Ulm38rIen2m8wupGViK25i3DTfIAL6fDRoGoPJ0H5M
	AqjwNQE9OPcmt5dwq+QE18B72g+K6AlkchnzJD1F8WWiouVGIfTxAzyq+EgjASLgS3E=
X-Gm-Gg: ASbGncsySf21W1liJpRo7I/FwX6SQlTpUIFAPRq3lbdYoBuvydfeaxKOjksDzJU1gAU
	DtnsyjijVNqy03OCukcyFmgDM/BkR6u8JeIyHfsVbrKzjE4/ps5N/pmhZgdCKPrqnoKwXT7o7PX
	S6xZ/t2eUFNTf3EzR8/zB1hELzLcAyb1gAqL57vtMwB7kVhtxqYqzOdEPKb14isFe8W7vxoov9Y
	3dtX3GwWF421Y6JYzXmkPrI/Nl910L/HgkLK6UiuOmjuY5u+FJpYV7Qn+5j002enbx3Am8/uMkj
	rwB0oR15dKLyOlDP04v4YQJGywsIxN/+ucRquya4XBeY1F44uTJ+cg==
X-Google-Smtp-Source: AGHT+IELC1IttHHKpQxPobF04n1BxV0zFn5416xOB8lAZHST6vgiJpJWp1f8e/ECPlHN8aFnCXiRFw==
X-Received: by 2002:a05:6000:250f:b0:3a4:cfbf:51c3 with SMTP id ffacd0b85a97d-3a4cfbf5539mr11042240f8f.10.1748355820879;
        Tue, 27 May 2025 07:23:40 -0700 (PDT)
Received: from dhcp48.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c73a4284sm12100719f8f.85.2025.05.27.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:23:40 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] genksyms: Fix enum consts from a reference affecting new values
Date: Tue, 27 May 2025 16:22:11 +0200
Message-ID: <20250527142318.14175-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enumeration constants read from a symbol reference file can incorrectly
affect new enumeration constants parsed from an actual input file.

Example:

 $ cat test.c
 enum { E_A, E_B, E_MAX };
 struct bar { int mem[E_MAX]; };
 int foo(struct bar *a) {}
 __GENKSYMS_EXPORT_SYMBOL(foo);

 $ cat test.c | ./scripts/genksyms/genksyms -T test.0.symtypes
 #SYMVER foo 0x070d854d

 $ cat test.0.symtypes
 E#E_MAX 2
 s#bar struct bar { int mem [ E#E_MAX ] ; }
 foo int foo ( s#bar * )

 $ cat test.c | ./scripts/genksyms/genksyms -T test.1.symtypes -r test.0.symtypes
 <stdin>:4: warning: foo: modversion changed because of changes in enum constant E_MAX
 #SYMVER foo 0x9c9dfd81

 $ cat test.1.symtypes
 E#E_MAX ( 2 ) + 3
 s#bar struct bar { int mem [ E#E_MAX ] ; }
 foo int foo ( s#bar * )

The __add_symbol() function includes logic to handle the incrementation of
enumeration values, but this code is also invoked when reading a reference
file. As a result, the variables last_enum_expr and enum_counter might be
incorrectly set after reading the reference file, which later affects
parsing of the actual input.

Fix the problem by splitting the logic for the incrementation of
enumeration values into a separate function process_enum() and call it from
__add_symbol() only when processing non-reference data.

Fixes: e37ddb825003 ("genksyms: Track changes to enum constants")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/genksyms/genksyms.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 8b0d7ac73dbb..d05c01eb721b 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -181,13 +181,9 @@ static int is_unknown_symbol(struct symbol *sym)
 			strcmp(defn->string, "{") == 0);
 }
 
-static struct symbol *__add_symbol(const char *name, enum symbol_type type,
-			    struct string_list *defn, int is_extern,
-			    int is_reference)
+static struct string_list *process_enum(const char *name, enum symbol_type type,
+					struct string_list *defn)
 {
-	unsigned long h;
-	struct symbol *sym;
-	enum symbol_status status = STATUS_UNCHANGED;
 	/* The parser adds symbols in the order their declaration completes,
 	 * so it is safe to store the value of the previous enum constant in
 	 * a static variable.
@@ -225,6 +221,23 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 			return NULL;
 	}
 
+	return defn;
+}
+
+static struct symbol *__add_symbol(const char *name, enum symbol_type type,
+			    struct string_list *defn, int is_extern,
+			    int is_reference)
+{
+	unsigned long h;
+	struct symbol *sym;
+	enum symbol_status status = STATUS_UNCHANGED;
+
+	if ((type == SYM_ENUM_CONST || type == SYM_ENUM) && !is_reference) {
+		defn = process_enum(name, type, defn);
+		if (defn == NULL)
+			return NULL;
+	}
+
 	h = crc32(name);
 	hash_for_each_possible(symbol_hashtable, sym, hnode, h) {
 		if (map_to_ns(sym->type) != map_to_ns(type) ||

base-commit: 914873bc7df913db988284876c16257e6ab772c6
-- 
2.43.0

