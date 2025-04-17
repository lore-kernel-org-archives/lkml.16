Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3456C25178D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900674; cv=none; b=tKbMSonR1+Whnu8idxZDynQ6CgvmbARXrnzux8go7NIONevT2qjYhjnJYKXnzrGpd1hVL7Iyqu7B1dl7DlEtVttXnO/8Va0XbSZeGb7Y6h+u2K5znXKnjnYLyb9FA5CXKYzl2x7AF5kCSmfm/HYABVtdBo8bM12AwkoqPwnb+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900674; c=relaxed/simple;
	bh=ZWtyqLd0KUu/OoDp0pkKasAAbUekLA45tdG3GN70TXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo7Cy+wNbtCSUvmD8raVHu+tIB1ppB1yslBeAh9d8KmlQ1dGz66vmuUNX1B9CSNgfngadNBhfEnHRdw1blyarBDCrCB/vSKwALr1ZnD6cN6igCmChlRL7XCPqkXtYspVatGt0+gVvZzW5H9DTSZRV0XhWb6v5NZ7UYAhgFe4sxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ldan3gmy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ldan3gmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EA6C4CEE4;
	Thu, 17 Apr 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744900673;
	bh=ZWtyqLd0KUu/OoDp0pkKasAAbUekLA45tdG3GN70TXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldan3gmyFwSi2sUoFtPU7hdmwJnkjkTi1EHKo/6jMQxEdshQ70jazaY5OsSO+5TNV
	 p3Rk1NmsklcOSNHQI0BS63hKn2PBiID127QbwT6p42r6gcA+okuNh/44l0cNuMJkFR
	 aeOJX+p2kBI7TLq5peBnzxgv9GgM/lgmNiNwSvGQ=
Date: Thu, 17 Apr 2025 16:37:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cal Peake <cp@absolutedigital.net>
Cc: Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [STABLE] 6.12.23: vfio error (was: arch/x86/coco/tdx/tdx.c build
 error)
Message-ID: <2025041738-rocklike-undergrad-14d6@gregkh>
References: <eb5a1df4-95f8-2784-8f4e-8460f33f8f4d@absolutedigital.net>
 <808e1111-27b7-f35b-6d5c-5b275e73677b@absolutedigital.net>
 <66f3e1b3-6165-4a2e-f34c-de6fef86e441@absolutedigital.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66f3e1b3-6165-4a2e-f34c-de6fef86e441@absolutedigital.net>

On Mon, Apr 14, 2025 at 07:55:06PM -0400, Cal Peake wrote:
> On Sun, 13 Apr 2025, Cal Peake wrote:
> 
> > After booting the new kernel, I get errors trying to do vfio passthrough:
> > 
> > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.3, no available reset mechanism.
> > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.2, no available reset mechanism.
> > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.1, no available reset mechanism.
> > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.0, no available reset mechanism.
> 
> This was resolved by Alex Williamson, with his patch:
> 
> https://lore.kernel.org/lkml/20250414211828.3530741-1-alex.williamson@redhat.com/

Is this in Linus's tree yet?

thanks,

greg k-h
