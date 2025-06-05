Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639E5231858
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129880; cv=none; b=UNsUBEpelJyQsSEi5HuMjg0jO/hRVYSAkbPjto6qRv9SlzWFOfeRkCBN25BHI/hM4oBFVXOrAcLtlYVfiWEEn9jdSXcJFRa0vGwMy40hvGTkZL6RxTM582wOPF381S8/VVLdiyfiUxAAkDF680C0WJnJyrZIuGk5Z9BosIjrilg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129880; c=relaxed/simple;
	bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvxYyPrdPrPV4H9FGdWoAwLsGeBY+Uzg7+1Jn/oAf6Pg5mfFqrZ/aq2q+x7BEP0oIfdD7bSMW983Zc7J49giON6gu/KdT7Mv7a78h6JCPc1bLhHXX/BRRt5R/LBay3M7lOPfrIG1mGg3qUUx4quhbaopEgYX8TqNa1yKNx4yfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMAlnBgd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMAlnBgd"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5534edc6493so1209125e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129876; x=1749734676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=mMAlnBgdW4sGDqrEMLIy8yhAW6JMQ+PDIgc1Np0QNTGa5egENV9Lnqw7OQuxSpQJlm
         n1SRIal3lV+FoMqfo2cTkPUTCCPkGNwXGqOJPGBP1IWzP5yUiibyl/OyVkO+74RiUGqR
         JXGQ20tED3ViIDwDxeRfVD0LihY21+XHUZaOkmatj3ah+tJZMTDNVE2RH652QZ4DsE+A
         kE5MCLDDKQJLXXj/NJGpz6JBofY8d9rY/4dUJRegDST+pbn0mB/PNV3IcR6iz3hZ4oZC
         +hp4x+AHqW6DqbIdrsruUT3j8y+1kGypLTVg4ewGIjR9L60L3SOnowBSs4KTGZ0SS32H
         7W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129876; x=1749734676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph8J09n5JKQD535azyDhvY/sp5bOQf//77AfpWmxs2Y=;
        b=qMmc9RSn3McsS/fyaqRCQbWJXyX6SMOYWhco/hRDclWI0Ozex1DaOLSpFt7wAneAyH
         +43d+JzxIkLFUJYRgffeVJxBYAHcC7qh9LKsXkPlINK5euhoBK9fejxLWuL/Yj2Go9Rp
         p3eYalG1Yr0kbHf8Udme3tvITIBB54C2tDkWXdHDv//7cvnTeSqlQqsKvjxWaVfGlUny
         tv215NLaRbvtGXxML6x1O4y4yuTgdfB6CHylu9XsvYVUV/YgWwxGZlevGMNL9yXFX52k
         hQ5BbL7MrpT5YlOfsLOKEEOK4H0OD8UGcRnnSWkdgSQn1OQzHqsERbfpvrBp5Celevvq
         JiTg==
X-Forwarded-Encrypted: i=1; AJvYcCWnIXS622CjrXduv0qc4+BI/N66H6Kj5DZcToWPII36CzLeu85YR+NwwQ07eRMgPYZYJ0lqMxjWZwgNquw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRhDB1te8DkZfjG8JDx0hzpzjr++Er/oZ+3hVHqiee9j1gSM7
	qOZCLopVIk1uPMaoMBIv9VzzhvrvtwQ3lR9a5yE6DgagJNIBigArYLzaI8Ja9dd0A7UQr3ABwfz
	wBXWL72Gte5T8yFZp7MUANOh9V6wCzQlZOOpamCa0pQ==
X-Gm-Gg: ASbGncv/8qcK7Y4+E0NzSUVmaaiF08/nrjsb9GDE57hg9xE6+5jHslR7imXFzq96O8V
	25L5yF3wWmOdhI03+pvKtVsyglRSFhJwnUbV6A8yKJImlUwSdPlGmVTlb6mElDIUv6/H3yOyTNl
	LZg9mE6KQ/FQ1C/W85gbPCXlPwqgcyZKZh
X-Google-Smtp-Source: AGHT+IHcFKkR1DgTHybFc9+cXkjDfNRWO9Y5rsQ/Vs78BAkzeGllU9ZiczF0eVkbFtRkeWxN8XAgTwUOdn8ciwJ5GKY=
X-Received: by 2002:a05:6512:4011:b0:553:26f6:bc01 with SMTP id
 2adb3069b0e04-55356e0492dmr1902010e87.53.1749129876416; Thu, 05 Jun 2025
 06:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-29-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-29-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:24:24 +0200
X-Gm-Features: AX0GCFv_P_oe8_LfoK0HrETyIz_pn_ODXYaiFB7vtLAilhJTNSsv4UaB2RLH_HU
Message-ID: <CACRpkdaFYcvq+XsQ6FocXqW-gnoP+66CL4hTiSQ=w0fc1jckig@mail.gmail.com>
Subject: Re: [PATCH v2 29/46] panel/sony-acx565akm: Use refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Robert Chiras <robert.chiras@nxp.com>, Markuss Broks <markuss.broks@gmail.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 4:52=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
