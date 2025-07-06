Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45A205E2F;
	Sun,  6 Jul 2025 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807859; cv=none; b=RHU/ZwneqvJrXXyWYaxX3s2OLc1OSQGY2bN1Ol430bCCKf9AoMsabzYlU/hwvVpWe/C1CIKKLz/m9R4I5r6kp9g6p/HylhZcn00Yy0v2q8zNffrcpjDuN/KbApE3MmIHzF1xnvU4UaSf0B8je9Jn4xLjOgXfg4VR9sIyzknwGHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807859; c=relaxed/simple;
	bh=Mv/shLjCKwn0QObl0EoTZZfjn3MUjEkt7hwbMWVsVCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBe/6xHxa57vSIw3vOe/AhWQnSfDynXnthqIOZv3KTSgc7SdMBLpSPsBVcu2bJmNQ9Yw3YaMiT3eKu3mWXSzCT0Tbyi4BaUN6MFrarFfLmza82TVeulftwUBLCGIgqFJQSSf9BjqFWxdK6pcxWIJAJzDaQ+UZgF3Z2OonJ23P8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553dceb342fso2273105e87.0;
        Sun, 06 Jul 2025 06:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807853; x=1752412653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0y9e3VsPZwS3i8gc70lCXlWKvcLrZlEitoiyjDH0k0=;
        b=fkEuLTqckZja5LX7wQJGYnq+R/19hgwMMIjTy5ExS4T42a+1QtWMXjjcBK4kFEX6Hy
         nKAWKwB7tPPYfuo7sG5VAIJOCzzSXbnmSlSdJVsjJD17XSFECgQd9sw8BGusrn+38lb9
         +PE26fJhUy1gFIH08F1O67cb/Jj/f4OHXIjpePZMPhMvj0Vk88An8CvWSKXdUmhkafdu
         dE+xWxkBEKs+jjVzcBQT9ix+kezVwo9tgyRSVXumOOtZvAQF+paOtRAKWC4mkIIb9MBI
         94spjmjTFbCZldqFamW3IDM0/d0SVuJdtctahaB3zMwcwqJhCrNIyi5VCtQav3oHLaY4
         1s9A==
X-Forwarded-Encrypted: i=1; AJvYcCUX7mWVTSeZtwYaXJB32xG0rphPrPI+GJs3i7kF+A8sslx2RFJdupMB5cJ7VaTAoFwrbKxiCrOXfmvOoMyc@vger.kernel.org, AJvYcCWNkzwvsCKPRn4Bj5Z/5NYHAtAbonP5EyVrfzBrrTfVl4Q2KlBo654EhAZnVRhhwQmMGqQDVvCc8o99@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YBbO5X8mx6zQfbyyRP2zVV9q9rkgjil5/Qw/BAfOQWC6bKU0
	BNEj7Jh+GqL6v+VP1/5BklJMdJxaZUab/5serSOulwCTsk6LR/xp4rBPLlgRVG2xzNI=
X-Gm-Gg: ASbGncsFix1uQEoEojW/n0doAVVOaPiP5VodLEKmUZjloYapzkiXFPzDoYAjGgKEmrh
	pDGuayFdoRa/N2gnxRTxSBNoxojB9ZWn3GXZk1wghzeP1bNI8/B5lxMM3OI4SjPiLP0U4P2aRCQ
	vv/u/tt5JMLLPzYtuJAYwNGppfENdr1O/L5m/NTXluj/+60wMsgRsSjal/DXyF0Ot+hfnzhaLXV
	6MrcG+79+1NPt5TiffsWxxgyFgo6ROFpzR/aAQhlr/dHdccUHK9m6CdEp++WScBiNcQiOTEGiXD
	gTzlsbjLgKVcpHv5mUmVQlsPsJjEgVCMFi6xc6ldVmfIR0Jy8tlEgdjjrVTd7hjnAdlMqPQKlhw
	2lbeZr3pKxOCcG8KHHdo=
X-Google-Smtp-Source: AGHT+IG7GWnwLy8cVwbGtYFu+mWQ7KLEnUINmqaOuXi1ChF3zzxD+L4Z74LlaATNvLAoAa8lyF5xnQ==
X-Received: by 2002:a05:6512:2256:b0:553:3532:5b30 with SMTP id 2adb3069b0e04-557e553f329mr1086873e87.27.1751807852655;
        Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d16c7sm954153e87.253.2025.07.06.06.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so11513251fa.1;
        Sun, 06 Jul 2025 06:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/HeNevDKuAw7Qer2nyxpPlfpwkU3Y1/EOyiXnSDuYRtnJzBqSC0XPK69DpZrh3s/9YtaczTAd/0lG@vger.kernel.org, AJvYcCXINOKaB0pUkpierPyTeLRM41mJP8RGad3I6/jbODfLpjmYsLbRsz1SuF3YeEpINJGc1nN2Uu/ShjbPPVDm@vger.kernel.org
X-Received: by 2002:a05:651c:1104:b0:32b:755e:6cc8 with SMTP id
 38308e7fff4ca-32f19af1307mr14177851fa.31.1751807852041; Sun, 06 Jul 2025
 06:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 6 Jul 2025 21:17:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
X-Gm-Features: Ac12FXzvgRNdcFpttWg_IhO6gnULQzwACTFMlrJqzvSYihRttnVAncFXhqPJE4A
Message-ID: <CAGb2v65XF=A5Qrm8FrLQaZXLLs5T-0osBLP3Fz3UabrTi5xUXQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: sunxi: Combine board variants into enums
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, lukas.schmid@netcube.li
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 5:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The common style in all bindings for enumerating similar variants is to
> use 'enum', not 'oneOf', so all boards of same variant or using same SoM
> should be grouped under enum.  It is more readable, more compact and
> makes easier to find actual devices from the same family/type.  Also
> there is completely no point to repeat the compatible in the description
> (incircuit,icnova-a20-adb4006 implies this is "ICnova A20 ADB4006" and
> pine64,pinephone-1.2 implies "Pine64 PinePhone (1.2)").
>
> Combine two easily visible cases: ICnova A20 and Pine64 PinePhone.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

I can take it through the sunxi tree if you prefer. We do have new
boards coming in this cycle, but I don't think there is any overlap
in the board binding file.
