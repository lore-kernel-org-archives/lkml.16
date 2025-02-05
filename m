Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BDD190052;
	Wed,  5 Feb 2025 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771620; cv=none; b=nDhNy7n63RYs/Q4uVh9EF+CteK4hA1PhdxbUT2NSzsT/o8i+QxQtYcH70Bj4YufjV1nqe2frD0tPYFMBvgjKs9wkK6saysgaXu6iKJgbJT7yGPJrOwRN0G5vRvx3zDsUZrE2jdWc+dxPJWsqWDyjyhD7NuBu7DVey2VGylSA8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771620; c=relaxed/simple;
	bh=fdaBYMhNywx3SBQczSGppmG5pefI/VXyodeBWOMusZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDRMhw9rlLiGCnheUqtFBfk7qSYjCtTorkEufjOjbMZUuuTsaEjyk+3c75gZgIQqWbyW7TI4lwBlLN1agUoiwVzJtjXRqEOdS1q+BdzCmXVgqUicJbCTA2pzeGoH30Hr/Mn56uVLpldRVDS+7wn5GcyK6K37UpVzCMXCSDWWyeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmJCzdWS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmJCzdWS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025E6C4CEDD;
	Wed,  5 Feb 2025 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771620;
	bh=fdaBYMhNywx3SBQczSGppmG5pefI/VXyodeBWOMusZI=;
	h=Date:From:To:Cc:Subject:From;
	b=rmJCzdWSdeO/MZyuaGwpd3jRF4Q7jUka+PZeP49a22TpzZIKQBxOWeNTrxRVzF71r
	 V8cJdZ9EWOL1BmPdt2MwvMKLkjtM7JwRiP5Gf9yKXTCLQi/XGNgf/u2TrHWnCZekMs
	 KcnR/4aFUNtySkDVs/QdAPjDdL4eOJD+qPlLcdju2mvIxQZvlapbjwGmQsPKFtP/DT
	 j2CkRdt+yuULeZ7J0auOX45nDI4eIN4QBns9+uFaj5ZTCnVUJ1pc4TPoJEUQqvAxJD
	 mrB4B9L1UmziRtJnfUOKo+FV7ymUCTH4T7WcVd9qGBuOvdhKT6IBEsdMgfbN3AIA3S
	 CTy3ep8u3Pyeg==
Date: Wed, 5 Feb 2025 17:06:56 +0100
From: Helge Deller <deller@kernel.org>
To: Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Sven Schnelle <svens@stackframe.org>, linux-parisc@vger.kernel.org
Subject: [PATCH] kexec_elf: Fix some trivial kerneldoc warnings
Message-ID: <Z6OMoCQridWMs0at@p100>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Document missing parameters of various functions to avoid warnings
when compiling with W=1.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502051744.Bjxxm10L-lkp@intel.com/
Cc: Sven Schnelle <svens@stackframe.org>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index d3689632e8b9..f71448ac27c6 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -58,6 +58,7 @@ static uint16_t elf16_to_cpu(const struct elfhdr *ehdr, uint16_t value)
 
 /**
  * elf_is_ehdr_sane - check that it is safe to use the ELF header
+ * @ehdr:	pointer to ELF header to be checked.
  * @buf_len:	size of the buffer in which the ELF file is loaded.
  */
 static bool elf_is_ehdr_sane(const struct elfhdr *ehdr, size_t buf_len)
@@ -180,7 +181,8 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
 
 /**
  * elf_is_phdr_sane - check that it is safe to use the program header
- * @buf_len:	size of the buffer in which the ELF file is loaded.
+ * @phdr:	pointer to elf_phdr struct to be checked
+ * @buf_len:	size of the buffer in which the ELF file was loaded
  */
 static bool elf_is_phdr_sane(const struct elf_phdr *phdr, size_t buf_len)
 {
@@ -244,6 +246,9 @@ static int elf_read_phdr(const char *buf, size_t len,
 
 /**
  * elf_read_phdrs - read the program headers from the buffer
+ * @buf:	buffer to read ELF file from
+ * @len:	size of @buf
+ * @elf_info:	pointer to existing kexec_elf_info struct which will be populated
  *
  * This function assumes that the program header table was checked for sanity.
  * Use elf_is_ehdr_sane() if it wasn't.
@@ -280,10 +285,10 @@ static int elf_read_phdrs(const char *buf, size_t len,
 
 /**
  * elf_read_from_buffer - read ELF file and sets up ELF header and ELF info
- * @buf:	Buffer to read ELF file from.
- * @len:	Size of @buf.
- * @ehdr:	Pointer to existing struct which will be populated.
- * @elf_info:	Pointer to existing struct which will be populated.
+ * @buf:	buffer to read ELF file from
+ * @len:	size of @buf
+ * @ehdr:	pointer to existing elfhdr struct which will be populated
+ * @elf_info:	pointer to existing kexec_elf_info struct which will be populated
  *
  * This function allows reading ELF files with different byte order than
  * the kernel, byte-swapping the fields as needed.
@@ -315,6 +320,8 @@ static int elf_read_from_buffer(const char *buf, size_t len,
 
 /**
  * kexec_free_elf_info - free memory allocated by elf_read_from_buffer
+ * @elf_info:	pointer to existing kexec_elf_info struct which will be freed
+ *		and zeroed.
  */
 void kexec_free_elf_info(struct kexec_elf_info *elf_info)
 {
@@ -322,7 +329,15 @@ void kexec_free_elf_info(struct kexec_elf_info *elf_info)
 	memset(elf_info, 0, sizeof(*elf_info));
 }
 /**
- * kexec_build_elf_info - read ELF executable and check that we can use it
+ * kexec_build_elf_info - read ELF executable headers from buffer and
+ *		check that we can use them
+ * @buf:	buffer to read ELF file from
+ * @len:	size of @buf
+ * @ehdr:	pointer to existing elfhdr struct which will be populated
+ * @elf_info:	pointer to existing kexec_elf_info struct which will be populated
+ *
+ * Return:
+ * 0 on success, negative value on failure.
  */
 int kexec_build_elf_info(const char *buf, size_t len, struct elfhdr *ehdr,
 			       struct kexec_elf_info *elf_info)
@@ -378,9 +393,15 @@ int kexec_elf_probe(const char *buf, unsigned long len)
 }
 
 /**
- * kexec_elf_load - load ELF executable image
- * @lowest_load_addr:	On return, will be the address where the first PT_LOAD
- *			section will be loaded in memory.
+ * kexec_elf_load - load an ELF executable image
+ * @image:		pointer to kimage struct of file to be loaded
+ * @ehdr:		pointer to the ELF header of file to be loaded
+ * @elf_info:		pointer to kexec_elf_info struct of file to be loaded
+ * @kbuf:		pointer to kexec_buf struct which will be used to
+ *			load the ELF file
+ * @lowest_load_addr:	when the kernel was successfully loaded, the address
+ *			where the first PT_LOAD section was loaded is stored
+ *			in the variable pointed to by this pointer
  *
  * Return:
  * 0 on success, negative value on failure.
