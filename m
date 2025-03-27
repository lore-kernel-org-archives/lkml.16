Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491BC155312
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090863; cv=none; b=OSeezLWMt7gA4GdS3UCxJE1G/W3pjWPw++9k2sP6Qzp5yHTcqhX+l+3eNj+jBAL7BmXvYVNDnj3wd45vBi4PAW7NXj+kz+iIqCLM+xWJAQ4PZrwZMeUYi7eDmzSW8pB/O4mI8OxOBN0id81do52fRt839f+Be3YS2CYMDzQVhCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090863; c=relaxed/simple;
	bh=Xn+hqAJcwF4LrOcw3aw2H3+w6fmBJDHufrOGSfYCVhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFvQD+f3KWw2+NbqssLwyB/huIfWJ/h1MMWDzBLwXwZ3oq1EHW9uy4OlTrqakAx/6fUuPfIRl5RTS9RZCRMdBWg3GKimHi6emsmrXbIsQxeQXuRgF3b/zXqgHIuzbGeI24cIhU6E0GQaCUPNpsEFjwwscwgMeX6VCYE2pUnBBU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SPw0/0q7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SPw0/0q7"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307bc125e2eso11087721fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743090858; x=1743695658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZv00/ePRkrRXDyY8uRk/fzDNtpq9RLmjZL7rRlPdfo=;
        b=SPw0/0q7EZ69fGBoGxpE8lzfVCkaePV1/wnhmNA4XMTr4GumSPL9oJGIgUtvh4Pkhn
         KumNI8+I2ziu9ioj9bVHZwCnYxXfD7RhEywfsxIXToJWIAzKBNlGamgUWMOXKkS82Ptf
         TYGTUIgv/mdGDh3oDv1QVzJ+9WCVoIUc0Ra8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090858; x=1743695658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZv00/ePRkrRXDyY8uRk/fzDNtpq9RLmjZL7rRlPdfo=;
        b=jT6/Iw8bacf0VaVzy6QqY3a8FCCwDXnAJW1U7djjNFcELHVfK5ODepIz+2BR/+1NlC
         p/KaHaBgzWpFd1C6kPgQEhb7vWSr5n/OKATw2M31osmF85sJQgbatX5DuzkUXSzo69fr
         7DolvIL0nj1QfkRHJrbwS4iulz2ohC1YOwpkHmftLrtL0Jb1AsCoQlDpLDLfbEt49jR0
         pTt641PggJykhB4qE5R+wDPQoOOaTlV6+WybcEjrDpNnZaDi7lt6/M8wEPVFTmxkUniz
         vdgYO1K3Sae7izrp/TqNqGHPvu9c7CQEZmihW98dQxOeC0Kd3pApah9xcajFFEnK8ACW
         vEbg==
X-Forwarded-Encrypted: i=1; AJvYcCVjhzgmuxVguEl+g1FV0kY23WfAViLEmo18FGoUmRAoQDQZMOOzv81VwICzAu/RHrhVlMO52Qs5Ae8EeEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbD4b19wTIjZuVG0PzNI31MDrAxxIEQ70yxhA9KD7OpaP/coSB
	2XUy0Xt8T+P9vA+wIShDWRxYc/nwEyFzdOVRYld2NnlfYziZVg5ZqM646NTHV42+Hu303Uw7XvF
	GRg==
X-Gm-Gg: ASbGncsNMX5iVkghqmRgv9mN+TM58GgdD2qLQd4h2nkcsUKaiCZdE0loyotp21sV9KS
	15x1eluSoiULHgLEusDYky86fuLIr9E+cu+48cETaTCexTjmZxzBqN5K9+CZjBQKLn+ahAQnNXi
	GfmdqCYtLBnAlZqUvdrtRrW7jmf2nEjjKfm0OTMUeMOTnQqWXDPxFD4g94YD8iKKDt6jdZw1OHm
	Q7pqHEaks3DHSbT4iwRVStoOz+JiRV0a+HN40X+GT5H7px1G8F6GsiFThBWezayUjsv5ykWtWkE
	o7zxoikotE9ZUSOHO5HBiCQK3BAG3LcvempPHc2GGpsngRiM0IV5I36hwoWEQTfDtyN4KiCvILy
	eelHvEFdp
X-Google-Smtp-Source: AGHT+IEgF+jIuURlJbaB0K5f6xzzdfZehap5FkE3aRshT//fMj+Iu0eYVMglJlMbhB/reYBf81wLKw==
X-Received: by 2002:a2e:b892:0:b0:30b:b908:ce1e with SMTP id 38308e7fff4ca-30dc5f25786mr15257731fa.29.1743090857684;
        Thu, 27 Mar 2025 08:54:17 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f3c9esm25261021fa.66.2025.03.27.08.54.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:54:17 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54addb5a139so1357168e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:54:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0ebfrBib0Shke3qJ5cZpZbrhVA1WY5Z99QP+B0V0o5u+/KtZEjOtAHYHIIMKgcBKBLYZhjuyUaytM6lw=@vger.kernel.org
X-Received: by 2002:a05:6512:23a9:b0:549:8f21:bc0e with SMTP id
 2adb3069b0e04-54b012201cemr1799007e87.32.1743090855396; Thu, 27 Mar 2025
 08:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org> <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
In-Reply-To: <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Mar 2025 08:54:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4bA-kGs+qBfTJ2+zayGr1ndDMiT6Gc0d8ZCxxYLCZVQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr0GBzGsFAxBQlSMWFiKpwbfZWxF1im_nyKl3vKfJiviUfLFt-4zl7_mZE
Message-ID: <CAD=FV=V4bA-kGs+qBfTJ2+zayGr1ndDMiT6Gc0d8ZCxxYLCZVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna40yk20:
 document ATNA40YK20
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christopher Obbard <christopher.obbard@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 26, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Mar 25, 2025 at 07:21:26PM +0000, Christopher Obbard wrote:
> > The Samsung ATNA40YK20 panel is a 14" AMOLED eDP panel. It is
> > similar to the ATNA33XC20 except that it is larger and has a
> > different resolution.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yam=
l | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Pushed this patch to drm-misc-next:

[1/4] dt-bindings: display: panel: samsung,atna40yk20: document ATNA40YK20
      commit: 1822532477cb5f007313de4c70079c09aaa270d5
