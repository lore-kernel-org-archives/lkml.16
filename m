Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CF01581E5;
	Sun,  9 Feb 2025 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739099772; cv=none; b=b0JUK5CE3FgM9hWyirwsQNQ8ngAIhkVjEkP2CinwrN2oYnYjp0oRyBP5GTBhVk4Wb4ECuhyfqmzDYE5l5OIrIrGKzBip9Y9L7htMnpuCLNAKPBnM7EAW1HI0u9uHv1Xcgv63rywxysQYH8kKjRDBp1X3qm1JJjXSrsn/xpobhLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739099772; c=relaxed/simple;
	bh=wJxbsC2z3YtJooP/30BhwNTuYyRohccVqSb1xfQsn0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnHuss2P40jww+Sn8Hk08J00s/ONGYtMPLaGsaNmBfTJp9NQtT3F+c7DtqQQEaKu5URl9aDdFHmL5JXO15hiAMomrT7KES3STvQ1vuXUYxPM/u+KXchPBqrZqzlt9LIAet6QmcC8SFkNcYnDRU2VmVT1ipZh86nIeqQ14LRlB9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so636975966b.3;
        Sun, 09 Feb 2025 03:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099769; x=1739704569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG9OSYVRZ3++ywrXL3F1Sigy1gOA1N63fgWGxmeELDY=;
        b=XyK8qUrXE/nrq0rr8dzPrzzq8nRbrPH0XYoadkg+Q/0us9zHmcx/IBxEvTUdB913YK
         4Xj5K2SZBqsEYHDrWtSWt3d4cwcb5yjoV0vdfJ3QA2csOBcpPKjn42slAxY2ZQZcxS3M
         MibQJ6gznFMc+anIjBmFa54t5cEo81rEJ2SqpSXLYclGJzZvw6Bwzyzge76MQVuXF2Sf
         T3GrG0VG0mvucrVjyg4fnoODoLs5Xg+AUeDIYQIEnSIMIG8hpevlaVxLOXaWed4i+Gh3
         dzpq630pGFjPlsXvNusYsEjGVxgXgVfsfHM7NHOMufmaySODbw5271JLl1O/pnjtu2LA
         Wt+w==
X-Forwarded-Encrypted: i=1; AJvYcCUJZtRI/CDTGT9qaDmCWLL0a1izvQPmFioLHWsqZEbS4kFH2aQVjMRt/BItPj28s398qe8dUwk5CJ5v@vger.kernel.org, AJvYcCXOHikWCEuGKR+zxM9Dc9TxCRMVIftqTw+xn+tnGzYAY6PrZHpg9JkBO5m0gEKG7UXrjGS+qHh+FNT8kFhS@vger.kernel.org
X-Gm-Message-State: AOJu0YxzxlAvNQtQ1HN8W+Fuc6yluHTYms3k6Io8brmxXLrZQhRfkO7R
	dE5KHXT+CiNb2RQ0286zqoqBdY4yDOqJggxe9uOouKd94pcQPOeHlHBLqEjRbik=
X-Gm-Gg: ASbGncsKd6wrOMqtDmRPtr65AWxfYvz2oSO7crV7AFC3s9caXFJd15PuayP+L8zgdPz
	izX32xDMUdlEq1AN8x/ceqBBgx0ID5VnsNrNftHyy1DZZwWD7ponaA6sCJ2VhIrZMl3bZokAOH/
	bzjCCC0lHWfw8cWJ18xy2qVwhjKG9qRCRRz8g/cSBvR6HQupWoJTwDD3RUaKy7izv8nvZJ+R9Mb
	e3cAlqgpCwkEcMgJypOvEvJxyUAimEyzEA9Jvx8wObaDaYAQLnWC8S0OJ28vYFEjLwV4nLUupoj
	XmJDvOVzF+4vy2YdfNNJrl8z7qS1ciPvZAtgnWKIpLICVA==
