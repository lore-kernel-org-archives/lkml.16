Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF744A35;
	Fri, 28 Mar 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158188; cv=none; b=ete3RM5KjWZoFKvc3djyAVtjKDDPzkOcSUf9rTMc5cqb6XLPkB9hzqVuZw/iRXfOoOZXLoLxK7y/HCkG7zTN90ft6XN+ZuRrVXpW/1ZwXN38/rbM7IU0b4q5sUxf/B1GUp85rEiSABKSgnhLmUTLzt409iSRJN3bEUIFrW7rSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158188; c=relaxed/simple;
	bh=Kfudq2zBmF5GsfnfmqkxJPDAA0WqYO+pmhs87CvpzdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=B1MqC8BzyXzy3a79Q5uquX/a+itt/C37HT1ILJm/MaNa8Xj2n3lEjhzeKPGPcoWIeIfTiGMmnSgjpih6kbaCVVsZ5uhFREfWNYb9BYGfa3GVCnfalg7rF39Ew45WG1qsi9WyDLkFQWYDkx27UEDLQOe40H00BBUBEA8w/t3ds2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AcRV5sTy; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AcRV5sTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=UdJbnIvHTJoyF1Q8KH
	RV7bQemCVQTNqvc+BySkfmlO4=; b=AcRV5sTyAtxYtNhrjhprcxUQmFXWh+9zM/
	6Fe+tqqJv48GMHSoibYQNdXXzl4yRY9591xa9jC/q54IwqU8VU4q54ZaTFV+h/8p
	FSXFLJ3WV1cJ2NPT2ch+PT0oQMGpckSpJ3Eeg3DZmpTt9WTLRQPaQ2VLtDQWVN3d
	qCcTO5HgQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3HXGFe+ZnIgTgCQ--.59704S2;
	Fri, 28 Mar 2025 18:35:50 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net
Cc: christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v6 4/4] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
Date: Fri, 28 Mar 2025 06:35:32 -0400
Message-Id: <20250328103532.18102-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b93159ed-247e-4cdf-81c0-f32b85d4fbbf@roeck-us.net>
References: <b93159ed-247e-4cdf-81c0-f32b85d4fbbf@roeck-us.net>
X-CM-TRANSID:_____wD3HXGFe+ZnIgTgCQ--.59704S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DCrW7JrWrWr1fKw4Durg_yoW8Ar48pr
	W3CF18tF90qr13XrW2y3ZYkw15Z3WvvF40krWDXr1a9a4kua4Sqa9xKr109F17Ar1SvFWf
	uFyvg3yfJw40yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUG9akUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiJRAd02fl1K4jAgABsj
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

At 2025-03-28 06:53:02, "Guenter Roeck" <linux@roeck-us.net> wrote:
>On 3/27/25 06:18, Wenliang Yan wrote:
>> Add the sq52206 compatible to the ina2xx.yaml
>> 
>> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
>> ---
>> 
>> Add the meaning of 'shunt-gain' in SQ52206.
>> 
>> v5->v6:add content to meet the update requirements of the ina2xx.yaml
>> 
>>   Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> index bc03781342c0..8cd672e6bf62 100644
>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>> @@ -19,6 +19,7 @@ description: |
>>   properties:
>>     compatible:
>>       enum:
>> +      - silergy,sq52206
>>         - silergy,sy24655
>>         - ti,ina209
>>         - ti,ina219
>> @@ -58,6 +59,9 @@ properties:
>>         shunt voltage, and a value of 4 maps to ADCRANGE=0 such that a wider
>>         voltage range is used.
>>   
>> +      For SQ52206,the shunt-gain value 1 mapps to ADCRANGE=10/11, the value 2
>> +      mapps to ADCRANGE=01, and the value 4 mapps to ADCRANGE=00.
>> +
>>         The default value is device dependent, and is defined by the reset value
>>         of PGA/ADCRANGE in the respective configuration registers.
>>       $ref: /schemas/types.yaml#/definitions/uint32
>> @@ -97,6 +101,7 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> +              - silergy,sy24655
>
>silergy,sq52206 ?
>

Yes, it is my oversight, which may be the reason why 'make dt_binding_check' fails 

>>                 - silergy,sy24655
>>                 - ti,ina209
>>                 - ti,ina219

Thanks,
Wenliang Yan

