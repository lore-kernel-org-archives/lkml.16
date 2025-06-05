Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8497257AD3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130471; cv=none; b=NRcIaGG7d4PdXbjbQgjW5aztKab22EyCqvRuJWXX/armS7/D9FSw+dpq8UZfZn/wRPRy7R6M8rSggXT3a376b9DqbBW74Ie4vBh/uD4UpXc2UIO15M58u6gYa7Ic2RaMAmDaXqB6035XeuqMhn+2+S2Tg3+kkTCS812VxFUesF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130471; c=relaxed/simple;
	bh=vOICNqN98USb6CrWzrPe3jO4IKU6MEq8Zi+BY+9xBWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZAlh2msSJ3SWgJ698D9RNEJ8+387yuPSWY3ppGPMy/A4JFgPiBlLBKllJ8jwskopq9+C8Jw0yEVah7mng/7vYP6WjcQGudCwvEDPBa06oIKFzO/Or4s8X5wMYHuk+Bu1hvq8ZT8xMNQ9/kP+bg0OwOBzuQIMvNhFlFF4zPwl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvNoO3WB; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvNoO3WB"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1044347e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130468; x=1749735268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdHw8SajT6NSEOVUedJOLVFr0dcQsp/AO6t3n5ZTzMA=;
        b=GvNoO3WBN74bOe2M7jIYXGBD3D+mzn4Zo82p2SFw1+kJHZuI+IvwJBF7OMQLYoY3pJ
         0sqov6ntD+M1DPT8cTU4EF0GDZTomr+0VtEuMPRmm1A05pyIZW+a8rj1AjTiGt0H+9pJ
         LmI2VUFd4QnaxaeO9cm4AFWG5eE4BDqsxoPWSwK+bpTJvhkUTuM6Md+FNjGHQmEeKP02
         yQe1VWUx2KL4MLa6KeScvYJInlJpoVaOmNrkakjevwoxCXrAVj8ap7lAkkwWmFa5mhtm
         ULYDSJ+Hvj6fU3UqpdFq/JmqoII6pIWaZ8dAG49lMn/sQCcWIPGY0cwiLnG+5DBi2YO0
         ux8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130468; x=1749735268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdHw8SajT6NSEOVUedJOLVFr0dcQsp/AO6t3n5ZTzMA=;
        b=pldAbz0xMK89MV7TknPGs9Dyq5Pc2ZLM/Mj4hPvDP4TVdLtG8uelAspZkrlt/MebJ6
         HOhggehNqJw4BDgSHNwNJen5U3ZjHUy0pV+/JxpimAvouwAEPhuvPcUQqKplVYLrnyrM
         e4va1LQ25ORbNjOyfAFQ1hMWHUfDIoVnxhf7NJwmjJef6w2gtpMUWNZyDlxJDxCttHg5
         1WFCcchnLhc/nm2Q3CjaPwSxLVhk5LnTKXCiGyEnfxnyrbnpO6jjKZGycuhAjCxz4G/J
         DBC+Pq9Oh/p3Fj61O1Xo8nBc3dtlbsayO/Co/Zq0SmIyiB31dHXluMCYhHAGV2iNUO3Z
         LRAw==
X-Forwarded-Encrypted: i=1; AJvYcCXGMZ7r3oT7WNm8+jYHblZLsqmGoJ6xKNk0yOb6pXvTJ+YwAd4A0ePbZQWgEGiomebQ8groTDzkWyKmDUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbYGJ2dJmNoEpeABzDvM8wZOOkYccirjJAgmswNfXISs+X3rfW
	6dxGIPM/dLuzwExUvNKZ7//fzVxS2tRO5bMyxwp7rp9sdTMRAThahOepVCPBu8nctsLLLR6O4UR
	5pe29YrLvpUibsVSMXTrs+mtNCzzCvJQ5mHSFmWYtxEEMtNvWVsol
X-Gm-Gg: ASbGncv3Yxu0t/N8HHt82xGJzBbn78EuO6CCOUilv/29mSJuB4l0bugtePyTqg+6zoW
	T/nJpHQr0O2Y+Bt8d6Gwz3Zib918t/I7+FG+bx3Bk/PbPSGUqumbZHWtFmMVbas9MzSC3qwf6DG
	b0Zo1w7FCfL40Tl0Q7cZQSzKu3sJxqIJhu
X-Google-Smtp-Source: AGHT+IGwrsRhcxejm2B7TIv0Jmtzv081ls93xQzgyznzl4hNVDVZDc8rSTwawh7S/z8e7ya3iwoUv7ta05XF2Y24f5U=
X-Received: by 2002:a05:6512:a91:b0:549:38eb:d694 with SMTP id
 2adb3069b0e04-55357bacff5mr1686265e87.26.1749130467806; Thu, 05 Jun 2025
 06:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601105100.27927-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250601105100.27927-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:34:16 +0200
X-Gm-Features: AX0GCFumg_yzf47SQes9X-E90Svhn2Zu4LV3i_LqM-EmbGGW0q70i3L_4Gmqvkk
Message-ID: <CACRpkdbbUbydRfm3zDV2xhRa59dw=-KYCANRwpeJOHBCMNB=4g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tb10x: Drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 12:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF warning:
>
>   pinctrl-tb10x.c:815:34: warning: unused variable 'tb10x_pinctrl_dt_ids'=
 [-Wunused-const-variable]
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505301317.EI1caRC0-lkp@i=
ntel.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij
