Received: from mx2.absolutedigital.net (mx2.absolutedigital.net [50.242.207.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39A195
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.242.207.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744588546; cv=none; b=MhGqm1YrTO8U447TYEB5eVtHTjbZ0tcuFXMyrDArMHChSmfKLFMyV1Ym9pkYjgCtQcGhe095yGuagMdRKPzQR/+8QP+yUorbMa2q5wY3LBV0KEY+x1FJF+xaCWJ5GdmishBZgdWgJQMhYnbBaugv43qBBaW5HGv84YhYG09eMdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744588546; c=relaxed/simple;
	bh=8hl06Xa4K+K/gDGQ9BJyiOar8Eu6COdGj5M/RWq+H8I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G5Tfsx/kdnXcFSr8s85zb00VDcJVFzIE+7LCY/5Q7AjVm3eZ3hecbcklk1IxuS8UYLzookfyEK+bsd9KXYcI1uLYB2WQPe1Kj384V0frdjECwcLw8VdWXBQ6oP+RWbCqWvz3zzCg0LISZeXgClxqq6Lm6AiS2k0OIs7jw75l09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=absolutedigital.net; spf=pass smtp.mailfrom=absolutedigital.net; arc=none smtp.client-ip=50.242.207.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=absolutedigital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=absolutedigital.net
Received: from lancer.cnet.absolutedigital.net (lancer.cnet.absolutedigital.net [10.7.5.10])
	by luxor.inet.absolutedigital.net (8.18.1/8.18.1) with ESMTPS id 53DNwOig029345
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Sun, 13 Apr 2025 19:58:24 -0400
Received: from localhost (localhost [127.0.0.1])
	by lancer.cnet.absolutedigital.net (8.18.1/8.18.1) with ESMTPS id 53DNtRQM004532
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 13 Apr 2025 19:55:28 -0400
Date: Sun, 13 Apr 2025 19:55:27 -0400 (EDT)
From: Cal Peake <cp@absolutedigital.net>
To: Kernel Mailing List <linux-kernel@vger.kernel.org>
cc: Vishal Annapurve <vannapurve@google.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [STABLE] 6.12.23: vfio error (was: arch/x86/coco/tdx/tdx.c build
 error)
In-Reply-To: <eb5a1df4-95f8-2784-8f4e-8460f33f8f4d@absolutedigital.net>
Message-ID: <808e1111-27b7-f35b-6d5c-5b275e73677b@absolutedigital.net>
References: <eb5a1df4-95f8-2784-8f4e-8460f33f8f4d@absolutedigital.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Well, this isn't good...

After booting the new kernel, I get errors trying to do vfio passthrough:

qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.3, no available reset mechanism.
qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.2, no available reset mechanism.
qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.1, no available reset mechanism.
qemu-8.2-system-x86_64: vfio: Cannot reset device 0000:14:00.0, no available reset mechanism.

Anyone have any ideas?

-- 
Cal Peake

