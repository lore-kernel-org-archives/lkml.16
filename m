Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45D2586E7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709380; cv=none; b=Avgqv8eohZqOkiIvjxn3B+EHmG0lVbqxgn1kxS2AaIQFTE1pFPQVIhgXFmQ2bUm4KQdOwlGBo0BILrxqhPctUIGoCkeT/2vKk6HK8dg1DUv5HcnbdeEpfzyLit90af6xj2xhtNsWXnqsJKGLCeuDvtExXf8UeYAs9vnRIG71Eyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709380; c=relaxed/simple;
	bh=b/x2NUvbFUR66l6roI8VDnPgeGmaWIQbGAijO+uMQeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmF3+rBfi99nDbi8+Lmm46MBJzdJY42JgJjSn5UUkoTp8qIQoIGlQT7bJmGuwEzVtnm3S1HgnJg7MP8ABUirfJbLUPz47ug+nJDkadOvze0faW9KtnbMaN9QpGnNU5j4l2HRAukOGo+tXaYw25VKxhxkVsaQDg13+QUANcq8TGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoAsUEyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoAsUEyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D17C4CEE3;
	Thu,  3 Apr 2025 19:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743709380;
	bh=b/x2NUvbFUR66l6roI8VDnPgeGmaWIQbGAijO+uMQeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OoAsUEyAiTAD94fpsVU4IYpeA6ZzRmZv2eh0IeigYg6jmiEsjpHvc+zm5HeaM0iod
	 yxi9Pvtm0EkW2sVSNVvxMz7qnMDK8AroQJ+dA27yDDtBVB4D2orPv3a/Y3zmjN7ElT
	 pkh+01oq0xhtX/VadaehdCSaZz5IPMkxLaOaUkKRRhrBBTZ9nveOcaEZNZwy7dBqnJ
	 p1qhl/9ENnKUmukaRUUIEztq7krtuUIyyZp1tMP/1utncdOTn57Ze4Bb9D40+2innA
	 koqGs9Qi3lHTWbeJGa85kTi94ICORlaABru6cdDjJkw9agY68lAaxukupFtgMlAUK6
	 kY2Xo8pUOHAfw==
Date: Thu, 3 Apr 2025 12:42:57 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <hon37m7rc4qn6a52btgbeplqmcd47wa4huehc4aoddgpqsgghk@vbfd6ma4lw6k>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
 <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
 <Z-6gyQk2WlHc4DNw@gmail.com>
 <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>
 <sqn3nlc6q26h5dnwnrsikg3mthxv4o7litoilsgufq4sdhcfqd@hp4goo43hdof>
 <CAHk-=wh2WtMskQ7ASnDJ_n0ZJs4hueEXsurwQpEvzmx-aZKFag@mail.gmail.com>
 <mp26sywwsgekejs7fvsjhym3zunh4y42z2mkw5txi37dolas3l@zup3ny7bceaw>
 <CAHk-=wixtChqkJ_NmORGMnq1pmD0x45HFgML54G2Dm-bRYAyWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wixtChqkJ_NmORGMnq1pmD0x45HFgML54G2Dm-bRYAyWg@mail.gmail.com>

On Thu, Apr 03, 2025 at 12:12:44PM -0700, Linus Torvalds wrote:
> On Thu, 3 Apr 2025 at 11:24, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > There's also smap_save() / smap_restore().  For the latter we'd need to
> > look for alternatives with "push reg; popf", which is definitely not
> > SMAP-specific.  So we'd need to start reading feature bits again, which
> > ends up even worse than what we had before.
> 
> Now, I agree that smap_save / smap_restore might be worthy of an
> annotation, to show that "this is just a push/pop, but the intent is
> to save AC".
> 
> Would that be ok?

Yeah, that should be fine.

If we can keep the annotations for those other alternatives, that leaves
most of the benefits of the original patch intact.

The "nop with stac/clac" alternative check does look trivial enough.

-- 
Josh
