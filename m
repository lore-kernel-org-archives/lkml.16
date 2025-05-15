Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96136C2C9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307999; cv=none; b=i5Xt7slZXieqEfYhPtXGtYyVO1nY2FHmz8UXWLpltpMqzxppj+j/8mC5xr4T1Uwe6afKhjf/4nYa7k3nN/SRzuXnVYHcfSEl1shOLb3q4kqDBoUR7MsqBkdp1dYF/du2jE+LUDfHyp+SlQMGcqLrNoEMl+Qwgw/VmcQa5TPiqck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307999; c=relaxed/simple;
	bh=O3ux7LFqWgocIOQ/x88a4TtGo6sbuiXHxUjl7ljgYWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fL5mk/XD271D2zh0uWfDUEgSz7sEkZRtqQwibZlXWxTvKyvORe0/5g9pEqW+yImEJoAsf+zgUHcbCWfB33SG5y+js4XVjxutX6kaGH2CtsKO4XjH7eri8KzsWyqrTNpYEa5TSLnDsq0BW3QS3gZtOUub6ZbVf5gCwt9Y4kZLvFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nqtt4Ktc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nqtt4Ktc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F063C4CEE7;
	Thu, 15 May 2025 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747307999;
	bh=O3ux7LFqWgocIOQ/x88a4TtGo6sbuiXHxUjl7ljgYWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nqtt4Ktc+D0NFrJNC6RMvhe0LgP35Sn2gEyFSe0PkOIkvuwQxv57JQYNXv5MyDNK9
	 Hk0v3k0nxcOwH/T71WqOasAXT5+dQdVhTA6BGG80vFsG26qJdclDt5gSikHQV3+z4w
	 RroPraNcqxzyteHe7ki2vl+St1qnWq9MGs4HEI/QrBOdqei8A/lSza7Jfclp1tjkeE
	 FmY1RQ7a6KUi023Mgv1bnvoPlC8duxxqB325fx/QnWA+qXWVJ8PFbrOq+1bcmOe3wN
	 Lku2WG3expolbFGXoQIoBNDqQ+kqRuuj71u9vowwt2Q1uRyovm7m/W4UTaUTMFqVvU
	 d0wGkUYdnII9A==
Date: Thu, 15 May 2025 13:19:54 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 30/29] x86/boot/e820: Unify e820_print_type() and
 e820_type_to_string()
Message-ID: <aCXN2mcspYiXJIu0@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-9-mingo@kernel.org>
 <aAc_7Zm1PqeRmKMW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc_7Zm1PqeRmKMW@kernel.org>


* Mike Rapoport <rppt@kernel.org> wrote:

