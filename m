Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4B1A841C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023221; cv=none; b=KmUjjbfigrP8jo58beEg2weLf1HVYY5ghx+60fXMPkAsNV45W8I7EoN521b7WSFLd5/MA5pwVNyX3IHt4iiektXUyv8L+J0wKead5lNb7dl3IPvXEiXEl/4dhtsfb5NqHCzB7hNda8esjUNXhTr8TnU+wZdY/6fzoZv6wWLb7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023221; c=relaxed/simple;
	bh=F3Gfj/8qYq2Rx/ZiVbGxfeH54gz4Uh4JCqyFFdG53B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mek13bbHGqV/5ZI+lwhkVSxbc+buO3HeIFbuqCW48gXRzCqXxvmt1CcZt9ovfLIxw6Y45BCYlUs7cxOrKdrtrxiVVOLi868ATI42JtTtntMB7TMwYtGj6h665+8fADFbEM+q4UQO2BkzVjhz/HTKj0DamaR7bkAXvtT26xrpT3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5tlWN9k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5tlWN9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4805BC4CEED;
	Fri, 27 Jun 2025 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751023221;
	bh=F3Gfj/8qYq2Rx/ZiVbGxfeH54gz4Uh4JCqyFFdG53B0=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l5tlWN9kz27grVZs5GqFo4rcYWpQJ2dHSrr7Ff3IMUPgKfK3vfXzFEcJAPJlPv2yY
	 cq1o+gf3FD2JIoLb/jSYF0lQhlC4z5mDz3RijUp4FUkp0dimM1BbWqz/IG7z6PLp3H
	 tpeMEneF5my3YRkhiiWLM22nmYCcibbu+vo0VPfk9Io/Ildy9mKUCr1oA5+rU4p9sb
	 sff4XLZWVl3ZZ8fpkRHJD2V6uZZpElkACq3vhhbuoE2ET9rhH7mwIOt3AOd7TOLlpv
	 KrufXO72WIZWrwFm2rupJkuuW5A3U0piCSGRPnX4ESvbtgNNqbrEQW7FrLA5lEbC8G
	 n5Nlwm1X76hkA==
Message-ID: <44e9c75f-7573-4486-9b91-70f02fd15335@kernel.org>
Date: Fri, 27 Jun 2025 13:20:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH] scripts/gdb: fix mount flags for lx-symbols
To: Brendan Jackman <jackmanb@google.com>
Cc: brauner@kernel.org, da.gomez@samsung.com, jan.kiszka@siemens.com,
 kbingham@kernel.org, linux-kernel@vger.kernel.org,
 stephen.s.brennan@oracle.com
References: <20250619-fix-gdb-lx-mnt-v1-1-ad2ba742048a@samsung.com>
 <20250627101734.1287929-1-jackmanb@google.com>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <20250627101734.1287929-1-jackmanb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27/06/2025 12.17, Brendan Jackman wrote:
>> Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
> 
> Thanks for this!
> 
> Tested-by: Brendan Jackman <jackmanb@google.com>
My patch is a duplicate of this:
https://lore.kernel.org/all/20250618134629.25700-2-johannes@sipsolutions.net/T/#u

Already in linux-next with commit id a333d056e276 ("scripts: gdb: move MNT_*
constants to gdb-parsed").

And here another duplicate:
https://lore.kernel.org/all/20250601055027.3661480-1-tony.ambardar@gmail.com/

Sorry for the confusion and extra noise.
