Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDCF1ACEAF;
	Fri,  7 Feb 2025 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915303; cv=none; b=RVKZu7bX7COqlsanG6ONQyRwl+jZpglo6phr9gFKcxzHNnyUjvtDI1EYaCwwdcZMRxdqTV+P4lUIeolx3/LMoXYpZxnFzECzT86OPGM+xjPtThm5/dM5JHTR8+n7rwssazs2KiQcTVAZYfuj9fzRufh+f58VBAEH7VggqYvnNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915303; c=relaxed/simple;
	bh=kFDeL/SJLlnJWVrJNKoLmxn9dhqX2WUHrbLloiO0mH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rX9WCYVCj3NK3gLtCZc7ICtlje/+oTw7YOQe0h9okOfNKwdU4MnhHmE+mH/ESQloLJtR/UdgwozCzIwspQ9wQAQ8IeT2yvcyZYL4tpB9T0jgh8dnYhBHZOkH6Z6CkltfZ5Y+KbV1zhFAad7pTa15AbweFS+bGqL0AA+z43FeeAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjyuP9Y4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjyuP9Y4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CFCC4CED1;
	Fri,  7 Feb 2025 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738915302;
	bh=kFDeL/SJLlnJWVrJNKoLmxn9dhqX2WUHrbLloiO0mH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjyuP9Y4T8Fan+zoNUKCQyuX6jxV85gLTZoZl7hEYpJX0wcJ9Ctafn5JB4bniEoFv
	 SRkEJ61x6qG5jit8nnguB76u3YF0z83cdx1SC73KnrQlo65sYoDYjNF/UqkYX8TYUd
	 bCmI4+wD37/kwXdMLzB1jxhIP+dKPVsS2Ufjzms022j0pW2Bt1nKew4tWOZJRGhCTD
	 kgzARsNkHKsPZIn6VJM0V5oKERYoKKUqLbyB+tjXl7V0B9DPzDkjQjNaTK6Rlw8X1m
	 qoMEe5lFxkKWH3vGFGn4uYLipyVg/XSaNFkC30V3xMSio2VBL0kcdTLfmhgm1pd5gF
	 SflwleruakgWw==
Date: Fri, 7 Feb 2025 10:01:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Message-ID: <Z6W90hz6WaXfZCjQ@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206205030.38d84d4062786c9e36a825b6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206205030.38d84d4062786c9e36a825b6@linux-foundation.org>

On Thu, Feb 06, 2025 at 08:50:30PM -0800, Andrew Morton wrote:
> My x86_64 allmodconfig sayeth:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xca (section: .text) -> memblock_alloc_try_nid (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xf5 (section: .text) -> scratch_scale (section: .init.data)

This should fix it:

From 176767698d4ac5b7cddffe16677b60cb18dce786 Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Fri, 7 Feb 2025 09:57:09 +0200
Subject: [PATCH] kho: make kho_reserve_scratch and kho_init_reserved_pages
 __init

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 kernel/kexec_handover.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index c21ea2a09d47..e0b92011afe2 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -620,7 +620,7 @@ static phys_addr_t __init scratch_size(int nid)
  * active. This CMA region will only be used for movable pages which are not a
  * problem for us during KHO because we can just move them somewhere else.
  */
-static void kho_reserve_scratch(void)
+static void __init kho_reserve_scratch(void)
 {
 	phys_addr_t addr, size;
 	int nid, i = 1;
@@ -672,7 +672,7 @@ static void kho_reserve_scratch(void)
  * Scan the DT for any memory ranges and make sure they are reserved in
  * memblock, otherwise they will end up in a weird state on free lists.
  */
-static void kho_init_reserved_pages(void)
+static void __init kho_init_reserved_pages(void)
 {
 	const void *fdt = kho_get_fdt();
 	int offset = 0, depth = 0, initial_depth = 0, len;
-- 
2.47.2


-- 
Sincerely yours,
Mike.
