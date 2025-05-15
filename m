Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB70C4C6D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315177; cv=none; b=L0/h3pTiouX2GT6eTVjpQDQbM5PaKQuKAPn/fnTKVevAQ40IvayhTFLnxN1q/I+CTM3ALMpx7lwzSWajKzrORHDUeA6vKhDTCJrxY76bOC7+a3goBQjKicR1Mdaz3NJDLmb1GPE+eVYDs2WOExGQYq2npqYA56fLZpG3TdvDPtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315177; c=relaxed/simple;
	bh=mASmfpvqEEgxTgNHtk9zOGjZv+n17h6fKj6B2DBsz60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5I4QYz/1pNOGbvHxVdrIErnxsrLuzBUHUEMJdDkonna6ED4lHEkb0X8auv0AKprVR0PtYkPhvdT32OPAwa9B8TM0axPDqnKKsk2nPZ8xQQB2F7aogxzYyCWvSsnMSHAfJkU2R94s1T0+WrY8wvlCJHkMFygSNxjCj3dzt54ZUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw+leEDe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw+leEDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41B2C4CEE7;
	Thu, 15 May 2025 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315176;
	bh=mASmfpvqEEgxTgNHtk9zOGjZv+n17h6fKj6B2DBsz60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gw+leEDezrBzbGEhWulZzpr+IxZpH2+TQjKc8to1+STsa0hleBIXMdyc9W+axjQTK
	 FnlIe71EpHmOYCmd6yz/rkmTMc8gmYPd5g3UWJR44jYgOx4laBLdeDAC8HS8xjfOCF
	 4920tmUVGq3VkDBMSJyV7z+ligB4eIevYqXiyf5w9LoR5eA5G8xgMn75hFMUQ6uO6K
	 iRd/P+74HW+3c4CyT/mlLQoV1DOqaV1s4y/14ovehjfbx0tPkkbtll/Zqsb+/tq4jt
	 CimcGWAiFKrxWsfNZR8wpnvjBLEUWwAe0xhGd4WNIfBkEhIv0bh72XFH5wryVWvzXa
	 wRv9ZuOWRShzw==
Date: Thu, 15 May 2025 15:19:28 +0200
From: Ingo Molnar <mingo@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 09/15] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX
 and Hyper-V
Message-ID: <aCXp4FiECnz5f4Nr@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-10-mingo@kernel.org>
 <26c14b81-5eaa-48c2-9b28-518687fe9ea3@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26c14b81-5eaa-48c2-9b28-518687fe9ea3@suse.com>


* Jürgen Groß <jgross@suse.com> wrote:

> On 06.05.25 19:09, Ingo Molnar wrote:
> > Since the x86 defconfig aims to be a distro kernel work-alike with
> > fewer drivers and a shorter build time, refresh all the virtualization
> > guest Kconfig features, enabling paravirt spinlocks, and
> > enabling the guest support code for the following guests:
> > 
> >   - Xen
> >   - Xen_PVH
> 
> With those it might be a good idea to add:
> 
> CONFIG_XEN_BLKDEV_FRONTEND=m
> CONFIG_XEN_NETDEV_FRONTEND=m
> CONFIG_HVC_XEN=y
> CONFIG_XEN_BALLOON=y

Yeah, and these already get enabled automatically, due to their 
defaults:

 starship:~/mingo.tip.git> grep -E 'CONFIG_XEN_BLKDEV_FRONTEND|CONFIG_XEN_NETDEV_FRONTEND|CONFIG_HVC_XEN|CONFIG_XEN_BALLOON' .config
 CONFIG_XEN_BLKDEV_FRONTEND=y
 CONFIG_XEN_NETDEV_FRONTEND=y
 CONFIG_HVC_XEN=y
 CONFIG_HVC_XEN_FRONTEND=y
 CONFIG_XEN_BALLOON=y

defconfig files do not include entries that get enabled anyway - this 
compresses defconfig files substantially.

Thanks,

	Ingo

