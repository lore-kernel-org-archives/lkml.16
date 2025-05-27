Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD2C2ED;
	Tue, 27 May 2025 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350187; cv=none; b=XU/AnYdc7KCh3f6ByNmBwN0JttgqNVQV8f+4OtjBEG6PY/KQT6CO/wZEi1UWECviUNmamLzsV6acWZjYPwTnrdgvo+WJ0oVQbxCRasKsQCNUr9ea/FWC9yIYlgJIeJwzTtmZ3xxOED5aa3KwBYm5eEzGBy3olGlHRkxGb2T9Hhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350187; c=relaxed/simple;
	bh=JDdbpWaEbBQLobrtKgNJXscwFDbI6qDlmZzGoK87irc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XqMcPAwowaA9nt+UlVQ5vu9AG14qICQ68zWSNBdildLYgxZhF/ZjTt1C1AlNDWWtMokKBFtS6nVaOZOf0Pv2OQVoloAZdVln4DbiAVW5OlD7ColudJ0XTQBmk6R6jY1gBm8rmadPZeDIVwbiFlBFFO9woyaJUm3AQ7fMWL06Dbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NA6WJik1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NA6WJik1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8793C4CEE9;
	Tue, 27 May 2025 12:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748350186;
	bh=JDdbpWaEbBQLobrtKgNJXscwFDbI6qDlmZzGoK87irc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=NA6WJik1uJ7cjMhaahN12C7UIXAUyfqHCJDfiQBKPga+zw+Gvvc0Rj901A8gEXsIW
	 vQx/pvCFbWAC+bjvdAi4q73bWEHwkRlbxeW72wDrdvsbC0gBoTgemL1QIiqxnVjhHr
	 w2/3daoXPzzb8Joj3HqfcTrdUxwmLC2zGrUArHLZBuXdDTlkgBk6JO3DxJS1f/wZKr
	 +W4N6yzpObddEeKmatQMz48h0JL8zz47nFzUXuWaE2FTl8bztO1PfSIL/U7dVy2HvX
	 WtAz3LV5kau/DI2t6yiu33y9KFIl7IWBO8Ji8pQggvFQrxLo6Qyiwq3GXGzIed51Cg
	 4w4DVEe0BufgA==
Message-ID: <fa255fb0-40ed-40ae-8d3c-d4f97e422ee7@kernel.org>
Date: Tue, 27 May 2025 14:49:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-1
From: Hans de Goede <hansg@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 PDx86 <platform-driver-x86@vger.kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Sebastian Reichel <sre@kernel.org>
References: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
 <aDWq/U57DO7fMu4K@duo.ucw.cz>
 <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27-May-25 2:47 PM, Hans de Goede wrote:

<snip>

>> 3) The code is not modular in any way, so the crazy API code is mixed
>> with real driver code, making reuse hard.
> 
> This is the first and possibly only driver implementing HID lamparray
> emulation. If we get more then we can factor out common code then, once
> we actually will have some 

Forgot to finish that last sentence, this should be:

This is the first and possibly only driver implementing HID lamparray
emulation. If we get more then we can factor out common code then, once
we actually will have some idea of what commonalities there will be
between drivers emulating a HID lamparray device.

