Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6A23315C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616994; cv=none; b=o8BJBDxfMpDTUUV+UvY+XANKoynMBDLSL9qugzlAI7m0yrw6g9dua/qTQZv4omWuRq1hUjSkZKc1Y/GloPmQPzM/KCtXwd5Rjd+VHyTFl1CHmxU7rTJhcM7hvMwfUv/y9hJxis49lQOQZ7SjVi7gFC1l243oQMeXofuIpBJO/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616994; c=relaxed/simple;
	bh=0YN7Qt+8hBYIMYQkj/bbF+8pso2oPM0KoT57Hc+rRzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+waumBoeqggDkw4e2SFx9NzapJzs9IvJ6uCtUMma90LliMVdlTyPDt52mQTIIeoN8nXsxpoXSQ8V3u1n+vd6vp20f3u9/zX8goMhGy8UHnD3Z41snw716jgGqbNGEBoT2lV8O0Vd0s4tzSu74w7xhaAb7qrV5D44xZ3x4Q5Tvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=mybp3sV6; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mybp3sV6"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e78e53cc349so395964276.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1746616991; x=1747221791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BrlKQngaih/GyBdcD0JlQz7H1v2pzxnPiDTUdfvP4es=;
        b=mybp3sV6AGCN4BO5zB4gqBXdriJSZwq2KPTT4t1sB9sklCUTuGVZYldgh+kx2rTcYl
         08zoX1KX5bW/qeDqD3fWSMSMXo4VlXlMhymWUyLWNFF8tCcJ9MwiIf6pd3ap/S6r3Nu9
         RzS8HsHMmQnznzifQ9Xod4Tg9HuGeLEpdGivLJGk57LRpNV9iC5mLEcxG7pAPa+suJbC
         T6cSiSrhsoJc5PE3rnq90R9/ZGyxB6HaWA3PXa6Eo/1GZF9j3rh4hvU28iuzY4C1kcGD
         7gLVavPFZSwcGv6S+ra6DL0VAx1EzyrVgn/O3thmrlGtratkZnpVruJA6TM0WBaWCBIz
         uxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746616991; x=1747221791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrlKQngaih/GyBdcD0JlQz7H1v2pzxnPiDTUdfvP4es=;
        b=d/S/CzgBJVG1/BeZzV5QmS7jUpT3+45j8iZlUxI7yGnriFcpLMt5YIAuuWvIiQCcKY
         iUuq8svrAHOliMXD5dFSGknjoy4EK7V5gkqLpz5bicrq/IEK8PRmTHqRSi37LKXFVNSk
         0cl4d2su5/6DHyQyUaJTtR7Pj8HWTlNHxxOQjSSQcFgs/ipKJ/Ioy0EuOxZXYG9Xj0gf
         d+ffTSKTPk2lI6CuCt1cSdkBnblDXi9V9ZVlAPq6MW3y40Yq5/X70nLXxkKtKftOvyFh
         xXRYC+3HHSt+DAu1rDN/3NFc5cY6oua+vaonVF/DYH0M4zj1qPiBSEfPU52V8AT3d88C
         tpqw==
X-Forwarded-Encrypted: i=1; AJvYcCWMOajhi2vjn5F6TbCDpoEp72JMAUBBh5+JeqU2iUegeIgENrrrO10UTbFkZ++G5HnWQ5UCYd7YRSXIL/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAXaJUd7ebpk8jAXuQMp0OJVf2NJHOM7FqdwmcOu3CoJ77VPqA
	cJh52gPgV1nonyzDBrG4fKJKhFo8fFT60QjGAH95oz8tarmnkh+Zugmo7fpaCpZbl6tsRfjbVIw
	co0xirYVaJPuUFYppz2UjVlHVXquzl+y+U5NjUg==
X-Gm-Gg: ASbGnctg/2PSXZTrpZnvryQhBuv/SPrYfeT9D0ourNcKKB+hjXMGCpnkoG3bdvKfS+F
	rTrlkj0Gp9yUAD8Ybr0jY5VKMdR/6my60ho/ma6Dt93PIsagKiwc1+PQ8nkI2cvswmzQatCbHdt
	BvAwdnjwZtef7KSAweb7VbsII26F7NK6HSHJugCl4mJEUdX4QXnF61
