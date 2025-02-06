Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C80D1EA7D5;
	Thu,  6 Feb 2025 13:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848501; cv=none; b=c1LwIyRcsaa7BrAsqEWiKoYahNtcvtrs3FoCASt6jqVLTv+Bl9Pe7mTxPCSnHQI98Px7zWca1t74XK6kH5mYxfCXNqUdgfPnzmi4nTHxhhYTN/RW6A3vAOqwOkZPjv1S3nW0vG91ppAoP5eVum2UGhplh1PtED8FbS4NQOCz3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848501; c=relaxed/simple;
	bh=1Z+ne27ukJ46AA8dNZtkdXTc5hsuBk47Ctb0PcMMIFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCoA4+NAhX0ltvohA6Ma5KYyHLtxy6d/4Jri6gz9rKBb4OBIXWAoM+cjfsm2yAH4WK5SFgdPlzwIfyz+2PVFiVb9J+GXjBTUao3wpBCVhj+SdlWuaD4FiXdQbgqbHHyeqXHkRk275Q3qr7m6dNDbEBrLLWINv3cS+aeiycI5o10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz7kCZ1P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz7kCZ1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90562C4CEE2;
	Thu,  6 Feb 2025 13:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848501;
	bh=1Z+ne27ukJ46AA8dNZtkdXTc5hsuBk47Ctb0PcMMIFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kz7kCZ1PP6AN3eBJ3Qzs02OUd8ZwxBOu6yNeh1IL9DrnUmfm3zQQlI75ZuvfoJmd1
	 L69sbYK3mzMfs6/uzfjaS7JElpcRpvRttIwaX1cFSWHTPKwfBDkrl+Wa3v32fzVFh6
	 5WD2UBrO80XKetdUmRCqbjB4xY0IfEgKUyc2qzaYkissKseFD3Oiu3JM2jSdonzRkc
	 M3inTAg4X0GzYq59T9RS3p1azmHXU+iMuhyhPhOFIiaMdtfDSicgAzACujavZi/eoX
	 xS2gkFzbtf9mgXm7FumrPRpUuqMEKHHclv1yrU4XFY3JLzpQsFEwT/L0BAeGGLsbKj
	 PyZ7QwE1KOR7w==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v4 01/14] mm/mm_init: rename init_reserved_page to init_deferred_page
Date: Thu,  6 Feb 2025 15:27:41 +0200
Message-ID: <20250206132754.2596694-2-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, init_reserved_page()
function performs initialization of a struct page that would have been
deferred normally.

Rename it to init_deferred_page() to better reflect what the function does.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/mm_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2630cc30147e..c4b425125bad 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -705,7 +705,7 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static void __meminit init_reserved_page(unsigned long pfn, int nid)
+static void __meminit init_deferred_page(unsigned long pfn, int nid)
 {
 	pg_data_t *pgdat;
 	int zid;
@@ -739,7 +739,7 @@ static inline bool defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static inline void init_reserved_page(unsigned long pfn, int nid)
+static inline void init_deferred_page(unsigned long pfn, int nid)
 {
 }
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
@@ -760,7 +760,7 @@ void __meminit reserve_bootmem_region(phys_addr_t start,
 		if (pfn_valid(start_pfn)) {
 			struct page *page = pfn_to_page(start_pfn);
 
-			init_reserved_page(start_pfn, nid);
+			init_deferred_page(start_pfn, nid);
 
 			/*
 			 * no need for atomic set_bit because the struct
-- 
2.47.2

