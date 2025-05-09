Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D03028F4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772666; cv=none; b=iR0ISlfxnhzGs4ojaIPnpDaSMqvgjGfNA4gGfD6PRAZEaRct9vnq0RBlkWyoKwJ1T3wdokX/10pSVNs1+4h2ggJYx+SLcyDI0xY6kE0nC5obMEk+95WkJ2mSftoTKe6/K/wm0uhFdouRxs3wp5zuOS7kASm3RhdCwNZTAMYpqhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772666; c=relaxed/simple;
	bh=dQ/uJPqSHryC/jX10/p5XMijmEo7PL5OSa0J4w7KrII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cASYKkTq1ZecEuKGBpMgP3ncz5gWDnN5SfzzpUPoMlARWYHYwoCBxnO8sjZMnB3vp5bVCOUZYyaMUkRxWK8OLKWKMG+peQIEShg+BBiVq9pCJa+2HjkFBmrhbj22WBrm0VS8ElMoOomA3t1l5CeafsLcgo2ph/erRGIcgCZFeOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7jNSbhD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7jNSbhD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DC5C4CEE4;
	Fri,  9 May 2025 06:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746772665;
	bh=dQ/uJPqSHryC/jX10/p5XMijmEo7PL5OSa0J4w7KrII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7jNSbhDOOIvuFlC+5KEUPDKQnpQkfNWo9JLbXUTgNX0/Trui6O9eQQH6qMCyXOcp
	 KMuUWVTyDXi3dXsTDS7ZSgZkhXvPXLmwWZw4G0pZuNUUqfQkRVz3DNN67IrVyGejek
	 h7uTn+UebLQMJQpa9ZhkrdtFkRbtDUl2Iw8OlPDexaUcPw9SuAWHI4+beJsgFlqUM8
	 1CYSYFGE9E6jFjY10q54AC6SUIfMxih7C/oNMfpib2YRP0bMdERwTjq+94hgyUJ60l
	 XFs7zCZbkTuPdpINs38KQyUk5xHn6rp33xsg67UkbY2/baOl5cf1w9dY/s+ZEm94N4
	 ny6f2rz0LVcGw==
Date: Fri, 9 May 2025 08:37:41 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dmukhin@ford.com, mingo@redhat.com, andriy.shevchenko@linux.intel.com,
	x86@kernel.org, daniels <daniels@collabora.com>,
	Daniel Stone <daniel@fooishbar.org>,
	robdclark <robdclark@gmail.com>, lumag@kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: x86: Boot failure on select chromebooks with v6.15-rc5
Message-ID: <aB2itc2-5h3LEJi6@gmail.com>
References: <a8638f85-1cc2-4f51-97ba-7106a4662885@collabora.com>
 <aB2bStp8efMHPjet@gmail.com>
 <d966d626-458b-4a29-abe1-b645317e15d2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d966d626-458b-4a29-abe1-b645317e15d2@collabora.com>


* Vignesh Raman <vignesh.raman@collabora.com> wrote:

> > What boot cmdline does your kernel have? The MMIO-UART patches should
> > only have an effect if the feature is specifically enabled via a boot
> > option:
> > 
> > +               if (!strncmp(buf, "mmio32", 6)) {
> > +			buf += 6;
> > +                       early_mmio_serial_init(buf);
> > +                       early_console_register(&early_serial_console, keep);
> > +                       buf += 4;
> > +               }
> > 
> 
> amdgpu:stoney:
> earlyprintk=uart8250,mmio32,0xfedc6000,115200n8  console=ttyS0,115200n8
> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598802/extract-nfsrootfs-wgn1xjer,tcp,hard,v3
> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
> tftpserverip=192.168.201.1
> 
> i915:amly:
> earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8
> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598804/extract-nfsrootfs-5rlm_b6z,tcp,hard,v3
> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
> tftpserverip=192.168.201.1
> 
> i915:whl:
> earlyprintk=uart8250,mmio32,0xde000000,115200n8  console=ttyS0,115200n8
> root=/dev/nfs rw nfsroot=192.168.201.1:/var/lib/lava/dispatcher/tmp/18598833/extract-nfsrootfs-3w0w5_mi,tcp,hard,v3
> init=/init rootwait usbcore.quirks=0bda:8153:k ip=dhcp
> tftpserverip=192.168.201.1

Well, if you remove the earlyprintk option then it will boot fine, 
right?

The earlyprintk=mmio32 in v6.15 is a new debugging feature that was 
tested on a single board by Denis Mukhin AFAIK, and it may or may not 
work on your particular UART - even assuming that all the parameters 
are correct.

Thanks,

	Ingo
