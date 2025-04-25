Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AFB5695
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584504; cv=none; b=m4GD80c671DVErDmwy5tYPpDL0azYjrpOPkoQvSFsUzmgBWOpP0UzjnHLG0y9rxZT+oPD1LDRpXIPDOifiMM2r6OJarJvl4fRCZW4DWXnRa557+QSQKRIpOUdkjBWPAEFWCk5UBzi9n7jgdxaMbzCkwIhAeAqHSO22CbNHN5XNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584504; c=relaxed/simple;
	bh=GQzt17MyqX8uuTm5v+Ec3RbmyAPRhmV9zL9hzbmniBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6fRZ6RkwXwEi3o+y+wYNuqq7ixnchPnXtWtNxQPJWcCGUP5kxJqC79ry1D2ASVLiJNpLlUDlZa61cnuAl1QoXiYRgqcH67JplX7p8T9GfwZi3hCmWgV+Z/KYboYNUcygRMZFNYnVUwnIWl6x0q0yk0gUiOIC117a1f1+t87yPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=HuuAVsCO; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="HuuAVsCO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+A9u+ebGFXpWrBdzblr4M9bejgEoUFrV8zWN6KJE79M=; b=HuuAVsCOtfijz17vlxhnpOz8Ug
	h5WkyYDKjkoKiqx5Ez3sr7YYZNPzG5khl99k+w38j+ej7QEBG/jSGD70ynE4HZzNpkhKyACAKsDAh
	EDa1fWP7Z2GbIZbr6OFmaJeq2B8NZV8TZWH64l6X0IgqcTMEfv5fYfcKbc6Ow1+cMcX0FFKnX8NWJ
	ViAr+HaMhBn0+jMVL4DkT39BVLRlNFthgfYHRdKPp1MNCq60ODm1xgeEH/Cq1L1Y+suU9Dbd/7NOC
	/B4rQTux5hUgoHsoe9zB27Uh3vja+LF3xzJ6lR3WZbkKAG5HoewDugMRVJmJdB8AlZJzxy/ncgRj/
	nZWfhVYw==;
Received: from [77.26.4.178] (helo=[192.168.50.63])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u8IGN-008KA0-Ve; Fri, 25 Apr 2025 14:34:39 +0200
Message-ID: <f8ffe67d-5267-4e97-9e36-359d39eadb71@igalia.com>
Date: Fri, 25 Apr 2025 14:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: fix client obtained from axi_ids on V3D 4.1
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Emma Anholt <emma@anholt.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250409155504.1093400-2-jmcasanova@igalia.com>
 <ee5cbc11-b909-4754-ab62-de9581d9785e@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Content-Language: en-US
Organization: Igalia
In-Reply-To: <ee5cbc11-b909-4754-ab62-de9581d9785e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

El 10/4/25 a las 14:31, Maíra Canal escribió:
> Hi Chema,
>
> On 09/04/25 12:55, Jose Maria Casanova Crespo wrote:
>> The client that causes an MMU error is expected to be reported.
>> But in the case of MMU TFU errors, a non existing client
>
> "In the case of MMU errors caused by the TFU unit, [...]"

Message updated.

>
>> was being reported. This happened because because the client
>
> There are two "because" in the sentence. Could you add an example of the
> a MMU error with a non-existing client in the commit message?
>
Example added.

[...]
>>           }
>>             dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 
>> 0x%llx%s%s%s\n",
>
> As we are declaring `begin` and `end` as hexadecimal numbers in the
> code, could we display AXI ID as a hexadecimal as well? Just to ease
> future debugging. You would need to change "(%d)".
>
Change done.
>
> Please, don't forget to mention this change in the commit message of v2.
>
Already included in v2.

Thanks for your review Maíra.

Kind regards.
Chema Casanova

