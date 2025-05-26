Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561AE1A3BC0
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248915; cv=none; b=fVxL1diMzePXkLhke028+ZNA3WxtzWadIqBXbUEAs5QM9zuYCp84l5jLSpCqZjOWqob5RCmSaLchW2jpuH50QyJgS78fjuYoGw9PBZAvdx2zt1nT7Ey477CPF8Y8jL00DQnZXeY3LSjm6HwGU7qOX+m38fkFYIRqldBEN2BRksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248915; c=relaxed/simple;
	bh=wKU+nvqmEJCspFI9vgvMdeFDqo/6RcmdfxsvtYzD6RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buHcSFiyfuIR+354dH/hjj+viMnAeol2Vgci4gQjEHRjdRrhHLTRrHb3fE4Ms04v2GlfehjQ+wBhiUhil+zx47rKgpbA59v/4C//Gh84OyY+OJSJ4fGp9gLya2I1HV7jIfD+czugmHbkYvjvZl/gsHsc0YUE3UdX2Efa28DeZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drIRK6TS; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drIRK6TS"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so2171682a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748248911; x=1748853711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHd2wRcQ7lTQF+yNodZJWejVqs2eiPfPDjLrNwQ5rWI=;
        b=drIRK6TSrR54WHhfrcCXf3RxBzjZjYv8innQBYEv9SeigiioDoztyq6We50OzqtH58
         Sc0/anUwGE8hbiZ/BGi+EW8sVdYkgLziPu9mlu62a5w5q0VjmXdcQWY/fyMCvkOXs+dU
         f8wNBAWeYylw7AfJilwOaf2cgdom+6PMnQpKna6Fwyrs4dsAcS3W0goAQQ2ElNbkiuHo
         Cd5x8TXWOAwfFlYJKd9sGN2VL3Y+0I/Bj3i4/EVLMB9cdYfI+EnKVn6gmpXVSW6jBsQR
         cMcmbjdURHRzl5abDe0mZ2Xrs1vyb5A4RjjfeE3xticWFhVgRuqnUbs2/kcCnfJBEAxU
         giBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248911; x=1748853711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHd2wRcQ7lTQF+yNodZJWejVqs2eiPfPDjLrNwQ5rWI=;
        b=tp3WbcGcZnADZKnYaFGvPC9JSYxbLmNcGWSKSddloBWoEGKON7GbtUK/72YE+mgEHa
         HjdX0QJT0vEFY92353ANKKQqzrJ8KurxRW6XlCJjUIMjiXF6G3tt6kUvH524ukaz0Lb5
         CC6AWTyfS67rkt8iTA+liv6lUcrATFYa/ZrIIo1EsJT2ptDCJGn4s+0P8Og9f8An1rd9
         fbLrdxJqhnYZ3fdAqt9aOieREhjeXkwVqSdEoeE5EW9tmTtolTQ2hWiUONhSK42SDGiG
         FA9jYmWfHsW/HBMxQ9ZN3WCCo0yf2KXelU7+CFVbTJ/48diJieahlvXK0lY6l6fKt/XQ
         AbPg==
X-Forwarded-Encrypted: i=1; AJvYcCVpxuVHie1mWkb3wxM2eaTXDxULgC+bV3IwWChpn3Bz4tH+vIJrGjgXEllBZlxn770UubQ60p4UN4iGiVM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9MGH5GvOWWDkmvchkki7Pcgx90VXezxOCM5rr0xlF5JfUzyb
	AbR+Zp8VcgNLO9ZdSrYYtXQB7HNTzzKFHaRbjkG+Kw+t0BPath24aRAe
X-Gm-Gg: ASbGncslNGo4NeV5PYYyHjmwAkLdUPc0wqEln/iTv/R8FP4DD92ByCxcolQCSk08wlY
	k+s9A5xmY6tKonQlSX00Kn9MpKLFzlzLlPB/0lztA4Lk7VmY5sSygCrMd2+ft77CtHHKKMJZ/yh
	kj8A97vXhW5Wn6ZhXE2kqTaHAECkTUcJIpK6IMidc0iUFP8M5tpZxgBA0uv96S5EfSz/bLRmyGc
	66BsxZOvAAIY2tYESqu1/uNO7jNIXb3HJ7IEmV7CwDp1pYUkbmJCyXdiFE3cmo3+m35bMat0F8/
	YM4PlaR2T8WEOVlbjqmH2ESwb/jFcDVRyYHmKjHJI+4y9AMbv6RtoydNLtZ+M4ap8UGop8mERCD
	xb32Wcaegsv0hkq4KCAQkxGYqkCukxq8PbAw37+q8/rwZJKycpGNs1iyEXxun7A==
X-Google-Smtp-Source: AGHT+IEA0HtNH2/yfq0/4CR8rO3eifkbDjYANMHuMRrKyZxNIUC7hbOEfWleKBj2frFPCciiKM9vAQ==
X-Received: by 2002:a17:907:3d93:b0:ad5:42bd:dfab with SMTP id a640c23a62f3a-ad85b1300e6mr711144366b.30.1748248911385;
        Mon, 26 May 2025 01:41:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498737sm1643583866b.138.2025.05.26.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:41:50 -0700 (PDT)
Date: Mon, 26 May 2025 10:41:49 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: dianders@chromium.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, max.oss.09@gmail.com, 
	devarsht@ti.com, dmitry.baryshkov@oss.qualcomm.com, ernest.vanhoecke@toradex.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
References: <20250508115433.449102-1-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508115433.449102-1-j-choudhary@ti.com>

Hi Jayesh,

First of all, thanks for your patch. I applied it to our 6.6-based
downstream kernel supporting a board I have here, and noticed some
strange behaviour with eDP now.

On Thu, May 08, 2025 at 05:24:33PM +0530, Jayesh Choudhary wrote:
> +	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> +		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +				   HPD_DISABLE);
>  

On my setup it seems that `pdata->bridge.type` is not yet set here,
because it executes before `ti_sn_bridge_probe`. For the DP use case,
this is not a problem because the type field is 0 (i.e., not
DRM_MODE_CONNECTOR_eDP) in that case. But for eDP, it means that we are
unexpectedly not disabling HDP.

With working HDP, everything is fine in the end for both DP and eDP. But
when the HDP line is not connected, eDP no longer works. So I wonder if
this breaks some functionality for weird eDP panels or board
implementations.

I could certainly be missing something; from my understanding it looks
like without a good HPD signal, the `ti_sn_bridge_probe` and quoted code
are stuck in a loop. `ti_sn65dsi86_enable_comms` runs but does not
disable HDP, after which the probe runs but fails and does not set the
type field, so the next `enable_comms` run fails to disable HDP again,
etc.

Kind regards,
Ernest

