Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1325F7A1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707059; cv=none; b=XgMRN71M+0hFUDzSsYaKiWEVWRRAWKNqIa1gLDeYteJCiPgOBkqDUF+cx4hLAIErvqHNQ3UkUl1ZQbvI0gTRjbDTpTyruueoq/UY7qc/rhZl99DoJSEZOPsXU4c0OLFmxgiJmsIycbO5EQigs5SZrC90EydXRyYofRuBD6z85g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707059; c=relaxed/simple;
	bh=iuOOwB3RhF2+wmWM3TB/6mKD+N4PJ/l0AgT6T28qZdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oe3R2YpOz1DEg4cWkaDexm95bpQyw+sl5PG34QxR4t/5HkpGpOFF9NJqgIi2kIcPWARSt/rWw+4FsVQo1Q5qGe5t/FZ6s1/39raOwhD0Rhjp2Kisy2WE7ofTE7geZCmUa7L+SvRqovvdVZ5FHSuukBXnruszlvEF+nMnCnubL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jn7Fb+Ug; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jn7Fb+Ug"
Message-ID: <0eb36d4f-ab6c-4bb3-aad0-99c09bcd56ec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743707053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR6tAQCdTqWMdGnoueGRPKReRRRQNdIbvhVIHJWD5vI=;
	b=Jn7Fb+UgY/OlS/fnuFJSgz2OVlcdAmgKv8H1oVFoc46n/wT4ubopRD4mJlVLWxZMgP1Wnu
	05Q7iiyh/mwHPQ6Dw+H10z3jRi2jjgr8S6+WImf8VczgxbWlw9h7NRIvnmN38tQ9ge6NVM
	kpjzXJKKqFnlUwXJb1TnwDaYvPaqCNs=
Date: Thu, 3 Apr 2025 15:04:08 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 11/13] of: property: Add device link support
 for PCS
To: Saravana Kannan <saravanak@google.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 upstream@airoha.com, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250403182758.1948569-1-sean.anderson@linux.dev>
 <CAGETcx9v610XhvU705R=Mjth=iAbCU04rqNnQPhQua37Jc4TRQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CAGETcx9v610XhvU705R=Mjth=iAbCU04rqNnQPhQua37Jc4TRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 4/3/25 14:32, Saravana Kannan wrote:
> On Thu, Apr 3, 2025 at 11:28 AM Sean Anderson <sean.anderson@linux.dev> wrote:
>>
>> This adds device link support for PCS devices, providing
>> better probe ordering.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>>  drivers/of/property.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/of/property.c b/drivers/of/property.c
>> index c1feb631e383..f3e0c390ddba 100644
>> --- a/drivers/of/property.c
>> +++ b/drivers/of/property.c
>> @@ -1379,6 +1379,7 @@ DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>>  DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
>>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>> +DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", NULL)
>>
>>  static struct device_node *parse_gpios(struct device_node *np,
>>                                        const char *prop_name, int index)
>> @@ -1535,6 +1536,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
>>                 .parse_prop = parse_post_init_providers,
>>                 .fwlink_flags = FWLINK_FLAG_IGNORE,
>>         },
>> +       { .parse_prop = parse_pcs_handle, },
> 
> Can you add this in the right order please? All the simple ones come
> before the SUFFIX ones so that it's less expensive/fewer comparisons
> before you parse the simple properties.

Ah, I couldn't figure out what the intended order was so I just stuck
it at the end.

--Sean
