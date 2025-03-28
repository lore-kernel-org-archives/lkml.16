Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957A18035
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743134272; cv=none; b=DQiiyfQFHtmH/PkVp/nQWINh2QqXoifBq2tNzPbyfb0eGkh8+ODFlHlTRKRLfpZoEeDaEO8N4WHpH2GhG37xBD/GsHTp5P7dmssvVh6A8NGXkkvWlORxagmDDTnA/tucZ6qpSBWUMAeEPpWneZkg4G8AS8vGWbue4RB8ydHzTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743134272; c=relaxed/simple;
	bh=nQsk9tASXs49hoe3W1eAIkv9OvcSVNgsdXt1lO20asI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp5vYbVnu4qEcZjNfXiWS9vlcVYIBT8UfyEZvhW0WPQv6FhbQubqB6VDpWjPdt3qMnTjDvIsuQ8jugrMKDzslI9y5OoTwKaJd5mo8FDzN3+r1DyKmvtorDM8YwNAQ05tDuurVJL4+fc4UOrgEK/Bap0q1u1si82wOOT1K1d0l2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwns4Gno; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwns4Gno"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77721C4CEE4;
	Fri, 28 Mar 2025 03:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743134272;
	bh=nQsk9tASXs49hoe3W1eAIkv9OvcSVNgsdXt1lO20asI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fwns4GnoMUICGX78rpEJfR9TO+qK9kRb9SNCRRPirlhZSPkp0fv1wdX1pAGtTFjxM
	 8QE8aj/loeXz2dG8iII+IhTYZSD++holamf3gGIhI3uhrmppUtmdumguKCtbmYxRD6
	 2W42pgaFdOPCyz2brqGcOJNN3y20Fg2k6ViTppd3qcOENWAj2uZiCKc9clMz7zKKoG
	 EsEfoDu11Oeq3SN0e+x2ACmsMR1JsVkxnDT6moktQ+AK+lOg840SrAzzmavGSfWH8T
	 Gpx3HqobW3cDmVmRveOlMit3J5a9/wLz8kHAuiE7CrZcncmxjhDGbzzZGMIleyR6g+
	 RLwpeCupR8dVA==
Date: Thu, 27 Mar 2025 20:57:49 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: objtool crash processing drivers/gpu/drm/vmwgfx/vmwgfx_msg.o
Message-ID: <grnfthlwv6jozl4psujzqyj7mwnsyugpwr5tcy72n4qermqpyp@mabr2g2dbt2g>
References: <d86b4cc6-0b97-4095-8793-a7384410b8ab@app.fastmail.com>
 <Z-V_rruKY0-36pqA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-V_rruKY0-36pqA@gmail.com>

On Thu, Mar 27, 2025 at 05:41:18PM +0100, Ingo Molnar wrote:
> 
> * Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > I saw this on one randconfig build failing today with yesterday's
> > next-20250326 (with a couple of patches on top), using gcc-14.2
> > and the attached config I assume this is a rare configuration:
> > 
> > ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --sls --stackval --static-call --uaccess   --module drivers/gpu/drm/vmwgfx/vmwgfx_msg.o
> > Segmentation fault
> > 
> > I have not tried to analyze it any further, but I would guess that
> > this is a rare configuration, not a recent regression.
> 
> I can reproduce this now too, not with a randconfig but with a distro 
> DEB package build:

Thanks, I was able to reproduce with both configs.  The below fixes it,
which then results in another warning:

  drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_recv_msg.cold+0x0: unreachable instruction
  drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_recv_msg.cold+0x3: unreachable instruction
  drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_recv_msg.cold+0x6: skipping duplicate warning(s)

Which is another easy fix.  I'll send patches.

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 3bf29923d5c0..29de1709ea00 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4037,7 +4037,7 @@ static bool ignore_unreachable_insn(struct objtool_file *file, struct instructio
 	 * It may also insert a UD2 after calling a __noreturn function.
 	 */
 	prev_insn = prev_insn_same_sec(file, insn);
-	if (prev_insn->dead_end &&
+	if (prev_insn && prev_insn->dead_end &&
 	    (insn->type == INSN_BUG ||
 	     (insn->type == INSN_JUMP_UNCONDITIONAL &&
 	      insn->jump_dest && insn->jump_dest->type == INSN_BUG)))
