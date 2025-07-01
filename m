Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A9C1E1E1E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377143; cv=none; b=k3DjcrrxrSPU+BrIfGMH6MkmNT8fMmxVhMK8Hq1HFci6DvIoLOgpEsUELmLLAajj+//mXs+rTVPC2EoWDBCv3mmHYnQNdsE4QUt4WteW15BP1uDA/XuHeKrnOVSWg8KRAHgAQwK+YzZm+wmB4JEla3vWxsHrQhAFxl18P2whHtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377143; c=relaxed/simple;
	bh=ibGwhtiJ8cVFBay6kJDzISuN07x1ov3VtA8N2wC6f6A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YbZ0AENLpIjr6M3z9nzBth2Dg4gEMLsAQmGLmWyawdwsmuzw2/cGJIQCvlg7G4GOvCb9guOBOShbg8YE5b0CVa8mVN+tQ7jQpZL90pWcdi65dDMOhUvLd2uBWKYt7MMGux8i7dcXIgZsZbEzKnY6M3MD7/qtiO0QxQPxqE63Crc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BcUkbxdo; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BcUkbxdo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso37625505e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751377139; x=1751981939; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3x62e+wGkvPyUJlGyyDzPotc9gk/sxa1tvutDh+K+6w=;
        b=BcUkbxdoTZ1tMHIFU++l+RENAbwlGQ3bcof12T3a7tT9uc7RPQVNXkeaNYfq7hKJAw
         HKmrYBzmqV8TAsR2EHKDbDkOZ0cUIJlaL7RxcCmJ623XOAabl7rFmW1uHX5KoR2auw/h
         69L4mgHKmOP/i7BzUSy5+1cIhd2QAIQ3GE9ADm0Q8pEtrefycnLiuNrkFc8ryfabHi1F
         Jqk4cgmlqdaKw1JqSz6p7fohhx5LkOYQX0hX1C9lnpeYvHU4PMNkoo7BFrrFWCn5juQY
         IkI7Mar8eCMcMrbEDpmXX0exVEJTfQGt0Oc+Y2ks6ab7gwfmOYdG/Z8uy5UgzbqUVnD8
         NQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377139; x=1751981939;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3x62e+wGkvPyUJlGyyDzPotc9gk/sxa1tvutDh+K+6w=;
        b=IasHGXteuf1FMvNgTFf1gOQTrMhKdFKVCKOCxKTPyWIT7s8CM1TjBNPiDEjEuJJVrl
         zHM8hwaoXaMwUrN+qsfkEq1j7N8TqQWuqRnuzBJ00UfxlFztUhoUXssUO8GHY9A7Mm9M
         KCe/8K6QBuwV7pbt7wK0lhd+tqCcXuPS9/1Gw0DKEzHeR9CCFaELGajI//Vfx+5k9VRT
         VYXAHdYlVvP0/VT1MmAy9Vn72RuG93i9qUnlhw6ue7jr+r47Cx3Z6J8+pG/EEmVG+qFJ
         lEenUI83qIZkNVmUpiNI5+ITgraS/mh5cg+GoiEeAnur6TY+g583fdYFPNrPIzSdgN0P
         5c5g==
X-Forwarded-Encrypted: i=1; AJvYcCVstTpB6WxP9fPIsqwVfPp4XJR+Ho01zHIjSfuk/KfIuUSmPFGF24g2yDXV7kS8IMzh3n8bYt5mvrk1R1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIe52aRcz2b5hwfsondyDmjIxYNRafWJ26jrWf3ngfzbXQcBp+
	9YR2b0NAlCJmV4tZKsn+VGzBj1Fse+9vCAO9aLknHCJeKls12R3xSVCLCOJqgS7NIiM=
