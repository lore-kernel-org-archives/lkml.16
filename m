Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416EE17C79
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769207; cv=none; b=JexMt/NFYcqUA9uyKO7CM1eUbdJoARmSIXbf/LWb1UxLLQgR0FDQqWv2OWaCPY2pyupqDIXcvM5/9t1Kmp2rgGcVf5v19A6Lh/Jo140JCMzbAGHkrqyhOt6gktkWUKPW0mHdtp4S6U0XaMbZanyPI1WEA3xaBHoPow1hLWLtKsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769207; c=relaxed/simple;
	bh=3q4ePts1uZjt+Ss4oftgi3N2hR8lJ7iR086SwMS8QPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h6mX+yAhC9nobk27eykc9v0WOJkqk7IX/68495XRYsj08081EDNjsioHbS1dVlOE9DBB9EeZik+Ylg0cQRpQEdwLxWozY4sWEkYWlZVlgHOhpHUpq4aMtFDS3FYBCVVyearjRPtsvAnlHArcgPeTwgZsnwIhOt5bWQnPdfNV1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=ApO1p1qe; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="ApO1p1qe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/58c4CnH2Lo1GWkHkqO/BsSaJ1BpEm4lprv0HNFi/+8=; b=ApO1p1qeot0XCWn/nsFk3CZdV1
	3SgKC0EyYE5BnQ3u9hDpJCX6/+SjMV/oHX0EQSVfkMBP0Jf1f2HkqWR0ZnQJzPopTUGFB7agsCfyI
	6Lt446uAZRpm+46vAJzE9ZlFDTzgJEnCctufLLh7gKFsmysqZNTCsJgvaojDidCYhInFQ16GIcMWw
	qUGrBUUAjYPPd3xvHYgzsyg3vqrXGLbC8TFI6Bsg9KEcIOmKPR2l3+m5ieZEUTogloBccrgV5+9w0
	vjovEHvpYHsfxt0oKnTkqcdV8AvyL1AoRO6sfDeod1EcESzbX7s5C6BQ2YVCqe0DFMU9CXxw2SXF2
	+5kMJJbA==;
Received: from [167.98.27.226] (helo=[10.35.6.157])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tfh1C-00CUJH-Fw; Wed, 05 Feb 2025 15:08:46 +0000
Message-ID: <b45aab1e-6d37-4027-9a15-4fa917d806b9@codethink.co.uk>
Date: Wed, 5 Feb 2025 15:08:45 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] riscv: implement user_access_begin and families
To: Charlie Jenkins <charlie@rivosinc.com>,
 Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-2-cyrilbur@tenstorrent.com> <Z4rl8BgoV8tygCn9@ghost>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <Z4rl8BgoV8tygCn9@ghost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 17/01/2025 23:21, Charlie Jenkins wrote:
> On Mon, Nov 18, 2024 at 11:01:09PM +0000, Cyril Bur wrote:
>> From: Jisheng Zhang <jszhang@kernel.org>
>>
>> Currently, when a function like strncpy_from_user() is called,
>> the userspace access protection is disabled and enabled
>> for every word read.
>>
>> By implementing user_access_begin and families, the protection
>> is disabled at the beginning of the copy and enabled at the end.
>>
>> The __inttype macro is borrowed from x86 implementation.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>

If we're doing this, then saving the STATUS.SUM flag is going to
be more important than before. We had this discussion when the
initial user-access with syzbot stress testing turned up.

We partially fixed this by rewriting the ordering in the __put_user
function to stop the 'x' argument being evaluated inside the area
where SUM is enabled, but this is going to make the window of
opportunity of a thread switch much bigger and the bug will just
come back and bite harder.

If you want I can look at re-doing my original patch and resubmitting.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
