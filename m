Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E254255F56
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409475; cv=none; b=eyw9+InVcEycyNaQjVva+CyjQ2cM+7W0gQnqQ0orn5DpUJvqtMLhreM9Duq3TDiIHxjW3yYXpen8HwhpMgOAKDNIn0muwl46Vqzc8jQdlaZ/Au2b9yuywU/yHKYOfK5Hcv+mjL6R4V3nH3cGawQHnIAKjRfEHk5zSL5xTBfRgx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409475; c=relaxed/simple;
	bh=41+NV6wm7M4BUwGUu5BfX6Y/1mglDykUJq2/D+L+bV0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dNCJJSRj640oKSrgeD2w9eku3YKVd18lh6LgrSbiERcxG6OoXIlzkQCS3P9jI7krdh5Hz3eraSlfogUU5EPEkHPAxSS4EAfu2nnp4Xg0o2QpJsMh3EX8AJbhPW8DImMgoY8LHtYLYWj62moy4auVYqf9KGzieWJzf5t+1+7IWAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eElRhdTF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eElRhdTF"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so2327720a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750409472; x=1751014272; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQs46cNDxNcEM2859ny72mW8pcAVQ7BIEu+RAnGt+Uk=;
        b=eElRhdTFqyfet3zX6SJ1DemBoJg/QYIVepXir4utb5zKu3ZxnIQpSDe8Wb4f2IeYlv
         c6YoNmHPjPVqMTBfMpoup5C3PIFs+jAuldaiJy5wWPS/o9WohoWF5sUO/2aRQPS4lgky
         JxhAlYByweTDsfqvJ8OGmK+gNOvF48TvrdZVnH58kMiaVh4njA3jXSfF2AunQzjQ5jKq
         COLm+FZQSG4PMPsfsxeCNYl6mbsKwLSBCVrU5ms9jJKSiFYiMm1fBJbYLNhBA8yZeGXJ
         wIiMp7w4tAcggmF3uxO1ArOmUCHu8FHJSIyhKJnYGXi1XZ6cbfh9mWnlJlxunJ/kqXr8
         3KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750409472; x=1751014272;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQs46cNDxNcEM2859ny72mW8pcAVQ7BIEu+RAnGt+Uk=;
        b=GOfv74y7/TxjMy+8SAyeafofFfJI1hDhQfouhU1EU6+tW23Or6Dd3kXnJwPHPAOziM
         jCZE8Uex3RQEHfnh4fitmVSF0TjHYH66OW5G1MvNvvVYUs8GMCQi0Ga1N7GjO2ZKElHy
         24/h/CmtnRcpWq6D0MHc55cxMq46bUQMVKqZuuJOC+rRCmqT6xPtoCnMfeVd5Ws0Dum1
         vMIRqB1KlQc9s0RPjgou7sEFpNxQ0+31HpXg7wZlPz5h1WrfaMgwTOHtFiZ0JdjTiSkQ
         6ZFJtBmHzc3nbSIVDiL88AnI1TTKd98Y5XlnO8WOuvxP1QEiEqEjUbWz9rCEWT3+inZd
         orNg==
X-Forwarded-Encrypted: i=1; AJvYcCVSY9vlXxAWnIdHU38yuKSV5QUtYQ65zIca7b1bRdUqDuuVqdQmdBvuuYph+NAj4qWBYaenNO8rI3LJhxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPspVKo27UaQMm9dyIRN3U9Z2lK5QDscUgSqNL4M7aa35Zb+9Y
	yF4ril1G903ErEK+GfkUFjfFUmYIW2V94l+Wd46Q/U+WBDNCvvwOs1NjXYmp2DaJ/fA=
X-Gm-Gg: ASbGncuL2BDmbW7ETwKidGyXS7ZtcMs34LEkvrRLIluYhEeyJkegWyHg6RRrzD/u9qn
	Pum9joHExGQyMi/I6dgZD+f3g+eM0N6SCMt1KUln5EnOGt8c9r/45mtsH6+nxhWXFVxNFjYEhxN
	o6BeP7AVSyhe+WvLE20QBEeWvUUHvjs1VrwvM+Sta1/UVJO7aAY+KoI/AP2Iu0u05gripa6YLWd
	aubXCfoHmJt7DcGgXfLEOrr+NeZsAvHb3SZCQ38asQkX6bikHu9/rlm5GmW9T3K5HJTri62zrdE
	+MGpJkndniTyM5YmIz7jvwCl83Nb82BA9AB6T0tKnF23xW1IjWjrdZ6pWadUd3kg6+yCtimLH5/
	b9Fnf9bpUj/+ILKAiRZWZDOMOCAKIy0w=
X-Google-Smtp-Source: AGHT+IEmFiflCY72gns8BJi7+wHzY3UkumCt6vc+CYitRi/cG7BsMF02qzVY1w31/s9Tg+2mrG6kaA==
X-Received: by 2002:a17:907:f1c2:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae0635cad5cmr13076866b.51.1750409471648;
        Fri, 20 Jun 2025 01:51:11 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bc9a0sm128495266b.146.2025.06.20.01.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 10:51:10 +0200
Message-Id: <DAR8DDUQ8HM7.3IKL9TCT7SJM3@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Sebastian Reichel"
 <sre@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 04/11] power: supply: pmi8998_charger: rename to
 qcom_smbx
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-4-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-4-ac5dec51b6e1@linaro.org>

On Thu Jun 19, 2025 at 4:55 PM CEST, Casey Connolly wrote:
> Prepare to add smb5 support by making variables and the file name more
> generic. Also take the opportunity to remove the "_charger" suffix since
> smb2 always refers to a charger.
>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/Makefile                      |   2 +-
>  .../supply/{qcom_pmi8998_charger.c =3D> qcom_smbx.c} | 148 ++++++++++---=
--------
>  2 files changed, 75 insertions(+), 75 deletions(-)
>
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefil=
e
> index 4f5f8e3507f80da02812f0d08c2d81ddff0a272f..f943c9150b326d41ff241f826=
10f70298635eb08 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -119,6 +119,6 @@ obj-$(CONFIG_RN5T618_POWER)	+=3D rn5t618_power.o
>  obj-$(CONFIG_BATTERY_ACER_A500)	+=3D acer_a500_battery.o
>  obj-$(CONFIG_BATTERY_SURFACE)	+=3D surface_battery.o
>  obj-$(CONFIG_CHARGER_SURFACE)	+=3D surface_charger.o
>  obj-$(CONFIG_BATTERY_UG3105)	+=3D ug3105_battery.o
> -obj-$(CONFIG_CHARGER_QCOM_SMB2)	+=3D qcom_pmi8998_charger.o
> +obj-$(CONFIG_CHARGER_QCOM_SMB2)	+=3D qcom_smbx.o

While you may want to keep the CONFIG_ name the same, the description
should be updated, at least in the SMB5 commit.

  =E2=94=82 Say Y here to enable the Qualcomm PMIC Charger driver. This
  =E2=94=82 adds support for the SMB2 switch mode battery charger found
  =E2=94=82 in PMI8998 and related PMICs.

Regards
Luca
