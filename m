Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C2210FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688451; cv=none; b=Epz+Tzb0YlHQLKK5T+u6XbVoGc5QmKSFrRbG9UYBARZR90+9YicZ2Smck73rw9a1wbeuqPCKqvIY9/KcoMCnOonR8iAlMjox1zwhx8YhjDpXUX2vJ5oGxH2WukGW7Vvhfl7COWDHSyxpvB9yxQvBgBPyAW8HFrZmmrjZK/5mWGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688451; c=relaxed/simple;
	bh=jsleVz6RlPhJ6njd+OaCl7+w8VCP3UYS3mLnSoD4Uzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCUGUzwDPfY69tYxOmM0NHpL724Hos6XjJUlCo+IluScHNTnUkGmIxnGFyXKvMs4UAaQvY3SPAWZLx/RKTWRWFmab1JNGE6HXOiAeH3MkSg72lRnyQPM8TQ+89nDX74b30zpIbpzvmK7Z4guHZPFo/DE5IZcML5gZpXjPi7pELE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KqL/VT8I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KqL/VT8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8B9C4CEE3;
	Thu,  3 Apr 2025 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743688451;
	bh=jsleVz6RlPhJ6njd+OaCl7+w8VCP3UYS3mLnSoD4Uzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqL/VT8I0lYk9J4E2tqA3+oJFzTrffNbdYAl1gSET15FD6yrwkvssnm/5SNk9tJDx
	 lHaPIsmnaFhlqJR/7ohgDqGKDLPX6/0RBq3NM8NXNVtAMsBWadQ43Ai+LC83T9DQPe
	 xUOdC3f9ZfU4z3HkD0D3PGpqusxgm/wVdrduZ1IA=
Date: Thu, 3 Apr 2025 14:52:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
Message-ID: <2025040347-isolating-eastcoast-bfea@gregkh>
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh>
 <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
 <2025040230-showoff-spray-ac83@gregkh>
 <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
 <b6e7abf3-b263-410a-8f4c-eb9a8e2efa2b@oss.qualcomm.com>
 <e8c91706-1a94-4e3d-b2a9-9d670021bbc8@linaro.org>
 <CAO9ioeVYYy-10ZBmNLMzZK2+mZ5mKf_ZtGwRVf__Dg8GA=Sf0Q@mail.gmail.com>
 <56cbe0a0-048e-45a2-87f2-e2515c7e7414@linaro.org>
 <139a5c4c-b984-4e32-aefb-81dfce2ea0af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <139a5c4c-b984-4e32-aefb-81dfce2ea0af@oss.qualcomm.com>

