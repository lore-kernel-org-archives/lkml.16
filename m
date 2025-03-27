Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B506215186
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081643; cv=none; b=CeQjmNGc2VHzZAH23ttF0dsIIiBw+DHLfEbQh0Na8YY7i2XqOeV/KQPNUlKWsearRrnMnRy3rHtiCA00VmEX/zgXPYrWKd48B6ICgwUaPSSAbsepKvlWF70b7yj36SHWZsY0Zrhkw48k/2MawW2u2yHZnPjJDF2IQDR88hp/3hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081643; c=relaxed/simple;
	bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfbTVAtuKsotXsAXETcnT9Lf0aOVdGoK2tOZhu/zRCaLjEsAHfLjtdaDWI9Ft4s8fvQAZNtDhICeQZtyLunfzx1NmcK1X717F3nkoIZyIID1F31PMiec5DoihiR8ZDugnE/4NdESvxdORFqhornK5M7UF2ZxyNbXCldXSvu78hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ETwnPzJe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ETwnPzJe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so9405835e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743081640; x=1743686440; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
        b=ETwnPzJebUhQSnpmL8nYgyp+8ZngjFOqQN61z7BX5cBWAsA4+a8CevIS4++y95u391
         RSnp4i56dPfb7m0euFbFTJUiYMGuVGs3Lp0OgQkQzIF/z5wvdHbm60x9VMJQ4S33oOVA
         WoSkCKkB68Y203K5dN28Ep8Icz6vKj+5HmenxUuVM68W2Zf4C6ztkw1VL4q3ovItUHqk
         4yYGSKrfwQ4OmK/1qpKYd6iS71/GJaGikvITVv//62zg5Gvl5grACwk6rmXYieGgXSbg
         wg42ROMLWszGM9gK6Wyv06s1m6yQBIGvQ/NWB4kHC0VCVTk053k7wrAzZQxVi96NmXj8
         JofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081640; x=1743686440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAC3jQYsjcnCVrZPAH4JIcMHqf1bqzRC+I0sVF5JOrQ=;
        b=E+A552tTyZSHuh5fWsG528J9ajgLNh1fN7BipbwxxUNp3nTluiUyTBTT/eHWHtroat
         P2E4Mum8bCtdi97plpeWpCKSyXMaSiojosASsSlUzy6xAFf1wiHyRC8VIYjSxucbu3Gz
         wkdl5ErgShPz/IMJwhA4AouUOuI1wnC59ZWTUm4jr+ocbpC7MXKNhyTPLODVCJNoieRe
         v1E3415dXSMMR9Rv80rTKldgVDjruauPpYZcgPUtQzEmVx2H77h5n6jU/42tQXuAJ+U3
         O6BxCodS9tD8r9jeJA3x/TYsuUkIzo9WHmjWrEZN1EZ/QCMkXlqZc7HnZmEeaoWHGrlB
         dlIg==
X-Forwarded-Encrypted: i=1; AJvYcCWemHr99kNtWee5xgdljyJlUVBfiW3SbzFNcAvZ3LCXcUihC1WOLf2xw3QuYmqbWRGBg/yO8BRNR7DuNzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRAmQVLZOgd12Eva8KWZFyFuqPSCxngKv/ZCLBgMfQmp61n8W4
	hpan+cKiG+ucQYxAhEneZ7NuovKZpwP80UHJBNsl2kf7D6J+yI/2QyMVuc5sCoWzN/cdGxpf7E8
	pHUtz3sEctIj12Xoi2uxYLdisSMgItZEYoEvqKw==
X-Gm-Gg: ASbGncvH5FFmYX2BUcFortlb1gg2eaUNKz/mtlt8uBqg3WAX9295l+Yzfi3YG4LRHg/
	f1CBltNns6bEHr5Mm4jqVn9OF7mDffR67yANZFC+dU/5FTAOPl8XV4UUg7XrDdaenh57oWBXP6w
	qPIAJ7uk4n+9NzuuNXda39qMGh8GJtjOsFq163Qw+6k78jD96C/29JGGw0Hb1Wt6BRjIvImA==
X-Google-Smtp-Source: AGHT+IG3iVxfp4ue+UFXysXvz6DKi4QxLJqDrwxZD58TmfbCfjnNN1Hj7KqR62wJRNud2cz8gFthkm8XWf3losuWT5Q=
X-Received: by 2002:a05:600c:4e12:b0:43c:e8a5:87a with SMTP id
 5b1f17b1804b1-43d84fba8afmr37682355e9.16.1743081640372; Thu, 27 Mar 2025
 06:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-2-e9bc7c9d30cc@linaro.org> <Z+UDlXFKbmxCECp9@linaro.org>
In-Reply-To: <Z+UDlXFKbmxCECp9@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 13:20:29 +0000
X-Gm-Features: AQ5f1Jrcx5M9VC1f4LvGyufiYg8Yl8JGFp1ql4ekPmK5Li1CNGcCqmgS2hBtMTc
Message-ID: <CACr-zFBRC1ZGTqX_RDERk3k52hJ=kunN6Lw6Qs-5djttfTJ3ZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 LCD panel
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abel,

On Thu, 27 Mar 2025 at 07:51, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-03-25 19:21:27, Christopher Obbard wrote:
> > The eDP panel has an HPD GPIO. Describe it in the devicetree.
> >
> > Unfortunately I cannot test this on the non-OLED model since I
> > only have access to the model with OLED (which also uses the
> > HPD GPIO).
> >
> > I believe this could be split into two patches; one adding the
> > pinctrl node and one adding the hpd gpio to the T14s devicetree.
> > But I will wait for your comments on this ;-).
>
> You should definitely drop these two paragraphs entirely from the commit
> message. Maybe add them to the cover letter.

Of course; I will do so in v3.
But hey, it made you both reply, so in a way my comment did work ;-).

Cheers!

Chris
