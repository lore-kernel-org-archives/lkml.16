Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C8D1494C2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745297766; cv=none; b=k2OGx1JIz9P6eM+yHLS1GYMf+20PqGs8hjXSZyVMh9Z9s2QUcszqktQPf9xnQg3ocmU+TEq3Dy07FK73YJMA0P1m2HFr2Olm0DhrkS4qWnWSpsKre2AcF06NVLLRCLSlCn3SD3Iu67TiZ1uDwtXtlvWGle4mBP3uSFBb8eoAnTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745297766; c=relaxed/simple;
	bh=1n6VFvcqcUzVl1/IbVIv/Pa/793Z9OAZn+Q6I6OUYBk=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=l30y23gSSsqIfIYJtF0Gd94b5ZshAB3SVY6EBCpbfA6wZlNHm7PuN4IGHbfYKD/lbz3pk6RsRv8YM1kJpqlQmQ2CES/cNI5C/Rqx3MkIv7XS9aO5V86KW+RjgcP+5+HIWreiQ32ZjGem8FOEnLPmU8GR6sdIpbD/GdYdobdqxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=V+9bxjNY; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="V+9bxjNY"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso7304396a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 21:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745297762; x=1745902562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wrp+glrqMEFQIOcbV8OH0y2t9hGyNvM/0gI9W80il2Q=;
        b=V+9bxjNYLaI+t9XZNnmBD5QZcHBo+JB9RlsajG5N+hvGKM+6zvULXg/VfhKPIlkcnx
         jIrm/sBnN4HU46kQfm5RPrqI3o8K7FkF/jigrI6UiaT+DG02zbBpQxBeVGm3+FnjGkPx
         L1go9+9Tj6gLPuU6SianNac05Jx11dbcnq7Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745297762; x=1745902562;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrp+glrqMEFQIOcbV8OH0y2t9hGyNvM/0gI9W80il2Q=;
        b=g3bvIQA+0n/V9zDLlMCV4tCYmua/41Glm7rU531d14DNzV2og2fE6eLb5ch1FA3XeI
         zvT+y2i4cSm4xV2LS69xYOEVpLmqPRIe6Qn0M0vM0lkSsRmWRaL6H2I+L68eTPy2qJxP
         cO38tLD1GjYM+5N7aVD4YgMSuXeP7Q6TPljqn+surYepgUqcAGo4zspPuJ5mBfFW0sFw
         e4HeRXJXXxaL2RpzBKcAweZ5i+EOPFmgszMl7zrIM1HzER7lE54azI1JXEeufyZDIpF1
         OdoA4I1Oas/Eq3nL5hICD3GYTZkLB7KuPN0RQgB3FwweG+Usq8KLMeYmTwaCLANy+tpS
         gtvw==
X-Forwarded-Encrypted: i=1; AJvYcCWtpydl383rE71WQYf18X0AWYpslG8nAD/ayk/5wpwJWzxfaXce/ic1nkYL+EYjBbcRG+HoaFsAtY/cyuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1R+CFQIydfpPtuis4jBbfWW7EOFTZqScVyLWOjgLmaWBY9KhD
	e1Cccp9fyS2p/1QQ4MND+B6oXlcxZG/pvvEryH0DJWHcotinBGMTSVNiNHSj2A==
X-Gm-Gg: ASbGnct2+5Rs+7EBEwrtoqZuhIY1hRI/kqyrvYxUW6TiPg8k37y+EoBb4e5p5Q4hV4N
	eqNdCL2CPt+JCeq7Qa3njv7YTYgwWPp2dyJTCT/zOG7CnWCdIcF+nek8dE+2YVF0DI650/VOM7f
	EVrdqgWLvTVMWfiWKltzsXNlkUjGoLwS2vTrPSJ/cKq5D1newBmp2H/K962M+yaRk0SkNl2vdW4
	b5iCDj6Ca0ftBRei8If4B5rzmNPsKQwqSFnRY/sm58Aa19J4B+0jArfXXS1N10k7JKiYFRiR8b0
	kEuCIFdLLBywxAtkQX4QlRakn1fUyPrjERJU2yWgKFHwC8aj7+tAsqTSjl7tdZnad2jnpaN2Oj3
	k5b8=
X-Google-Smtp-Source: AGHT+IHSU6S5KXFU9LqzhGRG+vKu9XggFzpPIOcZPwBxuMXIbI8vYSXr2SAHZ4O5/Fg7JR4/K6GtBQ==
X-Received: by 2002:a05:6402:13cd:b0:5e7:2871:c137 with SMTP id 4fb4d7f45d1cf-5f628548a18mr12182351a12.14.1745297761855;
        Mon, 21 Apr 2025 21:56:01 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258340c8sm5392034a12.58.2025.04.21.21.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 21:56:01 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Wentao Liang <vulab@iscas.ac.cn>, <kvalo@kernel.org>
CC: <jacobe.zang@wesion.com>, <sebastian.reichel@collabora.com>, <christophe.jaillet@wanadoo.fr>, <erick.archer@outlook.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Tue, 22 Apr 2025 06:55:59 +0200
Message-ID: <1965bda5b18.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250422042203.2259-1-vulab@iscas.ac.cn>
References: <20250422042203.2259-1-vulab@iscas.ac.cn>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v2 RESEND] brcm80211: fmac: Add error handling for brcmf_usb_dl_writeimage()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 22, 2025 6:22:48 AM Wentao Liang <vulab@iscas.ac.cn> wrote:

> The function brcmf_usb_dl_writeimage() calls the function
> brcmf_usb_dl_cmd() but dose not check its return value. The
> 'state.state' and the 'state.bytes' are uninitialized if the
> function brcmf_usb_dl_cmd() fails. It is dangerous to use
> uninitialized variables in the conditions.
>
> Add error handling for brcmf_usb_dl_cmd() to jump to error
> handling path if the brcmf_usb_dl_cmd() fails and the
> 'state.state' and the 'state.bytes' are uninitialized.
>
> Improve the error message to report more detailed error
> information.
>
> Fixes: 71bb244ba2fd ("brcm80211: fmac: add USB support for bcm43235/6/8 
> chipsets")
> Cc: stable@vger.kernel.org # v3.4+

Thanks for this patch.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> index 2821c27f317e..d06c724f63d9 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> @@ -896,14 +896,16 @@ brcmf_usb_dl_writeimage(struct brcmf_usbdev_info 
> *devinfo, u8 *fw, int fwlen)
>  }
>
>  /* 1) Prepare USB boot loader for runtime image */
> - brcmf_usb_dl_cmd(devinfo, DL_START, &state, sizeof(state));
> + err = brcmf_usb_dl_cmd(devinfo, DL_START, &state, sizeof(state));
> + if (err)
> + goto fail;
>
>  rdlstate = le32_to_cpu(state.state);
>  rdlbytes = le32_to_cpu(state.bytes);
>
>  /* 2) Check we are in the Waiting state */
>  if (rdlstate != DL_WAITING) {
> - brcmf_err("Failed to DL_START\n");
> + brcmf_err("Invalid DL state: %u\n", rdlstate);
>  err = -EINVAL;
>  goto fail;
>  }
> --
> 2.42.0.windows.2



