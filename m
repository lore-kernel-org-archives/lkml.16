Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA31F4C97;
	Thu, 15 May 2025 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323104; cv=none; b=gAg5I/rXXKGc74zt7fBLiqefIlY7U9lYAPq3z1dx6EDmghoRE/UTtv7Fx2KdBDpRiw7GK6Zoi9nSeCXLnTpvsOiwWTj7VJulUuIQOXX580Pn5a0YN477q+JsY3OPNatGI7D9XMuglLgVO+Rh96IuGtKDNxMG87qnoae5p025xOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323104; c=relaxed/simple;
	bh=PnAo1oy36wkZC4iacSN5Dxd3k5hdUeTirgRuwO6gKb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mWeVOhgQV05wqOgKwqY/7MFyAHyVgKVQNfOMXcM6ypIAmOE0lQECjNzJztDuTsSH7IRy1UD2huJdIINYRerR+IOHIGpBcZ2S2KimxDY883v4xUrsXezBcPfZGy9UKSGF+1vWp4x1cH6OYbeN0QdDpyfEHfNbMPV4hRWfz1/1Dfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azOKJCbc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azOKJCbc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so708732f8f.2;
        Thu, 15 May 2025 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747323101; x=1747927901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E887hLoV0mvWBatjUOh0WoVNqn5SVBGvUoo7S03Cz3Y=;
        b=azOKJCbc/KRxY/YFV3tJs/oTMGXcw0690wIWq5UbzjHTK/Whx4vcl/4gnNItIWSUXY
         gSTh+5QtZmjA+Xuq6JhjLzlzA38mgjMiGpDcNZee2Gs0W/DG0oRW04hmactxzb5u/2al
         a/Y3gQMr8ghAp5W4xM+/a4Uv9mR7ogUXCoY3ipXfScNikLP+igvxmUxPuW/+EIsekpg+
         ul3CCzwu2NXAFkhd3sxU0pB7WafC6yoQezRhoWYBjDMZYVgkEJAIsPw2Q6s9MElCKu9E
         3Hp7bteQxqbdzyMWlw2JANmT8JIJWWggbGGQYiQ8HQLjtLG633StOAkMnpxsv/SCWvm8
         /Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323101; x=1747927901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E887hLoV0mvWBatjUOh0WoVNqn5SVBGvUoo7S03Cz3Y=;
        b=jdUHebxlILzoWiOlo76lajXbgTNIHndTiNJbf6bVr+RqhyDkPHb3eOdBcAgqFG6/Y+
         tC2RsVUK7vyghS/Jr/KrH3aiCMsVrOwchVF4wKCz4Ls/sP2esiqdgc0gDZli8cPZkTuW
         UabDqYFC0WhW0gtopZLgjcFCFVBrPfZK5GJh0LSeJo1bB+MN9TUD5t8Go7RHYO5B42kw
         tv/1dGhm0KPtTd34nPc5UHcZHMtCRKR4+BCPGBCR5eurkhh/X3ytaWXXdItZCGWaD1Lh
         BL3V2+YAP/C/Y8kpEx1EdJ1BNkWWxxU9igfwCfX+LZHllShKogg7QUwcTugw0zbmx71a
         0Hjw==
X-Forwarded-Encrypted: i=1; AJvYcCWT71QD301rqdGlrBfIAEqHJHJ/sNm98yzC8EwiGlxewyzxIoIoo7F+ldrzVu5yr+5ObAFNOAwEZchAEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTndgMIU9qY7n75giaX5ql8ID3gWalt/6BOjjv5LXljuNspa/
	BwpO4CgoVSdnjFQGVNuVm61mJCIdI8RKzpKHUDtsWp3y9P1Jx+E2txle
X-Gm-Gg: ASbGncv8d6axo3qWFJhWSwmxbZvh8Sso+woK5jsgQFsFb1ZCGFLjtxVJ2VgUOsvWSJs
	vwS2DZWoLZkofobnE6t8JKZyCTPNF3SgdCZ0r2isVNRjkWLitABD/2U/asEGq6qnFUTunxNOIS0
	NXFCnu6EvBUYSAlUqPcc+BA6x4Z3nSMgyrJ0+r8attpR68XLTb6yA9PI8EXR+NTlHccr9Cc9OOz
	/z/peAMmzou1nkNqziAYRMqmniZ67fhV7XJ3q8ANZpJv2INwEIWjl5KeTKr5x8rRuEwVzr7mUXZ
	TIF/pprmAX79PqqY88gkzvOlvfvCqZnWmwPNBI5xnSwE5newuPtmMtof/fooj1OtdB0X6tW0Wlx
	V11BP8CUoxZdT
