Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06761369BB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202026; cv=none; b=c1fiUgw1VeS7WNHiWWf4pd3GUuYvwpP3h/zk++IpKpHLBU8weh9JPm9OO20GAKO2dmzX9lSu00V6YhGuLeOgUh0O8uGwzZWzIaNvm+8BGTFqRu9hMsuUEmVbJb7mXkCk2hSP1/JQhe2aPo4Q+0p02vJhKWE6rAbzNyfLX7K45vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202026; c=relaxed/simple;
	bh=yU8x0uMQkwOyuIKMuCjX2VjkJdt8anEcfyjZSVUfDQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgR57ClnW66LXvXybaCMzUVx/vRwpa1eCjv3CGAcXlxi+x8QQEELu0nkvkkqmpS8IgmdmsI68wTrKumT2W0AW0d8q7+r14WHl7RbNXdOPXQb5QAOJrewnE3vzxiGypm9lHcT4rRjc9KUjvwz0MKRQY2Y/Rz3J0EnRvH8dbTDAb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ThSPmOaC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ThSPmOaC"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-545064389d3so2057397e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739202020; x=1739806820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZz7wBdHRx1Y/NJmXMgTjFcJ/vA2swa3TSGqQIhUusI=;
        b=ThSPmOaCMmNIjUIzLDQwO+58MLTgvao+C2aq3bt7L1+ZR8XEiMc3rAF4e6M+CFV2hw
         wxjsImr1sHdw1L+jV4v7s3FMsPyls/5mCp/a64iP/Rl7ctdcmn+LwJfqPg5BqRTw0/Si
         fIHDWu7C4Nk/hpCpOT0R5cpS2v+gZSaMX8p/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202020; x=1739806820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZz7wBdHRx1Y/NJmXMgTjFcJ/vA2swa3TSGqQIhUusI=;
        b=VuhqWbj3xT6L+/mMOB8h1D+eQDDtkbdGAPJ0WqdXX0jONgvIfFxYH6HdoqEcZ6phBP
         ZXHeAhxgpeWMLeXYBOQg1r3RWMtPYDe2ilfwaZ73KHfq754NOfzQhXDGLFIDSuzzAPgr
         /Eeq4leXAatVw/OXeTu3lNw8Jslu3qMgffxLbWdjmksoOxbm2q+e6jpFEJRscIWcpYrp
         wvCSq1LqN4+s4WIRGUyO/R3EHo4gBQrcdPP9v9JcTKw452kQqui8ebZ+4WCGbvsASWXS
         bc1HxG9DMJP8kiKLGkQI4v0QlzaQ+OIf1UEepb1h6txONqY2vCkB2Lc21RUr96tuAeiS
         8ZTw==
X-Forwarded-Encrypted: i=1; AJvYcCX8yW0DIptV68WkN51GxiCBS0dqBp0X6JdoPomdvbuZQdNJwRyWioqcSYCdbZ5MeyH8ACEinSwkohCMv9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8FbF/AH7U8L53OIT9Ir482ou7n3T0vuUbLEfmxuIxFTVuN6KG
	gx3YvgU0+GPGowzcDVO/rHJovwTilZOcOGX8YdgyFCS+4h0iea6EMqLqYaonlRgncs/IjtJzGWz
	eHQ==
X-Gm-Gg: ASbGncsjYaStOlpFTfvo0znCXbPda1tffBgD3ekEosTzPnQFZ4vTiAYhq3MIrqviuu4
	qd99vMUFr+RP8Fs4Ng/qS7m3V70dXo9uvNwQ8F25Bltp0UVseKr1nCj4FinxZq+92OFgft9SdfK
	XxY3/FO072wbz21pFKJlujQdCPMlx3/MFzi6XMi7jI0nUkxWa1usCMBhXp3aDGtu4eOYpaWwTEu
	Lqx7LlMiduEe8K/U2j8mSzktpOLf60vDmIe6E+Kac15A+LMyB4h2MzQNFcGN6mFSSCpFkYgNQMk
	41XPi+1or6m8ctf/gjH7GcqsuwPu9aJNxt1jBwWc+Em89VD3/uH2MSeDIRk=
X-Google-Smtp-Source: AGHT+IHsv4ZZDFokaPJCXspdMIZX2ZuyTEAOc9IJsC8kO00sOznYseRoU5E+yZ5R0Xyo7DdsDZaCcA==
X-Received: by 2002:a05:6512:220e:b0:545:5f0:9533 with SMTP id 2adb3069b0e04-54505f095f1mr2959505e87.49.1739202019888;
        Mon, 10 Feb 2025 07:40:19 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450e00d032sm236881e87.12.2025.02.10.07.40.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:40:18 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30762598511so44682951fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:40:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYKalPoPFDcyqOR5FbJ9PYFYsvvseXrbkS167IOl5FOt7J178u/RFgV/s1iS34Ad8JPTp7ZqJVof9zXIE=@vger.kernel.org
X-Received: by 2002:a05:651c:198a:b0:308:f580:72a4 with SMTP id
 38308e7fff4ca-308f580765amr6925791fa.1.1739202017277; Mon, 10 Feb 2025
 07:40:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-2-yelangyan@huaqin.corp-partner.google.com> <20250210-rampant-uncovered-buzzard-c96e31@krzk-bin>
In-Reply-To: <20250210-rampant-uncovered-buzzard-c96e31@krzk-bin>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:40:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VPW=0eA-0VqNb+=75Q9dB2TCaJstcAhKEevk7Bhx7J9g@mail.gmail.com>
X-Gm-Features: AWEUYZmeIn_U_nhTSVtFx4mkzD6jTp93vru0sCx3dywqhcvaZxLtwogVx1qWx-8
Message-ID: <CAD=FV=VPW=0eA-0VqNb+=75Q9dB2TCaJstcAhKEevk7Bhx7J9g@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: display: panel: Add a new compatible
 for the panels KD110N11-51IE and 2082109QFH040022-50E
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 10, 2025 at 2:16=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Feb 08, 2025 at 06:53:24PM +0800, Langyan Ye wrote:
> > Add a new compatible for the panels KINGDISPLAY KD110N11-51IE and
> > STARRY 2082109QFH040022-50E. Both panels use the HX83102 IC, so
> > add the compatible to the hx83102 bindings file.
>
> Your subject does not fit at all at any reasonable limit. Keep it
> simple:
> Add KD110N11-51IE and 2082109QFH040022-50E
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Adjusted the subject line and pushed to drm-misc-next:

[1/3] dt-bindings: display: panel: Add KD110N11-51IE and 2082109QFH040022-5=
0E
     commit: a8505237066d054cd6ad63b52e7219ce41731753
