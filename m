Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B2925C81F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356428; cv=none; b=SZpd/DWnqY5AYHO+maVq/Q7ZAQI1PFLM1FNDSNz4BxQ0Jo4UwkRddJq26A/yPzNJIrWpYdke67xNlFYE3bcY96FmOhfxt4+95r4c1XIQUpaVl3B3TXRK0P3s2IE4Js7lKR5BOcYsX9NEXETl/BkuZ2A9DS0aN8FLtoHJKK3rwLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356428; c=relaxed/simple;
	bh=x99YqM5jAciDGUwEEKcwbaWSiUtE4eY2SQKKZ+ma9tI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iTuRmQBUCWoVAFOxGlW3Zhf5Am6n3bZ2Vv3OaTMRsqiMvsaGNbTu6u/CwPY08dnomn9U0FetDJowR8xn8JHJmNlBB7TBGI8m18bvKl3S0zyUIYz2MNit+mdf5hosV1lElL/dm3yplAPKBuVPRGwPzziy2Y4Qad2LgbtNFEI2iLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=IMtMcGcv; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="IMtMcGcv"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f2c45ecaffso43601656d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745356426; x=1745961226; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MRlkHO/ATqsDExG6tsCGhp23a2+ci1NHjbr5iO6Odtc=;
        b=IMtMcGcvVpQ9UAoX6OE3xtAKzBTgl8b/ZS6RAMBGzTd7kbIZXNSinakzHoStrsuAEq
         er8SfZAqim0/MQmurWQJc8uaTdz+HYAnOM3prSngZQm5DajXsIc3bvdTpnpneVV+SX80
         0/p65rZS/Mbf7A1r3ms8KVqhBXrQBN+ydvOVNI5TabQKHEEeuQ1dtEeYis7rmqE+NP9x
         RKOwW6UYe5R7K4hmnDrKEWTmj0H2ijuSX+C1by3xVx/JTlb7QcPMEdlQM44aaEMGgsZC
         xGTOtV3ZVvat3w23D4Dh/6s2uc5I/mK3Hl2pKzKYCff/b1oBdJUYfgF/Vyh1o3Pa5Rtt
         CTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356426; x=1745961226;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRlkHO/ATqsDExG6tsCGhp23a2+ci1NHjbr5iO6Odtc=;
        b=AMfo60jyUapkSFg/XF1bwBlI0kMIUhJbl7+S9/Wqp1yPlW3y60YI/uMs0/sSCX7Uiy
         I7/7TT2+SNI8b15lNucgFTUSaW7expg/Xe5UyNgw+/X2l4OiGxpshBwqSR6BfH2/U05S
         BMBl4defxwm3XxYwNFhTe+RMtrUz1hSexXjk3+XwPWRH9IVNRxPx4H+zoJkEm6yHWdog
         AzUpy7hV0ruVKOHz+/AZ9iuJO9wHA1Grayvie3DmAtv8vt9tS6QAX4Mvlm4pIeOty//N
         BvjPtkNK4brcz5y6h9XjfEGg3mR/vy2GAJXzkQzqaq4iuLbud5djQ5RvU8Paeluq7oii
         XSRw==
X-Forwarded-Encrypted: i=1; AJvYcCWkN4UEmj7p8HbJwtwqA83XbMrs724RnZbYkdxYZVvI2XDH1kzlHMW3dUbbi8i/lDPydsjNLELnt0du52Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGG4709tPpO7KaBSRlM8driMN74CxMiRnBTP18yKd5Ybd+5h4
	cu9V3SmcSDNx7nYIRrH5KvOgrA7llXuEv1YF121d5QF//JIo3TYGVBrNVmjrllA=
X-Gm-Gg: ASbGncvd3A6N+2swj1PO9Er68q9dl8fDVHnSqk/Rmc5eJkBGtg3Px64ZtFv1wSiVjrZ
	jPrjoNuTCLu/tJFliOR2oXDv7YBvsfD3y4U6nK7tOfNY8vctbfvsMZtSvemwk888PrLfu7Clyq9
	V9bphHQVPBnNbcqjLnqD1DHO6Y+lNlS4o2hnZxV2dm9Y5Sf2T64IfiTZ/xevSciAmyuS1eics33
	T4h0PBrToVrEWH/zCk8ezvNLSRpDcTlhVn39xN0+if6teQw1YnIa/hcxnvEdCrdWjvPKYl7CY9m
	znv286E69hBZJvlW+keRxw+SLng5G0r1WOyR43WMiEHtug==
