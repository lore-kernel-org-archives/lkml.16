Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064B3274FE9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377331; cv=none; b=hWdYgAhUZa6k2D9HsR19cdTRkHPbaT6yOIt9o1igkQLBbGxG+BfeqV5VIL2/LGYxSSw+e1WXgTH0eA54EE2Bv3F4rK1/YCvEm8J2MLZAPlVqZNKXMryEKgA8+C93Lg+tVPSyupjDVN/Z/+nG3dgUHsErOeCL+GJ3TZb3kcqBfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377331; c=relaxed/simple;
	bh=Mc1KTGp8AQ3igfQCX1fLG/VmxsuDuKRGSwcWZkGX5/c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=D1xKx2exYVh6Fgj0+BRgIsL/YoaiEkXNVxEYD/4+c3q0GW/2Fb4BPtSg7JFctQ6t5DH4O9TmxiJg7UbgI/jngBnvezOea8oH0JQxadH29vWf2Ukf3XLn3mdltKoHBdeFbbrunVO5oNbDle0MYSzkRG+OtdAF6XiF6ddgDhSaXmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OBO6iTkd; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OBO6iTkd"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so4309657a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751377328; x=1751982128; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3NN3YOnZNPrDgXvyD2XIOWd2IQC6I9YUWFKOCRkpLE=;
        b=OBO6iTkdmBRm4eMeS0Es6aAwNn7vMoDgC5DMUE0RyLrnT2Byx6S3YxDDL+AeDYspQP
         Iop2DiV70VY40Svs8Tuik7W/uOlL9MyFR4y0qFtVT0oMUetOxjt3yScq8YyDTgSpxefC
         rzbuZYHmIS+n0cK36GIR/kObpQQT1AXUGKlo8kQ87iKh3YA7CPNiWoXKrZzeW8a8HESc
         5WN88aStwwvrEcJZfkuxlFFDjuSaAzfbpXfhA0vFvsk/eCGzqvodg7d6zmFVDzQXhDpn
         LRZjpk7QJ/YJvXHCBLW9tfj6/7WQTvbsXKMIK11nvd8+zc6k4iBrA6r/JC7KaclhLrmt
         anYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377328; x=1751982128;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3NN3YOnZNPrDgXvyD2XIOWd2IQC6I9YUWFKOCRkpLE=;
        b=jG2aK1lwa0ZRAKCFq3CGu/F0Rd72YbX5QPEXlCXnop71+ESysDIsKiGE060vuOa/Ok
         mi/Sf7WBtqChPRnhQCcICj4AeN965pSIiGqdt1nMXwYCdBQ0qWF8pYFIEExYMBZ3Vfuf
         TjktzEMNFNVx6DHGgi/trEnB6vgnzWsaR9HCtxQUtA8UtYycn7tM/kHJvKGbvhcm6kVj
         LKc1a02SeMFr0udfQSwtOp1KP1wQW/tZYjCSlg2XbwsDvaNQhN3rueSQ6mMU2d6bU9ym
         w4Fyc2UF/D2e95Vzf9jn/MtiwMzNLt4ZCW1SHG5OSzrP5e76KEEFsPxe6Dwv4DPC3w/W
         GytA==
X-Forwarded-Encrypted: i=1; AJvYcCUyM6QcvhqWjMo/H7LXN7rruEfBr3zcCxPk7/ZOYdVGT4E+zuX0/ZszRD87vEL8NOTzvSWSKBo962F0Hkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjdMrDnIkiz+2JRdbYzMlApc2keL2L92CKFqJe1ZmU9oTZqVfv
	YkvoYOg07cKbIc3AR2cxcxxyLC20nWHsiYjYrN32jkWeXXWTE6QBpXIed0vjs6psz6k=
