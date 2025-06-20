Received: from smtp.smtpout.orange.fr (smtp-69.smtpout.orange.fr [80.12.242.69])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B97521FF45;
	Fri, 20 Jun 2025 19:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449448; cv=none; b=rdueY2zjkv7qt6FEGK31YmIIajRfz4IiL60dGn7EbJl8dybPDFNV1EbGMAJ82+mYHUA3ZxxAgb29agq6Hl2wvgjvbRA/VxC4chOOVE9H26hfnlwTQFtpux762vz9wroFWzHASvz+froYalozfjVSh9CKlM5BHxbGdXplch5dQa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449448; c=relaxed/simple;
	bh=T4bxQ+js+L+kONrcFFUZeo6KEMGpgi936gQ6NG55uXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBM+CiqTL4h9WkEigqr3WmKYo5LB0kf//3cmH1n71eAzeZ/vmTQ5JJj6NOBwYzx80QhCfOJwh1ki2eRlGRGujp6l80l1MBwgYkjoA/VdVf8mJPs7BP6udW/LrGIi2bKNj7bQTaIvIqZPPt7D8HwrDx2TKWyCOOZwkzfyVw8dLJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Li4bwqAo; arc=none smtp.client-ip=80.12.242.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Li4bwqAo"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id ShqLu160RuKiMShqLu11Jb; Fri, 20 Jun 2025 21:56:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1750449370;
	bh=N1N+ytm2H1ykrHgavGmyyf72iaKD39Hn7O7RanLWe/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Li4bwqAoJ1C5LWmO1J5WuRq4tQUwwJ8a7HnUzPaNkfqsiGF4FP0n3wvKjYg68WU9X
	 kDh4OcvD616QQ0RVLHietKltaPWHEKpR4yrvTCGweYafRSinO2FamC0vTypX6nUR6U
	 nunnI/1blUerp+XYSAK8vZIKHArqe+hl6hVLJzhn6ordIcjLkJPBR4uEuZyhur5SWz
	 HkOa4PM+tX9dpOdhW8oEmiXrLHJUV/6JI/cMoOSvlfMWEE0FuQ93Jq5+/e5zdUbymH
	 B25PVcP1J7XV7XD2BdT+SyiJU+2PotssQei4iG3CBU8ITsM97tqjz95YCCA3jubSWw
	 2imEt5y+FyasQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 20 Jun 2025 21:56:10 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <d2d321cd-7ca7-42d9-8eb8-7ab639dddfa6@wanadoo.fr>
Date: Fri, 20 Jun 2025 21:56:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
 stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/06/2025 à 14:07, Hendrik Hamerlinck a écrit :
> Per Documentation/filesystems/sysfs.rst, show() methods should only
> use sysfs_emit() or sysfs_emit_at() when formatting values to be
> returned to userspace.
> 
> Convert the uses of scnprintf() in sysfs show() methods to
> sysfs_emit() and sysfs_emit_at() for better safety and consistency.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>   drivers/usb/host/ehci-sysfs.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
> index 8f75cb7b197c..3786e81b0ed9 100644
> --- a/drivers/usb/host/ehci-sysfs.c
> +++ b/drivers/usb/host/ehci-sysfs.c
> @@ -12,21 +12,18 @@ static ssize_t companion_show(struct device *dev,
>   			      char *buf)
>   {
>   	struct ehci_hcd		*ehci;
> -	int			nports, index, n;
> -	int			count = PAGE_SIZE;
> -	char			*ptr = buf;
> +	int			nports, index;
> +	int			len = 0;
>   
>   	ehci = hcd_to_ehci(dev_get_drvdata(dev));
>   	nports = HCS_N_PORTS(ehci->hcs_params);
>   
>   	for (index = 0; index < nports; ++index) {
>   		if (test_bit(index, &ehci->companion_ports)) {
> -			n = scnprintf(ptr, count, "%d\n", index + 1);
> -			ptr += n;
> -			count -= n;
> +			len += sysfs_emit_at(buf, len, "%d\n", index + 1);
>   		}

Nitpick: extra { } looks useless now.

>   	}
> -	return ptr - buf;
> +	return len;
>   }
>   
>   /*
> @@ -70,11 +67,9 @@ static ssize_t uframe_periodic_max_show(struct device *dev,
>   					char *buf)
>   {
>   	struct ehci_hcd		*ehci;
> -	int			n;
>   
>   	ehci = hcd_to_ehci(dev_get_drvdata(dev));
> -	n = scnprintf(buf, PAGE_SIZE, "%d\n", ehci->uframe_periodic_max);
> -	return n;
> +	return sysfs_emit(buf, "%d\n", ehci->uframe_periodic_max);
>   }
>   
>   

