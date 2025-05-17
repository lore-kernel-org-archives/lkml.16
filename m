Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EAB665
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747486885; cv=none; b=JHt3qKCaZePGcn9QMfxHgkvG+lg7wGSB6GWc5+ouZclOSxI3Cz6IjMjBoUHaY7Gp7jsw6elkPVRJQ7lGaXj2ZwLDVsCj72zhSc1WWxrvkr8cwmxrOMVextC1DXwW5C4IzX5JQoFMuNoV40TAFwCTs/k31wyrBfC8d1LNlbUk05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747486885; c=relaxed/simple;
	bh=kDaVvTvZqoOc1Lp/g1cuDMsT0TpIV9jdN6pFoRbJ7tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFZx9djgd+qyb+/0ao9XAK3Kw4lit4Y+4MkGwJl6Eta6mJHkIbexqIPuGyRMHf3iY0saPuOWbVr+IeP1HwIgn+b9HljWSDtUEyD3U32thLkmeuJvlxBypkrfQ8YAH2G9euzBvPxZnrQ9wb1sD1upYkwby1pSCChdBO1PuZdT62U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T2uKLySS; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T2uKLySS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747486876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WIbKSwCYsCTCU4ZAr2VOIQ93eekYXV3ibAlWtorV7R4=;
	b=T2uKLySSMrAnMBqimeW4wwjhdKSEjpp9YvCe6cAhJ4+2MtrJvIU+Y8F0A9Qdv1P0Q03jFh
	vUCFqolm0HXgbbEMkfbsPnjkHx+5NCAvseTXpvp6XiiHSoMgdNFpWPdxBMQvT0JMowrr8d
	bcE8fhgUD+LcZeVVhIMz1siRXJxxHvU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Fix indentation and replace typedef with struct name
Date: Sat, 17 May 2025 14:58:31 +0200
Message-ID: <20250517125834.421088-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Indent several struct members using tabs instead of spaces.

Replace the typedef alias AOUTHDR with an explicit struct name to
silence a checkpatch warning.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/boot/hack-coff.c |  2 +-
 arch/powerpc/boot/rs6000.h    | 84 +++++++++++++++++------------------
 2 files changed, 41 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/boot/hack-coff.c b/arch/powerpc/boot/hack-coff.c
index a010e124ac4b..6bf0c94302f5 100644
--- a/arch/powerpc/boot/hack-coff.c
+++ b/arch/powerpc/boot/hack-coff.c
@@ -31,7 +31,7 @@ main(int ac, char **av)
     int i, nsect;
     int aoutsz;
     struct external_filehdr fhdr;
