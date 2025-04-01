Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD61E5B71
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490811; cv=none; b=oAxsq1/d3ViGnu1qY0IE3/wZIb2VEUqHGa0SNJHUAQ2oX5i/QiMSbq2m5PzwVftpWaDXvOVhmq9C7z5usdch9w74HrOrKig9lzuMFin5MOcCw01LxeMyB3lMWvPQFe1zCh5cEDyyYNR32n+D1tkLsHHKbw41w8aNpGvPPz1stEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490811; c=relaxed/simple;
	bh=hc78BvCvrSty4uT0h9zQYi1oQzYUmmmODb/fJdmF7JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2LNLAUhrEzqK4nUfArrjJZnXcsjz+utWNYvO1fjBEi2uZX7pHTJj6V/OH9mf6XwobsJeHoUwF9iY/7xB7p2CThMcgK0AGu9XOG0phQDpQwQRSDmHYqMmouaxoR/Fa+Wf4TaVTdKtrFJbM4TVP+oQ7BjjcGBNRdW6yLn7Eb/D7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bom/1L08; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bom/1L08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CEDC4CEE8;
	Tue,  1 Apr 2025 07:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743490811;
	bh=hc78BvCvrSty4uT0h9zQYi1oQzYUmmmODb/fJdmF7JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bom/1L0807acboj1ZOv49/OzC9pI4SnTuSlVCUfYZqspHpi8oJD3YCvYW96f1gyCY
	 3XTOcEjuUrY1ixjVgS78hJxzeWUoVyGDjWG2u2lqRyd8dPij2jn4AnoaTe9lHAvTKl
	 XOyj3QI5MuR33r1exblQD28D79tPKsWC0fmLRHbfXAANL6HiyDL1LGAoHPyhBnNfQh
	 26IDj+1HPJwloTv2AWjOLYnzD0Rd7d/gYTKh/DGleavpIcpXCA9w+bEmYM8JwXVCVV
	 0VoqInbWSOMtuLzjSdGYkc7a++MgeFgOMiU9QCQVtyopLGa2dANp5zZ7pT5zabYSji
	 XtW+83gGFm2dQ==
Date: Tue, 1 Apr 2025 09:00:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"H. Peter Anvin (Intel)" <hpa@zytor.com>,
	Michael Kelley <mhklinux@outlook.com>,
	"Xin Li (Intel)" <xin@zytor.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Nikolay Borisov <nik.borisov@suse.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86: don't re-generate cpufeaturemasks.h so eagerly
Message-ID: <Z-uO9kK0QLuKfczo@gmail.com>
References: <20250305184725.3341760-3-xin@zytor.com>
 <174238223959.14745.6970497940010271580.tip-bot2@tip-bot2>
 <SN6PR02MB415756D1829740F6E8AC11D1D4D82@SN6PR02MB4157.namprd02.prod.outlook.com>
 <CAHk-=whChrRQ0kuRuZo2+9D+J2BO9Q=1CV2eEk_yjrNi8kdjBg@mail.gmail.com>
 <SN6PR02MB4157D2C2260E6BD529BCF08AD4A52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250328162311.08134fa6@kernel.org>
 <CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
 <CAHk-=wi8h2fNpPBYakOMGhCk=pBSAQoLv=YG4KiTy45SZSQe7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi8h2fNpPBYakOMGhCk=pBSAQoLv=YG4KiTy45SZSQe7w@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 28 Mar 2025 at 17:14, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > So I think the real fix is something like this ENTIRELY UNTESTED
> > patch.  Whitespace-damaged again to make sure people don't apply this
> > mindlessly, it needs more thought:
> 
> .. and that ended up being even more whitespace-damaged than I meant
> to make it, because it also line-wrapped.
> 
> Oh well. Not pretty, but I hope people still get the idea.
> 
> And I just actually tried doing a build after touching the .config
> file, and it did seem to work.
> 
> But since I had _also_ messed with the config file on purpose earlier,
> I'm not sure I'm actually testing the thing the networking builds
> trigger. So I might be entirely missing something.
> 
> Adding Masahiro to the cc, so that somebody competent can actually
> check my thinking.
> 
> Masahiro, see the complaint (and my reply) in
> 
>     https://lore.kernel.org/all/20250328162311.08134fa6@kernel.org/
> 
> for background...

Just an update: Linus applied the fix below directly, which should 
resolve the problem. Thanks Linus!

Thanks,

	Ingo

==============>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 14:19:55 -0700
Subject: [PATCH] x86: don't re-generate cpufeaturemasks.h so eagerly

It turns out the code to generate the x86 cpufeaturemasks.h header was
way too aggressive, and would re-generate it whenever the timestamp on
the kernel config file changed.

Now, the regular 'make *config' tools are fairly careful to not rewrite
the kernel config file unless the contents change, but other usecases
aren't that careful.

Michael Kelley reports that 'make-kpkg' ends up doing "make syncconfig"
multiple times in prepping to build, and will modify the config file in
the process (and then modify it back, but by then the timestamps have
changed).

Jakub Kicinski reports that the netdev CI does something similar in how
it generates the config file in multiple steps.

In both cases, the config file timestamp updates then cause the
cpufeaturemasks.h file to be regenerated, and that in turn then causes
lots of unnecessary rebuilds due to all the normal dependencies.

Fix it by using our 'filechk' infrastructure in the Makefile to generate
the header file.  That will only write a new version of the file if the
contents of the file have actually changed.

Fixes: 841326332bcb ("x86/cpufeatures: Generate the <asm/cpufeaturemasks.h> header based on build config")
Reported-by: Michael Kelley <mhklinux@outlook.com>
Reported-by: Jakub Kicinski <kuba@kernel.org>
Link: https://lore.kernel.org/all/SN6PR02MB415756D1829740F6E8AC11D1D4D82@SN6PR02MB4157.namprd02.prod.outlook.com/
Link: https://lore.kernel.org/all/20250328162311.08134fa6@kernel.org/
Cc: Peter Anvin <hpa@zytor.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 0fc7e8fd1a2e..27efe2dc2aa8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -277,12 +277,11 @@ cpufeaturemasks.hdr := arch/x86/include/generated/asm/cpufeaturemasks.h
 cpufeaturemasks.awk := $(srctree)/arch/x86/tools/cpufeaturemasks.awk
 cpufeatures_hdr := $(srctree)/arch/x86/include/asm/cpufeatures.h
 targets += $(cpufeaturemasks.hdr)
-quiet_cmd_gen_featuremasks = GEN     $@
-      cmd_gen_featuremasks = $(AWK) -f $(cpufeaturemasks.awk) $(cpufeatures_hdr) $(KCONFIG_CONFIG) > $@
+      filechk_gen_featuremasks = $(AWK) -f $(cpufeaturemasks.awk) $(cpufeatures_hdr) $(KCONFIG_CONFIG)
 
 $(cpufeaturemasks.hdr): $(cpufeaturemasks.awk) $(cpufeatures_hdr) $(KCONFIG_CONFIG) FORCE
 	$(shell mkdir -p $(dir $@))
-	$(call if_changed,gen_featuremasks)
+	$(call filechk,gen_featuremasks)
 archprepare: $(cpufeaturemasks.hdr)
 
 ###

