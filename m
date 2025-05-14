Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579022576A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214413; cv=none; b=HMv/1fvY8fFKrPRFXNx6GcgQUcQwdG6BbR/qxnJitAAZKekMGM7ssUChJ+coGrq+ZTVtn8ZW256pfdm7BbQOwdqwlpP03U0Vi6Le4LAecliTMuMRy+c4T/K0xAzoeOoPKmvXekDz8xA16Wp1oy6iOWFT0oGMty/UTSRlhgvH3AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214413; c=relaxed/simple;
	bh=GOqpiypNLRNqJr91PCu1R/abzdDuvB/uI9eqkTVFA1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rPhu+/6e91mQSm7WFR8Jc16rr6oY+SNawQnaKtx+GcXRwYccbopcLA7glxiUmE7EU1mPj3We+sErtC4EjouYleT9ZG5lPeQdPrff1Ckr8cx3tRGog92eNJtefBZsPNYn8xiWJW+nse9uWHnYtHPUm42A6Br8Ub3DJp6GBuXfGtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI30ecEi; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI30ecEi"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30a89c31ae7so8395184a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747214410; x=1747819210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIefgDJRi7fDGuMK/trl/BjX3lPmH7RSfitXfLf6tlc=;
        b=hI30ecEi0wUW7nrKLjF19sW3287yLeaq1RJy66+omISchomuM+WzOolTBA6iWOB+lo
         a+jptlpgzg47/q0nHEXU8BS71dndKpfVXSv4QVGtLgtJnA22KiYAOS2YF3KQIIWUCl4i
         i14SPCL6t9mNigFczbvyrbqWvGc0z2Q7aF2ngnASkEWWSMJAgTyXBWk7Zpz7IjFyfsn2
         tjDaqmwGphe9lbbBYurxytJlMAENLEUne6h96V3dNpqUObo9m+yN6uHwESC5mx53aQRJ
         zgdw4KL01IrmEHBrHt8VALdtP+moln2DH63yyonJ2+emmCZtK6Ae46+rPcQvlwKTet6o
         cvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747214410; x=1747819210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIefgDJRi7fDGuMK/trl/BjX3lPmH7RSfitXfLf6tlc=;
        b=Y4FLOi68k7mLEdGfjRaoxgxaexTMC6MqcxLTyQYFPRVrjAjZJPgu0+SeWw4zgONoqf
         F4vO+wPs4qNJtvSZ6A5SwX0CjnosGaGinibLGZ7AeqbnApX01/huKDQtDS4OBpXgCiU5
         lzwkQr6CQFJS2qE/4QQz51HY7sKGWdxpUBU+x7nyglvztE4VI1uxttDgpT1NjSEgvOGQ
         mrW4167kzZzbtZOQW6Ag/K+QWIfyXyr0ySEPtVhCcK3GM+GBaek1DFyA7hNylBGJ9//Z
         BdCubb4zxdY0YDm9HjNkS7vSekLAeeSd0CboSLrkYf3btHyQ4PSQGQivJVJtCMBoh8rh
         TBdg==
X-Gm-Message-State: AOJu0Yz8znE+tj/Jz/sNw9e+yQPLhraWjfBrniO3iuNtpYExZofoXg7s
	Jke3+w7txywFmc2jeJY1Tugo58CbRQU8WGjwZ1iKcfc1QhTWzO+J+FSzT/5M
X-Gm-Gg: ASbGncuIvv5FNvH9dvSQkKfSuvlBfdTuZfi5/XqHVmvRL9iWfa6jtX4MR8U0/B+m+/5
	5rzqn5J+H3NGYuYraPywr7WNdxMoJV6uQZTV/CIqh1NWYtcX6NrPPGk5dDQyVrgDPAmvl06KG0F
	BfZ+/aubCa7zHcUa2Ej4FuTR/2T5o13UUAkWPHG+kAKxfhB1W5gAjunjrUVfzSA764k8tNrM+Sc
	9/MEqaqbsLJLiDv9Td59nrwkWumKiKqJT6xU9npQMLBxqc8SRMphJ/q1ZmFnp/G60sdcSwVqvJq
	HthBMOGtW3PHFoDTWiNBzL8N8DCcg4Zsvz2ajn45tk4ET2TKOOiY8+rCwhS2M284GlXsPsQtkcD
	DlhEpDrMUJb6cyw==
X-Google-Smtp-Source: AGHT+IE39aoSVTaXl1SfHw5lbFbwc1ayxSE5XilONEz+p7K8DBg24q1sQllFP4w8lJN56lcfedSmDw==
X-Received: by 2002:a17:90b:560f:b0:2fa:137f:5c61 with SMTP id 98e67ed59e1d1-30e2e5b7265mr5205650a91.12.1747214410390;
        Wed, 14 May 2025 02:20:10 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e1200a686sm1735830a91.0.2025.05.14.02.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:20:09 -0700 (PDT)
From: Zijiang Huang <huangzjsmile@gmail.com>
X-Google-Original-From: Zijiang Huang <kerayhuang@tencent.com>
To: linux-kernel@vger.kernel.org,
	mkayaalp@linux.vnet.ibm.com
Cc: kerayhuang <kerayhuang@tencent.com>,
	Hao Peng <flyingpeng@tencent.com>
Subject: [PATCH] KEYS: fix memory leaks in insert-sys-cert
Date: Wed, 14 May 2025 17:19:56 +0800
Message-ID: <20250514091956.1708756-1-kerayhuang@tencent.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: kerayhuang <kerayhuang@tencent.com>