X-Gm-Gg: ASbGncsUfzB6jRo5Iq8TdSJgW653EquQoCjd2Ai9tZ+sTQ8p+q0f2G9yWs4FfhXZ0pt
	ZRxMFAU5W7E5U3GARN2xlV6USiPiY+XMR1TlFrtpts299nDUPiJD3CoufoYNasqnllZuDKZ20Yj
	7BpepezoAaobHCDPT4zaCfGSrFL7x+j+CzQh7z0mmhMHDfs1qAObb6afVTlQS0ThGNmHopVk5HF
	fGK3MKKRHpbLrCAbyGbzIRZQbkSuuOyOfyYXHiqG6QOmmR3FreQEFoSePxlthdM5WOMUNOnfFbA
	VH9qgQzyhE0swTJuBUz0o20W8w7POPnfOTDZukp3lmHXj9M/xhWnmpdoVegbIQ==
X-Google-Smtp-Source: AGHT+IEepcG+cGqZUnzs59GW5Hq5J8kBkSOuGp9K3NiUmdRqn94I5Ku+rylMpUxJMmWSK5/5CmBghg==
X-Received: by 2002:a05:600c:64c5:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-453a79a70ddmr34244375e9.15.1751377138791;
        Tue, 01 Jul 2025 06:38:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fbe8:19b9:f06d:d64c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538234b30dsm196089495e9.12.2025.07.01.06.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jon Mason <jdmason@kudzu.us>,  Dave Jiang <dave.jiang@intel.com>,  Allen
 Hubbe <allenbh@gmail.com>,  ntb@lists.linux.dev,
  linux-kernel@vger.kernel.org,  Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,  Yuya Hamamachi
 <yuya.hamamachi.sx@renesas.com>
Subject: Re: [PATCH v2 2/2] NTB: epf: Add Renesas rcar support
In-Reply-To: <aFsEOl83Abw9kVAA@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Tue, 24 Jun 2025 16:02:02 -0400")
References: <20250624-ntb-rcar-support-v2-0-8c0e5cf69c4d@baylibre.com>
	<20250624-ntb-rcar-support-v2-2-8c0e5cf69c4d@baylibre.com>
	<aFsEOl83Abw9kVAA@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 01 Jul 2025 15:38:57 +0200
Message-ID: <1jcyakdo9a.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 24 Jun 2025 at 16:02, Frank Li <Frank.li@nxp.com> wrote:

> On Tue, Jun 24, 2025 at 06:06:17PM +0200, Jerome Brunet wrote:
>> Add virtual non-transparent bridge support for Renesas rcar platform
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/ntb/hw/epf/ntb_hw_epf.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
>> index e8eb3adc6cecd2d52235a3f0b6b5a59ec58f1d73..97c9ed7e4dc27dabd21d3f083cc70d55bb280df8 100644
>> --- a/drivers/ntb/hw/epf/ntb_hw_epf.c
>> +++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
>> @@ -747,6 +747,16 @@ static const enum pci_barno mx8_map[NTB_BAR_NUM] = {
>>  	[BAR_MW4]	= NO_BAR
>>  };
>>
>> +static const enum pci_barno rcar_barno[NTB_BAR_NUM] = {
>
> Nit: suppose neend't NTB_BAR_NUM.

Not strictly no, but it does not hurt.
It's an obvious reminder that of that table is fixed.

I'll keep it that way if you don't mind.

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>> +	[BAR_CONFIG]	= BAR_0,
>> +	[BAR_PEER_SPAD]	= BAR_0,
>> +	[BAR_DB]	= BAR_4,
>> +	[BAR_MW1]	= BAR_2,
>> +	[BAR_MW2]	= NO_BAR,
>> +	[BAR_MW3]	= NO_BAR,
>> +	[BAR_MW4]	= NO_BAR,
>> +};
>> +
>>  static const struct pci_device_id ntb_epf_pci_tbl[] = {
>>  	{
>>  		PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_J721E),
>> @@ -758,6 +768,11 @@ static const struct pci_device_id ntb_epf_pci_tbl[] = {
>>  		.class = PCI_CLASS_MEMORY_RAM << 8, .class_mask = 0xffff00,
>>  		.driver_data = (kernel_ulong_t)mx8_map,
>>  	},
>> +	{
>> +		PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0030),
>> +		.class = PCI_CLASS_MEMORY_RAM << 8, .class_mask = 0xffff00,
>> +		.driver_data = (kernel_ulong_t)rcar_barno,
>> +	},
>>  	{ },
>>  };
>>
>>
>> --
>> 2.47.2
>>

-- 
Jerome