X-Google-Smtp-Source: AGHT+IFftXa/Cc5yP/0YXe4frc+ywNZqnlZwyub0ZKCe8wNwnS+yYU3Ly5obmt7ZlBbYWv1INGmY8A==
X-Received: by 2002:a05:6000:438a:b0:3a0:ad15:4422 with SMTP id ffacd0b85a97d-3a35c8356bfmr228497f8f.21.1747323100390;
        Thu, 15 May 2025 08:31:40 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm22617986f8f.4.2025.05.15.08.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:31:39 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RFC 0/3] ASoC: audio-graph-card2: support explicitly disabled links
Date: Thu, 15 May 2025 11:31:25 -0400
Message-Id: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some boards (referred to as "base" boards here) support attaching daughter
boards (referred to as "plugin" boards here) to them to extend their audio
capabilities (i.e. the daughter boards may contain additional codecs that
can be attached to the DAIs exposed by the base boards). This can be seen
in the following diagram:

                  +========+               +========+
                  |        | D0 <-----> C0 |        |
                  |  BASE  |               | PLUGIN |
                  |        | D1 <-----> C1 |        |
                  +========+               +========+

where D0 and D1 are the DAIs of BASE board connected to PLUGIN's C0 and C1
codecs.

Currently, if any of the devices that make up a DAI link have their
DT nodes disabled using the 'status = "disabled"' property, the creation
of the sound card using "audio-graph-card2" driver will fail.

To allow for some extra flexibility with respect to the devicetrees,
this series allows the existence of explicitly disabled links. An
explicitly disabled link is a link whose CODEC/DAI DT node has been
disabled using the 'status = "disabled"' property. The sound card creation
will no longer fail if such a link is encountered.

The main usage of this feature is to support links that can be removed.
For instance, links D0-C0 and D1-C1 cannot be created unless PLUGIN is
connected. As such, we can disable the DT nodes of C0 and C1 in the
BASE's DTS and then enable them using PLUGIN's DT overlay.

Additionally, since links might be disabled, the route creation may fail.
So, if there's at least one link that was explicitly disabled then we need
to allow the route creation to fail (by re-introducing an OF variant of
the previously removed "disabled_of_route_checks"). This also allows
making the DT overlays for the plugins more scalable as we remove the
dependency of the "routing" property on the base board.

In addition to the aforementioned feature, this series also includes a set
of DTSIs that I've used for testing. I've included them in case anyone
would like to try out this new feature. If they don't bring any value then
we can just drop them.

An example of how this feature can be used is shown below. We assume that
C0 has widget C00. We also assume that BASE has an additional connection:
D2-C2, where C2 is a codec present on the BASE board. C2 has widgets C20
and C21.

[snippet from base.dts]
	card {
		compatible = "audio-graph-card2";
		links = <&l0>, <&l1>, <&l2>;
		routing = "Headphones", "C20",
			  "Headphones", "C21",
			  "Line", "C01";
	};

	d0: cpu@0 {
		l0: port { l0_ep: endpoint { remote-endpoint = <&c0_ep>; } };
	};

	d1: cpu@1 {
		l1: port { l1_ep: endpoint { remote-endpoint = <&c1_ep>; } };
	};

	d2: cpu@2 {
		l2: port { l2_ep: endpoint { remote-endpoint = <&c2_ep>; } };
	};

	c0: codec@0 {
		status = "disabled";

		port { c0_ep: endpoint { remote-endpoint = <&l0_ep>; } };
	};

	c1: codec@1 {
		status = "disabled";

		port { c1_ep: endpoint { remote-endpoint = <&l1_ep>; } };
	};

	c2: codec@2 {
		port { c2_ep: endpoint { remote-endpoint = <&l2_ep>; } };
	};

[snippet from plugin.dtso]

&c0 {
	status = "okay";
};

&c1 {
	status = "okay";
};

Since codecs c0 and c1 do not exist unless PLUGIN is connected, they are
disabled in BASE's DTS. If PLUGIN's DTBO is not applied then only link l2
will be created. Otherwise, all links will be created. PLUGIN's DTBO can
be applied to the DTB of any BASE board it's compatible with under the
condition that the DT node labels for said codecs are kept the same.

Laurentiu Mihalcea (3):
  ASoC: re-introduce disable_route_checks flag for OF routes
  ASoC: audio-graph-card2: support explicitly disabled links
  ASoC: generic: add more sample DTSIs for audio-graph-card2

 include/sound/simple_card_utils.h             |   3 +-
 include/sound/soc.h                           |   1 +
 .../generic/audio-graph-card2-sample1.dtsi    | 278 ++++++
 .../generic/audio-graph-card2-sample2.dtsi    | 878 ++++++++++++++++++
 .../generic/audio-graph-card2-sample3.dtsi    | 486 ++++++++++
 sound/soc/generic/audio-graph-card2.c         | 231 +++++
 sound/soc/soc-core.c                          |  12 +-
 7 files changed, 1886 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/generic/audio-graph-card2-sample1.dtsi
 create mode 100644 sound/soc/generic/audio-graph-card2-sample2.dtsi
 create mode 100644 sound/soc/generic/audio-graph-card2-sample3.dtsi

-- 
2.34.1