X-Google-Smtp-Source: AGHT+IFxdYKCzY2TKwPokyurfueqmOKja0Rc4hCwr5SUWy06EioalRQvocuOR1AAy0bCdqDcNh77dszj2t/Oy74t3i4=
X-Received: by 2002:a05:6902:18cd:b0:e74:e02:626a with SMTP id
 3f1490d57ef6-e7880fc6382mr3556036276.19.1746616991034; Wed, 07 May 2025
 04:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com> <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
In-Reply-To: <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 7 May 2025 12:22:50 +0100
X-Gm-Features: ATxdqUG3nHKGjKOQoFEY4aL1pXCEA2rU5jPHWszWU5gDb-fbZzf1eN3M8MI_ltM
Message-ID: <CAPY8ntCtycm+fha9yuJyr2_9obq8cq6xjYJT7acnFPgh_sCi8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Cosmin Tanislav <demonsingur@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Taniya Das <quic_tdas@quicinc.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Eric Biggers <ebiggers@google.com>, Javier Carrasco <javier.carrasco@wolfvision.net>, 
	Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Zhi Mao <zhi.mao@mediatek.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Ihor Matushchak <ihor.matushchak@foobox.net>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jakub and Cosmin

On Tue, 6 May 2025 at 19:34, Jakub Kostiw <jakub.kostiw@videtronic.com> wrote:
>
> Hi Cosmin
>
> Awesome work. The initiative to establish a common framework for GMSL
> devices is a great idea.
>
> I believe that we have found few bugs:
>
> > +#define MAX9296A_BACKTOP22(x)                        (0x31d * (x) * 0x3)
>
> The first multiplication is wrong and should be replaced with addition:
>
> +#define MAX9296A_BACKTOP22(x)                  (0x31d + (x) * 0x3)
>
> The same goes for MAX96724 equivalent macro:
>
> > +#define MAX96724_BACKTOP22(x)                        (0x415 * (x) * 0x3)
>
> In MAX96714 driver there is an issue with setting up lane-polarities.
>
> > +static const struct max9296a_chip_info max96714_info = {
> > +     .max_register = 0x5011,
> > +     .set_pipe_stream_id = max96714_set_pipe_stream_id,
> > +     .set_pipe_enable = max96714_set_pipe_enable,
> > +     .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
> > +     .phys_configs = {
> > +             .num_configs = ARRAY_SIZE(max96714_phys_configs),
> > +             .configs = max96714_phys_configs,
> > +     },
> > +     .polarity_on_physical_lanes = true,
> > +     .supports_phy_log = true,
> > +     .adjust_rlms = true,
> > +     .num_pipes = 1,
> > +     .pipe_hw_ids = { 1 },
> > +     .num_phys = 1,
> > +     .phy_hw_ids = { 1 },
> > +     .num_links = 1,
> > +};
>
> In order to make thing work we had to set
>
> > +     .polarity_on_physical_lanes = true,
>
> To false. So this field is either improperly set for MAX96714, or handling of this case is wrong:
>
> > +             if (priv->info->polarity_on_physical_lanes)
> > +                     map = phy->mipi.data_lanes[i];
> > +             else
> > +                     map = i;
>
> Upon mentioned changes we have successfully tested two GMSL2
> combinations on Raspberry 5 platform:
>
> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to
> hardware limitations)
>
> 2. MAX96714 + MAX96717

Feel free to shout if you want help on the Pi side.

Pi5 should be able to extract multiple virtual channels to support
several sensors simultaneously (up to 4 VC/DT combinations). It does
need a rework so the CFE runs from memory rather than being fed data
directly from the CSI-2 receiver, but I believe that is pencilled in
as future work with libcamera already.

Unless things have regressed, libcamera should report all connected
sensors to SerDes setups, and set up Media Controller appropriately to
use them one at a time. I know I've had that working with simple CSI-2
multiplexers and thought I'd had it working with TI FPD-Link III
SerDes (Arducam's IMX219 V3Link kit, modded to remove their MCU). I
don't have any GMSL hardware to test with.

We're also fairly open to merging drivers and overlays for 3rd party
hardware into the downstream Pi kernel. If they've been reviewed and
merged upstream then that is the ideal, but if you're prepared to
support them, then it saves the user the headache of having to build
out-of-tree modules.

Cheers
  Dave