X-Google-Smtp-Source: AGHT+IH0GaDhDhwwRuUL8aPkyJ77kEEFwsg5jHZ6pptPGGu8U8R8GNXiauC/BafRtBOHlsAHETZJwg==
X-Received: by 2002:a05:6214:258d:b0:6f0:e2d4:5287 with SMTP id 6a1803df08f44-6f2c458d023mr232308396d6.24.1745356425929;
        Tue, 22 Apr 2025 14:13:45 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1b24sm62265366d6.5.2025.04.22.14.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:13:45 -0700 (PDT)
Message-ID: <6a8b96daac4dd37dbe51cdc52052a9af26236de2.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chenyuan Yang <chenyuan0y@gmail.com>, ming.qian@nxp.com,
 eagle.zhou@nxp.com, 	mchehab@kernel.org, shijie.qin@nxp.com,
 hverkuil@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Apr 2025 17:13:43 -0400
In-Reply-To: <77ed36f63ec02156d480efebafb80f3af3ea50f0.camel@ndufresne.ca>
References: <20250411184356.2910366-1-chenyuan0y@gmail.com>
	 <77ed36f63ec02156d480efebafb80f3af3ea50f0.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 11 avril 2025 =C3=A0 17:20 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le vendredi 11 avril 2025 =C3=A0 13:43 -0500, Chenyuan Yang a =C3=A9crit=
=C2=A0:
> > The result of memremap() may be NULL on failure, leading to a null
> > dereference in the subsequent memset(). Add explicit checks after
> > each memremap() call: if the firmware region fails to map, return
> > immediately; if the RPC region fails, unmap the firmware window before
> > returning.
>=20
> Its hard to believe that its a coincidence that someone else sent a
> patch for this. A colleague, the same person ?
>=20
> I do prefer this version though, the commits message is better, the
> code is nicer. If its you, adding a [PATCH v2], or just adding a
> comment that its a better version would be nice.

To Ming Qian, this is the type of patch that I expect an Acked-by from
the maintainer.

Meanwhile, to Chenyuan, you should followup when requested. Marking
this patch as change requested, looking forward a v2.

Nicolas

>=20
> >=20
> > This is similar to the commit 966d47e1f27c
> > ("efi: fix potential NULL deref in efi_mem_reserve_persistent").
> >=20
> > This is found by our static analysis tool KNighter.
> >=20
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
> > ---
> > =C2=A0drivers/media/platform/amphion/vpu_core.c | 11 +++++++++++
> > =C2=A01 file changed, 11 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/=
platform/amphion/vpu_core.c
> > index 8df85c14ab3f..26568987586d 100644
> > --- a/drivers/media/platform/amphion/vpu_core.c
> > +++ b/drivers/media/platform/amphion/vpu_core.c
> > @@ -586,7 +586,18 @@ static int vpu_core_parse_dt(struct vpu_core *core=
, struct device_node *np)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	core->fw.virt =3D memremap(core->fw.phys, core->fw.length, MEMRE=
MAP_WC);
> > +	if (!core->fw.virt) {
> > +		dev_err(core->dev, "failed to remap fw region\n");
> > +		of_node_put(node);
>=20
> nit: node and res are no longer used passed line 579. Meaning you could
> unref the node earlier, and remove the repeated of_node_put(node) call
> in the error conditions.
>=20
> > +		return -ENOMEM;
> > +	}
> > =C2=A0	core->rpc.virt =3D memremap(core->rpc.phys, core->rpc.length, ME=
MREMAP_WC);
>=20
> I really enjoy blank lines after closing scope, even though its not a
> strict coding standard.
>=20
> > +	if (!core->rpc.virt) {
> > +		dev_err(core->dev, "failed to remap rpc region\n");
> > +		memunmap(core->fw.virt);
>=20
> Its interesting that you thought of cleaning that up here, since its
> not being cleanup in the error case of "if (ret !=3D
> VPU_CORE_MEMORY_UNCACHED)".=C2=A0 And its also not being cleanup if the
> probe fails later for other reasons. Perhaps your chance to add more
> fixes to this driver.
>=20
> > +		of_node_put(node);
> > +		return -ENOMEM;
> > +	}
> > =C2=A0	memset(core->rpc.virt, 0, core->rpc.length);
>=20
> Same, I like blank lines (but you are free to ignore me if Ming does
> not care).
>=20
> > =C2=A0
> > =C2=A0	ret =3D vpu_iface_check_memory_region(core, core->rpc.phys, core=
->rpc.length);
>=20
> regards,
> Nicolas