X-Gm-Gg: ASbGncvvU4wA4FHclifSr6ZQzNzYdxkqUvT4mGA6nZvYSlXKR9VXi5mwmMG7Ycr72ua
	Dz5xq+ABOwfKlfag64Oyw+VzWWANu3l+jTvuVhe89s3eTbiYLZQrZCN4/vojs5W7lct1ltQtXkU
	Dr6sjDEUbUlGx9AwGpdAY/Z9Lp+251gTkjJqb8S8jXMezHu3EBfbtf/7r4qDF65BRFmZDiLyygC
	2MROpkB0fm1xyVYlKkRCzrXS1DQV4XUttYnRHPsKR4qIf5LGW6GZcY+lQa8YR5L57yVpKpKYnWi
	7SGo3aVlpHrVXaD2aF36MY4VmoFHV3EMQyuMzY2svsC281f4fqvzL5x/RdD1fT5BvzixLo5tSXN
	DIcbI6WiDA6zRv35k0TmJxUk4RbFbuNMMLn6cu4i0m+C3X1BIlD1iM8LsMh6YM1SEd41uu/Y=
X-Google-Smtp-Source: AGHT+IGgNsYenmtHtqlifsI+EKQi0fEzMyYD6xYkDkrtd/syyHWZIutfcBHdoTD2pZXazBORFz/1ew==
X-Received: by 2002:a05:6402:26cb:b0:602:1b8b:2902 with SMTP id 4fb4d7f45d1cf-60c88dd6503mr16076177a12.15.1751377328145;
        Tue, 01 Jul 2025 06:42:08 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290fb73sm7382663a12.35.2025.07.01.06.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 15:42:06 +0200
Message-Id: <DB0RG4PFFP4A.1BAZWWZU2TWJF@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
 <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
 <w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow>
In-Reply-To: <w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow>

On Tue Jul 1, 2025 at 1:16 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Jun 30, 2025 at 10:01:35AM +0200, Luca Weiss wrote:
>> Hi Konrad,
>>=20
>> On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
>> > On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
>> >> On 6/25/25 11:12 AM, Luca Weiss wrote:
>> >>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>> >>> VIDEOCC on the SM7635 SoC.
>> >>>=20
>> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >>> ---
>> >>> Luca Weiss (10):
>> >>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Con=
troller
>> >>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>> >>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Con=
troller
>> >>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM76=
35
>> >>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Co=
ntroller
>> >>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM=
7635
>> >>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Contro=
ller
>> >>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM=
7635
>> >>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Cont=
roller
>> >>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7=
635
>> >>
>> >> We had a massive yak shaving patchset go in this season, please move
>> >> the magic settings in .probe to qcom_cc_driver_data {}
>> >
>> > Okay cool, I found them
>> > https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582=
982706.b4-ty@kernel.org/
>>=20
>> For camcc, gpucc and videocc it seems quite simple to follow these
>> changes.
>>=20
>> For dispcc I don't know what to do with this line.
>>=20
>> 	/* Enable clock gating for MDP clocks */
>> 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
>
> Use clk_regs_configure() callback to set this bit.

Got it, found an example on the lists.

>
>>=20
>> Do I just keep the regmap references in this probe function and just
>> move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
>> config struct?
>>=20
>> And similar for gcc, I can move the qcom_branch_set_clk_en calls there
>> but the qcom_cc_register_rcg_dfs needs to be kept.
>
> Would you mind extnding struct qcom_cc_desc with args to call
> qcom_cc_register_rcg_dfs() and call it from qcom_cc_really_probe()?

Something like this? Not quite sure when (in what order) this should be
called, is that place fine?

I'd include a patch then in the v2 of this series.

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index b3838d885db2..d53f290c6121 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
 			goto put_rpm;
 	}
=20
+	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
+		ret =3D qcom_cc_register_rcg_dfs(regmap,
+					       desc->dfs_rcgs,
+					       desc->num_dfs_rcgs);
+		if (ret)
+			goto put_rpm;
+	}
+
 	cc->rclks =3D rclks;
 	cc->num_rclks =3D num_clks;
=20
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 0f4b2d40c65c..dbe7ebe5b871 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -43,6 +43,8 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+	const struct clk_rcg_dfs_data *dfs_rcgs;
+	size_t num_dfs_rcgs;
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;


Regards
Luca

>
>>=20
>> Does that sound okay, or what exactly is the desired outcome of the
>> requested changes?
>>=20
>> Regards
>> Luca
>>=20
>> >
>> >>
>> >> Konrad
>>=20

