Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7CF2505CE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448724; cv=none; b=ktdWu8FVpDrqOfSdz3zhqUgce4mpQ9TOgMGxIgV2NLkHBp7qcApeRn1tfCaAuloGxyYYIjkb4U/cwjKsWQ7KjQdlOfC9anppxD8RPQh184IjSP/WG4GwKtxOPiuhd7sFEf7b+zW+wWt4X1ALViVVrfCoFAq7VLr3rZ0ncf/vbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448724; c=relaxed/simple;
	bh=AIiSEoyvM8NIqWKRwMdwZ3F+m/6RO3t+6zxhcZhQe5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r7DCnkNggXSF+INEYDQfGmvi21EA+r1WUJD2e0GIUgSOo6qnAAL11+3er+hsaOtmXPecE9VJvd06I4iZjyfgHIf8da2IYtcZW6fyNBrqzoL67XLrIncVpQaNZet7YkbzmL6JyqUJQRTbjw+Zs9aZDDWd8K5YyMMoRpL4HEky+pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CLq8LBAZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CLq8LBAZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so18247535e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448719; x=1747053519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ00OPYdqSJ+4uv8ctKPBsBBA32+QMJJaxQcYWfzOmY=;
        b=CLq8LBAZtxZBIRGtWgGKfTvRUAezUszxUeoSxbQtzlymPTAUUziddhvPM35PwNErrI
         sIGWg58FL8BAdJeq6J3bFC8jEA3FGUn7SH2Fl7uJKXgeTnOuFl/0E7rhrSAndHOdcTDI
         PQSrQdA/F4EGArCLSng8NsBCWuvchG5Bpfcc3X+89kRv85kXyKonDBWwMNcs2GEgR0q5
         7JO7bmrQ6xB9zjjLPYjT/EhZH6ZKh1wa6QWcRrRc9LSkpRovCZBzA63peISP/dRQtqel
         FTqRKlgb/k6hM242BThaq6nS1/TR/g5oAGAHB7IUo7eiOneZmbSF390DVR2ZUeS7HTGD
         gdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448719; x=1747053519;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJ00OPYdqSJ+4uv8ctKPBsBBA32+QMJJaxQcYWfzOmY=;
        b=nmPcMeEYNnflwMmtRN8OIeZaDzBbbi+z+jV7Nsma+9UdMlISQY6aL2c/o6nJKsLkS8
         PzbzxDMw2ZYmNJD+lVLDYvMp4vYNj1CPezTjazgBJVPNx/5tY7PF1y0WRcw6UbngQYWn
         7gJKxD4Ln6ym9ypZ8KlV609TBGoPyGW0uMjWhqMDUmCtBNcOHP1SMwq+88aSN1JhLdOP
         /yPzsnSwRmyA+UHBQrC0k7BPN1tzMfgNEtm8Tt2cx0786jHI3E6bYa/8p+30Vf7rlyyv
         WodjRMENiKl6MjHayyz/HonrfC0ze6E50V7bP05P1gUKAINTCbKUG0DQZt0JeyFo1DsU
         gsvg==
X-Forwarded-Encrypted: i=1; AJvYcCVY2IX/6j/95cd0GmbTt2waovmrooH50ywnN+D369bKRzPYkXrpvIS/E4norqPmPtVoIXLj9dbkwlkHtCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTELVnyxtY/CSlvXGIdIXgL3OXNUg9x1LJgHZT48r4OTjn2pq
	GJJkoiC40Mo+7s/L6ioybn28DyZ/h0RK6IAh4M4MPVLDe6kRC0P7VWoXde/P+Vg=
X-Gm-Gg: ASbGncuUY3u22yGv/eUrgu/tN/Pq4AoUUUWSga5KfXfYRtoKbr9Lj6+QTCTWRHA+Lnc
	6vKsjKLNb33TxSTlsUm3qM9Fhw/gltE3muQJ0fmAwtL1W0c757/uhaTz7VCMuaitNWGOtH1R1Zr
	E9vVOgOkNZaVt6BXzWJpJ/3walBHeBqESbByGrgAdHCwQ25iIWzRCWOyBDg/OzcvXD3AJBJmGFB
	/fpaTbQ7VWiREuJJ6VYXUZH2Yp+1P/iamlE5g66ry+Tr9BmaQvJUkOs6/5q1lUO6RAMTiR77oTF
	5vxCgQH60kGgVm92I4InFE3M9qeSljJpqU1urDFq7oXWv/Bm1tpu4K/15/SqhA==
X-Google-Smtp-Source: AGHT+IFy0/5CsAjAmtPJtG69bk3HYaRizPcxz8kBiV82Sd4ZPLYii45oNaazucMgx7OuBmnSByg2GA==
X-Received: by 2002:a5d:5c84:0:b0:39c:3107:c503 with SMTP id ffacd0b85a97d-3a09ceba798mr6003167f8f.31.1746448718752;
        Mon, 05 May 2025 05:38:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bf6sm10416625f8f.18.2025.05.05.05.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:38:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
Subject: Re: (subset) [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
Message-Id: <174644871803.1393229.3140979499225174795.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Fri, 11 Apr 2025 19:38:14 +0800, Kelvin Zhang wrote:
> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
> 
> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
> 
> Changes in v6:
> - Rebased onto the latest v6.16/arm64-dt.
> - Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[2/3] arm64: dts: amlogic: Add A4 Reset Controller
      https://git.kernel.org/amlogic/c/946b51882b84f0cbec2acd203467866a7378abac
[3/3] arm64: dts: amlogic: Add A5 Reset Controller
      https://git.kernel.org/amlogic/c/f0911f29478992f37e91c208fe44c2ea5b378b61

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

