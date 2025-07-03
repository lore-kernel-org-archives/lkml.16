Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1FE2620E4;
	Thu,  3 Jul 2025 11:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542664; cv=none; b=PHmMFSdVdrfiBmojJ5kcJod76aoy7sXKIpQ8d3ZMfCIiV/hRtdtZKeQZyRsuaTbMoG+JSaL+44ORsGRAJP4k2D9pSQ0Fve45TFDZ2ZJbaCcxC0hvu0Nan2yi7PRFUaxDAMM2S/fLTvAzbCLtXGJ3vp9UrMPhbkKClaPSCD7UiMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542664; c=relaxed/simple;
	bh=uRR7PVJBnOulCRdECwCySqV8cmACYmPxijoJvk6TQH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0O1D1+yWO+TBvKkM4654fzWnmYqoyPc9ku4oV6/m4e9IgPu6i93buhmswux3fuCW1UIidfe2Ohlj2Tf0Lg2FM0C1mIVfxLgL/4CotxpZZOZSrcraoSuXDAvoK2Fjshe82IkV2jZ+OZXMbVh1UHUMYdst8SWdLciFQ/DYohCxeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWHumouA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWHumouA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9A1C4CEE3;
	Thu,  3 Jul 2025 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542664;
	bh=uRR7PVJBnOulCRdECwCySqV8cmACYmPxijoJvk6TQH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWHumouAkU++FuaNOLE0xjB/643dhpSzlvWcHXO0LxLH47vD4t0R+AaSZpe4eX9H9
	 T16VKASNqFbmiQdevYGnhJ32iGeaLLRamiXPJxtMCHSS/z57+bfrXS3mTFdRfi0Ejl
	 rm8ZHGEbAuJcI0q4wz/vai6fB23hpaXgbVAiqAa9E2Agk0vCYJfiiJYJJV3c/YrrqR
	 oRrfiYCzeKP2bXvs2ntUzhbC1UgIfCkZD7K1shTLNtw0ATdK2Z3zich56rIpplfrrb
	 CCDz+Eez/RvtRJM1qYFWVcbB/qqoJbmu7PnSvthqLq0Q6pSyTxjEQsSueN0dMWx4UZ
	 UWR7/tL1yg7bQ==
Date: Thu, 3 Jul 2025 11:37:41 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dawid =?utf-8?Q?Nied=C5=BAwiecki?= <dawidn@google.com>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
Message-ID: <aGZrhe8Ku7eEIRqm@google.com>
References: <20250624110028.409318-1-dawidn@google.com>
 <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
 <aGOiu-sXFj1EUQAB@google.com>
 <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
 <aGSuS81Psqm_Ie4N@google.com>
 <CAJ_BA_BQOQe61r9t9rL=UiOqpHwOoTSbQcZNe=CrCcjMha_YQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ_BA_BQOQe61r9t9rL=UiOqpHwOoTSbQcZNe=CrCcjMha_YQg@mail.gmail.com>

On Wed, Jul 02, 2025 at 09:43:40AM +0200, Dawid Niedźwiecki wrote:
> > They doesn't look like shortcomings to me. The corresponding destructor
> > callbacks have to be called when a device is removed anyway.
> >
> 
> Yes, anything related to USB communication itself has to be freed, but
> freeing the cros_ec_device structure and calling the cros_ec_unregister
> function can crash the system if any of a userland application has the
> original file cros_ec open and tries to send a command. The chardev driver
> is not aware that the device has been removed and will try to access the
> removed structures.

We have seen a similar crash before but I didn't come out with a solution
at that time. Could you please try [3]?

[3]: https://patchwork.kernel.org/project/chrome-platform/cover/20250703113509.2511758-1-tzungbi@kernel.org/

> > Instead, re-using the same inode for the userland interface however
> > *silently* swapping the underlying devices makes less sense to me.
> >
> 
> We are sure it is the same EC device, so why do you think accessing the
> same inode makes less sense? It is a case for specific interface, that reboot
> causes reprobing, which is not a case for other interfaces. I believe
> it should be
> transparent for the cros_ec device user, what interface type is used
> e.g. if it is
> SPI, you can reboot the EC device and wait until it responds to a next command,
> but if it is USB, you would need to reopen the cros_ec file after reboot.

Did some experiments and I understand the difference now. It probably depends
on the bus implementation.

1) SCP over RPMSG
# ectool --name=cros_scp reboot_ec
# dmesg
cros-ec-rpmsg 10500000.scp.cros-ec-rpmsg.13.-1: rpmsg send timeout
mtk-scp 10500000.scp: SCP watchdog timeout! 0x0
remoteproc remoteproc0: crash detected in scp: type watchdog
...
cros-ec-rpmsg 10500000.scp.cros-ec-rpmsg.13.-1: Chrome EC device registered

2) FP over SPI
# ectool --name=cros_fp reboot_ec
# dmesg
cros-ec-spi spi-PRP0001:01: EC failed to respond in time

Anyway, I see your point about the EC over USB gets re-probe once it reboots,
sysjumps, crashes, firmware updates, and etc.

Given that:
- The crash you encountered is a common issue for all cros_ec_X drivers.
- I prefer to keep cros_ec_X drivers simple and similar rather than have
  something special (e.g. the memorized `struct cros_ec_device` in current
  cros_ec_usb) for fixing the crash.
Could you give [3] a try to see if it fixes the crash and also call
cros_ec_register()/cros_ec_unregister() everytime in the probe/disconnect?

> > No, I don't think so. I think all EC-like devices share the same concern
> > regardless of the transport medium (e.g. SCP over RPMSG, ISH over ISHTP).
> 
> Yes, you can run a userland program that opens a cros_ec file and constantly
> sends commands e.g. ectool stress, and then manually unbind the ec
> device, but I believe it can cause some crashes/memory leakage. I don't think
> all drivers are adjusted to hot-plugging.

Yes, we have seen a similar crash before. See comment above.
