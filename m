Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9F24395C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704131; cv=none; b=K5GnNsEYewKFPHVjuyS4IsvCJEjQAdO4YyZgncO1QQtIedlQrFhWxFo+RdEva/LAV8ZGQVe+TLGFw5xMscDw6RikuKsYq8ZcNrjTcOFfuPahcJLKVehJUI5kzhsts3ii25jAZU7s/6IDoRR4Tj1x6g1+N0pacqNH84nxu8UzLgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704131; c=relaxed/simple;
	bh=oEP9rni+HPtFUecXYpSc7d877m22l1NQuJbMRjFTHY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=me6teCRsyTEAtmlmxbp/IEniaYmkElwg/2/VnduUgBOvEUgmE0VSYDRQkQcg5C89ywlGJZ3+o26fmFqfH0dm52scpuM+PCL+oeG7Nxro9O3fhstoJYyGtP337Jv0czK4m9Bcvez9ckQZvYIbodZS9t+2BIAbkD+Xtx8UcYm+Wk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTbevgIP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTbevgIP"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54991d85f99so6563729e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704127; x=1745308927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEP9rni+HPtFUecXYpSc7d877m22l1NQuJbMRjFTHY4=;
        b=vTbevgIPabWLz73XUKVTWLKHOrsoB91L3DnVgu3KTQ1yy0Tv2WlzckhhaqyQLpcmre
         rD1tTY4Jvbxf4SYoBSz5M3I4VJ1Fcu48bKq6cEXZwG4f1o8QL0K6e6VUlIqt+nNmFoT7
         yNqj5LF/wQ/cFFASnMnbPuAmCE21fORC+oA1arrC3/WZ74/3Vz1SQYzO6yF6AFwlAdJH
         8UcSPzWJ1FKHfAezp//ST1Tcex5EgA315fhtXLoP4W2HaaeQXgldxYtTDVp8hsc6dBss
         qcD0ZycpKLfBneFdWDeTLUXW4/+z7KlqIT06TUtRlhzJljxj1NaNPF5D2NK5wvRZEmJW
         Lb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704127; x=1745308927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEP9rni+HPtFUecXYpSc7d877m22l1NQuJbMRjFTHY4=;
        b=L5RBOD2MFVnLbXo4rPHD1uRosXDEmJpc0ETmjT+al0lauZOxbwAdChUDfuj/PvqPHZ
         0KzHj6QUqB/iaiTOAkdA+z455k7xWVDuGaMyDJq6EXtmVij0HDR04g6AKV611c8Om6L7
         7Pd33zIt7Sq8NwW1Vonre2TLsNOi3WVj+ktVb0THFO1q/fBbuq/kPiimhHztDVECvN3B
         Uf9WxaUja9ilAt1RKw3t3Su/OJK+xSWTgtuPY5xcBmzqUtSeckk/p4sJJO8KEUotKxtq
         tvG9PEsaF34D4uqzMFFwacvRUqN5ePvKTdbSw69ek0So47TRHJ9mWZJXeMO4VOptBGwH
         FDBw==
X-Forwarded-Encrypted: i=1; AJvYcCXZaDI5IEp2VOqfbt15Ww1Ij4joo9nfZJP0ALtkFY+82VxmojihpWHxpaJxKhg60DrPvQuV/AqG9lmy9Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIn3+XCEyfDD6uEoj+oTakSA49tFlm9Zt340l/CP0W/7/My/23
	QeNNNXhXmpW0HKxHSvTPJL7yidGw5zR3OMBXrBYwLXpUQSYaA5ZeuSxvvjHQ+SkngHhSSupLnA8
	gmGB6lilEBjtcMZDeNY+C3HStddgvr9qCHUTzeQ==
X-Gm-Gg: ASbGncsFUtCfbCFZIeu4Pm8D9vz+Kq8Rb2qLaLziw8N0am1QV+OV57po2vF2CH8XexJ
	br8n4MqNTEx8ulX8Y4s9cFc9J0Ich24YAtFj7Zrg8FWdWtfIy0R4X+hVfApZ/kLbJaM9WckRj8p
	rAAMlMso85BwBN+BQejuG0ww==
X-Google-Smtp-Source: AGHT+IGvwutFyLX9Bb5seSiQwkJQ59W66bNTBlQIEGpJEd0Q/se9VhKkzK0oCbRzEiZy9LcBhbBGbivtcnsPVljK2/0=
X-Received: by 2002:a2e:7214:0:b0:30b:e73e:e472 with SMTP id
 38308e7fff4ca-31071ce6ee2mr6688871fa.14.1744704127547; Tue, 15 Apr 2025
 01:02:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-2-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-2-cdd7615e1f93@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:01:55 +0200
X-Gm-Features: ATxdqUEOaEBEBYE-tkHN1WoFieXREPv4a0_F4MeFEiy73pmQAz2OT6XbexJWBW0
Message-ID: <CACRpkdZg-MNFc4k2g+j0QfBjzD4a3scmjOKtRBSr4_FtFYuCTA@mail.gmail.com>
Subject: Re: [PATCH 02/10] panel/arm-versatile: Use the refcounted allocation
 in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 7:05=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.com=
> wrote:

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
