Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B2222A1CA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744780503; cv=none; b=aLnRvt592yGWifl8AbLbvhgm/Myp4lkoQ1AzV6QXtaTqeQkZMpKIyM2UvzsaWm/m8vGU60jpzQy0aduvHYmTuf9hwIEUWXoHCSlLGNXQEWqxoeaoVrPVI/I+i9LMPmYIGwmWY4eVHxY+cH8pKLzEp+EgGyUHuNdi/iVs2jwDoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744780503; c=relaxed/simple;
	bh=1H6wRrY/8Ivsaw2xJs6tWW14WF+v3NNV35qwD9c0Q78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJ1h/4oPxsBsG+6RsPAz9zZX2Mgygw6TefKrMJL193RlXQDlOwUdecxfHRaGxZMBWmC9fw/pvhXDnCoW093DGYLz8qtloOyIMPf0Mu3cNA7PmgSn+llu064dnKJ0H+rLedJIzuIv4agRth1HuxONJ5T5JrZHsHvNmnNHl/31zO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhDSbbBO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhDSbbBO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD58C4CEE2;
	Wed, 16 Apr 2025 05:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744780502;
	bh=1H6wRrY/8Ivsaw2xJs6tWW14WF+v3NNV35qwD9c0Q78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QhDSbbBOWhOpH/orA6V+5EM752INNKhmLW9YdYisO/rW2kVEwyv5eqbZ7cdhf4vnS
	 PvnPFNR986qQ9+NEemZPJfaQjvWGyieHnRdZELawUORNsK4qEXUcr/sf6Db5M8PA0r
	 6KnvOF4gPKZvjl33tvHpDUyVzGIUrZ28sqjkC5I6dEGcSK31Rt7OZA+MScLu5g2vHq
	 uCY9UfFy1Ahj9Q0PxNGOS+HEZtN7GVOiDFsdh8KdXWhIvTzyP39nJ11X5EaXJIVyV2
	 9K8I84twn0qjE17v7unpV2nQhNDib/4rSSZ1AXpXhvM1hixztH20sW99NfKkR5RwRN
	 vaV3UUXYfMsZw==
Message-ID: <3bd616cf-1655-4700-8c84-e26e71c43edf@kernel.org>
Date: Wed, 16 Apr 2025 07:14:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqdomain: cdx: Switch to of_fwnode_handle()
To: "Gupta, Nipun" <nipun.gupta@amd.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
 Nikhil Agarwal <nikhil.agarwal@amd.com>
References: <20250415104734.106849-1-jirislaby@kernel.org>
 <51bea79a-31ac-4ee1-e646-2af138017ff4@amd.com>
 <120b0320-b5d2-4fb0-bcd4-68a767a51a8b@kernel.org>
 <929198a2-6b3b-0f1b-3f36-cd8955ca6f19@amd.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <929198a2-6b3b-0f1b-3f36-cd8955ca6f19@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16. 04. 25, 7:06, Gupta, Nipun wrote:
> 
> 
> On 16-04-2025 10:28, Jiri Slaby wrote:
>> On 16. 04. 25, 6:30, Gupta, Nipun wrote:
>>> This will go via Greg's char-misc tree.
>>
>> Ah, then I should've sent this to him in the first place :). Uhm, but 
>> MAINTAINERS says:
>> AMD CDX BUS DRIVER
>> M:      Nipun Gupta <nipun.gupta@amd.com>
>> M:      Nikhil Agarwal <nikhil.agarwal@amd.com>
>> S:      Maintained
>> F:      Documentation/devicetree/bindings/bus/xlnx,versal-net-cdx.yaml
>> F:      drivers/cdx/*
>> F:      include/linux/cdx/*
> 
> As a MAINTAINER, I/Nikhil need to review. We do not maintain a tree and 
> patches go via Greg's tree.

Yes, I understand, but how are patches supposed to reach him? If he 
maintains this in his tree, perhaps drivers/cdx/* deserves an entry in 
the MISC entry too?

-- 
js
suse labs