-    AOUTHDR aout;
+    struct aouthdr aout;
     struct external_scnhdr shdr;
 
     if (ac != 2) {
diff --git a/arch/powerpc/boot/rs6000.h b/arch/powerpc/boot/rs6000.h
index a9d879155ef9..584c7f9c1912 100644
--- a/arch/powerpc/boot/rs6000.h
+++ b/arch/powerpc/boot/rs6000.h
@@ -36,32 +36,30 @@ struct external_filehdr {
 /********************** AOUT "OPTIONAL HEADER" **********************/
 
 
-typedef struct
-{
-  unsigned char	magic[2];	/* type of file			*/
-  unsigned char	vstamp[2];	/* version stamp		*/
-  unsigned char	tsize[4];	/* text size in bytes, padded to FW bdry */
-  unsigned char	dsize[4];	/* initialized data "  "	*/
-  unsigned char	bsize[4];	/* uninitialized data "   "	*/
-  unsigned char	entry[4];	/* entry pt.			*/
-  unsigned char	text_start[4];	/* base of text used for this file */
-  unsigned char	data_start[4];	/* base of data used for this file */
-  unsigned char	o_toc[4];	/* address of TOC */
-  unsigned char	o_snentry[2];	/* section number of entry point */
-  unsigned char	o_sntext[2];	/* section number of .text section */
-  unsigned char	o_sndata[2];	/* section number of .data section */
-  unsigned char	o_sntoc[2];	/* section number of TOC */
-  unsigned char	o_snloader[2];	/* section number of .loader section */
-  unsigned char	o_snbss[2];	/* section number of .bss section */
-  unsigned char	o_algntext[2];	/* .text alignment */
-  unsigned char	o_algndata[2];	/* .data alignment */
-  unsigned char	o_modtype[2];	/* module type (??) */
-  unsigned char o_cputype[2];	/* cpu type */
-  unsigned char	o_maxstack[4];	/* max stack size (??) */
-  unsigned char o_maxdata[4];	/* max data size (??) */
-  unsigned char	o_resv2[12];	/* reserved */
-}
-AOUTHDR;
+struct aouthdr {
+	unsigned char	magic[2];	/* type of file			*/
+	unsigned char	vstamp[2];	/* version stamp		*/
+	unsigned char	tsize[4];	/* text size in bytes, padded to FW bdry */
+	unsigned char	dsize[4];	/* initialized data "  "	*/
+	unsigned char	bsize[4];	/* uninitialized data "   "	*/
+	unsigned char	entry[4];	/* entry pt.			*/
+	unsigned char	text_start[4];	/* base of text used for this file */
+	unsigned char	data_start[4];	/* base of data used for this file */
+	unsigned char	o_toc[4];	/* address of TOC */
+	unsigned char	o_snentry[2];	/* section number of entry point */
+	unsigned char	o_sntext[2];	/* section number of .text section */
+	unsigned char	o_sndata[2];	/* section number of .data section */
+	unsigned char	o_sntoc[2];	/* section number of TOC */
+	unsigned char	o_snloader[2];	/* section number of .loader section */
+	unsigned char	o_snbss[2];	/* section number of .bss section */
+	unsigned char	o_algntext[2];	/* .text alignment */
+	unsigned char	o_algndata[2];	/* .data alignment */
+	unsigned char	o_modtype[2];	/* module type (??) */
+	unsigned char	o_cputype[2];	/* cpu type */
+	unsigned char	o_maxstack[4];	/* max stack size (??) */
+	unsigned char	o_maxdata[4];	/* max data size (??) */
+	unsigned char	o_resv2[12];	/* reserved */
+};
 
 #define AOUTSZ 72
 #define SMALL_AOUTSZ (28)
@@ -119,10 +117,10 @@ struct external_scnhdr {
  */
 struct external_lineno {
 	union {
-		char l_symndx[4];	/* function name symbol index, iff l_lnno == 0*/
+		char l_symndx[4];	/* function name symbol index, iff l_lnno == 0 */
 		char l_paddr[4];	/* (physical) address of line number	*/
 	} l_addr;
-	char l_lnno[2];	/* line number		*/
+	char l_lnno[2];	/* line number */
 };
 
 
@@ -136,20 +134,19 @@ struct external_lineno {
 #define E_FILNMLEN	14	/* # characters in a file name		*/
 #define E_DIMNUM	4	/* # array dimensions in auxiliary entry */
 
-struct external_syment
-{
-  union {
-    char e_name[E_SYMNMLEN];
-    struct {
-      char e_zeroes[4];
-      char e_offset[4];
-    } e;
-  } e;
-  char e_value[4];
-  char e_scnum[2];
-  char e_type[2];
-  char e_sclass[1];
-  char e_numaux[1];
+struct external_syment {
+	union {
+		char e_name[E_SYMNMLEN];
+		struct {
+			char e_zeroes[4];
+			char e_offset[4];
+		} e;
+	} e;
+	char e_value[4];
+	char e_scnum[2];
+	char e_type[2];
+	char e_sclass[1];
+	char e_numaux[1];
 };
 
 
@@ -191,7 +188,7 @@ union external_auxent {
 	} x_file;
 
 	struct {
-		char x_scnlen[4];			/* section length */
+		char x_scnlen[4];	/* section length */
 		char x_nreloc[2];	/* # relocation entries */
 		char x_nlinno[2];	/* # line numbers */
 	} x_scn;
@@ -211,7 +208,6 @@ union external_auxent {
 		unsigned char x_stab[4];
 		unsigned char x_snstab[2];
 	} x_csect;
-
 };
 
 #define	SYMENT	struct external_syment
-- 
2.49.0

