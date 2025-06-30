Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4109F2A1CA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324471; cv=none; b=C0lxbmzxB+NctqhRXhGF71HTt0daieZLZKB0LJPFJImX2e6kZn9bj2LF1AnOFQo9VBrA0reSwPYH3Vm4fqRRRfICH55Ww8v7c4zyWhuifuprhi9JV1nfCGNL5mzWPqJ3UN7R5iGeKs1g9TeBSK69Z0W/0sGzh5f751+BNTu12Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324471; c=relaxed/simple;
	bh=P+UhLg5UvlsbFtO0lztSNSWbnFv/C84K1aZ/0ZYwqXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoD3nqEVJi2XrdLsDs7I5qhFRihBcsO9TipCwufc+6lx7bwh6a/vIQirF1kn+5rdgF/y/5jAVFI9Dkq1RWZbgktpCVhIi5VA4KSNe48IMixLCxhFJZJHyA6YruTkYkd7g1RAN1nSkxt6sqw+2ByzsEU+orYj+rGS75b+5ZtgSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgsmulHZ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgsmulHZ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso2623187a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751324469; x=1751929269; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kcwhdLYH9QDCoM+AkPn/ixYQdxBo2mfkENfGHWF2vw=;
        b=bgsmulHZrHIszYdPHF3JasT9yFR3RrJiqr34+LT+svnlGN3cOYFhWGn4XdqtktSOsj
         c/DSBCZ4lJlyatTlTNjgzkfZ57d9tRmLWvbKr1rr/LSJwHzEOSmdL4UQjuMK2C/rvyAv
         Q+W0ArWfyUGjZUMTWF7eMwXjDh8vCrZyMW2waTLWsDwBsrIdEQ8wO/Vg8BNbm3jKts9X
         s8wwD5+MuPwNlFrW+F9RVPIGc342aDGO+qQMJgz7PHOncYMGGXkmlVPAnICkYQjGzMJ3
         Dvn6Ygj572w7RQmRE612p1a9ARHknquMnbZ1bPg7vTrBLBNEv9AmZO39Efnf9rPhxIPN
         TfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324469; x=1751929269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kcwhdLYH9QDCoM+AkPn/ixYQdxBo2mfkENfGHWF2vw=;
        b=ZjXtlPqKQJ7n4dKVVmpNrmUaz2bXMf4Bi6O2szuvx8TkO+C4SV3L7UwbX3vH1kGkfX
         T0z/jun0kXXGQUErJFdKD06A0DRkqnfpgQge99vWXznipfWZRdtwHkt3EELwG5Z7Tk9o
         YRWepPQdde/TCJQ5Qow4vBNlltcx0P4NZDRXY1Vizt+rDzUy4XKbpn+QGDACHiJ8bH/p
         3sKhdF8Kywt1mqqY4TOcbyLU3EWoEpgg5t88JUTI4fDzuqKgfv5XrL5vVtjdDXwM1jaR
         tmRJzrI0xTlY9ErHHdqBLE8KRu+O8Xzk3lRSITOTHpKj7SChW3jR6sVxnhQ857KMehSF
         fjTg==
X-Forwarded-Encrypted: i=1; AJvYcCVNsJYqkjm2lV/bMKXoA+bNzJPSt56LD9MrtmlR8CehDKo0il/p9Id5bwxIzakBqm1EzHoLYqlaB4wHnPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygwSBji1gUmRP6jgOq0Uqc3ht9UKbB3xbm5LK0mLfNfgvMSZbL
	BMUi8STsULwNGGsB/dYLYS+URK7qwIm000rO+qoYESYO7zwM7WaJN2Mkaemviw==