This commit addresses memory leaks by ensuring that all dynamically
allocated resources are properly released before the program exits.
The following changes were made:
- Added fclose() to close the system_map file.
- Added free() to release the cert buffer.
- Added munmap() to unmap the vmlinux file.

These changes ensure that all resources are correctly managed and
prevent memory leaks.

Signed-off-by: kerayhuang <kerayhuang@tencent.com>
Reviewed-by: Hao Peng <flyingpeng@tencent.com>
---
 scripts/insert-sys-cert.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/scripts/insert-sys-cert.c b/scripts/insert-sys-cert.c
index 8902836c23424..014d6bc855d95 100644
--- a/scripts/insert-sys-cert.c
+++ b/scripts/insert-sys-cert.c
@@ -250,6 +250,7 @@ static char *read_file(char *file_name, int *size)
 	}
 	if (read(fd, buf, *size) != *size) {
 		perror("File read failed");
+		free(buf);
 		close(fd);
 		return NULL;
 	}
@@ -285,6 +286,7 @@ int main(int argc, char **argv)
 	int opt;
 	Elf_Shdr *symtab = NULL;
 	struct sym cert_sym, lsize_sym, used_sym;
+	int ret = EXIT_FAILURE;
 
 	while ((opt = getopt(argc, argv, "b:c:s:")) != -1) {
 		switch (opt) {
@@ -304,20 +306,20 @@ int main(int argc, char **argv)
 
 	if (!vmlinux_file || !cert_file) {
 		print_usage(argv[0]);
-		exit(EXIT_FAILURE);
+		goto cleanup;
 	}
 
 	cert = read_file(cert_file, &cert_size);
 	if (!cert)
-		exit(EXIT_FAILURE);
+		goto cleanup;
 
 	hdr = map_file(vmlinux_file, &vmlinux_size);
 	if (!hdr)
-		exit(EXIT_FAILURE);
+		goto cleanup;
 
 	if (vmlinux_size < sizeof(*hdr)) {
 		err("Invalid ELF file.\n");
-		exit(EXIT_FAILURE);
+		goto cleanup;
 	}
 
 	if ((hdr->e_ident[EI_MAG0] != ELFMAG0) ||
@@ -325,22 +327,22 @@ int main(int argc, char **argv)
 	    (hdr->e_ident[EI_MAG2] != ELFMAG2) ||
 	    (hdr->e_ident[EI_MAG3] != ELFMAG3)) {
 		err("Invalid ELF magic.\n");
-		exit(EXIT_FAILURE);
+		goto cleanup;
 	}
 
 	if (hdr->e_ident[EI_CLASS] != CURRENT_ELFCLASS) {
 		err("ELF class mismatch.\n");
-		exit(EXIT_FAILURE);
+		goto cleanup;
 	}
 
 	if (hdr->e_ident[EI_DATA] != endianness()) {
 		err("ELF endian mismatch.\n");
-		exit(EXIT_FAILURE);
+		goto cleanup;
 	}
 
 	if (hdr->e_shoff > vmlinux_size) {
 		err("Could not find section header.\n");
-		exit(EXIT_FAILURE);
+		goto cleanup;
 	}
 
 	symtab = get_symbol_table(hdr);
@@ -349,13 +351,13 @@ int main(int argc, char **argv)
 		if (!system_map_file) {
 			err("Please provide a System.map file.\n");
 			print_usage(argv[0]);
-			exit(EXIT_FAILURE);
+			goto cleanup;
 		}
 
 		system_map = fopen(system_map_file, "r");
 		if (!system_map) {
 			perror(system_map_file);
-			exit(EXIT_FAILURE);
+			goto cleanup;
 		}
 		get_symbol_from_map(hdr, system_map, CERT_SYM, &cert_sym);
 		get_symbol_from_map(hdr, system_map, USED_SYM, &used_sym);
@@ -371,7 +373,7 @@ int main(int argc, char **argv)
 	}
 
 	if (!cert_sym.offset || !lsize_sym.offset || !used_sym.offset)
-		exit(EXIT_FAILURE);
+		goto cleanup;
 
 	print_sym(hdr, &cert_sym);
 	print_sym(hdr, &used_sym);
@@ -382,14 +384,15 @@ int main(int argc, char **argv)
 
 	if (cert_sym.size < cert_size) {
 		err("Certificate is larger than the reserved area!\n");
-		exit(EXIT_FAILURE);
+		goto cleanup;
 	}
 
 	/* If the existing cert is the same, don't overwrite */
 	if (cert_size == *used &&
 	    strncmp(cert_sym.content, cert, cert_size) == 0) {
 		warn("Certificate was already inserted.\n");
-		exit(EXIT_SUCCESS);
+		ret = EXIT_SUCCESS;
+		goto cleanup;
 	}
 
 	if (*used > 0)
@@ -406,5 +409,18 @@ int main(int argc, char **argv)
 						cert_sym.address);
 	info("Used %d bytes out of %d bytes reserved.\n", *used,
 						 cert_sym.size);
-	exit(EXIT_SUCCESS);
+
+	ret = EXIT_SUCCESS;
+
+cleanup:
+	if (cert)
+		free(cert);
+
+	if (hdr)
+		munmap(hdr, vmlinux_size);
+
+	if (system_map)
+		free(system_map);
+
+	return ret;
 }
-- 
2.35.1

