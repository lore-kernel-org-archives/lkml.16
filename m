Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A019DF6A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745749106; cv=none; b=h4PB3Hp+mklwELmG46qLZrBhS/v0LCi2kisp0XMFDdUdtygD0NbCe/jAkh7VxOMgkxHBOru0kDQDqFGS+m+yhYV45MTChDF4FDXGChxPK4GiOQ1Z3xphldbfZ0f/nSh3WqOsYZB67oNM8IZAmYL7XKtm2fxKgvzBj+xa2+pVni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745749106; c=relaxed/simple;
	bh=L7uhmgzdcPMMNpeCjXVtvKibb8+nFSEltpr8Sjv+mGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+rIntZSjMOvmDTEsjAAQ+f/O8jCbq+zjGlSK93izu1e0gZmDBLNltPm1Bgb3OoRrHR+V4BmX+ZsYFdorRBmu2JxnZIRcdTuvHIpP5cYtWuIeLzAy2WWtitdf6c6YNavn2MgI2TeJwoHUgobHe3wT4vQbkh0NhVaCXu/lQPRzJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvCrjiyb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvCrjiyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E785C4CEEF;
	Sun, 27 Apr 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745749106;
	bh=L7uhmgzdcPMMNpeCjXVtvKibb8+nFSEltpr8Sjv+mGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvCrjiybvTY0/WvL1ox/pY2ZElx88ZlFJXqTv22U0Yn7gwzaqmLmacBEfhQgvgrfL
	 8SI72doZ4zQQ2fTGluj2fPPRLSdBU1mQVPKKpB5lc3hS0YdF2CCIXnNBpGr3VSINjE
	 CHWysqhvkgob59ydkDUqfVBQ+mQSkUAfk/eyOhkb37d0UJRmy02DjlHSNY+jHSBp/x
	 njihO9Gof91jSkeg4Dtv0Vv6CXBm+U517/QysoHnszSSAZsN2VYrEATGNZ/cVCEiy0
	 duvXRbmEOmujKqCS8PutcLDaBQmi2b3QfVuFe48V/0H+YjxXirETLEIMUdYhwKcpIc
	 w+9GubMfHo3mw==
Date: Sun, 27 Apr 2025 12:18:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA4EbGhuHNUYlkp_@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
 <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <9D1971C6-8C13-4526-8D2B-37A1D3B0B066@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9D1971C6-8C13-4526-8D2B-37A1D3B0B066@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> The undefined zero case applies to family < 6 as far as I know... the 
> same platforms which don't have cmov...

So, technically, these are family 5 CPUs with CMOV support, if 
Kconfig.cpu can be believed:

  MGEODE_LX
  MCRUSOE

Right?

	Ingo
