Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5091F4193
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779542; cv=none; b=D+sKaSpmVEjt9Xm7/IdWkKGSO5USnUtWQnDvKi1z+uIzuXLWO55k5MtbCH+9l0ABF+OONoXJF0cZm6efBqc/bMYJp9i7wOX32kch/BUhIcTZbWuIVzM94H233ajLMFxVcxH5aOEDEVCBz2XCHhqMyCP/rh+rIbsuTheXf9Ysels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779542; c=relaxed/simple;
	bh=KCreTXWymrecjtmPS3L+e7hwdFIM1EdwxQRvo86EOwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SngL7UWF8IIoQqZV9DB1O9yozP+HM8STUyFxm03STp+O9IGQ9dS1/QN6lNIRKG7BslkqcSr6xp5AaojPeifFJV5wTfzZB6cqXIETxwxuYhPV1vANqPIT9zBmSDy0yCe+96R89fHxZbuuaxHFP91lwuFFF4yis7fnnyfc1OR1TIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tbJh3/Fg; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tbJh3/Fg"
Message-ID: <fd379fac-dbf8-4976-8f23-6202d488b262@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743779528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmFbXTDoFw2W47L5foiUWbOD7ozmpdIO22Jr4A2duwQ=;
	b=tbJh3/Fg0I3QaJE7qJnm0rsYxRsteme9jDC4vYOJBYNmG5FChxRQQYC4+Hn81aX3sLMv28
	ElV2hGVdt7V8gJSsPuVjeFxi3rWu2w9xh6wFb+ZWNwyS21ElFYj3xYVNLiPV1X3B3vC8g8
	jGmO0uNV9iScl3zdOf/NLL4jHfMObVQ=
Date: Fri, 4 Apr 2025 11:12:00 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 01/13] dt-bindings: net: Add binding for
 Xilinx PCS
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
 upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Robert Hancock <robert.hancock@calian.com>,
 devicetree@vger.kernel.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250403181907.1947517-2-sean.anderson@linux.dev>
 <20250404-tench-of-heavenly-beauty-fb4ed1@shite>
 <b4e2db47-eb56-4a9d-bcd7-52b23450ae48@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <b4e2db47-eb56-4a9d-bcd7-52b23450ae48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/4/25 06:39, Krzysztof Kozlowski wrote:
> On 04/04/2025 12:37, Krzysztof Kozlowski wrote:
>>> +  pcs-modes:
>>> +    description:
>>> +      The interfaces that the PCS supports.
>>> +    oneOf:
>>> +      - const: sgmii
>>> +      - const: 1000base-x
>>> +      - const: 2500base-x
>>> +      - items:
>>> +          - const: sgmii
>>> +          - const: 1000base-x
>> 
>> This is confusing. Why fallbacks? Shouldn't this be just enum? And
>> where is the type or constraints about number of items?
>> 
> I just double checked now in dtschema and latest next - there is no such
> property.

OK, so you would prefer xlnx,pcs-modes?

--Sean

