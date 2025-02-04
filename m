Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE042214A66
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683473; cv=none; b=RnHjSbSWrISDgAwv49P2dr/IWGTUTNk2njt5Huq4rLIMfwMOIIgR4iS/cnF0XXiXm2AePes2F9C1XheNkWjLImrPlxa79RvkjF7VNh9+Y0Hu887rnUoRk/o9417VOGH5ippq8zfmjnVzqcIq6G68ayRnKkl7ZVAm6M873snQGYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683473; c=relaxed/simple;
	bh=+aiRMryI/PyiYAVqxh3wAwcAJtTNf5jCsbss55UrJ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCrAJYN7grq3XCWtGbEVrkQQDVH9Vx0FYGEEM5RyXUWfnOm0yF1KhisDowTd3Ba9okqfhHpLq9kxdG/EixwEzKdFKMdvxmt0vkhzN246ZsC8vyoRAgRX5odR0HA3Q1cQJp94B3IY4fJdG33dDArZjueVYL4kMGqCdaHuQjCh2CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JHr5vfRy; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHr5vfRy"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-543e47e93a3so6108565e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738683470; x=1739288270; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXRswmzs3E1pPYR4f55S4R+8P/qWlGpviWkaCfNXr1Q=;
        b=JHr5vfRyGLe6M/wExDU0OKMcw1Uagof04OGqxCi6Kavk/1lE4lnD4GUQBS7ntzPNPp
         o3zLA733vPZvx6NbrSfxrvoMG/S+fxjdh5gOt70P51d6K1iT7GhPcye6+K7X3jljExDe
         HlnEo/AfMFhGAYe58PcOLyhyT5HgWCV0q6YothSteIFI0GsY8md0G0CXYj5tTU6LNt8x
         8hxGz738o8Gt5GvW9EFG/q+JIrzr8ZLsCaa5Y1UqqtMnGwa3aQwyaFcyQgY5/+669FBe
         D74gLJn36uMUeOa0xznxpJhc4utbVdoKtoiUFuHsPIpFde+INZVN9hUCTduagRRcmMSN
         RYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683470; x=1739288270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXRswmzs3E1pPYR4f55S4R+8P/qWlGpviWkaCfNXr1Q=;
        b=muqLGm2lfX6eOvSiYvIdhpvQdJg6kL+avgqmBPpDz8gETD7v2OAcV1gPcshPQhr7Gq
         d+wEiNmQTQ0Xu/ygmWiLBoS1gw031MDIeZh/xvQBtwpDBbaVAMA7RkPVLZLeGub6Lt80
         A+cSA4BRpWYV8T2TU7yfn48A+67UfjnFiwP3aomtRN3d3Ag3nh9iIGVwhDXhE7FcV5Jo
         pxwB3mrWWpJFvMRNNYIfIzM2kNW3cV+Oy/kRZod8W5MKu6C/uOLb+6fZc3R8TdPP2e02
         /9/sFtz5C3DxdFdnj0zNPC0pVOprwIeRPhYknTQ2g7TeMAUPD9ivplYg0Z6/zf4GTKJp
         gixQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR/kZjmnF0DOGbQ9p4OKbxc91XPTndwO2IzF4uu0ITEBSJfavFFKSV8aX8Y4IydCLzSxD/6LqPdKzyEyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGY/E86gRYtKCVec7VKqW/REsmvTB0U6XMmHS5TvSiIoPothjg
	pLe0has4bdC+l+nShcvu7VXj46TAvzdVrQi5i7o+6S1brujw2l37w7aFYSQy17I=
X-Gm-Gg: ASbGncsXNp0vg62/xMX3pCzohUpLRHhR3GWsUllfdDs//yXfbZ8ojzIUyk0yXvYlbbA
	UERX6CrUaiHIKk7imajxk+970jsE3A9OtHdAEfKKLcvSA/oC3LACck6r9fZtPwzScBR6yAJNkbX
	HJb92zmK3DSNbHn6isYsexjHEV371qHlc+FQS2V03VBxcbgrNOJGxXfp3FeYbPXr5gZkRZum/eG
	5QTwlHw7gar8qZMdSBJiMYG5MfJb9RruNpNp1JnaWZYk1y4jyM2sUfXvDgRoXP6vs6pvyMjo/wf
	BeQkVDcqkP/SSSwyMx3KzxhchxMCEbNl3yceqGoMf6XUwyVqJ4rhug9HIHifkl6j9yRoiAk=
X-Google-Smtp-Source: AGHT+IHBfTNkAf+lmgLZuPgndyNDwP4gVMSK0kteVAMO6RgJ3GlDWCfLBab5sN+UwkPZ9Ed5iueJvw==
X-Received: by 2002:a05:6512:3183:b0:542:8cb0:88a8 with SMTP id 2adb3069b0e04-543e4c3fffamr8931689e87.52.1738683469609;
        Tue, 04 Feb 2025 07:37:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf1068sm1596844e87.27.2025.02.04.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:37:49 -0800 (PST)
Date: Tue, 4 Feb 2025 17:37:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Hermes.Wu@ite.com.tw, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Pet.Weng@ite.com.tw, 
	Kenneth.Hung@ite.com.tw
Subject: Re: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for audio
 stream setup
Message-ID: <2wkhsjxrlhrapu3jar4kdzddfav3epc45h4dlpq777i2bmnnqz@oel7prfwvtqm>
References: <20250203-add-audio-codec-v2-1-5c8cd72ee5bb@ite.com.tw>
 <btzdguakskos2gogmwjkz6zoquiut63kmirvdsh4yjoqqvzpin@um4hcrlnecxh>
 <9742a55aa51a461a9d5b9352db0f3c39@ite.com.tw>
 <CAEXTbpe891XQW6FsYs=uw-PanmVznp5ieeCbJWprZ-+=83KwJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpe891XQW6FsYs=uw-PanmVznp5ieeCbJWprZ-+=83KwJA@mail.gmail.com>

On Tue, Feb 04, 2025 at 04:10:37PM +0800, Pin-yen Lin wrote:
> Hi Hermes,
> 
> On Tue, Feb 4, 2025 at 11:49 AM <Hermes.Wu@ite.com.tw> wrote:
> >
> > Hi
> > >
> > >-----Original Message-----
> > >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >Sent: Tuesday, February 4, 2025 1:28 AM
> > >To: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>
> > >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; treapking@chromium.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Pet Weng (翁玉芬) <Pet.Weng@ite.com.tw>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>
> > >Subject: Re: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for audio stream setup
> > >
> > >On Mon, Feb 03, 2025 at 02:04:30PM +0800, Hermes Wu via B4 Relay wrote:
> > >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> > >>
> > >> For supporting audio form I2S to DP audio data sub stream.
> > >> Add hdmi_audio callbacks to drm_bridge_funcs for the HDMI codec
> > >> framework. The DRM_BRIDGE_OP_HDMI flag in bridge.ops must be set, and
> > >> hdmi_write_infoframe and hdmi_clear_infoframe are necessary for the
> > >> drm_bridge_connector to enable the HDMI codec.
> > >
> > >Please split this into two commits: one adding OP_HDMI, second one adding audio support.
> >
> > This will need send patches with cover letter, should I keep patch version or reset it?
> 
> I would bump to v3 in this case.

Definitely.

-- 
With best wishes
Dmitry
