Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CB199E8D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951173; cv=none; b=lNCAhJMvd1a0elii6ja4OWMQAq4kVN0vSoM1x7tQXJHg2WGoXrr5P3RHU4QqfIV9B5rHy9HDuRQ68Sij6gQjmskAucDdjddTLiAHNTKy5IniTEm2Zbn3FrGh30UNxYEqLtNYliZ/zaNVWjYQ4jC01GO0AfHVqPeRGRwOyj/aUfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951173; c=relaxed/simple;
	bh=HzEQLP02Z2hiN4v9+HR7+/Ah5QElILgZPt/vrg4XGEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epB/gkdMITI8Mq+PQ4OmUqY9I+bFiHu67GVq9b0sEBJ8gsxjupkZVVNjZxdzwfmEqrQW6pFH3O6R77yL2JcQHs734wZXxrFEMgdRBHVBX9p7ljCFEv79DoH3zelQViGIjBAgVl7M23FfyrNQUkhBrwGujpqDU31WJjNHT9Jag1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HzJYLmJB; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HzJYLmJB"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5440efe97baso2629783e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738951167; x=1739555967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAyA9k3gE8c5Mnrd0sbdTuF+3Mk11ZW10JEKEegQbhc=;
        b=HzJYLmJBCFIjdzFiGMIg1kr1hr49lS/cW4DxNXTfuK6zfbXjb0PVZz8BrnxBJiPU3k
         Glliqnvma7nyXl1eXqgKliUVIJeGzqujAcfrBk1gx+HKaTzBB1rOEfnDfrzVAc5D4t5J
         CN0FLNqjUj4RWo0k1q7YQfiw4yyIW5TMp3kcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951167; x=1739555967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAyA9k3gE8c5Mnrd0sbdTuF+3Mk11ZW10JEKEegQbhc=;
        b=N2EzWM/CX27Hs5fouMalr/O1jVj4+hJ8aE2gZ5uPzbDf/5f5rlUY8szIIxOw5aS+4V
         eXXbWAuX771wf7opCFffs33B6TQ28vkuUCezLERuSMgBJf01y6rauCl/OmwyLFnlp9WX
         FSF9Y4IvgFXgWXLEZUDyzRIiHWxge6AMo/NGO5La5Fsjaqexb3E06w41QK/hosjmEHNz
         UptDmobKotn6BB8cLIrdJ2JvJII3UbGGMM2SoZul3WXIwPX2nddpzXzhMpoTYDXUnrno
         NoDbjOQXclMUBPj+LV6doGXHAoBilCCf40H6Iqx9FbUJHLjUF86FHDz8dgUfE63snRlH
         EpEg==
X-Forwarded-Encrypted: i=1; AJvYcCVfL5ZXGBkmum/j7ovz/TTkAM42KemNnGSzxeJrIclFCGsuU8+4ItJRolAfbRKOJEPulXlEraGTGLFnS64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9jnakU/jER+Pq147O2Utfq+2zW7CA75LgTcX2p6e9PKj6mVA+
	/5AU0vqHxyn4SreIscDt4DQLaCoQk7jqA8rCY/66jkZSdExV8PypaNLxQDOq/PvFARM7RbrEQYP
	atJQ7
X-Gm-Gg: ASbGncuNMJotkqRZuhjZHGGWXQjY19jmsWPK+O0QZqOhbFX0g0vZ1To1Cjdhs9/2jGe
	0kWL8xtMYyBivojjo885LFRf1Hf5hXHdpTN36lqfU+dTZiIFyUlAqCHj49sBMGxNa9n9iPAKzx8
	kzbwYb0tFYNLva9YO5q65Z1h0d96RhtugAtvm66DKjcjusjPwf0/4CCiHTs6o8Mita76ahT6xV2
	VgmiXgHmAoCjvXf9Hr0sbEREMertJvA5DKRkK7gnPMrZVfXtbTyHh0y3aJkrbY6HbLHALM5zyQj
	ZbuG3l6B689qC76k4Jc25iKZ5uXlsObqq0Tt44+5xaIAvyiZalIA6Xs=
X-Google-Smtp-Source: AGHT+IEuA/tGGc8yDQcpwmyiuU86u+w8z9pHxWvo0vAh1oJETaqwId2ERomQwLWJmzUAfyqCxJMOAQ==
X-Received: by 2002:a05:6512:5c8:b0:542:8da7:242f with SMTP id 2adb3069b0e04-54414a9619cmr1131815e87.10.1738951167034;
        Fri, 07 Feb 2025 09:59:27 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441055579asm519810e87.94.2025.02.07.09.59.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:59:26 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-543e47e93a3so2562257e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUoYPrrx5DY78E6Tuv/4SuKiRGdeqQnKIkv5LvGJT/Z/0AWFXmtS4GMQycIPx0/Ivbd6yqLmr+RdmWc1/0=@vger.kernel.org
X-Received: by 2002:a05:6512:4023:b0:542:98bb:5670 with SMTP id
 2adb3069b0e04-54414aa709dmr1057707e87.25.1738951165202; Fri, 07 Feb 2025
 09:59:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com> <20250206-uselessly-riverbank-14c097e62ae2@spud>
In-Reply-To: <20250206-uselessly-riverbank-14c097e62ae2@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 09:59:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UybUjCSqtk0-QvYc4GLY-J1=hLep9eCoPwB73psw4BeQ@mail.gmail.com>
X-Gm-Features: AWEUYZk_zCmx3_FAd9S6oDwQX9ETkP9z4pnHHk7HPMygPYUX8J-m_i6ND9efCG0
Message-ID: <CAD=FV=UybUjCSqtk0-QvYc4GLY-J1=hLep9eCoPwB73psw4BeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
To: Conor Dooley <conor@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 10:14=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Feb 06, 2025 at 09:12:59PM +0800, Langyan Ye wrote:
> > Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
> > HX83102 IC, so add the compatible to the hx83102 binding files.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Pushed to drm-misc-next with Conor's Ack:

[2/3] dt-bindings: display: panel: Add compatible for CSOT PNA957QT1-1
      commit: 36947218ca90c1f560f43c88c438124f8df884d4
