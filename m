Received: from mx2.absolutedigital.net (mx2.absolutedigital.net [50.242.207.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E454782
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.207.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744916461; cv=none; b=JN7cN5jerqdzIS6KmO38zkkIjozSRcakUkT97IGael9IibOpannJ3Ipo5phyQMqH8I4ZJlCo6lWne+X5+oRug+b/Tc1GGCwxMTY6mErx2MgbNDvdMIv8Ir4tyN4UYgkym3is97Cw74UauASm7H6/ZtGBDOfdu3j/x2j3WmZDG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744916461; c=relaxed/simple;
	bh=IcY4Xs00z/94hiekZ+NdZhIyCTwKBvHHUPpu2xerFNQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P8kzDMTmPg93rV6n7/EAUod9l5gR3enaCIkYBTgYR4KvJSHdfYmZvoZQT59NDiE0GODt67yXGRZPesOaRuA9exm6Fi0TmA5nFJf/1XOgy9qiifWxyiAZyObUo35+d/Ayyg/XKULBUcEv1+zNwhH1NUDzL1PqPqcThAIg+LcYapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=absolutedigital.net; spf=pass smtp.mailfrom=absolutedigital.net; arc=none smtp.client-ip=50.242.207.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=absolutedigital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=absolutedigital.net
Received: from lancer.cnet.absolutedigital.net (lancer.cnet.absolutedigital.net [10.7.5.10])
	by luxor.inet.absolutedigital.net (8.18.1/8.18.1) with ESMTPS id 53HJ3GVq010291
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 15:03:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by lancer.cnet.absolutedigital.net (8.18.1/8.18.1) with ESMTPS id 53HJ0KMo010230
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 17 Apr 2025 15:00:20 -0400
Date: Thu, 17 Apr 2025 15:00:20 -0400 (EDT)
From: Cal Peake <cp@absolutedigital.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vishal Annapurve <vannapurve@google.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [STABLE] 6.12.23: vfio error (was: arch/x86/coco/tdx/tdx.c build
 error)
In-Reply-To: <2025041738-rocklike-undergrad-14d6@gregkh>
Message-ID: <ad526922-53a0-c9f9-df5b-ce73c9fcb87@absolutedigital.net>
References: <eb5a1df4-95f8-2784-8f4e-8460f33f8f4d@absolutedigital.net> <808e1111-27b7-f35b-6d5c-5b275e73677b@absolutedigital.net> <66f3e1b3-6165-4a2e-f34c-de6fef86e441@absolutedigital.net> <2025041738-rocklike-undergrad-14d6@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, Greg Kroah-Hartman wrote:

> On Mon, Apr 14, 2025 at 07:55:06PM -0400, Cal Peake wrote:
> > On Sun, 13 Apr 2025, Cal Peake wrote:
> > 
> > > After booting the new kernel, I get errors trying to do vfio passthrough:
> > > 
> > > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.3, no available reset mechanism.
> > > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.2, no available reset mechanism.
> > > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.1, no available reset mechanism.
> > > qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.0, no available reset mechanism.
> > 
> > This was resolved by Alex Williamson, with his patch:
> > 
> > https://lore.kernel.org/lkml/20250414211828.3530741-1-alex.williamson@redhat.com/
> 
> Is this in Linus's tree yet?

Adding Bjorn Helgaas and quoting from their message[1]:

 > Applied with Kevin's reviewed-by to pci/for-linus for v6.15, thanks,
 > and sorry for the breakage.

-- 
Cal Peake

[1] https://lore.kernel.org/lkml/20250415203929.GA34692@bhelgaas/
