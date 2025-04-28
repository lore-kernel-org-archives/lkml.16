Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE1297A70;
	Mon, 28 Apr 2025 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864020; cv=none; b=iG4QVMQEvnzmsBpUOqK64XIFjgUhXXNTnlPC9IWF6tcUCL+f31bEVv7yKIWi9AonrwDyZ+qUbGvtVFj6/a7ZwVK48t5DAdJ/KyOXKuZ8YZLA39qSepPUI5MnN0gpje9jscaNB/pNvIcFLgb3yXSBJL7H/uac6i8Q2G4D4Ep4lZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864020; c=relaxed/simple;
	bh=IJjkyUZox2URzUQtE7jRJKXjME8ZBdk02rDxxxDsOg8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QYcmov8XjikD6qijhVcfCw6oObd9xXgghe5mVgH9wBFHdBauHjWQMcjTNGeLnKP7Wv06GxqXPPe4168bqz154wswd6KvayxgpHe96dafe0gfGFXCON3zW2EFmlYlIcZDXoEaeBEB2awtpEwmsGRZt4YKUFSRAtTWO2YSICQe3SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Hgrm6XxF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Hgrm6XxF"
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id 4D466BBAD2;
	Mon, 28 Apr 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745864010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XzisxXOIvIt99ecAlPMk+mfkIlF+kp2Ehh9SvEPsx/4=;
	b=Hgrm6XxFsLPmkiFUr/E6kZw7iJUUJq7ANQdlFZTDIPiaz1CLld4JQmCo70YsggLEkEFup3
	xzRsbSYVQEBKS6+qUVBrys+IlXb+/I6qy7u0Io7nHRIzzx5n09xF3uL8U7LM+4ib28zfSh
	CaQm7z1QLUQ6th4mgcllmfjvEnNo298ORww9v92JjDtEPIYe+WmMFNw7OVOOZcCjwcsSB/
	3RVWj/xTscwTOOlEXiuSiWxdASHOFOai8B1J/sqdtNyvNgTLexK5EV99xbe4uRLfYoUbI9
	1OW/AJWswZXisUqfY0QZ5pj421KZpnaIxMKs4UTp0ArIDxcnmtyjhLSf0gA3wA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 20:13:30 +0200
From: barnabas.czeman@mainlining.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add BOE TD4320
In-Reply-To: <20250428-versed-boar-of-charisma-961cbf@kuoka>
References: <20250427-lavender-panel-v1-0-b2611674166c@mainlining.org>
 <20250427-lavender-panel-v1-1-b2611674166c@mainlining.org>
 <20250428-versed-boar-of-charisma-961cbf@kuoka>
Message-ID: <d838dc2006c52bf6099767a2805ad826@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-28 11:22, Krzysztof Kozlowski wrote:
> On Sun, Apr 27, 2025 at 11:11:11AM GMT, Barnabás Czémán wrote:
>> Document BOE TD4320 6.3" 2340x1080 panel
>> found in Xiaomi Redmi Note 7 smartphone.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../bindings/display/panel/boe,td4320.yaml         | 55 
>> ++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml 
>> b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..65da1c392cafbb7cd3ce32e347fba1b9244c1ad8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/boe,td4320.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: BOE TD4320 MIPI-DSI panels
>> +
>> +maintainers:
>> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
>> +
>> +description:
>> +  BOE TD4320 6.3" 1080x2340 panel found in Xiaomi Redmi Note 7 
>> smartphone.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: boe,td4320
>> +
>> +  reg:
>> +    maxItems: 1
> 
> No supplies?
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reset-gpios
> 
> No supplies? This looks really incomplete.
It works without supplies because BL is enabling them and there is no 
qpnp-lcdb driver yet.
I do not see worth to add them at them moment but I can if you want.
> 
> 
> Best regards,
> Krzysztof
