Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FDC2376FC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129966; cv=none; b=kOihD2nPKZCKYvh71bV67oPpmBHATGmT+bDUpHnZJc21cbXInS6Sr7OlMGofWeEdDPlLApRKHomoDyIZ/N6znGZzlmmA9jZdvU8kveH2OSCbRkqUJRASs/qxD5yvSo4naMDoTejW5FhvH1WComGI4CQIIlr9ql3GNd2vkBDjzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129966; c=relaxed/simple;
	bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGTn250nFU1Q3j86G87Dart/00jw9cKcNA7q+WpGV6+6wdnOKvz54PPkxwmxiRBi3FnAHZoIpm+FNFGVnyBeHK0E5H+al6LXQJx0fCOZP/RSLrvZFk1OOCdQEMYoltVTyw/vKFsQJ/F+tcrU1/JPsdng3yxUkT6n+HUxi0a8kV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1HV1Tl+; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1HV1Tl+"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32a72cb7e4dso10720181fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129963; x=1749734763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
        b=n1HV1Tl+50IjFzfJHMrD0ZB2z/ntWh5fHv0gQV01hzVHdDGdppcWGR+AdUsNqZYebg
         DIcAlHTPFRAgBHnFRTNVKFWT3DuxMGbyxS7p7e+Q2oZfWff+vTv175DzScHxTe9SoeZI
         2h1yJLjltotFiba+H8dr88DlFBxjO56VR//AnMK7h1YfQFZMeEfDHRdLUcczLoeVO+Vb
         9eqSiVUjDUAPQl9y0d7Gi658CTvWQ1okxV4Yz4SvbB6Hxc/L7sqszCYjXwr9W8997DgX
         aV4j7hnBVc5N1q94+QizY5wlw8BHvTSSpeETWkqjgzNa6mNEx6p2IlXogVo6oSibSlsp
         TzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129963; x=1749734763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhVG2kN4LoAfwvL6GSSBxcG9jP3N0nwH7XuxrOA/U88=;
        b=HojuJQM+iFkYdkg7B5Rclgi3eKQ1MnygOs9Vt+3Orw5HwMzKGimI7pWRj+zDKUpoFL
         tC6jXbZ6qZbZ6U9iNlspuCNtpuIMY6ZSNA3s+zguNtdQtPn1xlO+MyAU0W4WCn2RM1ij
         nqB4APgM9NapD26shQ18o3r+Q2j2F6R4UR2ZO8R774GKUHi48YXIWPVPFNIRwRwPL30r
         9WXQtzT+FKNDFvqsWYHGcDEo/zZYRfSKaYKZ1B/M/7AuzybaznS379S2lxRoGVAsJ+kR
         Dyksi75oB2Fucd1xpUgBWLSPDHpGskPRS3Rtid7OwHyHd/ysPBz27aheD8hTjGwURf/a
         6R4w==
X-Forwarded-Encrypted: i=1; AJvYcCVjeALM0foOerhQ6gqbCgebGqNlEje8CrzwW2Uu/g+t7NqNXWgAicxPZYAR4hDjxuLlsoWF5xB8GIQbSh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQ86xuWaZ+jS+H7YoiPhzj/QN4heATsLUf72Yo/Mv9w9U13aA
	ica3CqKug4NTOVyJUHkTy9t7HzOeoteKgI3cK/D6hokRICRXb6RlLSMUVLZ1BIh8SuaCYwLXQ7o
	l/KpKAGKG+OUH+q0RzQcy6Y7EhIiJ3Bxk9l4UREx21A==
X-Gm-Gg: ASbGncsXnLM9Fy8QasN46cZiBfzseHl1wJW33zV4gAa7vAryAec+Fq2474YIZKYV+uS
	m40Nd5ITLinMYZtDbzqQ6XIUlZa6voj/hru1Gpm6v9DiP9smrg8/dEFMygq1uO8NDyTqz6FBLrG
	KZS3Qu1Asdv5F2dBtGF6vJvACPwXdi94+4MzorNGtBSo8=
X-Google-Smtp-Source: AGHT+IGzkG6Ev8DgBi85YJ8sl3jbCPXRA28i4r/pxYrAP5o+fCPD/kuEmxicVyoL2xsSDiMRi26UOm+0/MOqiRfdIq4=
X-Received: by 2002:a2e:a902:0:b0:32a:7a4d:9450 with SMTP id
 38308e7fff4ca-32ac72ac20fmr31835671fa.33.1749129962831; Thu, 05 Jun 2025
 06:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-41-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-41-5d75a3711e40@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:25:50 +0200
X-Gm-Features: AX0GCFs01csf8csUF9o0pkVY61rk8HDa8aAw9AQmVv_cMVBcNF9E297jzPpGnpg
Message-ID: <CACRpkdYTXwhuAWHvpMNj1w3ekmPoRkXE2k5TnrWwB+hFjG9QUQ@mail.gmail.com>
Subject: Re: [PATCH v2 41/46] panel/widechips-ws2401: Use refcounted
 allocation in place of devm_kzalloc()
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

On Fri, May 30, 2025 at 4:53=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
