Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954CA12B73
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955755; cv=none; b=PQDBi8vnQk1WKPzHJ26hbxe+zAcoj5ZkzpsCHHEc7sqkhW7B8kgwfK8Wxj++SnCkLjOFLstjm5NaRos8Nuk9/TGu3y0YB6lHGqNSqQxFZL3TxAD6+vFk1Hq11f+9c0z6xqyglstJvsDBxyXRtv1uyvRsh/5E7GeqWRnuFM6xvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955755; c=relaxed/simple;
	bh=a3Bth044JkzqN+I5E9h2Xqk3MI2Efz0GhU3HzldcUTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VSvl9xPpEFNU/qpHIiv/9kkhjEYqvN3AGp6bTrI2eUSbavYNOyO+9p4j3BFFOjVsH4yZ2ns0ghTsw+b+lV6P08dQZlOoZqrBzpPtH7UoQnuXGy6ZnRHz83206lqH73iYOU0Lvd/gDi/DYOdTZenpdmnWRev+ScZrcaRgXGZvd+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DtNCXBCr; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DtNCXBCr"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so64847325e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748955749; x=1749560549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FgV8WmPpyYwIlY3KXqCGoTrUxLSUVlDIjanFlbv2iSQ=;
        b=DtNCXBCrHfH+PifPJAfuY4/xz4TS1AH3JMkfEjUwLxfa+GWVRbq0VPpePlqOhymPVl
         pD4TQQ5y1d9Jli2irl0wfF7vmaYO7ArBc+lXR+WoJQU1T6bjW0uYFdrt8+/A4aW6omRe
         nMuXjNItCndUx8H3Ocf0gFh3t61DL6q0dAt55UsPHv+MyGO6mMjxM3M+uRtJXcR+AXS9
         yWWgZ7a3W+fnVWb2u1bUWI2rjFzPHQhmMd6ZLSTgZe6UWh0v9pYpXniADyw0ZEXRxR5v
         YZYE11253/VED3yMTWZPleJFJ9hriBfVi1NlFNoMLaKdk90RclrtGxibwPI1ew7TmDgG
         Q67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748955749; x=1749560549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgV8WmPpyYwIlY3KXqCGoTrUxLSUVlDIjanFlbv2iSQ=;
        b=rUU1j3UoCpkIzAgk0sf5kP8EbT80SNkXYKG8g2+FQTM8iZVzr8WfvTuebJ3EsW7ikG
         HkxMba5Dt3GTWSZJwEDrhXZNigxWqQbJi6LuJX78qDQzfPXNmdbEWGjp0AzknQphC0hj
         5hyOOYYYI4BNtCHGvBTmDxYOO4xrbjIkt5UP3HTUUzscBX1EtMXi+FFNo9tf5todIS/r
         /kgnBY1FT54u02W/egpavqYJv+4Nxj1qKRveQiboidkNqe8Y9wtOnRMrzRAfZu6JVuXT
         Xx8D/ua3e5EprfWwWhXnUMEmAuyjO+nNqS00Ghp/w9xvxgwf3WCEVlUjOf2nhdknbhlb
         AHIg==
X-Forwarded-Encrypted: i=1; AJvYcCX5YDs+1I/qPT3JE8KAJ2IRovBm2a12VL9NrwzWtodmz7GZNxiuncb87ZvJIuGzNyUuCQWe753V/gT9KZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgeCJjRradd4cZuf1HDMNEWzynwqGnCnfRHznV88PIWcop8O9
	nnAY9mVa7Pta0U0hlNN691goGyp/gvSzlDfPWvzht5TIIWG3chHu6vGi/9exUfCa0Ok=
X-Gm-Gg: ASbGncs9UHlppTZJNLbQW14cV6zZb1b4CaWnCYLsmbT9qN+3mzp+7c3rNXQ/9hdMvI+
	lxebk3zBOQgUr5bjRK/FKKWhUYcWhgsMgQL1xU0cvuLR0EVFHuFeROIj1wQCVmfCk8sovbnMllj
	EAISMp4lOYYXTyTXCfz3thARWLVz4gB/w+yyMEH3yMN2YTniXBN/YulvotX8EfycN5pMk29oPQT
	MU2OhsLEzjqsSH1U0jpq/PTWdIa2NFiCKj1ge8XseIMaAPBMPOF5y14yEO/q6IFiz5YUV8RY1+q
	7kguN+t+utEf7x2uywBr44t8XLA5RD0OjnBGHc4WIQrwQAzO2iI=
X-Google-Smtp-Source: AGHT+IFWiSmBVfdSIw0x/8GQR722JBV1AamyNmhPw9KmRDkbnQ7doRl6M042da4l9DkvncHLB16wTA==
X-Received: by 2002:a05:600c:8b0f:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-4511ecbbdc4mr99459095e9.1.1748955748613;
        Tue, 03 Jun 2025 06:02:28 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8eed4sm158634485e9.4.2025.06.03.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:02:27 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH v2] genksyms: Fix enum consts from a reference affecting new values
Date: Tue,  3 Jun 2025 15:02:09 +0200
Message-ID: <20250603130213.338518-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
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

Changes since v1 [1]:
- Remove the unnecessary condition 'type == SYM_ENUM' in process_enum().

[1] https://lore.kernel.org/linux-kbuild/20250527142318.14175-1-petr.pavlu@suse.com/

 scripts/genksyms/genksyms.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 8b0d7ac73dbb..83e48670c2fc 100644
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
@@ -216,7 +212,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 				defn = mk_node(buf);
 			}
 		}
-	} else if (type == SYM_ENUM) {
+	} else {
 		free_list(last_enum_expr, NULL);
 		last_enum_expr = NULL;
 		enum_counter = 0;
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

base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
-- 
2.49.0

