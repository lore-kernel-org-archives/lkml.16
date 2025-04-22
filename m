Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D616835893
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305014; cv=none; b=fZ2wbCgiAQ4Hy1g5xmcX+8xApz33EOmy68GE2WeCfLKmLU34h2X8ko+IU+sIqYdms2YUOTuv2+E6vUihH2FajgpYca1gEZswYp16t3OYYijNWMtvL8vhq8djYhuZx44a/r2Odu9eZoDBeKWYCJFHzagHYfV21ivsIFIkG8W1P9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305014; c=relaxed/simple;
	bh=YnRXmAWbig+Xap6gkgn1Tv9qDd2ui8UFtvBteCshp+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYazcxB81s6qoQzXFGzneXpqYeGzBUtrHINj3zlCSJrixpEj3b7cvFGD3pLhuaYJgbAoy9yA+GVlcu7ej36Ns+u6eoVbLZnRTceFOfuTlMMDih6y92H6OgiCEHG86RFtiG2gnZSrhEdIYHElTeJaNAmiE34DKNxpzDb4/u6Z+VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tymLr9Xe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tymLr9Xe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7A2C4CEE9;
	Tue, 22 Apr 2025 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745305013;
	bh=YnRXmAWbig+Xap6gkgn1Tv9qDd2ui8UFtvBteCshp+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tymLr9XeaF1mICdlCmmmRr3jk87w5g9Ned+zuMB8jJag14fqYD5BCDTjbeQtKFyy2
	 T/ex9qIGs9vuy1tr4i3YwAInzS1tGFBCh/MQDREQ16SCsMpGxwWjs2gdJvWvedq310
	 ZM7xtYGaKFcmgNRNOb0GNryi7+lVImxWtwye/gPxJvsTOwIU0i+OwQeL66Gb7+7aBQ
	 VH7q8skeqxQ8ihI0woM3AhEEHkybseXpZeBb+uxVcj72+xjwqwuULnDRScLEwd7A+2
	 6w+EFh4avP4dgu8nKqDe9wX3gck3ktVKMnE7NOqkHcIOFTQPuHS6rj0isi8UWPxGHy
	 ydz9ZsGHILjbg==
Date: Tue, 22 Apr 2025 08:56:49 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Changbin Du <changbin.du@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86: remove orphan header file e820.h
Message-ID: <aAc9seuR4AMuO4qw@gmail.com>
References: <20250421041419.3167094-1-changbin.du@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421041419.3167094-1-changbin.du@huawei.com>


* Changbin Du <changbin.du@huawei.com> wrote:

> The header arch/x86/include/uapi/asm/e820.h isn't used by any source file any
> more. The e820 related items are defined in arch/x86/include/asm/e820/types.h.
> So clean it up.
> 
> Signed-off-by: Changbin Du <changbin.du@huawei.com>
> ---
>  arch/x86/include/uapi/asm/e820.h | 82 --------------------------------
>  1 file changed, 82 deletions(-)
>  delete mode 100644 arch/x86/include/uapi/asm/e820.h

This is part of the specification of the bootloader protocol between 
bootloaders and the Linux kernel and thus should not be removed.

The kernel has its internal types that adhere to the same 
specification, but that's not grounds to remove this header.

Thanks,

	Ingo
