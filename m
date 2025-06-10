Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75D512D758
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589513; cv=none; b=oOHD5HnrNe/oL2nCAYijEBGaeeUQHI/tS3yL83JlBGdiG1ug9erR6LBiAq8ZgnbdZJVzv/iTSboOQIkVoUc1oXYI+79k0USM1oSjXy09fSkpYL/FnldFHAu3scoSU4v4YB1bm+lqhPflB/Btf0nbU80teWWRvQbVWQI4CAKo5XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589513; c=relaxed/simple;
	bh=KVf1u8Ke9mnKJKJCr9C29Gs5RPEocIzyDWvmVd4c9L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiBcFK9KUxEiHqIhHBoeO6p1CmAQZy3x84mH3lZGPJ22NW7QriuD8XUnJis8S2vvwoW0ouk8765WmDURrhEOEYUzUTE6Zua7TqJdi15WoH0G7hPZQhFghBN6OVd81Jb3y5qQm+KLGF3CNEBOyi2U3NuoXDIG7ZXS0D7kbw4EvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqiqbBTJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqiqbBTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A760AC4CEED;
	Tue, 10 Jun 2025 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749589513;
	bh=KVf1u8Ke9mnKJKJCr9C29Gs5RPEocIzyDWvmVd4c9L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqiqbBTJpy/c5W+abu2UWjE3aonVcvvHc2DyHyuK6F18c6MYwQNAZBkt7are0DCKG
	 A9UdgZ5yCAeyAlewT3j8SO7OcRS09ik5AtViJRuJxnnrIV81UUOcC5TBTeTYwwft7I
	 A8m2a+1ifzJDvTGTplmyI3LdTtdKSQywB+QbTtyfW8p046RO9Lyikcsmw3zd14ikjE
	 hGl+oe9EI9TITEovLv5X2e0WJ4aoxzigl+mP1MD7DndoTbaP/fuKSsouRJ6MqFw6SZ
	 hqrXUk85H7G3k+7t3KXlrAgOJjAKzwYBtPDgmr+Uqfc1XXQuJ2Sg4TmlUFycu8mVeb
	 g/tR0Zgl8LhwQ==
Date: Tue, 10 Jun 2025 14:05:03 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
Message-ID: <iutvcrog7abyz2ski5fhcfzikc54b2gwodsds2gmovutahapg4@5rk4o4b7eajz>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <vx6cxar2ium7zsqqzf57lmn2nhwemi2kmeu2kal6s4mazj3tp3@zdymccnsispv>
 <d52b6b3a-dd18-4c8e-b7f6-5ac0879d959a@oracle.com>
 <c0153249-5643-492f-ab2f-70dcafcfdd0c@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0153249-5643-492f-ab2f-70dcafcfdd0c@oracle.com>

On Tue, Jun 10, 2025 at 03:00:50PM +0200, Alexandre Chartre wrote:
> Here is the patch to handle both old and new binutils versions:
> 
> 8<------------------------------------------------------------------->8
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 00350fc7c662..91a2858fea14 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -7,6 +7,11 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
>  srctree := $(patsubst %/,%,$(dir $(srctree)))
>  endif
> +FEATURE_USER = .objtool
> +FEATURE_TESTS = disassembler-init-styled
> +FEATURE_DISPLAY = disassembler-init-styled
> +include $(srctree)/tools/build/Makefile.feature

Thanks, that worked.

That Makefile.feature thing is nice (except it prints an annoying
newline on every build after the first one).

Can we also use that to determine if binutils-devel (or binutils-dev or
whatever) is installed, and then make the build of disas.c optional?

Then if somebody tries to use '--trace', it could tell them to install
the binutils development package and rebuild objtool.  That way we don't
disrupt everybody's kernel build for a feature they probably won't use.

That would also mean disas_warned_funcs() would be disabled on missing
binutils-devel.  But I think that's probably fine.  In fact that will
now have less reason for existing now that we have this tracing.  Maybe
we won't need it at all.

-- 
Josh