X-Gm-Gg: ASbGncvOKmIPSLbGaa6XLfHqm4/p6j6yvv9clVmjJtNfMrZQSkWrtQXueTOaEUCT3xV
	RQ3hUdhxnrQugCpo6UR3Z/FaKXZbBy+pfoNNxprwGrpxoL2r6yUQoKYCgMzWKA/dUMv3PXWhxUU
	eTkk7bXPuDPTkT/ZlVUfNQzhQ0ScL6e1afnnOv3fdMhvKyFXZ2++hWgUjxYBt/GiqaQ9WTHBroM
	EfhC00LxD82IxcHA3+nXRXk6CJqOErDyQmOInbKvoDghNGIgspDvyMR4RIUHy0zfftbhk7QbLlx
	hoDCVx4V7hhgvrOwF+lPyrRRP2evS9Z+Ivfmr0JuLtSV0hPQPQIrsz6rvGiz5w==
X-Google-Smtp-Source: AGHT+IH/YP+qsLsAUJeoIl5Ftc1VJsIoDYRrAzxIfVfqHDzSeIu+OzhjwmD/bR84c4zzsWnFKLgMSw==
X-Received: by 2002:a17:90b:5348:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-318c910a649mr27346171a91.12.1751324469281;
        Mon, 30 Jun 2025 16:01:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5441770sm14974126a91.48.2025.06.30.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 16:01:08 -0700 (PDT)
Date: Mon, 30 Jun 2025 16:01:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Fabien Parent <fparent@baylibre.com>, Reported-by: 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] MFD: mt6397: do not use generic name for keypad sub-devices
Message-ID: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Do not use "mtk-pmic-keys" when creating sub-device for the keypad to
make sure the keypad driver will only bind to the sub-device if it has
support for the variant/has matching compatible.

Reported-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
Fixes: de58cee8c6b8 ("mfd: mt6397-core: Add MT6357 PMIC support")
Fixes: 4a901e305011 ("mfd: mt6397-core: Add resources for PMIC keys for MT6359")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is not tested so if someone with hardware could try it out that
would be great. I *think* it should work...

 drivers/mfd/mt6397-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5f8ed8988907..3e58d0764c7e 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -136,7 +136,7 @@ static const struct mfd_cell mt6323_devs[] = {
 		.name = "mt6323-led",
 		.of_compatible = "mediatek,mt6323-led"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6323-keys",
 		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
 		.resources = mt6323_keys_resources,
 		.of_compatible = "mediatek,mt6323-keys"
@@ -153,7 +153,7 @@ static const struct mfd_cell mt6328_devs[] = {
 		.name = "mt6328-regulator",
 		.of_compatible = "mediatek,mt6328-regulator"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6328-keys",
 		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
 		.resources = mt6328_keys_resources,
 		.of_compatible = "mediatek,mt6328-keys"
@@ -175,7 +175,7 @@ static const struct mfd_cell mt6357_devs[] = {
 		.name = "mt6357-sound",
 		.of_compatible = "mediatek,mt6357-sound"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6357-keys",
 		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
 		.resources = mt6357_keys_resources,
 		.of_compatible = "mediatek,mt6357-keys"
@@ -196,7 +196,7 @@ static const struct mfd_cell mt6331_mt6332_devs[] = {
 		.name = "mt6332-regulator",
 		.of_compatible = "mediatek,mt6332-regulator"
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6331-keys",
 		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
 		.resources = mt6331_keys_resources,
 		.of_compatible = "mediatek,mt6331-keys"
@@ -240,7 +240,7 @@ static const struct mfd_cell mt6359_devs[] = {
 	},
 	{ .name = "mt6359-sound", },
 	{
-		.name = "mtk-pmic-keys",
+		.name = "mt6359-keys",
 		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
 		.resources = mt6359_keys_resources,
 		.of_compatible = "mediatek,mt6359-keys"
@@ -272,7 +272,7 @@ static const struct mfd_cell mt6397_devs[] = {
 		.name = "mt6397-pinctrl",
 		.of_compatible = "mediatek,mt6397-pinctrl",
 	}, {
-		.name = "mtk-pmic-keys",
+		.name = "mt6397-keys",
 		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
 		.resources = mt6397_keys_resources,
 		.of_compatible = "mediatek,mt6397-keys"
-- 
2.50.0.727.gbf7dc18ff4-goog


-- 
Dmitry
