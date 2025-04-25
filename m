Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2932199931
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745561198; cv=none; b=X3R0uumNdSejlKIhjQqg8aoQ7NRFIfGdNpaTl++4/6UYoEP/BHYJfMhwWRGBBVwMZPfz6wWe4LeWPxqUqUrYvW3JSDun3ysUvCSnI4yBB3MYgbdToBe5WscugsKQWVKn5mWLaBnNodIWvypdQzfdCuxJpQ9W7vBskTgddaECIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745561198; c=relaxed/simple;
	bh=CpBT/GJTl/qOHB8XXefQW8z5QInEFr8XQOgxoGfmDlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZQfzfYcSQ7J89AZvRWyRxPfPxJQnTQ2ZaIcPKrjZediXk5dDIq2AYJkNQOfpMaOllVHp6Kma0Ef1hxDgH7zcuxLpmlmM1yZTD2qWEO1vvs3RflHbdcqTJ+UWT65RP418HobW3GAA7Enl7Tv05JDHYOhUMQHB1WLRrzW0L3Ynq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFtSTVxY; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFtSTVxY"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-524168b16d3so1785525e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745561195; x=1746165995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=RFtSTVxYzNOCGv2rnwTHN+3CiPKXQBATPCXeP6dr7gaQRpBhBoalnkY+LbUx0sk0K0
         uyWj5fDaidv+PnkUuO8tbvCDnuKmBCzQIZWOz1hEBc76bo18OqEBD5Oss8u10URqGgRQ
         BMs/R/kC1OEknsAsU25OZXJvGLGWnmeq+yhLXDIU5LhKz4jUdWSM0/q/rcBT1Vb5UIYp
         yibnkVOsVcZ4vQj/iAJ+eQ3TvnlV6RbQDIgst7u5CJ7Rlkd6Q4jQmnIFsYxEr9SWwjN/
         NmYo42eVBTKO60T5mAo/Q11+g3gVoJLKhg4TExj0Wq0SNGr03vP1PeV/Gv6UA8BHCwAk
         PWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745561195; x=1746165995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=YKHcrRcat+Fa3iQW95Yg2Jck8Zfjowh6NSGfE0kWG/XLzVfZErkVmwXuI4XyyF/kY6
         0MiCXQWZKphd4MgLcT72RVlVW99I9U7sEJj78a3g96OpZn56TW+tQKCrsOCb6ggQBZUt
         N1nbSZDDIcUAFkkaeQ+Qxkh5EkAyK90U8Sf6itm/dZPuvp2rI1RJAs0TL02CeGxSrdiH
         OOjqA+bTKBmPVM+SEpRawI77VtR6F9aXlrf0cdvP78f8Q9HFG6GXiDBKdWTmsF9DtM6e
         /yYj64Up1hOEs49H1nZc3ec2HUak4653d1sOKba6tco29xn9gIQL6kdkmOZkWwChZxXg
         dTQg==
X-Forwarded-Encrypted: i=1; AJvYcCXHADLP1Y3LjEtjz79cY/gOO86QFGosScdXZFFgZolpyhXUc3TKd0XU5MjgN49/+LqxCDTGCSsYzreJsJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfQ/ZoV4qxvFKJ6b2z14UnbpPuBxMiBs4UquJp4rGNIQIQKZXe
	WKgy01fuVVWdCiN6Ih+O0RC9A6k/7u3a4WNTyudzqCT/hZxqYcOylxlrv5mkT3XcQldztJpavF4
	WjaCRVVmyYd0JkQZl1uxJwLDLz4nm/jg5ilLvwA==
X-Gm-Gg: ASbGncvAdJAuSn/s0FH9I+wDWqSPh53gW8h1DtTCVM5V39Ukbpw3VGxF7KIFWGfubOO
	PVXG5VTfJyKZ8Gp4gYdCZnxPT91qCMXmilzoFGhYFrAOa66+zpYs2XTzYbNqoh00KnUsxJslQdG
	Qt+4RhMkt+1D1Zn9oL9cPEwNDLPwifpeKZxplDiUfD+jPA2ER7FC18JRgE
X-Google-Smtp-Source: AGHT+IHk3Sh1recRtL0I0FAiNETtYwurKFY0CJ0FDTy8w0bAg/KMEvL/1tmqPiwb61pQkrz7JWUirq46fq8oitTFWfU=
X-Received: by 2002:a05:6102:3e87:b0:4c1:9526:a636 with SMTP id
 ada2fe7eead31-4d543fb6341mr362655137.15.1745561195672; Thu, 24 Apr 2025
 23:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Apr 2025 11:36:24 +0530
X-Gm-Features: ATxdqUHyh1sPNfszHFCKsjMSGrXxYsTXLBiYXGTypFcI7J1MgDaUy852FfJYen0
Message-ID: <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 22:52, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
>
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Naresh, could you test this patch and see if it fixes the boot
> problems you saw?

Dan, This patch fixes the reported problem.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Links:
 - https://lkft.validation.linaro.org/scheduler/job/8244118#L2441

>
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..bb161def3175 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>         __le32 hdr[5] = { cpu_to_le32(len), };
>         int tlen = sizeof(hdr) + len;
>         unsigned long flags;
> -       int ret;
> +       int ret = 0;
>
>         /* Word aligned channels only accept word size aligned data */
>         if (channel->info_word && len % 4)
> --
> 2.47.2
>
