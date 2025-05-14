Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2407E1A3155;
	Wed, 14 May 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217119; cv=none; b=BpIp/DNQE6wCqXSaGEi1DwH3bFf1mHLkICK3bfrNxn8hpLiJUh4v1+xr7xxnq3a6bKoUe3r69bJSnFFN1wboAHu3QUmQbjn3/oifWZmO1iSJfaE2jtEjjLdEWxlbeOgV+jXNIWo95xn/TqLvOu0Qevw/G3dKPr83vJvSnvFWdwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217119; c=relaxed/simple;
	bh=kITsxbCJWQENOnKhbH75PkR8+Js5zmGnIQSaxyrbZS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFbUgi51KuKaR+jIOdASifaHwsRufAM4+PyqLr1xn42GPu0ACw+eaxUiXASzsk1Vtoc4cNqS8NvRDPzzRyF0QXOm5me3mgMKEltHQnjZ8QKpws3kA9pv8XWt+ipFxK4M6UsZKbbXIxYMhR0bfySbgrd2IblsOvjn4Uso7fjuvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhkJtu/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhkJtu/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8773C4CEE9;
	Wed, 14 May 2025 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747217118;
	bh=kITsxbCJWQENOnKhbH75PkR8+Js5zmGnIQSaxyrbZS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bhkJtu/YUchVVSclF2fE1TtYPbybleNNZtHAQ9hQchmLkYcIAALhCsZpL/r//HDdL
	 QH9dTU3Lrur+qAs3383SfJ+OmbKuskTBOCiqu4dntYhSCaSK712Zynad0WLzS4kxWF
	 jJulO6hkxCA4YLORUwlug00FJP2KkSZzrlqysKilUPJSKdJq30/s/sbLQXfS3Wn3xw
	 xAEWMmAsZbdJTuN0fCSmo3gKWdPCBSzEipuD+UlYP3bWCvxpFMAT9k1ebgrtP0ql82
	 LFkGT8k4E/cxXp+Hwo9iSBes4PacHK2Tqv3hrJJlq6AVYxoZwMrGVvUFQ5u/ng6Fnb
	 96zGN9qJrFL7w==
Message-ID: <e4317fef-c4e9-405c-9bcb-4d5447dd8367@kernel.org>
Date: Wed, 14 May 2025 12:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x
 i3c-hub device
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Vikash Bansal <vikash.bansal@nxp.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Shashank Rebbapragada <shashank.rebbapragada@nxp.com>,
 Frank Li <frank.li@nxp.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <20250508045711.2810207-2-aman.kumarpandey@nxp.com>
 <b46e3766-75b7-4635-a505-3039e4394f07@kernel.org>
 <GVXPR04MB9778CD46464F6BEE25D5D0529997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <GVXPR04MB9778CD46464F6BEE25D5D0529997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/05/2025 13:45, Aman Kumar Pandey wrote:
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, May 8, 2025 11:40 AM
>> To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>; linux-
>> kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
>> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
>> conor+dt@kernel.org; devicetree@vger.kernel.org
>> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
>> <priyanka.jain@nxp.com>; Shashank Rebbapragada
>> <shashank.rebbapragada@nxp.com>; Frank Li <frank.li@nxp.com>
>> Subject: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-
>> hub device
>>
>> [Some people who received this message don't often get email from
>> krzk@kernel.org. Learn why this is important at
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report
>> this email' button
>>
>>
>> On 08/05/2025 06:57, Aman Kumar Pandey wrote:
>>> +
>>> +static void p3h2x4x_of_get_tp_dt_conf(struct device *dev,
>>> +                                   const struct device_node *node) {
>>> +     struct p3h2x4x *priv = dev_get_drvdata(dev);
>>> +     struct device_node *dev_node;
>>> +     u64 tp_port;
>>> +
>>> +     for_each_available_child_of_node(node, dev_node) {
>>> +             if (!dev_node->name || of_node_cmp(dev_node->name,
>>> + "target-port"))
>>
>>
>> Same NAK as before. You ignored the comment and nothing improved.
>>
> 
> Thanks for reviewing the patch.
> As per your comment I have used proper function to get reg instead of sscanf. And our driver is not having direct interface with userspace.

What was the comment - undocumented ABI.

> What should I change here ?

How did you solve that comment?


Best regards,
Krzysztof
