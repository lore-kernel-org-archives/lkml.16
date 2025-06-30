Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B527054C;
	Mon, 30 Jun 2025 12:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286857; cv=none; b=j6RhIXkMvx33LrUNDtIrtg0DVI/p5LkaZYeu+dRwkgKQ4cyQNZjfmP+epRpkQYvTfNl8nifQASQO1K8md0raluwScEJ+CDE7C6CUK20Hx/rVpradVGWxrNciOo4k8KqbP1t982eif3eyVla4rMLFVxFjKd8JtDIk9Eq3t746Bcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286857; c=relaxed/simple;
	bh=YmvdTn3Yb59iQwNFWY3RaUBVLJtG9DvMo8XScgsgnsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3hmwqV/noj+buF+6lFt9NWpJCtOnFQbsPeIpJMWGiBID7tzFKNivLF8UtFO+UcA8bkFcyg5r3+cShlVaKO2jxlLbxsYfWexOsHc3AgRuZQFlGodn1lbEyDf9v4QSYH0ku8W5HOr+jJ7HafnK8TSVf2pbF5fEhEbqFSdxK6URuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=c3dh3Tj3; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="c3dh3Tj3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NGnf4bhFU/j1HOvGLBdTQiqonwf7x0+KACKFefOASB8=; b=c3dh3Tj342SZjQS/lvgmtgByhz
	ONc3yL8o9CZVZXgPoxWSHqp8J9/sry28+pEvjFzWxo3rCb1sPHJHavrAfdRmN9gjIVa+wB9CCt9bg
	05sgw/7Bx0SshXHYmiHUjhZlm15H9A6RURjn+5/ETyUp1nyL9UoywLk/G7Jm6SY3ibpJRU2XqB2U6
	Jm1n5OwoezCenLC3XMtbMpqUWShmJ6eQgz33vKshf+tBJtS/WBi89bF+eKJf+YNFXNQTRqQmXPi41
	GrzEHGTrUZEQDTTV+G7tEqs//kVJ2cKut93RyoOALA4mN/oonufSRaRF6t/fqPYYDsMHTo4TGpGSg
	uvniamtw==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:27863 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uWDi9-00000000PNw-1JF9;
	Mon, 30 Jun 2025 14:34:13 +0200
Message-ID: <6dce47fd-01fb-4401-88a3-d9e85ee5529a@oss.cyber.gouv.fr>
Date: Mon, 30 Jun 2025 14:34:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
To: Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Kannappan R <r.kannappan@intel.com>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
 <94cd36e2-db7c-4693-9f43-01c855dc6891@suse.com>
Content-Language: en-US
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
In-Reply-To: <94cd36e2-db7c-4693-9f43-01c855dc6891@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Olivier,

Thank you for your review.

Indeed our current implementation of the usb authentication is still a bit
crude.
Currently, most, if not all of usb devices can't handle authentication. 
If we
want to have an integration that doesn't break on current hosts, we need to
have a fail safe. We are still working on the best way to handle the
combination of authentication and authorization.
See the reply to Alan [1].

[1]: 
https://lore.kernel.org/linux-usb/8cc10112-23a7-41af-b81f-7fc0c097d34d@oss.cyber.gouv.fr/

On 6/23/25 20:15, Oliver Neukum wrote:
> Hi,
>
> I am afraid someone has to address this.
>
> On 20.06.25 16:27, nicolas.bouchinet@oss.cyber.gouv.fr wrote:
>
>> +    // Set a default value for authenticated at true in order not to 
>> block devices
>> +    // that do not support the authentication
>> +    dev->authenticated = 1;
>
> So the default is authenticated. OK.
>
>> +    if (le16_to_cpu(dev->descriptor.bcdUSB) >= 0x0201) {
>> +        pr_notice("bcdUSB >= 0x0201\n");
>> +        retval = usb_get_bos_descriptor(dev);
>> +        if (!retval) {
>> +            pr_notice("found BOS\n");
>> +#ifdef CONFIG_USB_AUTHENTICATION
>> +            if (dev->bos->authent_cap) {
>
> If the device claims not to support authentication ...
>
>> +                /* If authentication cap is present, start device 
>> authent */
>> +                pr_notice("found Authent BOS\n");
>> +                retval = usb_authenticate_device(dev);
>> +                if (retval != 0) {
>> +                    pr_err("failed to authenticate the device: %d\n",
>> +                           retval);
>> +                } else if (!dev->authenticated) {
>> +                    pr_notice("device has been rejected\n");
>> +                    // return early from the configuration process
>> +                    return 0;
>> +                } else {
>> +                    pr_notice("device has been authorized\n");
>> +                }
>> +            } else {
>> +                // USB authentication unsupported
>> +                // Apply security policy on failed devices
>> +                pr_notice("no authentication capability\n");
>
> ... we do nothing about it. We enumerate.
>
> The purpose of authentication is guarding against unknown or malicious 
> devices,
> isn't it? This behavior seems to be kind of incompatible with the goal.
>
>     Regards
>         Oliver
>
>
