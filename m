Received: from mx2.absolutedigital.net (mx2.absolutedigital.net [50.242.207.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3608685260
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.207.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744674926; cv=none; b=oDd5z7MVlr/En8iaCVkxawON5huFHnpO+OKACLRYHz9NeRBD4zDVcscVeyMXDauYrazhznzGqLBOTtCTrsDhkMBolYKt+pchz2B3eq1NpBqqSiQfdm2vK3N0MytyGbd/efcbVv3O+grc6PtdSoNIjsYnfSTHBa7+5ROr/5p9oCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744674926; c=relaxed/simple;
	bh=dMmMCfWHWEyhlIsKLQz8kUl7HnoKK1XIFx89roYZkmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bGHF+yzISC+E0cp8XQ3FtOAjC2BgtuwdLUwUqb0rJilTi04EgCHb0sFkBCsbRKJyK2FMcbdRrE7Cf2s0TOr0ui9JuO/7ckHaobif6zAHbmc/cItsN8iB0RNYMuCAybvP8YfmcesIdJhy7vWv0++Rz4ncQk14sL2jeu7Hhi3ddnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=absolutedigital.net; spf=pass smtp.mailfrom=absolutedigital.net; arc=none smtp.client-ip=50.242.207.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=absolutedigital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=absolutedigital.net
Received: from lancer.cnet.absolutedigital.net (lancer.cnet.absolutedigital.net [10.7.5.10])
	by luxor.inet.absolutedigital.net (8.18.1/8.18.1) with ESMTPS id 53ENw3Cu016007
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Mon, 14 Apr 2025 19:58:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by lancer.cnet.absolutedigital.net (8.18.1/8.18.1) with ESMTPS id 53ENt6PN005090
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 14 Apr 2025 19:55:06 -0400
Date: Mon, 14 Apr 2025 19:55:06 -0400 (EDT)
From: Cal Peake <cp@absolutedigital.net>
To: Kernel Mailing List <linux-kernel@vger.kernel.org>
cc: Vishal Annapurve <vannapurve@google.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [STABLE] 6.12.23: vfio error (was: arch/x86/coco/tdx/tdx.c build
 error)
In-Reply-To: <808e1111-27b7-f35b-6d5c-5b275e73677b@absolutedigital.net>
Message-ID: <66f3e1b3-6165-4a2e-f34c-de6fef86e441@absolutedigital.net>
References: <eb5a1df4-95f8-2784-8f4e-8460f33f8f4d@absolutedigital.net> <808e1111-27b7-f35b-6d5c-5b275e73677b@absolutedigital.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 13 Apr 2025, Cal Peake wrote:

> After booting the new kernel, I get errors trying to do vfio passthrough:
> 
> qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.3, no available reset mechanism.
> qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.2, no available reset mechanism.
> qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.1, no available reset mechanism.
> qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.0, no available reset mechanism.

This was resolved by Alex Williamson, with his patch:

https://lore.kernel.org/lkml/20250414211828.3530741-1-alex.williamson@redhat.com/

Thank you, Alex!

-- 
Cal Peake

