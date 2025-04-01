Received: from sender2-op-o17.zoho.eu (sender2-op-o17.zoho.eu [136.143.171.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019EC1EA84;
	Tue,  1 Apr 2025 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.171.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497669; cv=pass; b=XSJTnxQkvPD6krKKCH3v5fOgUEhE+sUlMNSxP1Wb6TEvDCFeakGoNBrJ5uBvY4HN+xoFxm3w9AWQGEhAn/9LdvatS/2Yi6rI2bii2OXD1XATMofq1FK6sAM4S717hFr1SyuQL3pbDQ1JFG0ls1t0miK6VpWIt/oMQR3RgFC7LJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497669; c=relaxed/simple;
	bh=aKUuJwu0U8bq5ODLU/EBl2gp/37apqgHHw2MWv7l9eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMR7izH76lZt7Y2/8f8F4TCSJRcxIKds7flQyzR7pV+xUwXJymA8BZGpoV9swomTjlsUclwfVrueHoLVoinH4/T6EchtZh2kF+k6AJCm+jHxrj+OO7Y+7dBYKv3RE9v7f1H6WCL+7WqTXjlySxs9UXulv6zoUoRiySv9ArOCThA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chir.rs; spf=pass smtp.mailfrom=chir.rs; dkim=pass (1024-bit key) header.d=chir.rs header.i=lotte@chir.rs header.b=UdyHWwB1; arc=pass smtp.client-ip=136.143.171.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chir.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chir.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chir.rs header.i=lotte@chir.rs header.b="UdyHWwB1"
ARC-Seal: i=1; a=rsa-sha256; t=1743497646; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=GkWngAyi+uzuViOiCY6JCGHZUgbWETG/+kT53OAui4q2sT3kKd3Zquz6l17QyJ26vfD28cIUdcfhSJSaikZWOpi/S9ZivrQZmFIMgyx83PTzxfUMwzPHvE4Hf27UXQpEScRCX5pT1r9bKanCXC4c92lLGhzNUjnv1koeXN2p6kA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1743497646; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IKWd7/S8ecvupAPGxLPLAgyuVQEO8m2WiEs8ZQCSIDE=; 
	b=hlU22wub2xiYbovhm07uqMVlsCNEyAoUUPqtQQIot5PjhY3bAwnFMJA0x6JTSLLxGoulyAHbGYTihj7xxJ2bd20r3PTM8AJrEdVK/lh+xLllJoKnwwNTk+6L+FHzzdOx+rTLohy+v8ZgDn3EGeKyZFM2j42/DpVRZfCsaQvI8NQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=chir.rs;
	spf=pass  smtp.mailfrom=lotte@chir.rs;
	dmarc=pass header.from=<lotte@chir.rs>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743497646;
	s=zmail; d=chir.rs; i=lotte@chir.rs;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IKWd7/S8ecvupAPGxLPLAgyuVQEO8m2WiEs8ZQCSIDE=;
	b=UdyHWwB1/Sh3ODklYLF2YexzS6g3Vw+lkmkg5iR5lMQq4ou/hgMfChTIWoLlvMCu
	W4REsTLWyOeI41rMYSm/EtUvTg7mDhjUqcI9SI4rhslVEm5FHKXRXP9InJntsKwc4aQ
	dnooQFpJABkCcF3QSpNiisNjhtnKXeZ/h3JQC+aY=
Received: by mx.zoho.eu with SMTPS id 1743497642823882.9940100806688;
	Tue, 1 Apr 2025 10:54:02 +0200 (CEST)
Message-ID: <5c9f59c3-2868-47c2-b2af-b515a8ec9349@chir.rs>
Date: Tue, 1 Apr 2025 09:54:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Add Clockwork CWD686 panel
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250401081852.283532-1-lotte@chir.rs>
 <20250401081852.283532-3-lotte@chir.rs>
 <abfea9d8-9992-44e6-975e-a18b01753aa5@linaro.org>
Content-Language: en-US
From: =?UTF-8?B?Q2hhcmxvdHRlIPCfpp0gRGVsZcWEa2Vj?= <lotte@chir.rs>
In-Reply-To: <abfea9d8-9992-44e6-975e-a18b01753aa5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/1/25 09:34, Krzysztof Kozlowski wrote:
> On 01/04/2025 10:18, Charlotte �leńkec wrote:
>> From: Max Fierke <max@maxfierke.com>
>>
>> The CWD686 is a 6.86" IPS LCD panel used as the primary
>> display in the ClockworkPi DevTerm portable (all cores)
>>
>> Co-authored-by: Charlotte Deleńkec <lotte@chir.rs>
>> Signed-off-by: Charlotte Deleńkec <lotte@chir.rs>
>> Signed-off-by: Max Fierke <max@maxfierke.com>
> 
> That's not a correct chain. If you co-authored, how can you sign off
> before max did?

I missed that requirement in the patch submission guidelines.

> 
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Best regards,
> Krzysztof

Kind regards,
Charlotte
