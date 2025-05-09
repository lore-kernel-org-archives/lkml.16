Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10782701C1;
	Fri,  9 May 2025 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782552; cv=none; b=hHpko2Wk9+RdzGsIVm5Gh3rI5cEcpgSWZ8w6RqY+4uQOy1kweWK15cRBkMZtXFNmAZ+8/1eWVVMPKkyQWbIdrvO0r+r2kpQmVy72omY5Sucf6AbuN0MM2PivZYOrlNnNA4AI32XYvcie1/VpjP4vf1FFKoOadERYg1uqodgeBZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782552; c=relaxed/simple;
	bh=9RwaVCJoB2QX52Fzfwg1Ie9/qtAgL82D53jNjXgnjjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkkfYkPo0t72AzmWFe8gfrd4HreBmLUi7ytj+nTCfffY4RYRw0nJdl3uo9Ir8cG7ffuIu51KBoq2dGLT3otdEAiQC5xIfr/MOOhNOcSjghtgXe42JnqIVe6VOKj+Kp2keYZjtJ1AP84O5z/aanfk3hfdrwWyMd213Ps/F0MSEDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDcVTB7u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDcVTB7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E87EC4CEE9;
	Fri,  9 May 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746782552;
	bh=9RwaVCJoB2QX52Fzfwg1Ie9/qtAgL82D53jNjXgnjjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qDcVTB7uRdZVUEn57NM9lVN1IeezZySRSG6biuzKx5NsoWnb3bmGeNilt5WQn14zF
	 MZHkWmmIWgTG/BHC2DibkuAvfEr5oWjw1FiNHXarZ7gfD8xakVDj5Pg8UoQyQ+l3Wx
	 MScDqxI7g5xO90TjO48SLrAFLdChEgOzNKQ8VVdbn8DUGs+B9mzum9ClzwoDWX6gPP
	 0JdRQUFc9ovZ0BC1NTLJ/urJLLrPEU1U4RHIXwoWKaJjuo/lviQ+s5PpLhS86wgQu8
	 8uSnFLiM3GECugygpYSKqlqr9XfQizblc11s/ZqjV+6zt2fL4XwUdvAtGZ1acbsJML
	 Kmhee+Lrul25A==
Message-ID: <e002674f-f180-425a-9f60-ce8f9126b058@kernel.org>
Date: Fri, 9 May 2025 11:22:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hwmon: pmbus: mpq8785: Prepare driver for multiple
 device support
To: =?UTF-8?Q?Pawe=C5=82_Dembicki?= <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shen Lichuan <shenlichuan@vivo.com>, Peter Zijlstra <peterz@infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-2-paweldembicki@gmail.com>
 <272301e5-6561-499a-91eb-615fed4727fa@kernel.org>
 <CAJN1KkxPOuZqRwysx3zu_5ChODn2wnizKXzfEZHD2AiHAbd0ig@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAJN1KkxPOuZqRwysx3zu_5ChODn2wnizKXzfEZHD2AiHAbd0ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2025 09:41, Paweł Dembicki wrote:
> pt., 9 maj 2025 o 09:03 Krzysztof Kozlowski <krzk@kernel.org> napisał(a):
>>
>> On 09/05/2025 08:51, Pawel Dembicki wrote:
>>> Refactor the driver to support multiple Monolithic Power Systems devices.
>>> Introduce chip ID handling based on device tree matching.
>>>
>>> No functional changes intended.
>>>
>>> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
>>>
>>> ---
>>> v2:
>>>  - no changes done
>>> ---
>>>  drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
>>>  1 file changed, 30 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
>>> index 331c274ca892..00ec21b081cb 100644
>>> --- a/drivers/hwmon/pmbus/mpq8785.c
>>> +++ b/drivers/hwmon/pmbus/mpq8785.c
>>> @@ -8,6 +8,8 @@
>>>  #include <linux/of_device.h>
>>>  #include "pmbus.h"
>>>
>>> +enum chips { mpq8785 };
>>
>> Use Linux coding style, so:
>> 1. missing wrapping after/before each {}
>> 2. missing descriptive name for the type (mpq8785_chips)
>> 3. CAPITALICS see Linux coding style - there is a chapter exactly about
>> this.
>>
>>
> 
> Sorry, I was thinking that it is a local pmbus tradition.
> Many drivers have the same enum without capitalics :
> 
> grep -r "enum chips {" .
> ./isl68137.c:enum chips {
> ./bel-pfe.c:enum chips {pfe1100, pfe3000};
> ./mp2975.c:enum chips {
> ./ucd9200.c:enum chips { ucd9200, ucd9220, ucd9222, ucd9224, ucd9240,
> ucd9244, ucd9246,
> ./zl6100.c:enum chips { zl2004, zl2005, zl2006, zl2008, zl2105,
> zl2106, zl6100, zl6105,
> ./ucd9000.c:enum chips { ucd9000, ucd90120, ucd90124, ucd90160,
> ucd90320, ucd9090,
> ./max16601.c:enum chips { max16508, max16600, max16601, max16602 };
> ./q54sj108a2.c:enum chips {
> ./bpa-rs600.c:enum chips { bpa_rs600, bpd_rs600 };
> ./adm1275.c:enum chips { adm1075, adm1272, adm1273, adm1275, adm1276,
> adm1278, adm1281, adm1293, adm1294 };
> ./max20730.c:enum chips {
> ./mp2856.c:enum chips { mp2856, mp2857 };
> ./tps53679.c:enum chips {
> ./ltc2978.c:enum chips {
> ./max34440.c:enum chips {
> ./pim4328.c:enum chips { pim4006, pim4328, pim4820 };
> ./fsp-3y.c:enum chips {
> ./lm25066.c:enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };

If that's standard for this subsystem, then it's fine, although to me it
feels odd to see all over the code lower case constant.


Best regards,
Krzysztof
