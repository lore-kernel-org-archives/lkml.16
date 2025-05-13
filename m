Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E820B7EE
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173769; cv=none; b=RySOlKvHTWIHAqcp3fOzldTEZAAT2pi+/11hTbn4nL2DlSyJVTJT1/o6lny5Cr09WVBmJK2Zpj157Kv5F3DrHBoC4L70VPImFORqmrBEUQMi12w86hXRaysXaRVcZSDft3RO9Z4bn4gS1nkNKv3t9WbYCRZY3gDvD7/3llhDMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173769; c=relaxed/simple;
	bh=1EAngaPc7uOdyOtINcBruD+FdbRowx/2Y1slal9XMzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WtSVexZ+fbz+oqYPeKr/9MIiPqMh18FMP0Igmo5BOKwgtiYQs49GOxTuUt81Be+vELCLsabB7E4a7tliRzTf8nR0HeOuqxjAndI6byIrdJew0rS+Udt9PmUlTm8yXnLgpueC39I0+dv1g1Z42GI8aPLEpZhdOpXEBAzFbSnQjqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGSuCyV6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGSuCyV6"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d98aa5981so9809763e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173766; x=1747778566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=uGSuCyV6qvuY4kVmd6bgVP0SGhvTTQEEFv/GDUKXxq49KIt6NY//cl4MMWxM8hGqey
         tLHsas5Rd0KLjqy8fB+tcTCOWK94biaj5HCGCBffyvP/DInryyMUapPHuM2rfKivT/j5
         JckKhAfCSFiIUOc+oGICQqyXuQeroMlgAQK5dylFaPj4g7zUkFluCNAUOv5mcepurwlu
         RyhaBw9uhFspiu+et8C+cys55TAWAD2/vVFnw1mA5pTXcaTVkTlkNr5HpQtUgemW8cio
         /vA7+yde8d6NN2Fk4bdxj2P8yOJOFrMeyzhTKUsgBEUcGfmlyiwUIWkO6tTcHjVXC829
         ajrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173766; x=1747778566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF3Y7OxM3P8Aw80IWQnBi8AWbTqWJX1OjgpSqEvS6a8=;
        b=buHMZaTTZvMr5FN5zitKrpt8lrdv+6fZOj1ELB3LAIPTwYtcEdo0ttQsPt/3IqClBr
         7K3wSZ1S59X4xsQyGndG59xOdi0OLltigL4ZYD/qPNI1E0EbCpALUhiB2y40AF8yFyOv
         LJn23yTr0zw4UoIj4hLLK6KQELU/Fk7DMTOO6n6fcMbZV8uqPviw0Su+d7VODCShftxT
         THeNOQ/sJY98jVWZiBzXfmHTmWUGR3Qf9ptzTPilglVwxequTYbFlhoA5pZl0TnaffVA
         mJBPANzrUHXzSk4ZZknRXbjR+8kAG6advNIFvo/8k0YDFnXpvANzssKJbDptyePA6S/r
         yuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0g4IJdJPWW+pMWVYnHK0Y9UjBjyenhcY/q0y2NJA+UGXszIwCABws08gY6UaefEJxIWNNn357O1gr97E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjo5rcOPMxDVCAEQm2fY66ULjdtAs9DIEI7LiRaqs1+wZzSsu8
	0DB9k21SSoSuiUYbvfUei3hBvvIjqRJLFW2iGmT8fxPqv0LmessGiKP0Et4k2XoSpVT6oto60G9
	C66b1An8TX44njaz3byg+rvYzdS19JNEdW6xeug==
X-Gm-Gg: ASbGncsRjzEHgpUhQOfG+1SJZKTzcLuctmyxhQvG82QgO7NeZRWeO4RBfS+eCA8TAcI
	GKnqhcG6MFhMfeSzm7M3HeCuwua/cwwP7NWdK2A5jFykU/RzRvsA1QafUByRMPFpGSmAHgzPXpM
	L3PuJ6XBTE5aR9ne2NFobg+5f++eM9DYwX/JTsE1Wg3wM=
X-Google-Smtp-Source: AGHT+IFV6oM1huMeF+j8D3av0zRQp+sO6a3WETyY9TcoM8z4D0gAPRxDZ6Iruo7oYj1D+k2aLqn2jGcIPx0XlTck+IM=
X-Received: by 2002:a05:651c:30d3:b0:30d:e104:b67b with SMTP id
 38308e7fff4ca-327ed22688dmr3408491fa.38.1747173765836; Tue, 13 May 2025
 15:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:02:34 +0200
X-Gm-Features: AX0GCFvrX_aqXbESUgpoRHsXNXvkw7MLENgWNexCpBHmO_EVXfh1y4WvP_Nh-o4
Message-ID: <CACRpkda6zzroe3XbPpnrRMqbHcCsiczEQM9JW7c-hwhiV3vtNg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.16
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:59=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.16
>
> for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:
>
>   pinctrl: samsung: Add filter selection support for alive bank on gs101 =
(2025-04-08 20:57:51 +0200)

Pulled in!

Thanks Krzysztof!
Linus Walleij
