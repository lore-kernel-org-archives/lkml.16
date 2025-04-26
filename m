Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55986AD3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745693757; cv=none; b=nRB6TeAKLZB3ldjJHlxjCvN67JD0duKR80AjGcAJQ/RCd87MUpJB4GjMF1y5pC3NdCFR/msAIUVpICZtEjWO9wKiSwZQWFT/O6NESHkEsl4oH/eAw1NYRntZTitw0HhA+6EJkmYUXw+Tj6gXhZU38yVHURjvtovgjcPAsc/YwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745693757; c=relaxed/simple;
	bh=F0vG+nDcCONKZs4e6RtOitQ9n8Mz1fjCVmRW/ho89E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyT0lIyB7GhPHdEGOTPHRQWWOgj+nrgWc3s+j1bYGdcz+f7SfO30w9GuShMJxWTYabCvpIlvQl5RX4Bm5LycrIP2awI4jzJN5yhOc09B1A8unctzPEosi2EfEzHhi80h+6chsrhb7Vt2tf1KTboCQz2EtHDBLCZO/vVchWqWo/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+3VZhA2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+3VZhA2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC84C4CEE2;
	Sat, 26 Apr 2025 18:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745693756;
	bh=F0vG+nDcCONKZs4e6RtOitQ9n8Mz1fjCVmRW/ho89E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+3VZhA2rqQfpKTKP2m4yO0DolUCdMwEmkMYv15ph8vW2QWnr+dwsgrdPEDAa+XKU
	 cT+lBTivJUJbXq+YwDynrxuVGxxd7bxMoEAer2TcpR5Z/80KWu1DFGnJTMAWfaqwHp
	 Wt4Jx4tgNhuiLnQ6Uh2yFQ/qvjnnEMx6H4ogxz68sX4Wr+dcBgU5QN/U2h2Uj0/Z1G
	 PhGfSzqlUafQ7G0XaImHK804liJwS1k4ojK4L0zZghvVKYBfY33rV6LPviVBGb4Iu6
	 DYFyY1v4Quv3vP2Oe2ssiS64YmX/cVrSFbo0ye/YxMwYHLtMptqvYcMDxuiFBr260w
	 jjSeafo4hNDdA==
Date: Sat, 26 Apr 2025 20:55:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <aA0sNu0gcjlvhlDT@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <aAyiganPp_UsNlnZ@gmail.com>
 <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> Dropping CMOV would mean dropping P5 support.

Yeah, I think we should make the cutoff at the 686 level. Is there any 
strong reason not to do that? Stable kernels will still exist for a 
very long time for ancient boards.

	Ingo
