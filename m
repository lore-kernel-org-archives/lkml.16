Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E5A26B978
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211045; cv=none; b=WZzKZqtxJRNk+M2MM+fY4QqaTR1EEPdIQtTdN3SuJZXCpWdziVV6DZXQ/HppTDseGDNDdi8Q/wX0vdg3/k7o/uJxADPZ23roe7WNjUWzgPzG7nxnFkN6WuZOlnDE3cioNxdyjKMRrRu5cjs5G4HwxJ6ywAaMuKt1Tce97xn2+bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211045; c=relaxed/simple;
	bh=A70GfRt6rS7q055BdUvnvblK20cYmxXB3ubM9CYqwaE=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=pSnCrWM7JhJTwcgDevafX2v0hGatjG47foopYNqNocS9iN+xzW1PWQGgWSWD3In0hdoPBpAnyhKiHoz+ChodRYEBC+P1Jd9hyxMeAk/o8P83KZn+ZfW5GSD7i+ZVMa73bbNLL1HZwZImcgZCGY5uVwdAWRad0H7jvrU9yy4Wl2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WDR7QX+P; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WDR7QX+P"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abf3d64849dso1174282966b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744211041; x=1744815841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdQ6uVYA6aRCHZvQyDMxVKHgqhU7FXpMW3GkKnr+FVY=;
        b=WDR7QX+Py5LOlnsKZjgHFenGgdqNgR44gD9SeNFV/hPGgSAO/MD1sRAy+6fSgem+2b
         BC9Ud1L9LzOn5iT4aF3gssabFKZ2P1n72tRU6XeSF4fFhjbjMeP221A8OMRF43Kq9U7c
         oPZ49n3UF9f/AMC/kgPQ5hGDKJ7cniL0o5uq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211041; x=1744815841;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdQ6uVYA6aRCHZvQyDMxVKHgqhU7FXpMW3GkKnr+FVY=;
        b=ja8oLsvPtkWMOJ5i69jBY5IlBGRufPGO56YzrdBw9o8ZT0CWeWOt/PqPMDZusk1+Ia
         FlpLpe+IzTZWbGwUc6qNPsT7V1RAf7CCnGJov1cKu3EouYKiO88UBH3p4bKE8Q0FefBt
         zJk4gbqXJ9ExzJVI6vDVSf/hrE5mMedXTONexy3K61I91pMZCaJn0hp7SLWF9ZB+o5fn
         dmyj/hH5uJxqf7U98LibPxss3+RNrF7LlmUIuHyjRnN26MDce/hWY6+zi78n87Yv1vRb
         Ui+As5obS9/16CEcsTgpo+kstVX1p2suKZImNJHCVGslLzUcYo6M/poVITgnfp9BXeTE
         ACZA==
X-Forwarded-Encrypted: i=1; AJvYcCXFxeEou6upLQmerShvsdQ7M5WibGB+RPIPywIdcFW471g99ysqNM6KsEJq4Dg0hXHnxDfm2XnQLRsZhu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOs7piCwwNUO4hEJciebcThgyGd2Qp12/+nOE7gynYOuBzBsTB
	/szoGkGRyjaf8YQeNbzXoOK6GktnlEG+VExmX8zwhO/8QqOJAExXPJ41jHC/Cw==
X-Gm-Gg: ASbGnctgkcbwsQjLjJIbcFkFhgUCRJhDYQssdXrGmssXd83IoW+MDFctDI6Wfo2A4du
	Jrka7n1R0mLa5dnNSuhggZI+d5kkRjaZ1CdsPPjTmFm3tITCXl9pVpSt8qaLbSA2uy4JD57rm4P
	Ch82P2OIM6XISA4UxL+ExcXTKmk+4bx/MD7+hpurMhqQLePLb4g6JdQzFO+KCWMW1rmADJ1itpR
	KxFZE0EbfS1/jJ7/Hn0fJe8mr7EAPP8vAe65/sbQKZew5eW8R0yRvoMa5ibnYFt6ND8I1iTMBTK
	OOs+VUcA4Kc/Dd7L3jPOLICkio8a4vTwuBPKOOUji7lW6AfJ5kzkpt/Q6N9+Fz1fJYMfvIX0vuO
	xfcw=
