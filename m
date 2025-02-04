Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35239215F7F;
	Tue,  4 Feb 2025 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690092; cv=none; b=DO7TXA1eu6RtTZQZhHWzyJnhwImtzsHSPi6VilNrS/h+2S3kvjgwdCugHxfzpG74V4z5L5e4JY6mKcEKQpplTgfWbX5clGopYBh3XKg1KeHKrNDBytHHWpcQFj/sxYNWfEMBTWXA9Uz6yiO874vaHltyDp19mXoMXKttqlFYlDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690092; c=relaxed/simple;
	bh=wt8dUqOM1Pf7PssIZKx4k8SgvyNA49AD1sqfWixn88Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WWv1WploloZrhT9JLxM+7z8lMIprN8p7jOzA8EwGLEibUb7MiF/VJSXGSxaxkqwmT1qVjuXQDubweBuBKvg9c/MWHMhUiM8Y1ZjlSQWSASkkUN8CfJi6yaRdy95TCH88QWAcbJ+zFtXvPiQ9JprP5/C8WuhP4zmi9UMkne3KqvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=X3PA4dlF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="X3PA4dlF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5AA96404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738690089; bh=7AGHFadaMcYPp8oArYa7ZSwoO/SsUuUqSlNJyHK9y1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X3PA4dlF7bRicgSYtC549Yx6JTZHewJnJ87S0tb19/CJwhSsJ3G4FopXbzMnfd9EX
	 0sHwS/8py3d5CwRfF6WIIUA0sQnJ/ZYL7/y6rjGPK9NZjItBE5hjDx9XXg8OSU5kbN
	 xEYeBZ4P1y+Bfzx9WrYYog+pQdPBsqirCJhOOKeWTSgnpFkhfZykS5wxfSIM8GveAT
	 61vBG7KIVq7/j9Lsez2EVkVvu7WphZ6n1GB2KTuVolsKDMpIdKr0xfW35HLg8sMwBz
	 deEWrnaTJxkdMBm/dL2gv7xRPpwS8Ige+AesDnRukuFkOBaIs9zzVZYx4SiAk4h9AC
	 aEIxlpXistB2w==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5AA96404FA;
	Tue,  4 Feb 2025 17:28:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [RFC 1/6] scripts/get_abi.py: make it backward-compatible with
 Python 3.6
In-Reply-To: <6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
 <6d74360f8cdabeb0bf628a6e870d10e134f396f0.1738166451.git.mchehab+huawei@kernel.org>
Date: Tue, 04 Feb 2025 10:28:08 -0700
Message-ID: <87r04dei1j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Despite being introduced on Python 3.6, the original implementation
> was too limited: it doesn't accept anything but the argument.

The original implementation *of f-strings* ?

> Even on python 3.10.12, support was still limited, as more complex
> operations cause SyntaxError:
>
> 	Exception occurred:
> 	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
> 	    from get_abi import AbiParser
> 	  File ".../linux/scripts/get_abi.py", line 525
> 	    msg += f"{part}\n{"-" * len(part)}\n\n"
>                        ^
> 	SyntaxError: f-string: expecting '}'
>
> Replace f-strings by normal string concatenation when it doesn't
> work on Python 3.6.
>
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

So I'm curious ... later in the series, you make 3.9 the minimal version
for the kernel.  Given that, is there value in adding compatibility for
older versions here?

Thanks,

jon
