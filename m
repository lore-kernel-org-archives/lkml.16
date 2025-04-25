Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11E2D78A;
	Fri, 25 Apr 2025 19:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608691; cv=none; b=VKUXPfGprA32ERc1JURW96vSrjnM0H9I2ARjaqyfj7gjXaV41snt2wvWAhhHLslNKnEo24ksaR1qvRzHuqtzcM+0RmOjcK6mr525f55O7pMHsFAwU04NIFU3yWEU91GPgW1EHk6riOs82oyuRyVltIfERDbPqYnRwp3vf9x7p+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608691; c=relaxed/simple;
	bh=VURIFLvJMlHbwvKBM2tzEUd1MXIR+jjLfjKCMpwkC6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dD6Ga0EGMB1Ivp/ramO1YSk4j5iPd5Dk8IZvTmFvUMxMnhrJXbLfnpf2RKP+U+U5F9v4trKzjV0Wf6ZAVxFTA2u+/ly6HGT3Fr14/WpjPLiSYmvOCTjO1hSPWM5dzuHsUKgLKg1rXD+i4YZVpOxNNYF4SuILIYrlZWVKGxSuP1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ7RKpD7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQ7RKpD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D28C4CEE4;
	Fri, 25 Apr 2025 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745608690;
	bh=VURIFLvJMlHbwvKBM2tzEUd1MXIR+jjLfjKCMpwkC6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQ7RKpD7wXQ49G4nETSjVLgHEj0gxbIND+XhiDJjUGu8MfjwLfN+48n66/23Dl8Eg
	 nZT3d5aNT+OOa3OHiH9uhNZYjbvzH3ciojIXYi+ZaN/Z+CnIAPltifPJO8Qql//1U5
	 YwfoqtVQuArwlo0C6SlYSziovjXTO5svNCBbUNqRzLVCXI9rDIm7gbFJjOzrjoPIab
	 bbomkZdzbRlK3kqHL3vgqG5CE81Fo14gIRHtKSS/qBqKP2ynuH5Etq+StaT92QKoI9
	 KD5upa33m4OM7+MjBt3fQJ28bd71yYRe8FShUFvppLPygdbJxLD9QgPbKcPbhLJWvg
	 +mzwmyo2T/ObA==
Date: Fri, 25 Apr 2025 14:18:08 -0500
From: Rob Herring <robh@kernel.org>
To: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	saravanak@google.com, dmaluka@chromium.org, bgrzesik@google.com,
	jaszczyk@google.com, ilpo.jarvinen@linux.intel.com,
	usamaarif642@gmail.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, tnowicki@google.com,
	mazurekm@google.com, vineethrp@google.com
Subject: Re: [PATCH v2 2/2] x86/of: add support for reserved memory defined
 by DT
Message-ID: <20250425191808.GA2681888-robh@kernel.org>
References: <20250418124718.1009563-1-jaszczyk@chromium.org>
 <20250418124718.1009563-3-jaszczyk@chromium.org>
 <20250423140913.GA360030-robh@kernel.org>
 <CAGptq8GzJh38349ZZpEOw9sV8ihtJMHqV=PH9WUbG-C7b0tJjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGptq8GzJh38349ZZpEOw9sV8ihtJMHqV=PH9WUbG-C7b0tJjg@mail.gmail.com>

On Thu, Apr 24, 2025 at 08:06:33PM +0200, Grzegorz Jaszczyk wrote:
> On Wed, Apr 23, 2025 at 4:09 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Apr 18, 2025 at 12:47:18PM +0000, Grzegorz Jaszczyk wrote:
> > > From: Grzegorz Jaszczyk <jaszczyk@google.com>
> > >
> > > The DT reserved-memory nodes can be present in DT as described in
> > > Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml.
> > > Similar to other architecture, which supports DT, there is a need to
> > > create reserved memory regions for such nodes.
> > >
> > > Additionally, the x86 architecture builds its memory map based on E820
> > > description passed by bootloader and not on DT. Since x86 already has
> > > some DT support and allows booting with both ACPI and DT at the same
> > > time, let's register an arch specific hook which will validate if a
> > > reserved-memory region passed by DT is valid (covered by E820 reserved
> > > region entry).
> > >
> > > Without this check, the reserved memory from DT could be successfully
> > > registered, even though such a region could conflict with e820
> > > description e.g. it could be described as E820_RAM and could be already
> > > used at early x86 boot stage for memblock initialization (which happens
> > > before DT parsing).
> >
> > Sorry, I don't get how it conflicts. Wouldn't the E820_RAM be registered
> > with memblock and memblock then handles the conflict (or should).
> >
> 
> On x86, early memblock setup is performed by e820__memblock_setup()
> and regions which are marked as E820_RAM are added to the memblock
> "memory" type and such regions can be later on used for memblock
> allocation on early x86 setup. If memblock allocation is performed
> after e820__memblock_setup and before x86_flattree_get_config,  the
> reserved region described in DT (but described as RAM in e820) could
> be silently used before we scan DT for reserved memory regions.
> 
> Additionally there are more reasons why we want to make sure that e820
> reserved regions are in sync with DT reserved memory: resource tree
> building and setup pci gap based on e820.
> On the x86 resource tree is built taking into account e820 entries
> (e820__reserve_resources()) while on other arch like e.g. arm64, which
> relies on DT, the resource tree is built taking into account
> information from DT(request_standard_resources). Mixing both on x86
> seems problematic and at first glance could be achieved by e.g.
> patching e820_table via e820__range_update so other part of the early
> x86 kernel setup such as e820__setup_pci_gap() will also not use
> region which is described in DT as reserved-memory. But it is not
> straight-forward (initially I've tried to go through this path) e.g.
> it will require handling DT earlier (x86_flattree_get_config) but at
> the same time x86_flattree_get_config relies on the memblock being set
> up. Therefore it seems that making a requirement that the e820
> reserved region should be in sync with DT reserved-memory on x86 is
> reasonable.

x86_flattree_get_config() is a bit odd in that the DT is mapped and 
unflattened in one shot. Usually the flat DT is mapped and scanned 
early, and then only unflattened once memblock is up. You will be better 
off moving the early mapping and scanning earlier. Then the next thing 
you want from the DT early will be there. For example, the console or 
handling for kexec (which is its own reserved regions).

Rob
