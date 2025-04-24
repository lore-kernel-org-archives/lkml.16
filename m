Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23127FD69
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513860; cv=none; b=KK94+pwv+ZIyCLoKDuGXkYKa2SdR6fZyWgR0RCX06x+74G1Sv3DvZH+EwzFpuITim7cu9W5Mc09ewwhudzJR+lkOLCKiNkG71FwWisxZeSZgMBbdYwW8xzz9jJCq5rFusWY9p0Ess7KaSefot+kgxKEQl13oDf6CUCO0j+4buk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513860; c=relaxed/simple;
	bh=hS6YdVyjaOxJfdDNyVfmlBPQQSzKuRq4dxje6DjD3Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIITjej/lYXF9X/RY+W1PyMk2lh4iyo90SDAvRzBFZ75KfU7CTVu+qvuEJz6yRxmTxcP7Fgjbo+DT5rs8MJdK4w/IzH5kT9zC+XpcxHHxYqMttReZXxnPf9tuM1eU6YNcLCx02Abtlehv3knupLDRIZcg+vOZ7vmzNWbXPe0Kw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BELN2Xlj; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BELN2Xlj"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e6cea43bb31so1115480276.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513857; x=1746118657; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=;
        b=BELN2XljavDZtosWC9tWlOifhW73t+TMCc+khWL/dze/lq2mIlef3Wiw2V2VOKfJln
         6h/Uu/nyyGHXWyiFh0VfBCJDQdGY6KzQ/WBgrIKcYKQ2KZiVGJjdHCKVAXk4qhQEf3wT
         vXkCn4QTHXa++N/Y8s7u7+VMNdbIM6uW69rlloBxeWcu8FJKO+x9nLPfPVWoGhyvbwzI
         hhv/hVyQZRud32Hl7CyB1kHaW1wzBedoVi7BOcOaKmiLxFujQ6qwetcqtHu9PZ/PiZae
         UFZYfQnPCx+qSQykZbRYD+R0dgS/HvVg+b73btWWpUd22S80299TICTu+t70VmI5tTFT
         fJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513857; x=1746118657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=;
        b=pyvGRPJj3u9iNL7ew/O6KXFG3KmMA9CD0LF1hKKzJgKm/h1j2QHwgLDjUf/BHaMYVb
         P8Yo4lufO4NsumOI2eJUfvYRAB2a605y555OByC5EiOY7hdrmQlHSbFMvYiVKCvPY/y2
         ap16WBg/vLu3HT91I381pcxiFHw548rqUFEuELbaPJRu+1i85kTwkPpkR2/hWPdZA4dq
         7gSzVUyYa5m1kTH+TD6H4Lkp/z/IUqz297Bb0KJ9Aic8/4Rd2EANJSOX/djw0p8Jsd0n
         1z+PEcgaL3YLH6C/VBFssXvLP353UynjBh7yGi8vidDCnElPek+q7TNwX+AEIvHYnhLc
         ecgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXux/sPtlObXFBnWpkrlZvMUytILJMi8SGefkjL//2N5YlxUQgRAyYMUS5GhAbP01E013YVZFFXLfkY8/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkAFZxS2BKG11d9LRYwqemyINAZr9GyaPlWMXaEjPxzrr/feWp
	Knh3Qa8NFFcskaq4yH5x7juSMIJRpBr8/rZgfOZU2I8gdbOfOz2EPSZbCbX5zxGJ9SHAN94oBDb
	m8GQLNc+vVBG2LVxPhW9rFl5EJvV5rPK5D3vYWg==
X-Gm-Gg: ASbGnct5duTWVWPtxZeDds8fxdDvbGBPNUM0DJhCBw9y/9C6kh7gjrZt9QchnbjtjqT
	3bOFKp0+3rI6DxV8XW4xuTJVEaxAIRsjjHYgbW8SiIC5ZoKQcpM24vthO/eqVWY4ueenr1wzVij
	YYzYedxk5QH+3FpDc1iQWIySg=
X-Google-Smtp-Source: AGHT+IHIsM0JcIVkaYurwu7Xm76aeWCRBd2kXA94L1zA7HY4+kXgxndqZ0iWhzKWJZRbPN5Psmgt3hk6PaDxQyb1LIo=
X-Received: by 2002:a05:6902:13ce:b0:e6d:ecfc:2328 with SMTP id
 3f1490d57ef6-e73034f04f0mr5006786276.3.1745513857331; Thu, 24 Apr 2025
 09:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:01 +0200
X-Gm-Features: ATxdqUG-Jb1AZR77fk7uAdSggUmnOFrjqf9oHFUx6Q2HN7mjbQy7Up3T4KB7Soo
Message-ID: <CAPDyKFob2wB=stDXLPG0VG7mBso4Hid32pXpMvaP6WPbL0SyEA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Power Domains support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, fshao@chromium.org, y.oudjana@protonmail.com, 
	wenst@chromium.org, lihongbo22@huawei.com, mandyjh.liu@mediatek.com, 
	mbrugger@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 16:39, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the power domains
> (MTCMOS) of the MediaTek Dimensity 1200 (MT6893) SoC.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: power: mediatek: Support Dimensity 1200 MT6893 MTCMOS
>   pmdomain: mediatek: Bump maximum bus protect data array elements
>   pmdomain: mediatek: Add support for Dimensity 1200 MT6893
>
>  .../power/mediatek,power-controller.yaml      |   2 +
>  drivers/pmdomain/mediatek/mt6893-pm-domains.h | 585 ++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   2 +-
>  .../dt-bindings/power/mediatek,mt6893-power.h |  35 ++
>  5 files changed, 628 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt6893-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
>
> --
> 2.49.0
>

Applied for next, thanks!

Kind regards
Uffe