On Thu, Apr 03, 2025 at 12:38:03PM +0300, Dmitry Baryshkov wrote:
> On 03/04/2025 12:35, Srinivas Kandagatla wrote:
> > 
> > 
> > On 03/04/2025 10:31, Dmitry Baryshkov wrote:
> > > On Thu, 3 Apr 2025 at 12:27, Srinivas Kandagatla
> > > <srinivas.kandagatla@linaro.org> wrote:
> > > > 
> > > > 
> > > > 
> > > > On 03/04/2025 10:25, Dmitry Baryshkov wrote:
> > > > > On 03/04/2025 12:18, Srinivas Kandagatla wrote:
> > > > > > 
> > > > > > 
> > > > > > On 02/04/2025 12:31, Greg KH wrote:
> > > > > > > On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
> > > > > > > > HI Greg,
> > > > > > > > 
> > > > > > > > On 01/04/2025 20:18, Greg KH wrote:
> > > > > > > > > On Sun, Mar 09, 2025 at 02:56:50PM +0000,
> > > > > > > > > srinivas.kandagatla@linaro.org wrote:
> > > > > > > > > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > > > > > > > > 
> > > > > > > > > > Hi Greg,
> > > > > > > > > > 
> > > > > > > > > > Here are few nvmem patches for 6.15, Could you queue
> > > > > > > > > > these for 6.15.
> > > > > > > > > > 
> > > > > > > > > > patche include
> > > > > > > > > >      - updates to bindings to include MSM8960, X1E80100, MS8937,
> > > > > > > > > >        IPQ5018
> > > > > > > > > >      - add support to bit offsets for register strides exceeding
> > > > > > > > > >        single byte
> > > > > > > > > >      - add rockchip-otp variants.
> > > > > > > > > >      - Few enhancements in qfprom and rochchip nvmem providers.
> > > > > > > > > 
> > > > > > > > > Ok, I wanted to apply these, and tried to, but they fail horribly
> > > > > > > > > because:
> > > > > > > > > 
> > > > > > > > > Commit: 1b14625bd6d4 ("nvmem: qfprom: switch
> > > > > > > > > to 4-byte aligned reads")
> > > > > > > > >      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
> > > > > > > > > raw_len")
> > > > > > > > >      Has these problem(s):
> > > > > > > > >          - Target SHA1 does not exist
> > > > > > > > > Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit
> > > > > > > > > reading is required")
> > > > > > > > >      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
> > > > > > > > > raw_len")
> > > > > > > > >      Has these problem(s):
> > > > > > > > >          - Target SHA1 does not exist
> > > > > > > > > Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than
> > > > > > > > > one byte")
> > > > > > > > >      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
> > > > > > > > > raw_len")
> > > > > > > > >      Has these problem(s):
> > > > > > > > >          - Target SHA1 does not exist
> > > > > > > > 
> > > > > > > > Looks some of your scripts or b4 is picking up
> > > > > > > > older version v1 of the
> > > > > > > > patchset
> > > > > > > > 
> > > > > > > > None of the above patches have Fixes tags in the V2 patches that I
> > > > > > > > shared
> > > > > > > > aswell as patches in linux-next.
> > > > > > > 
> > > > > > > Yes, that looks odd, it looks like b4 pulled in the
> > > > > > > wrong series, yes.
> > > > > > > 
> > > > > > 
> > > > > > Even that looked incorrect, as the v1 series only had one
> > > > > > patch("[PATCH 12/14] nvmem: make the misaligned raw_len non-fatal")
> > > > > > that had fixes tag. Not sure how these 3 patches are tagged as fixes.
> > > > > > 
> > > > > > > But, that's even worse.  Those "fixes" are now not actually marked as
> > > > > > > fixes of the previous patch.  So that information is
> > > > > > > totally lost, and
> > > > > > 
> > > > > > Its because this patch("PATCH 12/14] nvmem: make the misaligned
> > > > > > raw_len non-fatal") is taken as fixup patch and wrapped into the
> > > > > > original patch ("nvmem: core: verify cell's raw_len"), Also the sha
> > > > > > will not be valid for linus or char-misc tree.
> > > > > > 
> > > > > > > again, the first commit here, "nvmem: core: verify cell's raw_len" is
> > > > > > > broken so much that it took 3 other changes to fix it, which implies
> > > > > > > that bisection would cause problems if you hit it in the middle here.
> > > > > > > 
> > > > > > 
> > > > > > All the patches related to this are enhancements to nvmem core to
> > > > > > allow specifying bit offsets for nvmem cell that have 4 bytes strides.
> > > > > > 
> > > > > > Specially this check is also an additional check in core to make sure
> > > > > > that cell offsets are aligned to register strides.
> > > > > > 
> > > > > > > While fixing patches is great, and something we do
> > > > > > > in the tree all the
> > > > > > > time, let's not purposefully break things and then fix them up in the
> > > > > > > same exact patch series please.  That's just sloppy engineering.
> > > > > > > 
> > > > > > > Please redo this series completely.  I can take the
> > > > > > > "new device support"
> > > > > > 
> > > > > > I can send them but its going to be exactly same series, I dont think
> > > > > > anything will change as all of these patches are enhancements and
> > > > > > there are no fixes.
> > > > > > 
> > > > > > I hope this clarifies a bit, Please let me know if you still want me
> > > > > > to resend this series, which is going to be exactly same.
> > > > > 
> > > > > I think Greg is asking to squash the fixup into the relevant patch.
> > > > 
> > > > Its already squashed up in v2.
> > > 
> > > Then there should be no Fixes tags. Is the series that you are sending
> > > visible somewhere?
> > 
> > Yes, there is no fixes tags in v2 series,
> > 
> > Here is what is sent to as v2:
> > https://lore.kernel.org/lkml/47a3a851-
> > f737-4772-87c6-98613347435c@linaro.org/T/
> > #r01449e17cf6f9396967a822a0460ad4b1245e914
> 
> LGTM, thanks. Then I don't understand what is causing the controversy from
> Greg's side. The only piece of information that got lost is that Mark has
> found an issue with the previous version of the patch (I'd have added that
> information between the tags as you've squashed the patches).

Yeah, I'm confused here as well.  In v1, there were 3 patches that were
marked as "Fixes" for a previous patch in the series.  In v2, no Fixes
were marked at all, BUT the patches were still in the series.

So what went wrong?  Was the v2 version of the original patch changed so
that the 3 other ones were not needed somehow?  If so, why were they in
the list again?

Anyway, I'm confused...

Please send a v3 of this series, NOT in response to any email thread so
that b4 does NOT get confused in any way, and I'll be glad to review
them and apply them to the proper branch after -rc1 is out next week or
so.

And document the heck out of what has changed in the series in the
different patches please.

thanks,

greg k-h
