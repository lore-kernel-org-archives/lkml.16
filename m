Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B782036FF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748905835; cv=none; b=MP6LPwKDz5Wvt0SstG+zre8Qf3BoIJcRObjrgI0kmsmlfSbi9nCF1XAAggv+A+VFvlYTokcuhkkeiZ3/31rj1uCNw8E9TieN8/zgdi3xOzJQ4HczrFAau2MS1F2u+o94piSeub9t8OTQHi8ZtX7rKIUTdCzaJ9xMSvKu+qBtzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748905835; c=relaxed/simple;
	bh=HLtWlUdCA5tSyETK+p1bjru5SFXCPmkyXFdHE6/YSc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufWwKM02D/t4y3eDxOGqw9ftbARix9UoohgRjcRYKE2OH+Oi+u71aau0eZ3LER+kBjxuqhJVAp2DC03E2HIqLgvEkT/c5pqbztgQjo6qZz+nf3y55/EcFoR6eh6nQGtCsZOzMsGmLjUIk6NG4sdtaL+aYsnsotlMtCuACs9wF2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dihcd+Xo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dihcd+Xo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so53958365e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748905832; x=1749510632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4Vpa5WCgPTy+i1VpwapiKrKW/K1L0f0Ol4/XZy6OOw=;
        b=dihcd+Xo8UJq4oRortym8JMSolZPpgy4+AvRkF/entmp+14iXphdpRkJ+xq3AyoFqF
         p2NdhnnZ3B9SztcRHDDfVISdXiGA3UwXzzH9qs9meWCendcZ5nPzXIfU5pnn2bAH1oWF
         /Msl5VXD7PueAIU9O3XFBXDZ2t4E3SOD9VJZbB76KUqrzdS2Dq6Sp1eDXcmXAhRtUk5Q
         /Md6l/tLx4JBGx/SQ3zZYO9J4Vl7PJGznivF2cRCZxH0DQF1uCT5ySnwkKFxLfly7677
         ISIdP5hsBrppcR3ao4O6kYCP6fg/ii1R8fI69X8tW57dVAuIIodBWeJEzx6o62uWJWUJ
         sZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748905832; x=1749510632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4Vpa5WCgPTy+i1VpwapiKrKW/K1L0f0Ol4/XZy6OOw=;
        b=mGLA0A0j16cIWM3CoLI1J0O3pDAXn2Tb6h5zIJDzXWDQf4E0lYmXJ+NOpoCYDyZ+Fa
         l+8P00GChl2KVIiSGDglqcmbxXdK9MVhBBEylptk85xJdMt5i4sxwsPjbTHEbtoAG6WT
         QPnWlahTZ7a+aK9pKYDBI/PfSpDnC4PDmg5ivaQqOTaUqGK+LUqCczeu//2tED4g5YSY
         /bFo2XgNCpDUv2PY5AOi2J4jJSmtaxoRRjfBmbBQOQnr/iMEACVqKIxSRYJ5iNuU8tUW
         cvcj4CGlsKkh35ykCEwqkuiVOptTLojLeqrZzAaRWLVCC0sgfULQ1m83l9NhMhnL4zk6
         BaXw==
X-Forwarded-Encrypted: i=1; AJvYcCWkT/IQyH8aBU9ZtEqG+BBfbj0RYcQVz+x+sYfonCagzNv+nKNmff53MJ+QFdlcWlTa1Tv8qJC9mlTrIEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJ5U0xq2B0mVh7+MFOEPL9CnF7YG96M4fRuMkJb3rRodPIvC/
	k4Y7O9046pzvNCry1yC41TcWGpfHJpOa7g+R4UyFUbPf+0P1KWybVOmbpxBKMf32iuU=
X-Gm-Gg: ASbGnctQlQvA134/5Eumu3JiZtmqvS+O4ZuXnJA9fJ5Kfwxtj7TLk6dKF5UyjX0bfk6
	pET9Rc/z7/5sGyIyiOWWWqt7dik6rGCp6WdCaSnTipv02uoPHsEQ5Wpj0d3w6EAF3MJDca8XQPj
	62RpKL/hcEXW2/nU3mrkSWgm616jJftuI6KJWfBYPtaSJF+oSpy8s20KWwoWvMVISYoXmgfJSxw
	e+he72meWl6lCDj7J622l4Up7tOn1UnX3++TzU8ugZA7B+F8Ovf5pUAZ96EJw3v29Umpq/g/QX1
	+AY4tBMMo4Lsa+WZEXuWJArAw93TNOXNlinZlAgy2k3RTayoRlX61GgCS3Z68nIHulZE+551J+h
	3Z6U=
X-Google-Smtp-Source: AGHT+IHVRb/jNONyUnY0zBCRWyEnP04lsieXvz6H7a2fe24kCCSQoZBv4k3ktjmMiMlGczV3RA5mhg==
X-Received: by 2002:a05:6000:220b:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a4f7a825a2mr11742538f8f.31.1748905831575;
        Mon, 02 Jun 2025 16:10:31 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e30b688sm6073962a91.32.2025.06.02.16.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 16:10:30 -0700 (PDT)
Message-ID: <d7383d29-516d-4643-aaac-dfd930ec896e@suse.com>
Date: Tue, 3 Jun 2025 08:40:25 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel crash on boot, arm64 VM
To: Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, LKML
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 rafael.j.wysocki@intel.com, jonathanh@nvidia.com, ulf.hansson@linaro.org
References: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
 <20250602103521.GA1134@willie-the-truck>
 <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/6/2 21:42, Sudeep Holla 写道:
> On Mon, Jun 02, 2025 at 11:35:22AM +0100, Will Deacon wrote:
>> [+Sudeep]
>>
> 
> Thanks for adding me.
> 
>> On Mon, Jun 02, 2025 at 10:00:38AM +0930, Qu Wenruo wrote:
>>> It looks like there is a regression related to the device tree/acpi parsing
>>> in the latest upstream kernel branch.
>>
>> I've kept the crash log below, but I suspect this is due to the __free()
>> cleanup path in dt_idle_state_present(), introduced recently by
>> 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT
>> idle states are present").

Reverting works, thanks a lot!

>>
> 
> Hi Qu,
> 
> Do you also have this commit ?
> 
> 39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")

Not yet, the branch I'm using is from btrfs' development branch, which 
is slightly older than the upstream.
(The base commit is a56baa225308 ("Merge tag 'for-6.16-tag' of 
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux"))


Just tried upstream, which also fixed the problem.

So I guess it's really the same problem.
Sorry for the noise.

I'll just notify the btrfs community to rebase the development branch

And thank you both for pointing out the proper fix.

Thanks,
Qu

> 
> Just trying to see if it is same issue or if this something else even
> with the above commit included.
> 
