Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5234182B4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680074; cv=none; b=fR4iQFD0D9gt1sTgAwv8DP3B/rsic4Z7DRx1H/v5jf0kooPbRB/CLTJH3mJ3BLyH3ES3xB7C+HAbe1LsV87tOrJeD698qW/vmj3egA4XWMse8lgFjdO/lq8QlGZYXfQ5fr3i0x2mUIj5QglZlwy8hT139b+nGfQ5U4ompgCt+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680074; c=relaxed/simple;
	bh=91N+LRtBj3itj2ylbUHtfZjyPuwCyXJA3tx1li28bLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WK7Npg+QBt00NMU00NSsi1iebJIKVfx0qErBeEqf5uVsaZT8jUEpYuhWcCJc4j5CpBYxlz9EiA9xu8E4qOhPcq+4y6j/RdmtF0CJJEG6xH1170BOF/tx1dDnhOnPlWHFg1UpWlIrw9+mGd512yVGxeOKOYh0IL1tlewsaKjAMd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7oYfX31; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7oYfX31"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e5b225b1df4so69383276.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738680072; x=1739284872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ew4DOVhQnp3KVlv6Z+adbVElEmJww+rFIUASaWfJwLQ=;
        b=n7oYfX31A/NH3eQ20R13JOYxzT/yquVu6Utu0u1J1D4nD4dynrH27xyievqj4mQ8W5
         EBBr64jt0d/klDXCI90CNM5Kt27AdRCPSosiiybsPjIPU/wn1Ol7ycGMGyJdvky5HTbX
         rjLz3CaA7sNqL9Cztnc6Jvd2l7dH3zNadnk2qoEdKMXsFCPQvVex6pL/j+EYpPalTGFk
         dfN0Pe/RODqy81J2k9QncRqF5DLBuUzNDq1X+CKZvdXi55jwT92ni1ShmQvKthBDkQ43
         Dm7a4jjMlC+KqVbd2WhbmPo3cSDjgDQa6Zh2crYqaNQBAL8P+lPYfs9UeQjie27tkvJz
         EYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680072; x=1739284872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ew4DOVhQnp3KVlv6Z+adbVElEmJww+rFIUASaWfJwLQ=;
        b=lOgKBtNbwku6tC+lPGIcuIySElK9olIEEaXkX+jgGZi5lccFqJc+ySf5Tn62tzfLS8
         LIN2N6jwuMnfJL+j8KoW0+6WjSheYbHQOT4VpcgF0t4BdrMhTjtgawmy+Vb0Lp9PS1mc
         Ft0tgGXCSU3jm2bH2QI/cpkYZ/u8Z4rSMv7Bvrq/vOwtzRZQlTxWkaaCbn35pJvUiXE8
         1sIfcW9vakTG2RJphjm3H09yJnYaVXfRSs/Ob9FNn5wQtyTG200Z+RfPfJufJyK6GUQk
         wFuBGc4urXdriDwSP9TnamokS0EkmbYKVQgQ2W1jq3LfIRsPECRHXDfcO8xz4RkdcdcG
         d4tw==
X-Forwarded-Encrypted: i=1; AJvYcCUFg4l/v13/ouxYSsMTjAegeXh/4NcKYcf/zyBX+XUIfhc0fPZvbKZ5g6YX0do6auNx7FiW6doL5g9T1mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUH7mB6J4uh9u/CYeN+w2QIk8J7YFHAE1IIlukppYfM08+f1q
	dSuf1nrzrIVsJXh5VH7UCa9uheodn0QvwrFQAjZ8N91tS8T6ZSSZF3nXl91+5Q59P3ZzHU9MYzp
	dnBrXVGxCSegEp69t1k0jaIXzHxI0jhqmTneceA==
X-Gm-Gg: ASbGncssObhQhc3NSt3XrJdw1nzbvZ1KJYnp3WCNIXWXPvEq/5QPvC7/5l73HLpl8qi
	FMcfXi8/Qtf4YBjy5ZCYu8jzmsz5Ryu2kiNap9sC2xIq5D9Do/RUWDeZXU2b+A3APU2xplKIMxw
	==
X-Google-Smtp-Source: AGHT+IFB7VsIcSnlCga8NeUStj+nz7dcGdSq8KdqrAerawmVjHxlGaQ1qu1pYWqjA4/tsyCajzkdoxica/UvVlxL0Zk=
X-Received: by 2002:a05:6902:e05:b0:e5b:1034:909 with SMTP id
 3f1490d57ef6-e5b10340af8mr5144143276.29.1738680071774; Tue, 04 Feb 2025
 06:41:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <accb12bd6d048d95bd1feea07dd1a799ad3f8b31.1737532423.git.geert+renesas@glider.be>
In-Reply-To: <accb12bd6d048d95bd1feea07dd1a799ad3f8b31.1737532423.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2025 15:40:35 +0100
X-Gm-Features: AWEUYZk6NgieIWPfpkG1IfqaDakdkwS41m6bUoTtDOf9y7ZpOmY6vlu_-K7SU_E
Message-ID: <CAPDyKFrOa4hqGkwqGN9BwW0w2QP8S17EO6mSrQHqx+LLprkFxg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: ti: Use of_property_present() for non-boolean properties
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 08:56, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> On BeagleBone Black:
>
>     OF: /ocp: Read of boolean property 'clocks' with a value.
>     OF: /ocp/interconnect@44c00000: Read of boolean property 'clocks' with a value.
>     OF: /ocp/interconnect@48000000: Read of boolean property 'clocks' with a value.
>     OF: /ocp/interconnect@4a000000: Read of boolean property 'clocks' with a value.
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Seen since commit c141ecc3cecd7647 ("of: Warn when
> of_property_read_bool() is used on non-boolean properties") in
> dt-rh/for-next.
> ---
>  drivers/pmdomain/ti/omap_prm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
> index b8ceb3c2b81c2510..79d165331d8c6379 100644
> --- a/drivers/pmdomain/ti/omap_prm.c
> +++ b/drivers/pmdomain/ti/omap_prm.c
> @@ -613,7 +613,7 @@ static int omap_prm_domain_attach_clock(struct device *dev,
>         if (!of_device_is_compatible(np, "simple-pm-bus"))
>                 return 0;
>
> -       if (!of_property_read_bool(np, "clocks"))
> +       if (!of_property_present(np, "clocks"))
>                 return 0;
>
>         error = pm_clk_create(dev);
> --
> 2.43.0
>
