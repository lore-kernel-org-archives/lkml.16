Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2CA29DB84
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560322; cv=none; b=aobjQad52VTgRMAqPZZ455hHADS9o44TF8zQz0SHrY8fYaZVhhxvQdNrp1MnOTGbW/SNFMA+zSJGsvRnWBldWI5jBr/J9XPKjJed8wLwfBKIojgByahch8V49YXNpVEHGBE2+PU6jSJLaRSMWVPH53j7VlP1Ssw27TvyTTz6wzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560322; c=relaxed/simple;
	bh=fvOlakXshbmzakRbTJCpEkrKBi0FeURoiGYCIMLBZgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWKk9ohfoNu/rDU1h3WlKn7uKVM/HrnFEjK2pUBDMHi36oVIBymyFZlTCrNMAmnwobmFlXPPYRpMnWJ8cwaQNag1zZQ7gUZC92soIL+ogG1sqgyKr2mF1U4pFF4qCo/v4kCAmGdZH77CcwlCwDUCALxVJPtDnqubHOaniHW2DQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jyafR0by; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jyafR0by"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-310447fe59aso52380501fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749560318; x=1750165118; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PuNZG9GzYspsHj115f3YdhRzMM0n4xwJDNOA1CoppcQ=;
        b=jyafR0by1Y9K7W4jDncALqMEbQOcaoK26EP6AM53I5ZkWaQnPCd25LhBfdlKzzbkLA
         SCo73lXvl8CVLEuHU5QEA7ozirSTnxrT35mdWopiowhSL1nsUiSwMf8OlFX1Yj1sPHPk
         stzEawwtiyAV4S66Ts9YjNXwYu7yyjxe8q4U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560318; x=1750165118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuNZG9GzYspsHj115f3YdhRzMM0n4xwJDNOA1CoppcQ=;
        b=dYw3UPnuF6lZEYkv5gn1fpPXYc1Ff5hZ+nOHJKqpt+DyfkzTJa++wFdnGWCIPHVOiC
         7Kjw96e0GmfAY1EF/fzWMMzuKNa+6INXk4i3Mz4awBjUCyQERcV/Pmm4JyS1Rarb+QBh
         RLvi+kU7cPTsvcRticFH/zjGeMt9g6U/BX27xRemOpAD2TGAl6lfjuptNx3+omuL6caG
         DDyD/AQ+/I6HzcE6Y7xHFeYlgF4oX795r3PuCdUL8J13kaXZYYleBm6O8igXO4M6rRRV
         0QBR/qcuUI/4M3b3dyd0k4+XY+lkv3KS09glQgBsnqWAhZ44/ZNHJd/b8QpJ+/cJwmUM
         Zt+A==
X-Forwarded-Encrypted: i=1; AJvYcCVUo+TDDNq2LXl8chZYvEcLUogtTJO8xhajJYTmDJDe7CbzvK9d3uOqVLXCI7Gnzbyp02KVjltxAyUQF1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0D50Tyl5lbxluEgOIWrIEXqBDVLnJA54C4dn83tnGWGcSA0M
	nmTmgzBy35W3qGri1xkjvAl6sAvhOSF4pRjnTVRqDveY4SKjyIeagwxae1mP0apDpt/yks0KqYQ
	cYck=
X-Gm-Gg: ASbGncu8yGe8m1Pi1Go/PxN13LVU4F+a9mrkrZCAEwGdwuLnx24N51H0RVBOV6OLyg9
	awlJbL7Qp6ujuXIcIHDXldlCh132lakgJvrZ0BqikW3jCzLcGA1+JTn/vE9cYRNy7eibezcxRrn
	vtUMnW1CAChs3ArgVI6BwgwWr5aGkQ/EKWbksCQZK9103mVcv8KOMMYK4jBT4CfysmMCTR6GD8C
	CjqeRea2P34Qmmxmtsjn80Nd6y3oeULOJl2QgFELc9yOVb++6utmzY/zRJcN7lgnPIjBbvtaFd+
	fxq/xlHZwqGoP0+wroiOxeuSmTz12sHFzOehl6kw86A0HPZA4LWhldJ8UziJ8vjQNTWKwia/LoS
	TyL445EFwMVO3ZjJwBUtoeMDc
X-Google-Smtp-Source: AGHT+IEtMx4r93OeG2RWFhkjCHpczSO2t+ZTGsJxP2ukgZGfrEVFRdhRPuWvNPViQoh/MyHJP2rXgg==
X-Received: by 2002:a2e:9c83:0:b0:30b:f0fd:fd19 with SMTP id 38308e7fff4ca-32adfc27738mr30523581fa.16.1749560318128;
        Tue, 10 Jun 2025 05:58:38 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b36c8fsm14881701fa.45.2025.06.10.05.58.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:58:37 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e98f73850so5797935e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:58:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUViPhoFMQqEVdEqwLw3er91QzU0Pv0NDkzIkppVawywRwK0we9iG9FbBoNW0cK5YTLNvlqAaaqWZGZagU=@vger.kernel.org
X-Received: by 2002:a05:6512:3ca4:b0:553:2100:69c5 with SMTP id
 2adb3069b0e04-55366c38f13mr4292643e87.56.1749560317177; Tue, 10 Jun 2025
 05:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179@epcas1p1.samsung.com>
 <20250610124107.37360-1-yjjuny.lee@samsung.com>
In-Reply-To: <20250610124107.37360-1-yjjuny.lee@samsung.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jun 2025 14:58:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCsaQCJCzfjjnMvVRAde0ZrMZC753y7m2MPQJuK=dVqQBQ@mail.gmail.com>
X-Gm-Features: AX0GCFujERdSe9Qt4dtGaH_A96BZ3xcvIQGmZPoA67-Hn8NMMl0VJUbIdlsL3To
Message-ID: <CANiDSCsaQCJCzfjjnMvVRAde0ZrMZC753y7m2MPQJuK=dVqQBQ@mail.gmail.com>
Subject: Re: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in uvc_parse_format()
To: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Youngjun

You still miss the v2 (v3 in this case). and the trailers.

In the future you can use the b4 tool to take care of most of the details.
https://b4.docs.kernel.org/en/latest/contributor/overview.html
It has "dry-run" option that let you review the mails before you send
them to the mailing list

Please do not resubmit a new patch to fix this, only send a new patch
to fix more comments for other people.

Regards!

On Tue, 10 Jun 2025 at 14:41, Youngjun Lee <yjjuny.lee@samsung.com> wrote:
>
> The buffer length check before calling uvc_parse_format() only ensured
> that the buffer has at least 3 bytes (buflen > 2), buf the function
> accesses buffer[3], requiring at least 4 bytes.
>
> This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.
>
> Fix it by checking that the buffer has at least 4 bytes in
> uvc_parse_format().
>
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68..1100469a83a2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>         u8 ftype;
>         int ret;
>
> +       if (buflen < 4)
> +               return -EINVAL;
> +
>         format->type = buffer[2];
>         format->index = buffer[3];
>         format->frames = frames;
> --
> 2.43.0
>


--
Ricardo Ribalda
