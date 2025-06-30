Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94EA10A3E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298296; cv=none; b=LiG9AjQCeKQXjWaOQdbGjBgF8ecG87VpQ5qp/uZee90VOsmHjjxrYE+KZAtC7RFrA2sUopGfXqKIvQ0faD380RInX0leSC/M1OsFiVMcK6BaBZZrOPxE+Vhp7kiCTeCHySxGHdLvqdjsDW4b25hYxFIEC/n7XhiQrlrWEchJQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298296; c=relaxed/simple;
	bh=OUW1ZM9FKOaaNB/P/M/fRQ01/7K5YEOzkpH8veAv1Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aGIDJzrsOUmhbc8RvcSfMIUPSO1P9V2Rrq4pTWkzMSbJbhR9BMp2VGJXRMTn46j8On5zUSwls1vlxMVeu+wwh0OYKeUF+6qEV1G8QA0qfCLx7SG1Wn3g2k5YDDYnlL7T+UjkVRn33moH8aKRrEaWrcxc5QBADOpTLOkSYYeL/TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YnvQEqnl; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YnvQEqnl"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a51481a598so1281171f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298293; x=1751903093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVCH2kt0v6xCHof8XjdoacFaxm9PvIMlt/I0pFMFj34=;
        b=YnvQEqnlugRuSMY7QgSB0j/OT2tmU4uWW0wRdkIqoax3lbPNlzhkis0hHL1Vc04zBy
         Xx/IBpNVfsIWoq0iN5YhN+sBkvbU7gB9wdcfM2a5a63w5zBVxFouMXkhAarZeGcYLrU/
         CEJDpDbNOQCoNtsjGEKPbUIULXL4lPPLSLN/9VRMYh2WZRZ/lXzOh1lMbPNFSPG9TXzk
         2Wud+kwdCgMbMNWgso/uNQO0Rrm/Q/76MJwFDLbeDFrMMKUHqiB+ryApfnHOeBy5/uOd
         65nHBt1aibMRcIgmeVYQz/GIpav0VLyHd+BSI0cXRzjbcHOwSOXb/VAr6fB61gcwhQ+j
         gT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298293; x=1751903093;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVCH2kt0v6xCHof8XjdoacFaxm9PvIMlt/I0pFMFj34=;
        b=qOacNWWRCTBIfgYBdiLEX9ikUjh3gq6xoMKCsAedTAWpxWo88vC+Jet4FzgLfspNtM
         6S6F3Uo3TcCuq9LRdeWFFhPo/GSWB9pw58q4wDE0ZUSbhbRqZsvZ4WIiiCi9eCguj41o
         8fXILIu2yBGa2BW5MoxvMuGuohm4L5GMXsaqkKO+cjeF3xqEqZXHYNRmRmwMknGjQq1K
         NmwXxonfa/cC5FOZu/A/L3q+UA+KxUZ4JAqsjhmRT5bun/bzV8PzQT50WypaTyP2TRGz
         MaJmX6jrOfsGcq8UJ23958t26twcxe3FUqp8dKgbtG8l0kYRTrgFfaFRHE0hEkE1qnZ1
         DRBw==
X-Forwarded-Encrypted: i=1; AJvYcCXpRB9vuepiNLx377bnSZHuNwmkzRY5ecBUdGoxTPg+Pke/u5EhcPuxSg5K67gvdZV8fIxnYNczyWvh+xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyumw/BNiaHPx0G2Qjw2GBzyoPRFXPxkob4XTblC+gazDL/e29G
	oWNXdwfcdOORtiGQblymhXmhoLLctPsfT6Rh+aNE7qDBkn6UaN0IvSnV+ddvQT3B8JA=
X-Gm-Gg: ASbGnctBuoqInOZNdwm90fOIniFIymlf/yuxvJVzT93xyS9+FbjpO8/Rzp9JE3KZxDS
	6/1hO91kynjKs3fKByEeiJJrG/NNOa53Dt+XTo2SDjXw07+SIa6mVDYMcJqoZoLi5njFniKwUKe
	IaSNI2ApbVU3WSy0/Pgzwi+6yeMFfZgQrU0Sflyx40ATKi6SWbM7I5xijDNeksMpBzJ+7wCcai+
	TZ5/7TIr6ghaAU4COHKt2UrNuBWeU1P4Z2y4tbdF+6tlpe1cotGsvdYwVsggYU94VTgQlGUxOdi
	1CIE7uldFuT/xYREzpjZeV6Du4wMYs6yCyiGtz9Hj0mHWTqzr3q0Z5MOgDZnniYIG3/UVuD4IQz
	RKcmogOo=
X-Google-Smtp-Source: AGHT+IEA+TkFS/ZHvVhFMPYel2yYQlHnVZL0fDsZXO6GvDRs+ebjwQjd6yPvqRN0VHQci/TgccoeYA==
X-Received: by 2002:a05:6000:2103:b0:3a4:f70d:8673 with SMTP id ffacd0b85a97d-3a8fdff4360mr8919019f8f.25.1751298293085;
        Mon, 30 Jun 2025 08:44:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm10834062f8f.12.2025.06.30.08.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:44:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20250220-panel_prev_first-v1-1-b9e787825a1a@linaro.org>
References: <20250220-panel_prev_first-v1-1-b9e787825a1a@linaro.org>
Subject: Re: [PATCH] drm/bridge: panel: move prepare_prev_first handling to
 drm_panel_bridge_add_typed
Message-Id: <175129829220.2307732.2489809206567748662.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:44:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 20 Feb 2025 17:07:26 +0200, Dmitry Baryshkov wrote:
> The commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
> drm_panel") and commit 0974687a19c3 ("drm/bridge: panel: Set
> pre_enable_prev_first from drmm_panel_bridge_add") added handling of
> panel's prepare_prev_first to devm_panel_bridge_add() and
> drmm_panel_bridge_add(). However if the driver calls
> drm_panel_bridge_add_typed() directly, then the flag won't be handled
> and thus the drm_bridge.pre_enable_prev_first will not be set.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: panel: move prepare_prev_first handling to drm_panel_bridge_add_typed
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb028cd884e1b0976ff8c5944ee6650fe3ed0a6c

-- 
Neil