X-Google-Smtp-Source: AGHT+IH8rvSNSI9ZT7sJJpxIkBiqflzFJXcmfoY4w8kr3Fxm/euzzgm+d6qqs73HjSj0q7bCQs8BSw==
X-Received: by 2002:a17:907:97d4:b0:ac3:121e:f2cb with SMTP id a640c23a62f3a-aca9d5dd4femr248936966b.1.1744211040164;
        Wed, 09 Apr 2025 08:04:00 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7042sm106602666b.165.2025.04.09.08.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:03:59 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Wentao Liang <vulab@iscas.ac.cn>, <kvalo@kernel.org>
CC: <christophe.jaillet@wanadoo.fr>, <megi@xff.cz>, <saikrishnag@marvell.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Wed, 09 Apr 2025 17:03:58 +0200
Message-ID: <1961b144f30.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <d791185d-6a23-4c6f-8a93-d5464409939a@broadcom.com>
References: <20250406081930.2909-1-vulab@iscas.ac.cn>
 <d791185d-6a23-4c6f-8a93-d5464409939a@broadcom.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] brcm80211: fmac: Add error check for brcmf_usb_dlneeded()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 9, 2025 2:11:08 PM Arend van Spriel <arend.vanspriel@broadcom.com> 
wrote:

> On 4/6/2025 10:19 AM, Wentao Liang wrote:
>> The function brcmf_usb_dlneeded() calls the function brcmf_usb_dl_cmd()
>> but dose not check its return value. The 'id.chiprev' is uninitialized if
>> the function brcmf_usb_dl_cmd() fails, and may propagate to
>> 'devinfo->bus_pub.chiprev'.
>>
>> Add error handling for brcmf_usb_dl_cmd() to return the function if the
>> 'id.chiprev' is uninitialized.
>
> Thanks for the patch, but NAK. Let me explain why below...
>
>> Fixes: 71bb244ba2fd ("brcm80211: fmac: add USB support for bcm43235/6/8 
>> chipsets")
>> Cc: stable@vger.kernel.org # v3.4+
>> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
>> ---
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c 
>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
>> index 2821c27f317e..50dddac8a2ab 100644
>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
>> @@ -790,6 +790,7 @@ brcmf_usb_dlneeded(struct brcmf_usbdev_info *devinfo)
>> {
>> struct bootrom_id_le id;
>> u32 chipid, chiprev;
>> + int err;
>>
>> brcmf_dbg(USB, "Enter\n");
>>
>> @@ -798,7 +799,11 @@ brcmf_usb_dlneeded(struct brcmf_usbdev_info *devinfo)
>>
>> /* Check if firmware downloaded already by querying runtime ID */
>> id.chip = cpu_to_le32(0xDEAD);
>> - brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
>> + err = brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
>> + if (err) {
>> + brcmf_err("DL_GETID Failed\n");
>> + return false;
>
> The boolean return value does not indicate pass or fail. It answers the
> question implied by the function name brcmf_usb_dlneeded(), ie. is the
> USB device running firmware (false) or do we need to download firmware
> (true). So returning false here is not going to help us.
>
> The id.chip is initialized to 0xDEAD so upon a failure that value is
> being passed to brcmf_usb_prepare_fw_request() which will consequently
> return NULL, because we do not support a 0xDEAD chip. So there is no
> need to bail out here. Just print the failure message is enough although
> I would suggest to include the err value:
>
> - brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
> + err = brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
> + if (err)
> + brcmf_err("DL_GETVER failed: err=%d\n", err);

Maybe an error message in brcmf_usb_dl_cmd() would suffice printing the 
command id and error value. That way every invocation of the function logs 
a message upon failure.

Regards,
Arend
>


