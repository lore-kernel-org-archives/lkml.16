Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238D54738
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738307623; cv=none; b=beJBH9Jy/FHqGRDzYDVjxdOq6qTArmLW2FAU6uwbqHfM1zV/X2v1nMx/29HjO2vvQpxdSl6Py4xyTcgNOYe/8YKZsN1R2venJNnvmpoH6Tj1CNrRHBRCtRKqq0hE5A8sPvi/xOrujAVt9dHJSTPGfNd3L6UrXpn4jaMf+EqNNHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738307623; c=relaxed/simple;
	bh=oCsbKzhgT/KhIVG/z8t0kbZLEi4avOWBM1A6imr3Aog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iM/yuLaupuuELfEk9TObgAEUis3KUoGpWpr4j+NSdtAsaZSHbpsx6dZPTZSZmXDAmFfnFSWj1ZJacAKEAL7VeixYmXWlnen80ehi58Exrjvf0M12FvAaxNWR+w+mmyOvuVRAQOzE2KT1Z8NqcMVhiKG823c/O68MSu6FokGTSlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=If0IQ9Zg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="If0IQ9Zg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4363ae65100so18021285e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738307619; x=1738912419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ttm6v3FBTzieJ8SUVLl/gOL9EjbKAxhp9vbmf+0aYqQ=;
        b=If0IQ9Zg8IdEhcotRpt1Ch/UqEvuVYAgZzuxKK9j+bY+p8hYaJ8qqWXQqaOeANiaNt
         7rT0/bVr+Lcp7jBC0BJFOLB9rAC1HG2poOGqm6OZv+33KakBUBvNGAgmUuM6FyASwfUV
         NiWjfGxt/1IVAKVCo5RhArFGKqLFw7Cl11bh9J71+0Z778uhMaJtgt3JsHV1+z2U3C8V
         wHAMMmikqWfk5PryvGvzJrPsKOC4lMmDtfjMvvBiqb8evOgEU5j+qlWA3WWrjy+ysc53
         E2Ja5YKKVbgGBajKIANk7PZZ2zpKe7BrmuXOXH6mnZx/SgudPlQcB+VnHRBywWwhYH6o
         i45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738307619; x=1738912419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttm6v3FBTzieJ8SUVLl/gOL9EjbKAxhp9vbmf+0aYqQ=;
        b=r5Z4SFnaHGZ/QebhvTqi8qfgtiIWYgibjFtXHMnrokROhvMOxc0NQ8CPWNtQ7Vl9zC
         xtxF6c7KeVjVPuMwSoty+23Zh4RV2A8A95H2epcSCg2YLHJCDv8MOzySF+K/i7aMVpHE
         RpkBA1gEcvVBd3CYJtt+9cT26JhWa3R8kFPjpw+95ctfZlLp/mUBzVtfO6vrX8s+xm1l
         xJ2qevFg/GdzPBEntJovROkoBrYEpvP2WHlNSSBOQgbrxey7HbtdUHVmeztlDY8mXe2y
         Zex86DuUCx/hg9gsaQ6BIHN7xf3oJnX3QsWMYz+AqQCOQ2U9zvltQrH+gT2MsZVuZxfT
         SxRA==
X-Forwarded-Encrypted: i=1; AJvYcCWuj7OGo/6RZBb1LomcrHpEijaDdG6QWeXfi7GapVUczGdyKLLBYVLSOMSN8dxiw5drKsUe1A1LnPogFJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVnxugV+s2NZOB78g04tLKmSqiFAdKikGefKXgUJ2uLzRgYeO
	bKlW8MutS0HqCo4DL/t0f/OCyBVj5b8eY1Lb69foth9RwVAoZx0ii5v3k6xh7A==
X-Gm-Gg: ASbGncvOBAma0A5GNM+mnpyCcyYY238eu//GIMiRDuMPv9fwPHic0LydNbJ88HSQRhc
	vRjNudwXZI2DyUqz3f8J/fMml+2FYxMO2TboaxtX1fxLACU9292Ax4YUljjzfkwasgwWnljj+mT
	YuEAdKffkBohe1eVIov2QWhWVjvaxSfF13Dbb5q7daizLFUNaY6hf/sqTwbHbVhRrt/XbzpHrd6
	u/UHicQz2U6Ah1xvrr/5sxvL+GNDaojHk9rKCdPUVidoQP4MT0d52Q/lIcb1ieFiRzda0k4ATZ5
	6odoJBN0sK4PNgi/1Mbs5DIMCZ0YlRPRYorVKY9G7viSG/GIZc7VhrlktRHc4A0Yt5TAWSOLSDN
	rPrKmKVu3jg1KVruM2jpmMYglfJRSWhT+hNR08xEAq3kjwkkTtg==
X-Google-Smtp-Source: AGHT+IEoTJGWaLKWkydMGgIgEhmfdAzAaGkqn+yNFFfgssg8dqdbKs4HRrJ/OFxj8N4UVjVlH1OMEA==
X-Received: by 2002:a05:600c:1e21:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438dc3c31ccmr126782315e9.11.1738307619291;
        Thu, 30 Jan 2025 23:13:39 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f1d0:3123:f9e9:b484:6874? (p200300cab741f1d03123f9e9b4846874.dip0.t-ipconnect.de. [2003:ca:b741:f1d0:3123:f9e9:b484:6874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc263f0sm81274495e9.9.2025.01.30.23.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 23:13:39 -0800 (PST)
Message-ID: <2d5b51e9-db32-4e46-97c8-2644081b7e33@suse.com>
Date: Fri, 31 Jan 2025 08:13:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
References: <20250130213123.GA633869@bhelgaas>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250130213123.GA633869@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2025 22:31, Bjorn Helgaas wrote:
> On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
>> On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
>>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
> 
> PCIe Cap at 0x80, PCI_EXP_DEVCTL is 0x08, PCI_EXP_DEVSTA is 0x0a.
> 
> 0x80010088 would be PCI_EXP_DEVCTL (a 2-byte register), maybe offset 2
> gets us to PCI_EXP_DEVSTA?  Not sure.
> 
>   0x0001 PCI_EXP_DEVSTA_CED /* Correctable Error Detected */
>   0x0008 PCI_EXP_DEVSTA_URD /* Unsupported Request Detected */
> 
> Not impossible that these would be set.  Lots of URs happen during
> enumeration and we're not very good about cleaning these up.
> Correctable errors are common for some devices.  lspci -vv would
> decode the PCIe cap registers, including this.
> 
>>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> 
> PCI_EXP_DEVCTL:
>   0x2000 PCI_EXP_DEVCTL_READRQ_512B
>   0x0800 PCI_EXP_DEVCTL_NOSNOOP_EN
>   0x0100 PCI_EXP_DEVCTL_EXT_TAG
>   0x0010 PCI_EXP_DEVCTL_RELAX_EN
> 
>>> (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910
> 
> PCI_EXP_DEVCTL:
>   set 0x8000 PCI_EXP_DEVCTL_BCR_FLR
> 
> This looks like the actual FLR being initiated.
> 
>> This is the express capability's Link Control 2 Register afaict.
> 
> Unless I'm missing something this is actually Device Control.  So far
> I think this all looks OK.  The next part:

What you say is very plausible as far as the observed behavior goes,
but: According to the lspci output provided earlier the express
capability is at 58 (hex). Hence here we're 30 (hex) into the
capability, which according to the spec I'm looking at is Link
Control 2. Yet as said - with what you say being plausible, likely
I'm simply getting something very wrong.

Jan
