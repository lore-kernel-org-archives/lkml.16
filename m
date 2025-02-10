Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BC423E254
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202035; cv=none; b=lKORAsMlyNF6FXVvmZOKwOoQTtlYzcDeL74wBld918AEt3Vz34Q+sBwYzxnLUtQKxRABqHklgK+ogQz+4SmM03T9kD9/U4XbdDTSkZODUMTiTfgSbFPbICnby7rTvnGppNcywgNyxpICWlxubgl1EcxDMriIhPkGQJWVe2B6Xyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202035; c=relaxed/simple;
	bh=kj6zSX8Sy1priPFeNHrLAanZuDtOXsR0uQHsylLl7I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrHCu/ufX31xluP2rFsJtzIBdpmGZn4IR1zkN973wgwO0za4Elp8On02V2xXL9KrAGYvJDGivZMsNaSYUHkECTAeUD+flRqXhxQQD5GeNCPmASW1+sizDdZpBcUOeuylWQX60+G7AgPqjB6/zHU3vlLisfLoOgrdyPErGdFYIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S1RRPiX2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S1RRPiX2"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-308e9ff235bso12752921fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739202030; x=1739806830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/SdZj5cHoqqEQ76M9Tucg5S48D9qoX/egkWuOcaBkIc=;
        b=S1RRPiX2gyt97kY7NNRvJqs/SRt/QPeJlHTIChO8plb1th2d3OdKLSoKG/8eMHuOYC
         86Q5H6dnT5wWDhXA04y+4qcrkn98/Ullvq+aDvtA0tVCGmNO4mjQLJG4/b1QgMQDxg0m
         g8p+fk1y7CVyvHTxxx9rGvG2KHr9r3Fsno0M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202030; x=1739806830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SdZj5cHoqqEQ76M9Tucg5S48D9qoX/egkWuOcaBkIc=;
        b=S92KMiuj6oevtgOH8R42hzyW5cziQbA+mDExo1Wruuyz83dacEx7K4g1KryXR6lsxA
         knPSxYPwKrJCATlMicYr5pJ1TJ8o9sDCfoaFJe6We8kzJUSy/XB/VRLGFDYLGtYjvm+G
         5uUgOL1kVWU0nRcyc2LlrmUHdC+hoOSC+tUtAeZpjtAiBb9dKMUk1PapIKLEFVQxe3yW
         c0YvUDWOeb2LfBll1SH6AaSvDT368RLcA26KeTGBxpFObhumN88wx9MnDDn87XRZ8FaE
         IXZEtpPh/hzWblI+z+0Bw8ruFz7VqFqc4PtkfXw4EHUNf6wWlNezkBiDj+H503nvZKq7
         bwZg==
X-Forwarded-Encrypted: i=1; AJvYcCU6QQ6GdSiHarmVCIVWnyf83Z2D51II8OYyh12LbHrTXp6auCqOUcUlzxTbSKZ9caQe41OfbDqYacSRDvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynbjvtGNTUu0wzIbXhkW8VSQSl3Fg4jbCQNv6CtiATFS7cmjBC
	F0Y8OrMhhy+Vh/Q3Ig+86W35fDB8l2S/Yk9dsAHu/3lMBLB+fnfRQJCpjfOD5uebNh9uZrPrm/T
	rRg==
X-Gm-Gg: ASbGncsqtd2rvCtirZnpiX32cJ4Db7LBljW8BjNGBSPeS2h93pX3o2rsXC9JOY/e9+E
	8ooHQPqxuHhpYks86TD022UOdSSNmX+t1Ofalt9rYaCdRM8YWqlyvUiHKEUDJ3OyppRqXMcRMJw
	DTE7IcSLQmouoocOGpxUp3EE4+eSR36jythFX/VmBbpDcM6bn21BUKwjqoXH8Xo78MjKVKpAn4g
	xcHL3wx+pn/1OcxWCr+ereSYmsuUO5ckpfvSsDY/1GZXlUYqU03iQ80OVI7LJ8GJheSNmEaXY+b
	cN2OummJz36EWX0pG0GDhOvemVgcXhKdqSG6lxOdw1zbXAE0V8jz2GBcH/0=
X-Google-Smtp-Source: AGHT+IG7WjDMSsUchjb3kGmCftgRUNz/K4FxICEZcoXZDjgcLRaBwfwsohkBPzvpuKXinlUw9FeWBg==
X-Received: by 2002:a05:6512:238d:b0:544:1451:fa06 with SMTP id 2adb3069b0e04-54414aa815dmr3845103e87.28.1739202029632;
        Mon, 10 Feb 2025 07:40:29 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54504357fc4sm782467e87.59.2025.02.10.07.40.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:40:25 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-308e9ff235bso12751411fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:40:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdQTy756MYexvQ4NhBjmlAkfPw5Sa19uG+QkblNgP0WWjiUPcW/19cRS+RCNyoE9gsWJGxAkpYwaFWnWg=@vger.kernel.org
X-Received: by 2002:a05:651c:893:b0:307:2aea:5594 with SMTP id
 38308e7fff4ca-307e57f2535mr53531281fa.18.1739202024114; Mon, 10 Feb 2025
 07:40:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-3-yelangyan@huaqin.corp-partner.google.com> <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
In-Reply-To: <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:40:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UyLEEnVRJNB-vAV_KpiZvBgmxiAkusXVooMUgzt570Yw@mail.gmail.com>
X-Gm-Features: AWEUYZn9yU9AYjv0ZV9n8hb_YE2USzRC2N16Y3pIGHR5EU-Jjsdk8V-yKWEWNyw
Message-ID: <CAD=FV=UyLEEnVRJNB-vAV_KpiZvBgmxiAkusXVooMUgzt570Yw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm/panel: panel-himax-hx83102: support for
 kingdisplay-kd110n11-51ie MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 8, 2025 at 12:25=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
> <yelangyan@huaqin.corp-partner.google.com> wrote:
> >
> > The kingdisplay-kd110n11-51ie is a 10.95" TFT panel. The MIPI controlle=
r
> > on this panel is the same as the other panels here, so add this panel
> > to this driver.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c | 115 ++++++++++++++++++++
> >  1 file changed, 115 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/3] drm/panel: panel-himax-hx83102: support for
kingdisplay-kd110n11-51ie MIPI-DSI panel
      commit: 15d174fa85d936f3d0250b111e7d3b7f26a38b40