X-Google-Smtp-Source: AGHT+IHqUYy/g5XJzEwsbzWKk5OOtu++gbRSn7UUlkXZkZTe6Vrf/jEjBvTmrBghEAyWd6KRIJJtZQ==
X-Received: by 2002:a17:907:c0c:b0:ab7:5c14:d13 with SMTP id a640c23a62f3a-ab789ca28c4mr965684066b.53.1739099768474;
        Sun, 09 Feb 2025 03:16:08 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c0fd64eesm4177666b.56.2025.02.09.03.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:16:07 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de4f4b0e31so3305236a12.0;
        Sun, 09 Feb 2025 03:16:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdcSSrBw2vk1GdWTq7a6+o+UUSpBf42hoWcbCY6Yhb8E3bHadAs4vPkaPDpNmVTKxQaWve+K9ZGVPm2Bfc@vger.kernel.org, AJvYcCXebSbkoc8Rw0FurRjioPbPso4dpLgeIvk2mULoEdSAFl3/7+PzIdqN6ECZw1VjVKy92QDLvrqFwvFe@vger.kernel.org
X-Received: by 2002:a05:6402:2106:b0:5dc:58ad:b8d5 with SMTP id
 4fb4d7f45d1cf-5de450028ccmr9278045a12.9.1739099767175; Sun, 09 Feb 2025
 03:16:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121831.36053-1-towinchenmi@gmail.com>
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:15:30 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-iyYeJ3KrfmY5Rw7p9P4gJjFitfSQm6zU1YR+BaJ1z4Q@mail.gmail.com>
X-Gm-Features: AWEUYZkSDgSvnihPMz58EG7aGE05QsB0MtC-oDAO7_jhkBlKmWapE15sU421zUA
Message-ID: <CAEg-Je-iyYeJ3KrfmY5Rw7p9P4gJjFitfSQm6zU1YR+BaJ1z4Q@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:20=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11, T2 SoCs, along with the associated dt-bindings.
>
> Dependencies:
> - Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.co=
m/T
>
> - Device Tree for Apple T2 (T8012) devices.
> https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.co=
m/T
>
> Changes since v6:
> - Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
> under the radar this whole time...
>
> Link to v6: https://lore.kernel.org/asahi/20241222173750.148071-2-towinch=
enmi@gmail.com/T
>
> Changes since v5:
> - Rebase the series such that splitting s8000/s8003 device trees is the
> first patch to be applied. Now this series depends on Apple A9 device
> tree being split, and the T2 SoC PMGR nodes are added in this series.
>
> Link to v5: https://lore.kernel.org/asahi/20241203050640.109378-1-towinch=
enmi@gmail.com/T
>
> Changes since v4:
> - Use imperative mood in commit messages.
>
> Link to v4: https://lore.kernel.org/asahi/20241201161942.36027-1-towinche=
nmi@gmail.com/T
>
> Changes since v3:
> - Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
> This is required for cpufreq to function correctly which will be added
> in a later series.
>
> Link to v3: https://lore.kernel.org/asahi/20241122095136.35046-1-towinche=
nmi@gmail.com/T
>
> Changes since v2:
> - Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
> t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
> is required to be on)
> - Add asahi-soc/dt back into the subject prefix, missing from v2.
>
> Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinche=
nmi@gmail.com/T
>
> Changes since v1:
> - Removed "framebuffer0" dt aliases. It is not standard and not needed.
>
> Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinche=
nmi@gmail.com/T
>
> Nick Chan
> ---
>
> Nick Chan (11):
>   dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
>   dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2
>     compatibles
>   arm64: dts: apple: s5l8960x: Add PMGR node
>   arm64: dts: apple: t7000: Add PMGR node
>   arm64: dts: apple: t7001: Add PMGR node
>   arm64: dts: apple: s800-0-3: Add PMGR nodes
>   arm64: dts: apple: s8001: Add PMGR nodes
>   arm64: dts: apple: t8010: Add PMGR nodes
>   arm64: dts: apple: t8011: Add PMGR nodes
>   arm64: dts: apple: t8012: Add PMGR nodes
>   arm64: dts: apple: t8015: Add PMGR nodes
>
>  .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
>  .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
>  arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi  | 757 ++++++++++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  22 +
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
>  .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
>  arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
>  arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
>  arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
>  42 files changed, 7097 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
>
>
> base-commit: 146773acdbf5afd40b0faf7383061a95adee8a2f
> --
> 2.48.1
>
>

Series looks good to me, so...

Reviewed-by: Neal Gompa <neal@gompa.dev>

I've also looped in the new Apple ARM maintainer Janne so they see the
patch set.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
