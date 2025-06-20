Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E2235056
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421235; cv=none; b=s0zsHlIxZt0cWwxg/wDpYHC5AEKTJ+VTTCG+UepL+TQBVzo+oZFYvE01PKRrzufNuOsMMVKAlidPM3Sc5/jwzmHErrVsLOkkz+qBChvdMFES15HIPLAH2TXSkumt99zMBbEqk2YfkELXemZxbexjAi4jnKGXH+lhRfY9OEiPoGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421235; c=relaxed/simple;
	bh=EtRUcRnnvwKaEoPNvie571Q7bf0PXL/8PzpE64KHIRc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=qdaa7sF73/vCgPGB73YNV8ALfxFw9apNSWTE+PhAG62t+Vkjzr+nAizFV8nhHbvWlrbwQWrZ9wGZok8l9dQTInGW8CumfjJdwbWA73WYhkmqK5yrq6m1NuIp9kU9ZBI5tVPVHbAVwWDZ2uHkOBGWMegTCZyCARN37AI2AL31K1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WciHImfz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WciHImfz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad574992fcaso287751566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750421230; x=1751026030; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG/pp+YecK6TL9JZ8UqalWMy4MkbPjqfLN1AxeBtCuM=;
        b=WciHImfzRZ9V7PUwwHv+EbBSJ4I5zk+4c1fbrAYz4XgZWQo1EA3n930KwkG44k9iFN
         qqgzJ+31nPw9BXuYhfczmoTW7SdfwdGEkWr85hU7rhvp2lkPnAhTjD/l3MamAuUj5b3o
         62+JzinqVKDrNDyqUnuqPG5Nb4IFYLBqvVpHCRRxOEFgcpLq+rAS8WylhPMG9iCohAwX
         6fMxxMxf0RDFa5JrPt/3EGtvj+Zy6nl0+uW/yhtSPTXkJUfz1Zr+oVSVQhorIi483rds
         +QZ672h9jkLNFB2Tw7BEetn5BMNKKOyobCV5XBhRAWx3TwR1bhKO5Vh+6A4M5pP/LKhl
         CiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421230; x=1751026030;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lG/pp+YecK6TL9JZ8UqalWMy4MkbPjqfLN1AxeBtCuM=;
        b=L1koqd4Tk6krO9EhDCrR7Ly27ngMgQmZZHT50eThcuwciQqHaczS4EuaYlvXJQwrFr
         CyRJvszhvGGHhWemXSkpk6Pg7csuOYDSv4HVmBAckkAOvBURQFBpXLxcX1BtuVi6UHgW
         cVizFKPvJhkLp8DVf20m46HXR8Zby/N+Ux49B4529JNj+KMsawT3ptNe/7TACuWpTEBp
         98IoQR+lABQkPL9CFuMB/C2mOHg7iV6/DG/LlJ/R/PLVP8ObaxStRfjXQ/YvFNIlDDUG
         6FSXkYYupC4QYYPyhMTZnDMrvGAcpcydvpdUpjnH79NoJPVTZQtxqlofCiz/on9X5LN1
         qUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWnToQ9cT5ELBLvNVBoTohqr6wB1ZQYSTmm1rONEKQ/bQqrFnohvTb1m1/BSbSmFQAYF/Y4sS2jgIl7w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBKNSY7RdN7lr0rx2Q/pmguJaHzxXkwI2tsgW560/5ZlwBIC2l
	HB2aJPf7Dj2Rb9LrfT19OT1Eg5qjvHT2WfgqaYSvQ8UpAAYRXbn+DKylMSB7aon7emw=
X-Gm-Gg: ASbGncvy8RIFRTXUhOm0Ku2Rqwn8c5Ah8oO3SS5NG/lVEQp9K3C+SYsc+GOgR3VHRKB
	mP6ZOQpOYcz51Kmnm+ouUnxALZHCVGQIK8l/CQYb8AG8vO+m1uRmBak9oR5kl1w98HKJBVBfQ9a
	wFB4bKj8zlc1/04K1ItS6eoS2HVeb25bs+L/8/KEMbWE59uC9vuJCVHD7iCpyx/4NRlSFj0RrIt
	NF605L+2+2nkbVcZFmUOShFr1M6QD0a2xJ90eMTehUNgHCq5O8wsIYLEVPmkD5/xsI8qJa2M9h2
	rDLlNqgg8lreENnkiZp7h6n63PxlYcX8HwoIcBz1TN0Dbymgs7dwD1I49mK2P2UM+HpCsZEF3bu
	3+++V1e2wnA0/c6xxUoSP7+yhwVC9+N0=
