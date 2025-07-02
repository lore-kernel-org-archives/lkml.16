Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0BB3196BF;
	Wed,  2 Jul 2025 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470878; cv=none; b=X+LXHJG617/MpKJK9bcE2xmmmplVOwg0rwBXJrMkNXHrg/y88OkQlsify88VutOK7kFF2N8dKUg4HaqhJf4e0XdrHRf5E4WAW6Duu98xZAHn/72smvEvGizHWg7sd1PuOY0AdxdsqhCKh3HmCOU1t35cn3vH3XSerxqxBoZvs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470878; c=relaxed/simple;
	bh=08XZkzH/rp3F/lACfJBlpUicfjBs9yAbgK7BUXoRwbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OM9wkR6uXJPhvqAJxe/wKAK45FXH+zenPRw0WBqYFeUtzO8s2pqDsadBcYs+jPc+YUk9NekXE/cqcGFW9kdimlT4Om1OLnLtand8wQccyyrYbA+jtCUzDx+LEDcnzCieYGZdj+l+NAxd7GIDVpKkjcSDD6tfKpdv4xUwnnKTRUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GvxBmAeH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GvxBmAeH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C4A99406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751470876; bh=Ks7fMMTsFmVFfdfh7mElmQhkZIoo5Ph9lRKADq3EZ2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GvxBmAeHdiuj+iIyAFIZIDyknnrBbh8bF0HanFL8xXthfH6d/zTHHPkcR6tiqk3OX
	 rlfm5KoHMNe/mm0yJANtdpJ13+bMVTfEp2NHyTaeJRVeL1t1iHgpqnB1pB+T4T3IaG
	 gE13NgrmoFkylf9FFnGFhWB7cF5T+YjQO9pyAZxzE0bnnCVK7rImNIP/0eCPYBYScx
	 CyxrN+scMb227WLW3wcpcvru747/QXf506IToF9JX019bVdT2mbDsNESd7jTb38/wm
	 K/cjYGorNPNRd8S4uisoe1ToLCMZKklLUmcXeDY4rGtRbC9KQUigHwWyFjcNLgNcFH
	 Q2xOql4NCDFDg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C4A99406FA;
	Wed,  2 Jul 2025 15:41:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DOC ML
 <linux-doc@vger.kernel.org>, KERNEL ML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: standardize git.kernel.org URLs
In-Reply-To: <02ffd0a2-3036-475c-9e23-55d706eec7ea@gmail.com>
References: <20250625142017.237949-1-xose.vazquez@gmail.com>
 <87a55vag0l.fsf@trenco.lwn.net>
 <02ffd0a2-3036-475c-9e23-55d706eec7ea@gmail.com>
Date: Wed, 02 Jul 2025 09:41:15 -0600
Message-ID: <87ikkapplw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Xose Vazquez Perez <xose.vazquez@gmail.com> writes:

> On 6/25/25 7:27 PM, Jonathan Corbet wrote:
>
>> Xose Vazquez Perez <xose.vazquez@gmail.com> writes:
>> 
>>> replace https: with git:, delete trailing /, and identify repos as "git"
>>>
>>> Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: DOC ML <linux-doc@vger.kernel.org> (open list:DOCUMENTATION)
>>> Cc: KERNEL ML <linux-kernel@vger.kernel.org> (open list)
>>> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
>>> ---
>>>   MAINTAINERS | 50 +++++++++++++++++++++++++-------------------------
>>>   1 file changed, 25 insertions(+), 25 deletions(-)
>
>> So ... we're changing GitHub URLs from git: to https:, and Gitlab URLs
>> from https: to git:?
>> 
>> Certainly we want to fix URLs that are broken, but is there any real
>> reason to churn up the MAINTAINERS file to "fix" URLs that work?
>
> The reason was to be *consistent* with the rest of the entries.
> Because most of them(380) are using git:, vs 22 for https:

Why are we concerned about consistency here?

As you will have observed with your other patch, wholesale changes to a
file like MAINTAINERS lead to merge conflicts.  We can handle those - if
there is a good reason.  I'm not convinced that "consistency" counts as
such.  Let's just let the maintainers present their trees as they wish.

Thanks,

jon
