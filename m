Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F37243948
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046326; cv=none; b=sUjvFL+8r4tB1d6fMhd1gtdyPWCTJa05shuL/I6xsR3Hm74B7jkLmauVv4LOnQJjEps3LtypxIxSMSRRt558N8GfZlpC6id/OPC78bcahQk1ZNFl4f7pS9jTD15a8NLPZQ3aC/NGEfnODTdChbo/T7lhjrRaV7ryCSqUeAHGEf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046326; c=relaxed/simple;
	bh=qguLn2lVdAay7Qgv9NyHlsgIV433J3xLJk6d/GB3DqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwrytiYoRZk3IjtyV7dSLIYi67SgBpduZNnwec3C/wI/6ZPGyam7m0lJJY967yREKEKiqjZn8OmOmV2+yccaTBir4LfBL04KIbI5CM59e8D3/At9l7dwiW/CLIMljMCz6Dqh/BdqL7xVwqiYdDJCZtTs+mlpBtrs+7e/0c+xGpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=icQqgaC8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="icQqgaC8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450475df18so827134e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739046321; x=1739651121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0snXFD48srt2bPIw0/xHSEpJ3QuHpc2GgTYscYldOH0=;
        b=icQqgaC8Msaq8e2nvkAB8PRz1Ten+Ls//yVenentnVguv5ITNaWlkpC7UMvfRW+Riv
         LE7ZZAl8uFEHU+wXLF7S8VxQpLNjx2xpCRzQGm0oVzqvoCM3sVhc9ssArqvebCCB3r49
         yJeYDbj+gWFt8jgum7/7s96GP2mFpiem3u1Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739046321; x=1739651121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0snXFD48srt2bPIw0/xHSEpJ3QuHpc2GgTYscYldOH0=;
        b=lQDUBoqykS82OHrjn4FGChv7LzYFxpgn1eEAYY8tx72F1/YEudspR2SOEUXuZDHS/I
         8aPRhvFsqXOIwUdWJp7UoJcZsNq5rCLuo0ZAQd0MK7hn+8gvKBKTZpL3zIstCX355gWk
         EwL6t+bDgzshf0nzQKhlAas7gTmuYOBjU21Iy886s+PVUdy2o4fprk93YN39GJsis45B
         HZ4sSDg9jhsC/L7OH2EJeGuBOtnQsySUyugjxwaEyhyHkvIZFiVfrJgTzXE1jy6vClKW
         RwWJmfjXgjKmMnWoyNDeNGEzUpDDtVCZ04jHMpRd6idG9/HFhSD88s5R7KaAP12Mi0BD
         mYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNnvPCrB6K8jqR4yezif/EGnYqqVzHklWZ6Jvhs2dpFpbq7Kww2uVB96TC/8Vxz6+pQMdXbVDkFqyKWgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ1Ze29aLQVzsy/EGEm5KhhrxdJ2fW/73WW2GK9KwGjnih1wV9
	qdGck3O/bQAcb0EZW9+1XjKqJKRQWKI5s2M0WadQ0a/8ktaWPML1kWJR5Y2DPFGkIh3/hVD9+jr
	ofDwF
X-Gm-Gg: ASbGncuEnBJQTPxuIA7ELjRI0BSlb0I6h2+qSJb4gxtAVpjE1YV1UncWRa3I/TjcTGs
	JXavB28tWkD3evCA0C0t7W0EMzTp+BAhg3jslwpPjPA4Ln2vXQUXulbexTvLiVMuq/+3yyq/K5g
	6ChJf2C7tN8Eqbwg6jk/BiaKtLB0ldWFup6rBVCTdNfB17TSqOe/4FXiN5Ptp59CxWYge0hAvlT
	Vvxf9Q4nSb581ag04sAQClds4r3Jy+ktaPjqTrdvM1/AC2H89SwN+1e9lmWsKinXfqglEvYvbWJ
	Yf1vG167qLM4Do3JIcu1TyVFaGiLWEfVAtrfMeIPFwbW5mztineQrs9GRqE=
X-Google-Smtp-Source: AGHT+IFn4PU/f3IX0Pp2k9AAx2BFR3z2vh5h/CB1GO39O21fhU/WTx623J7BZlsgfXTlM2u0ZByUIA==
X-Received: by 2002:a05:6512:208b:b0:544:1080:6934 with SMTP id 2adb3069b0e04-54414b06e67mr2020288e87.46.1739046321039;
        Sat, 08 Feb 2025 12:25:21 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410555912sm804042e87.91.2025.02.08.12.25.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 12:25:18 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3072f8dc069so33430881fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:25:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0opaBZ8l2VI0622w/ZxRwXhDjD+CjmAV2Aa1TzDUM8N6iG9mv+yAHGG+k3LiUaIRMjADtOHe7syFTWg0=@vger.kernel.org
X-Received: by 2002:a05:651c:1616:b0:302:1fce:3938 with SMTP id
 38308e7fff4ca-307e57fd416mr31605761fa.11.1739046317966; Sat, 08 Feb 2025
 12:25:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250208105326.3850358-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:25:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
X-Gm-Features: AWEUYZnkToH8gEJqi66QQhCeYhQX2_qfYzlMhuvpnRPH9ru5wjR-xYGs0fqUV7s
Message-ID: <CAD=FV=U6AfAq1j1B7tP7HMqjwh9yNxJ44mfVfdP+KCFiUO0Xng@mail.gmail.com>
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

On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The kingdisplay-kd110n11-51ie is a 10.95" TFT panel. The MIPI controller
> on this panel is the same as the other panels here, so add this panel
> to this driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 115 ++++++++++++++++++++
>  1 file changed, 115 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