X-Google-Smtp-Source: AGHT+IF+wrgDWF2MbI5/b7UwRcOpVaso3voR+Zg/6OIhVMjvknso7RtJOSmtvATMmjnDhH2I7Iju4Q==
X-Received: by 2002:a17:907:7244:b0:adb:2bb2:ee2 with SMTP id a640c23a62f3a-ae057f1f567mr241816566b.41.1750421230048;
        Fri, 20 Jun 2025 05:07:10 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080a6csm154878566b.93.2025.06.20.05.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 05:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 14:07:07 +0200
Message-Id: <DARCJEWMK6C2.21Y93IPCZO7NM@fairphone.com>
Subject: Re: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Hans de Goede"
 <hdegoede@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Javier Martinez Canillas"
 <javierm@redhat.com>, "Helge Deller" <deller@gmx.de>
Cc: <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
 <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
 <cf29862b-496b-4825-aa0f-493eb44838a5@suse.de>
 <DARBA03BEQA1.3KLHCBFNTVXKJ@fairphone.com>
 <4475251a-ede7-42d1-a95e-497e09beba0d@suse.de>
In-Reply-To: <4475251a-ede7-42d1-a95e-497e09beba0d@suse.de>

On Fri Jun 20, 2025 at 1:28 PM CEST, Thomas Zimmermann wrote:
> Hi
>
> Am 20.06.25 um 13:07 schrieb Luca Weiss:
>> Hi Thomas,
>>
>> On Fri Jun 20, 2025 at 1:02 PM CEST, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.06.25 um 12:31 schrieb Luca Weiss:
>>>> Some devices might require keeping an interconnect path alive so that
>>>> the framebuffer continues working. Add support for that by setting the
>>>> bandwidth requirements appropriately for all provided interconnect
>>>> paths.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>    drivers/video/fbdev/simplefb.c | 83 +++++++++++++++++++++++++++++++=
+++++++++++
>>>>    1 file changed, 83 insertions(+)
>>>>
>>>> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simp=
lefb.c
>>>> index be95fcddce4c8ca794826b805cd7dad2985bd637..ca73e079fd13550ddc779e=
84db80f7f9b743d074 100644
>>>> --- a/drivers/video/fbdev/simplefb.c
>>>> +++ b/drivers/video/fbdev/simplefb.c
>>>> @@ -27,6 +27,7 @@
>>>>    #include <linux/parser.h>
>>>>    #include <linux/pm_domain.h>
>>>>    #include <linux/regulator/consumer.h>
>>>> +#include <linux/interconnect.h>
>>> With alphabetical sorting:
>>>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Thanks for the reviews!
>>
>> For both simpledrm.c and simplefb.c, the includes are not strictly
>> alphabetically sorted (1 mis-sort in simpledrm, 3 in simplefb), shall I
>> just try and slot it into the best fitting place, or make them sorted in
>> my patch? Or I can add a separate commit for each driver before to sort
>> them.
>>
>> Let me know!
>
> Best is to try to fit it into the <linux/*> block. In simpledrm, it's=20
> probably my mistake. Don't bother with sending an extra cleanup if you=20
> don't want to.

I was mostly asking whether this diff is okay as part of my patch (for
just adding <linux/interconnect.h>)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.=
c
index be95fcddce4c..f2efa4b51401 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -13,18 +13,19 @@
  */
=20
 #include <linux/aperture.h>
+#include <linux/clk.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
+#include <linux/interconnect.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/platform_data/simplefb.h>
-#include <linux/platform_device.h>
-#include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/parser.h>
+#include <linux/platform_data/simplefb.h>
+#include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
=20

Or if you want this churn to be a separate commit. Either way is fine
with me, just trying to figure out the preferences of this subsystem :)

Regards
Luca

