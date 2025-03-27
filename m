Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FDF26289
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109791; cv=none; b=uFNrfmfakmDsauiOsJPAq5MoSwDPt+//YvmSohbWnyM+Jz/MmOrwhd0+HB+9EU5vMGVoIx/vaZ91XEy8622SdOTUZPTeqAhWmgDXoivqwSLtrXxm69T2h5z8aCzpKEjhnlSQIevewSH5Wg12VTYdwODEh76dPq05qOZJ67fVVDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109791; c=relaxed/simple;
	bh=tzjGtYCbeNeCXpaTkMz9MrV7CLWWyWtx9pe31zDzt7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BuN1wFJU9RJMIBnRQACUDdtit7w5Q94CjRDOuz4e/0lP91pnBIJ8Tbz/Dcd54IrrGOJ5aq3i9mEMj7UILx8Dl2S1/hQPns2ALKOf/OQwrdx7166XBw9Fs/iJL1Lo/SEtcR4MwQnxHC3LdUoHACFB86wKg18+F/3Fm0Uwh+kK8IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KiEIdEtb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KiEIdEtb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so2914989a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109788; x=1743714588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8R+j26INxHnTb7Mwq8fGCf9msi9SXZiuekCSpd0mnI=;
        b=KiEIdEtb0hOC+fcD2crQvUWhbjjKnQ5yoj9wTgGqTX3yPcDHimj/IZZbmmhqWRbeLR
         gzCfTFIvm2KfcjjZQkIooTUX/q4fZ4OJH+7pmMQrhdUfQwSNdMYgkM7zASBbbe/bXqsj
         J6xhIx+CyyNLUEX002wthlgAxVYGR+3usKEMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109788; x=1743714588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8R+j26INxHnTb7Mwq8fGCf9msi9SXZiuekCSpd0mnI=;
        b=fJaETJs1h9X6oVZ3AxhGwqksUfrPlpAcX3nnGz5SxeUG+kRJE3jmHM7s6uWUGqSicJ
         TPC9kSLOIzYNnNILc+3XYRk40mYN4VrlMfCCxy5ivJfQbAtDFUVowKQW308+W6ULTO3J
         cmWCaA8naHuioTnx9zXlpzT0UogH61i9UTWZ0pu5xv+sA3fZt4tUvm1voubtsPy7jcoQ
         L4h5PhtZfejVaCX6Kv+tbxc+/vQ2TPH+LEKnJm0zgNj1vLKtqUzv+OrgBNZlucPp64iL
         bMNtfJPa8KkIyvhF4K/5WHg2kwY99DfwpZ0ZKuahAdNmLWWBxLuzjCBMISIbUzy2TvNT
         wrqg==
X-Forwarded-Encrypted: i=1; AJvYcCWyplNQlPqZHn5Ab6vDcLc+aCnkMg8pNzcljKQjhSR6NYUYn8ka7p/tw74mrJu3yTXNlJlePyC5ipy2cOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsm6irDdD/+l8KSuyHW70dKqirRJb1tQKTM2Nhi3O9ydDOUgAy
	MjvDqUsqjcQtkey2JOR36be3DR7vznjqGb9CEq7UrAFae4b1zBQeEYoxihqpyDAp2amQw2zJ/O+
	/VYT1
X-Gm-Gg: ASbGncuanykSyccSmugdAxCC8lVg3osRAsP/vnROocP1zeeLDCA/UEENzfWCuYyDz19
	egIv8Aw6Gq/BZJvfpDUyTK+CzEBiJKT9kIHDlERSgCus3SDZZCe6sjeBbk/SPIO1vu2NpaGo6hc
	x4c6LbPrM52+KubrZ1LPc5uRNN2VG2XZv6CqWDClcvH16hp/lL5Y27HH9L4r6Bh7hK2IyBj/Gmf
	WJKarbTKaGENA86xKtaNO1ugN+rek+WfJMfG3h4LNBKdMD1vXJTyUJu+M+xUKCPm8rFv7NHSpzK
	+0FflxtNgmFTp94USx0Q00O6uQyn3NhUhRDYzR9crWniQRszysB9o4/EJ22UUk7cookdDb8Sid1
	GE9YCxiEf
X-Google-Smtp-Source: AGHT+IFcemHvCAs4jQW9ro7Wnst6axx7lXJhwU4LVbMtTWfZ3jNgvUoudpEmhpXVbZz734qGiP3ccg==
X-Received: by 2002:a05:6402:5106:b0:5e7:c782:ba94 with SMTP id 4fb4d7f45d1cf-5ed8e27b770mr5138938a12.13.1743109787884;
        Thu, 27 Mar 2025 14:09:47 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16f10d6sm345734a12.47.2025.03.27.14.09.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 14:09:47 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39143200ddaso931901f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:09:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6bkZRG/VAmsVrKrxBeY3afFuqXvxSj1p9mW0I1d/XWtFbVDP6JdMSSWKFTHrVkT+Uyj3bsaduKySbP5s=@vger.kernel.org
X-Received: by 2002:a05:6000:1fa6:b0:399:6af3:7a77 with SMTP id
 ffacd0b85a97d-39ad1749e17mr4689238f8f.19.1743109786837; Thu, 27 Mar 2025
 14:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312090132.1624445-1-nichen@iscas.ac.cn>
In-Reply-To: <20250312090132.1624445-1-nichen@iscas.ac.cn>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Mar 2025 14:09:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XA0q9KjkM0M9rL6ADi=umRYbACj+Sb7M5yyxSXVT_scg@mail.gmail.com>
X-Gm-Features: AQ5f1Jplbd6tKLgHVVNpR-o-b1u7nON_NY4Ow89vJm0zuAh4ZO6OMWeppRLf-CY
Message-ID: <CAD=FV=XA0q9KjkM0M9rL6ADi=umRYbACj+Sb7M5yyxSXVT_scg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Remove redundant 'flush_workqueue()' calls
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, yuanhsinte@chromium.org, 
	jani.nikula@intel.com, xji@analogixsemi.com, robh@kernel.org, 
	sui.jingfeng@linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 12, 2025 at 2:02=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> This was generated with coccinelle:
>
> @@
> expression E;
> @@
> - flush_workqueue(E);
>   destroy_workqueue(E);
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
>  1 file changed, 1 deletion(-)

I guess nobody else is going to land this, so I went ahead and did it.
;-) Pushed to drm-misc-next:

[1/1] drm/bridge: anx7625: Remove redundant 'flush_workqueue()' calls
      commit: c1031442d384eea6d53a1d1ec6791a2782afcdbc
