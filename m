Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275421EA7F1;
	Tue, 11 Feb 2025 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263531; cv=none; b=ft73wtVoqcbR3mS1k1YXXuBVnx6P2FDEJmaTG7+aOJgyqOChxBF0BBEgmBbvuPo89Y0RLMOPZrTiqRlqCKDCoqUHm93rfNtkAFdSF8W+dkpv9YzZiqSn63SaHRWfZbjFKhAxnPRfpBrEPPuMTgguGOBrQueYPNG07DvrOO1i/50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263531; c=relaxed/simple;
	bh=r7i5OIfvpHIuCNrkrP5o+cryO3m3MlIt3NKg50L9zZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3EKDc00pNK2sUsUuSAD4NfDUNeana/iinnNn9ZfX5pDnFmwcs9/UcYzu3OproGveGD89OmI0dFxTuL6H1sEgW+hjNOmwNCWrQ1EhiMj4mbqr2KcxiMo4uhbIDIuJeBI01WgBVP5brM2xJXqsN3PU+TRPxl0Zs/8URhJJX0ICZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=oY0RyXno; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="oY0RyXno"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=5LUJh4mH74sc3fYsMDckuN3SVRfckVBlLGA6/IRgs3M=; t=1739263529;
	x=1739695529; b=oY0RyXnovFVhX2cuignDMNcmTvuk4+6JvyqxlGvj0FiIamxDt9xDYTAWOyKQt
	KUkokHcWqzKDZtpglRJGWmWLGY/8/JqsbvBrvibnfoi9XMIb7WJGLW9BRfCVJssM4OjgOmVFue6N1
	1A+bA6IPtqzcWcGW+Uos+UNIH+htFXnFgC3vzaWk5b4xyQqbncyyw94mOM30kfkCpCkZzn9icNP6V
	+UvgoW3P+JOsHqEy3eKgc8ejlTP1TASA5/nJ1TJJVhw9XqCXuKlUVKAryDQZ3CzlcO0+RcTyHEtnR
	i0kZqvnckIAWwFKFn0gJcaAkUrSbAW0Zi7KNhDyADz6NZwF2TA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1thltU-00AzLL-0U;
	Tue, 11 Feb 2025 09:45:24 +0100
Message-ID: <e56d7767-d222-43d9-be2c-4ab5135ccacd@leemhuis.info>
Date: Tue, 11 Feb 2025 09:45:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
 <Z6Vk-7OgDB3DM7Yb@archie.me>
 <559e84cc-4da3-45a5-9ff0-2283d2c53d0a@leemhuis.info>
 <20250210171658.5eb4dc2e@sal.lan>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <20250210171658.5eb4dc2e@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1739263529;fd106dbe;
X-HE-SMSGID: 1thltU-00AzLL-0U

On 10.02.25 17:16, Mauro Carvalho Chehab wrote:
> Em Fri, 7 Feb 2025 09:24:56 +0100
> Thorsten Leemhuis <linux@leemhuis.info> escreveu:
> 
>> On 07.02.25 02:42, Bagas Sanjaya wrote:
>>> On Thu, Feb 06, 2025 at 03:30:10PM +0100, Thorsten Leemhuis wrote:  
>>>> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
>>>> index dbb763a8de901d..22fa925353cf54 100644
>>>> --- a/Documentation/process/5.Posting.rst
>>>> +++ b/Documentation/process/5.Posting.rst
>>>> @@ -268,10 +268,15 @@ The tags in common use are:
>>>>   - Cc: the named person received a copy of the patch and had the
>>>>     opportunity to comment on it.
>>>>  
>>>> -Be careful in the addition of tags to your patches, as only Cc: is appropriate
>>>> -for addition without the explicit permission of the person named; using
>>>> -Reported-by: is fine most of the time as well, but ask for permission if
>>>> -the bug was reported in private.
>>>> +Be careful in the addition of the aforementioned tags to your patches, as all
>>>> +except for Cc:, Reported-by:, and Suggested-by: need explicit permission of the
>>>> +person named. For those three implicit permission is sufficient if the person
>>>> +contributed to the Linux kernel using that name and email address according
>>>> +to the lore archives or the commit history -- and in case of Reported-by:
>>>> +and Suggested-by: did the reporting or suggestion in public. Note,
>>>> +bugzilla.kernel.org is a public place in this sense, but email addresses
>>>> +used there are private; so do not expose them in tags, unless the person
>>>> +used them in earlier contributions.  
>>>
>>> So for example I can only include Tested-by: when a contributor who tested
>>> my patch explicitly offer the tag by replying to it i.e. with the tag, right?  
>> At some point a text must leave the interpretation up to the reader. I
>> would say a "yes, that's okay" to the question "is it okay to add a
>> 'tested-by' tag in the patch description; note, your name and email
>> address will then end up in the commit history and can not be removed
>> there" is sufficient "permission" as well.
> 
> For me, it sounds reasonable to accept a public reply about someone
> testing a patch as a reason to add a tested-by tag. Yet, I don't add 
> tested-by myself based on replies. What I do when someone sends 
> a reply saying that the patch was tested is to request the tester to 
> reply with a tested-by with a short description about the test scenario.
> 
> IMO it is important to ask it to the tester, not only to have an explicit
> tag, but also because as a simple tested-by without a test scenario is 
> usually not very useful. 

I see your point, but I'd say it is useful enough: if that patch causes
a regression you immediately know whom to CC to test a fix for that
regression.

But maybe my view is just biased here. ;-)

Ciao, Thorsten