> On Mon, Apr 21, 2025 at 08:51:48PM +0200, Ingo Molnar wrote:
> > So it is a bit weird that the actual RAM entries of the E820 table
> > are not actually called RAM, but 'usable':
> > 
> > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB usable
> > 
> > 'usable' is pretty passive-aggressive in that context and ambiguous,
> > most E820 entries denote 'usable' address ranges - reserved ranges
> > may be used by devices, or the platform.
> > 
> > Clarify and disambiguate this by making the boot log entry
> > explicitly say 'kernel usable RAM':
> > 
> > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
> > 
> > Signed-off-by: Ingo Molnar <mingo@kernel.org>
> > Cc: Andy Shevchenko <andy@kernel.org>
> > Cc: Arnd Bergmann <arnd@kernel.org>
> > Cc: David Woodhouse <dwmw@amazon.co.uk>
> > Cc: H. Peter Anvin <hpa@zytor.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/x86/kernel/e820.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> > index 8ee89962fcbf..99f997ae88dc 100644
> > --- a/arch/x86/kernel/e820.c
> > +++ b/arch/x86/kernel/e820.c
> > @@ -187,7 +187,7 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
> >  static void __init e820_print_type(enum e820_type type)
> >  {
> >  	switch (type) {
> > -	case E820_TYPE_RAM:		pr_cont(" usable");			break;
> > +	case E820_TYPE_RAM:		pr_cont(" kernel usable RAM");		break;
> >  	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
> >  	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
> >  	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;
> 
> We have e820_type_to_string(), IMO the whole switch here can be replaced by
> 
> 	pr_cont(" %s", e820_type_to_string(type));

Yeah, agreed, but there's a few additional details:

 - Your suggestion doesn't work as-is, because e820_type_to_string() 
   takes an 'entry' parameter, not 'type'.

 - There's some difference in the messages, so I think this should be a 
   separate patch.

 - Also, I think unified messages with the best of both sets of 
   messages is the best outcome, instead of just picking one side.

See these commits in the WIP.x86/e820 tree:

   x86/boot/e820: Change e820_type_to_string() to take a 'type' parameter
   x86/boot/e820: Unify e820_print_type() and e820_type_to_string()

With the more interesting one attached below.

Thanks,

	Ingo

=================================>
From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 15 May 2025 13:17:45 +0200
Subject: [PATCH] x86/boot/e820: Unify e820_print_type() and e820_type_to_string()

Use e820_type_to_string() to derive e820_print_type(),
and unify the messages:

 - Don't Capitalize Words Within Sentences Randomly

 - Use 'Device reserved' instead of 'Reserved'

Suggested-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/kernel/e820.c | 50 ++++++++++++++++++++------------------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 3a86216ee05f..aadc46f3d074 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -68,6 +68,26 @@ unsigned long pci_mem_start = 0xaeedbabe;
 EXPORT_SYMBOL(pci_mem_start);
 #endif
 
+__init static const char * e820_type_to_string(enum e820_type type)
+{
+	switch (type) {
+	case E820_TYPE_RAM:		return "System RAM";
+	case E820_TYPE_ACPI:		return "ACPI tables";
+	case E820_TYPE_NVS:		return "ACPI non-volatile storage";
+	case E820_TYPE_UNUSABLE:	return "Unusable memory";
+	case E820_TYPE_PRAM:		return "Persistent memory (legacy)";
+	case E820_TYPE_PMEM:		return "Persistent memory";
+	case E820_TYPE_RESERVED:	return "Device reserved";
+	case E820_TYPE_13:		return "Type 13";
+	default:			return "Unknown E820 type";
+	}
+}
+
+__init static void e820_print_type(enum e820_type type)
+{
+	pr_cont(" %s", e820_type_to_string(type));
+}
+
 /*
  * This function checks if any part of the range <start,end> is mapped
  * with type.
@@ -186,21 +206,6 @@ __init void e820__range_add(u64 start, u64 size, enum e820_type type)
 	__e820__range_add(e820_table, start, size, type);
 }
 
-__init static void e820_print_type(enum e820_type type)
-{
-	switch (type) {
-	case E820_TYPE_RAM:		pr_cont(" System RAM");				break;
-	case E820_TYPE_RESERVED:	pr_cont(" device reserved");			break;
-	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");			break;
-	case E820_TYPE_ACPI:		pr_cont(" ACPI data");				break;
-	case E820_TYPE_NVS:		pr_cont(" ACPI NVS");				break;
-	case E820_TYPE_UNUSABLE:	pr_cont(" unusable");				break;
-	case E820_TYPE_PMEM:		/* Fall through: */
-	case E820_TYPE_PRAM:		pr_cont(" persistent RAM (type %u)", type);	break;
-	default:			pr_cont(" type %u", type);			break;
-	}
-}
-
 /*
  * Print out the size of a E820 region, in human-readable
  * fashion, going from KB, MB, GB to TB units.
@@ -1065,21 +1070,6 @@ __init void e820__finish_early_params(void)
 	}
 }
 
-__init static const char * e820_type_to_string(enum e820_type type)
-{
-	switch (type) {
-	case E820_TYPE_RAM:		return "System RAM";
-	case E820_TYPE_ACPI:		return "ACPI Tables";
-	case E820_TYPE_NVS:		return "ACPI Non-volatile Storage";
-	case E820_TYPE_UNUSABLE:	return "Unusable memory";
-	case E820_TYPE_PRAM:		return "Persistent Memory (legacy)";
-	case E820_TYPE_PMEM:		return "Persistent Memory";
-	case E820_TYPE_RESERVED:	return "Reserved";
-	case E820_TYPE_13:		return "Type 13";
-	default:			return "Unknown E820 type";
-	}
-}
-
 __init static unsigned long e820_type_to_iomem_type(struct e820_entry *entry)
 {
 	switch (entry->type) {
