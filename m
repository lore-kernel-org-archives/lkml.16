Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462D13EFE3;
	Sat,  8 Feb 2025 15:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029023; cv=none; b=bBylhiZrG88T182129gaDKJRlgPPvhAb0Yzj5YyTfkWu1T87dbBx10qZh+/8MWf+pA2kOKvF0fHDdccTH3WZUy5qerWOE/WvCxWKUkbYBXNwoaFJLPqvh+OjkFiO/oBnFWRMcn+H6LEfZ5djfBP2F8XVJMw+iHxndcS802YJ38E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029023; c=relaxed/simple;
	bh=edP5cnZdsXNLdZyaPPqteFAjfe6jOmR4Y4nreqkkx8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMqhTQUdH4c+dR8GV3DKXEO6p6v3bWerTjoa51uRXqJpIhonWvUVQ8bVCfKDtjM1K0pEIcoawS0FYM+KE2gpKh/vEE5ROUdCuDV1FiTYcx/WV5tQ+++0kE7dXaHIX68ntavYKHoPifMprxljm4ebRmligJa3UBdZmOclbeI41wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=k15sMw4O; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="k15sMw4O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=sReTgSh8cyWWQXGCpKo6cPSEOhWgPQHHXye7J9k/w6g=; t=1739029021;
	x=1739461021; b=k15sMw4OXE4nBpmZDaFtjk6EsyrOeyrgYTNXowC7zssFtnLvLjws/QSjFrFoi
	SceQzdg3ZKGTjkMN4QJwdVeshvcOj5Hx5IL8lgIjrpqHA+tzNrFGKp/9gAoTmpSy3EOyXmXnaWehn
	OVHVqdPAlzG/i1TN5GVaT7w1vQUp+z/PAPLR/4pcWv49ByMZcO5L1jbAw3EY+fagrcAGxKvG+zY4u
	tEUwqGvi4jsJ1Zx9TgfKGf8bCMyaAtwCwR3SniIQrWpY9FTFVeaO2iQS1WMf9Ph6wXYfaGFeBkGiB
	M1rFD1wiJO8mXuvvCaURroErpOiK1hCsO01X3wFPPbY+t0HGdQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1tgmsy-00FzLO-1o;
	Sat, 08 Feb 2025 16:36:48 +0100
Message-ID: <f50c7b22-2b31-47d2-8353-41d80f5241c1@leemhuis.info>
Date: Sat, 8 Feb 2025 16:36:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
 <20250207090518.GE24886@pendragon.ideasonboard.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <20250207090518.GE24886@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1739029021;64fc3945;
X-HE-SMSGID: 1tgmsy-00FzLO-1o

On 07.02.25 10:05, Laurent Pinchart wrote:
> Thank you for the patch.

Thx for saying that!

> On Thu, Feb 06, 2025 at 03:30:10PM +0100, Thorsten Leemhuis wrote:
>> Point out that explicit permission is usually needed to tag other people
>> in changes, but mention that implicit permission can be sufficient in
>> certain cases. This fixes slight inconsistencies between Reported-by:
>> and Suggested-by: and makes the usage more intuitive.
>>
>> While at it, explicitly mention the dangers of our bugzilla instance, as
>> it makes it easy to forget that email addresses visible there are only
>> shown to logged-in users.
>>
>> The latter is not a theoretical issue, as one maintainer mentioned that
>> his employer received a EU GDPR (general data protection regulation)
>> complaint after exposing a email address used in bugzilla through a tag
>> in a patch description.
> [...]
>> -Be careful in the addition of tags to your patches, as only Cc: is appropriate
>> -for addition without the explicit permission of the person named; using
>> -Reported-by: is fine most of the time as well, but ask for permission if
>> -the bug was reported in private.
>> +Be careful in the addition of the aforementioned tags to your patches, as all
>> +except for Cc:, Reported-by:, and Suggested-by: need explicit permission of the
>> +person named. For those three implicit permission is sufficient if the person
>> +contributed to the Linux kernel using that name and email address according
>> +to the lore archives or the commit history -- and in case of Reported-by:
>> +and Suggested-by: did the reporting or suggestion in public. Note,
>> +bugzilla.kernel.org is a public place in this sense, but email addresses
>> +used there are private; so do not expose them in tags, unless the person
>> +used them in earlier contributions.
> 
> I like this text very much, it's concise and clear.

Glad to hear!

> My only possible
> concern is that "explicit permission" isn't defined. I assume that
> someone sendubg a Reviewed-by or Acked-by tag in a public mail thread
> counts as permission, but strictly speaking it's not explicit.
> 
> Regardless of that, I think we can clarify what explicit permission
> means in a follow-up patch. If you would like to merge this one as-is,

Hmmmm. Not totally sure that I exactly understand what you mean, but I
think I see it. But I'm not sure how to solve that. Would simply
dropping the "explicit" solve this? Or should I start the section like this:

""
Be careful in the addition of the aforementioned tags to your patches,
almost all need permission by the person named; one can be assumed if
the person provided that tag in a reply or acknowledged its inclusion
after being made aware that name and email address will end up in public
places where they can't be removed.

The tags Cc:, Reported-by:, and Suggested-by: are an exception: for
those three implicit permission is sufficient, ...
"""

Ciao, Thorsten
