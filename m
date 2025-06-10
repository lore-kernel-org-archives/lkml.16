Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A028BAB4;
	Tue, 10 Jun 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549070; cv=none; b=Xv+k/Qiy2zQquV2a8xGhrUFmXpWmxGh2SceoxS2ShMgIKKNec6MwPtztW5ZmUYEC/Szxt6VMgs5eHEUre42sMNbIxd/2PqTRIWXAg5aO7ATXVnta9hWcft0Oeta28AzR5A4a4BQcOPA4UE7nErHK/L2ruDwlLGa8aQFyc5nI5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549070; c=relaxed/simple;
	bh=iRyRHdm7eGgLOrCqyLMS8X2C4VLY3ck/40Q2IurUp70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pd3HbOBMCmdn3Q2+wFZ3V6lcrkrWTWz3Dl+R78pv5KhLn2MKrDR2NZovsqRoBa87gzpuFFESGQOGSoBP/FsKYj03LfHlBKqXRZIZc5b8qVXUaOr9rsMMLI0KoKEu0NO9lRM1pMtOpqL2na41k2N/0lh7skqEYfKDDWNPLFzMBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qNGD5sEG; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qNGD5sEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=nUVTmfdkyIz2sCibo8CQYdH/ADMQuNhoQmpTEzyRL5M=;
	b=qNGD5sEGGVHWy8tTwX792dVz/FOchRHUWGIobOMMn684dG2AfKdMafxMgMN6yL
	oNo1c1YramDqSCyFpDJxlToxQXLxDGO+L2i8mV0ZmdjtY7CK+tZzBpsGerCLqGyR
	q/PPFm6yl4jVK8fL/eoZl7Kw4TyqKglkseO32kQd4YnY8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3xx3b_0doxXNVAA--.50837S3;
	Tue, 10 Jun 2025 17:50:21 +0800 (CST)
Date: Tue, 10 Jun 2025 17:50:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEf/2+3MU5ED2sxE@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
X-CM-TRANSID:M88vCgD3xx3b_0doxXNVAA--.50837S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFykZw4DZF1kKFWUtw1xGrg_yoW5WF17pa
	1ayFWIka1kGa4rGr47Kw17KFyUXa9YkrWqkryxGw4xXFy3ur95GF17K34Fvr90kryfJanF
	yF4qgw1DAFyvga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UC1v3UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwVoZWhH4ayQ7wAAse

On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:

<snip>

> During the scp process, the usb host won't put usb device to suspend state.
> In current design, then the ether driver doesn't know the system has
> suspended after echo mem. The root cause is that ether driver is still tring
> to queue usb request after usb controller has suspended where usb clock is off,
> then the system hang.
> 
> With the above changes, I think the ether driver will fail to eth_start_xmit() 
> at an ealier stage, so the issue can't be triggered.
> 
> I think the ether driver needs call gether_suspend() accordingly, to do this,
> the controller driver need explicitly call suspend() function when it's going
> to be suspended. Could you check whether below patch fix the issue?

Thanks for the patch, Xu!  It does fix the hangup but seems to be less
reliable than my/Peter's change (disconnecting gadget), per my testing
on a custom i.MX8MM board.  With your change, host/PC doesn't disconnect
gadget when the board suspends.  After a few suspend cycles, Ethernet
gadget stops working and the following workqueue lockup is seen.  There
seems to some be other bugs?

[  223.047990] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  223.054097] rcu:     1-...0: (7 ticks this GP) idle=bb7c/1/0x4000000000000000 softirq=5368/5370 fqs=2431
[  223.063318] rcu:     (detected by 0, t=5252 jiffies, g=4705, q=2400 ncpus=4)
[  223.070105] Task dump for CPU 1:
[  223.073330] task:systemd-network state:R  running task     stack:0     pid:406   ppid:1      flags:0x00000202
[  223.083248] Call trace:
[  223.085692]  __switch_to+0xc0/0x124
[  246.747996] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 43s!

However, your change seems working fine on i.MX8MM EVK.  It's probably
due to the fact that host disconnects gadget for some reason when EVK
suspends.  This is a different behavior from the custom board above.
We do not really expect this disconnecting, do we?

Shawn

>  ---8<--------------------
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 8a9b31fd5c89..27a7674ed62c 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2367,6 +2367,8 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
>  #ifdef CONFIG_PM_SLEEP
>  static void udc_suspend(struct ci_hdrc *ci)
>  {
> +       ci->driver->suspend(&ci->gadget);
> +
>         /*
>          * Set OP_ENDPTLISTADDR to be non-zero for
>          * checking if controller resume from power lost
> @@ -2389,6 +2391,8 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
>         /* Restore value 0 if it was set for power lost check */
>         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0xFFFFFFFF)
>                 hw_write(ci, OP_ENDPTLISTADDR, ~0, 0);
> +
> +       ci->driver->resume(&ci->gadget);
>  }
>  #endif
> 
>  ---->8------------------

