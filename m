Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734EA244668
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944046; cv=none; b=tk9KetLine6I60JS2kt6txmY6gO2iR7o4DG6ODnsKrCvBGsmi8XTIQht51exrMrteNURwxpV9pmBA1EZI2N14XKtWBWa3xqUDrL2scU2rKpI3jJOz5+xG6ds0sfL2NzPZH5D5l0L9rbczLFElbZhSJFiaW9hiv7ec4GTUAZDPWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944046; c=relaxed/simple;
	bh=kwlSRx2vVCbaqKQ/e/jgsYXC3+oVAV8fCxRQJbVDDq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5nnlOk/VwrTJBC5YyoZRpk/YM5K3pQRnYjpgYMlC2WeIkYjfsTTW+jEzQgzFgwOeDZRRwmtqGiCdREb1cM5YIsgdnxWzVLkJMQMrzxv5sWrbuxfkE8fdPwxFWBBEmKFnoyCeqjoeDodMZfkvd52SixgL4sYbcFEDK8py9+CPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Olv/ESx7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Olv/ESx7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376e311086so8447430b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745944043; x=1746548843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HclVyaYhDkOgSEJP0FWc3iF06F9vTvtmO/KyE9DKqLs=;
        b=Olv/ESx7/cv0oU20CTXX2jmESMcgAlnYmYZQ0gEaUY9B+xdQfINIfyhAgNVEpKayv2
         tbyi2+fSezYTeqjwCe2jr84Tt9YMxDJgfqkpe4YtI1FxOsB1xwa5Zz03Z9VxjG1aiicL
         SGcb1umMzgYndaxhYpA/qn9eDl5+i7yQ0aAyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944043; x=1746548843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HclVyaYhDkOgSEJP0FWc3iF06F9vTvtmO/KyE9DKqLs=;
        b=k431v0eREbga8P/auTJ3Tazcx7UJWRpAUd9iQKoaZ0dvR7+Pi/zLJS74cgOvcn6YkP
         YOK5hDUOjMzefoAY03EarBOFIugo/L0zmeLuTO/Bf/r25ac/Ra1J+Of4qxiuf2a55AVB
         VwpaRf0+dtyaySV+zftx+WLCXpmpgptjK5tlFshbuh4rab6J0y1ZwuA7TFtdNYV4fH+J
         3Gq8XyX3gvn8gfCxBd48pRgnCUDZW5vHg8ZQWLt43v96LEEUWPArQzBoan2MFl3ZxUMC
         7jgw2WTUspPw8er13AugofkUdNCJUNUyxJ0NagcGbLLOk3qmmAexFrfVtwTH/sG5YAdm
         nG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyX6eM3fzCxwGpzyo6qHsLOuKxPxIZ/YcQ+UBmsqQ1xr1xZwk9K0hJATh8/UBTASBJUydGHA8MpUmEQ6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOE+N5S1jnCapsb9+0aD50Vv6aMNr0pGCHUAIjAQXQPFkhaW1k
	feaEonHKxVqdm4Pd/1znkMbBSkasDx29pxylBLsoA8wHgxrRDml9hgA2QUMEZNjE8Dm7u+1QPKU
	=
X-Gm-Gg: ASbGncsYe0qVN5pj7weklGspe92ZFNd0ErvQCcqcMn2JvgnJcE8Nnh22Y1M2DsEU5M2
	ax5TyXmkxlq3ytWNSm9fL37vfjAVcQbtgjVNU98JV8JUCR6sOVwYstCkM7DUkBAlfRoX89eC+0/
	suI73VeF9gacbBn2wRvEDjfaZokI3vLZt3PnzhSwqJCz8xEsANXXa1DI2xoo/S0GDeRKdzF6YPz
	t8kbmsgTcvSBH5AJqVmZD81dIXqIKQ6xhv/fx3Z4XaNCRjOr2tACSBIhfqLsUSmJAjL6t6qRxf7
	bWcQhdAIPnOncLwI5OcNd8EYb0jLipk09ph4opHgilY1ILOle3oTvB+Z4oyBjguotoz94kH5JB5
	44gzx
X-Google-Smtp-Source: AGHT+IEZCc+r1Q5vxXzlXQyfKl7PP2nIp7FgvwWh4n+yyznVPCVkPdKmMc3lO/wq328pC+32QswTsw==
X-Received: by 2002:aa7:888c:0:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-7402722d4b5mr6359721b3a.21.1745944042969;
        Tue, 29 Apr 2025 09:27:22 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a0e5sm10438968b3a.132.2025.04.29.09.27.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:27:22 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301302a328bso8650922a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:27:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2uSlkquqBGyL0OHII42MhAnlKY7TWeLhQBR4yi8tM7ZO5raQYPJNBvNIGS0YYb31U2VjaxDAG5oiRuRE=@vger.kernel.org
X-Received: by 2002:a17:90b:5645:b0:2ff:592d:23bc with SMTP id
 98e67ed59e1d1-30a21546cf9mr5997284a91.4.1745944041359; Tue, 29 Apr 2025
 09:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250429092030.8025-4-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250429092030.8025-4-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 09:27:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3LsgMkVyUo9ZNq7VBZgRzX-7hVSyvVGXSA7Woyu-R1w@mail.gmail.com>
X-Gm-Features: ATxdqUHg8RCvWUpfqr7D8JemmnKpizE5FcMLM7GqkurGFB3kpFT_tlqX5YrRVfI
Message-ID: <CAD=FV=V3LsgMkVyUo9ZNq7VBZgRzX-7hVSyvVGXSA7Woyu-R1w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 29, 2025 at 2:20=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> CSW MNE007QS3-8 EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 77 57 14 00 00 00 00
> 34 22 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 cd 7c 80 a0 70 b0 50 40 30 20
> 26 04 2e bc 10 00 00 1a cd 7c 80 a0 70 b0 50 45
> 30 20 26 04 2e bc 10 00 00 1a 00 00 00 fd 00 1e
> 78 9a 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4d 4e 45 30 30 37 51 53 33 2d 38 0a 20 01 3f
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 80 3d 8a 54 cd a4 99 66 62 0f 02 45 54 7c 5d 7c
> 5d 00 43 12 78 2b 00 0c 27 00 1e 77 00 00 27 00
> 1e 3b 00 00 2e 00 06 00 43 7c 5d 7c 5d 81 00 20
> 74 1a 00 00 03 01 1e 78 00 00 5a ff 5a ff 78 00
> 00 00 00 8d 00 e3 05 04 00 e6 06 01 01 5a 5a ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 76 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

nit: your Signed-off-by should have been _below_ my Reviewed-by. In
general whenever you send a patch you always move your Signed-off-by
to the bottom of all the other tags. No need to resend this time, but
keep in mind for the future.

nit: this is unchanged from v2 when Dmitry added his review on the
cover letter. You probably should have carried forward his tag. No
need to resend this time, but keep in mind for the future. I've
re-added it.

Pushed to drm-misc-next:

[3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
      commit: 0d607a59a0f6593e72630854a8bcb8b01b8dce40
