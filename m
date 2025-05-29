Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7721A92F;
	Thu, 29 May 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748528573; cv=none; b=HAvZ5df6jOIN+eEPBMjFde5Zlj7sxPpWedXgCUV/xkx5+hEQmu5EQP4EVfDW1eQbYmFOlXhxVI+6qhOKwokhwisorom8B21CXbVrXP8ijx4Cr8tJqHHetNUmtLTYwTzXEJu5GYxHVZPAoo8wyNyez78L3eJN9C5vxTgBogbApWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748528573; c=relaxed/simple;
	bh=qiyOkuxkDLaVuva6le+oFT4pru956z5G6GA0i0W+tZw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JehwVddRWBSXlRBHT/EBdBxHe5WL5oGQnfgIn/wdLv/V7EHrw1vQSrwUWwOXg+91E+4FylsorQOYzkHb6xxHxAy5Xpn3Y/V8vEgm0wxUCDBiyzqUCXzbxHMxjAfbuw2go3bE5Ecd7cdZjcb3kWTg2L1l6g0h6vn8AC+LawxNd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=KJTsZ9E1; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="KJTsZ9E1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OXDybIQBmXMpeFMEFGOD4VW3cLSDlCP2Z3a8Ye6iNLQ=; b=KJTsZ9E19rLZ2Hv0Doq26jf+WW
	o52fpbKB0fiTIAbsxiZ13lh5/lA+MS9t0KSwucv6tWlDlUjajdeoNR/u5CpA1qSpgxMd5UJcIgY4d
	0xQXXvzq6cG/CU4Ya10+ei++/YfW5XZlM/uFcKAFrl1WSckgwVHVceah8WQhZGtAvupgg/3rHmNNt
	IwFhfoPtpfLnRoGvgjSzZpG/Zr7kIoLigu+3+FDoOyuYG4v+ZIJBh1aM8fmKQR+rql1lKu4QdyJgE
	MLtRHupisWMRKWWJIxBapdpGYU7vWxiESTRTGcYo4pSzZqLJAdYY7Wpkr6Rbg8EvOHCDaRGLF7TjF
	0CX8Ywkg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1uKdkG-000EUE-2J;
	Thu, 29 May 2025 15:56:32 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1uKdkF-000AvE-2P;
	Thu, 29 May 2025 15:56:32 +0200
Message-ID: <21cc4282-ca3d-49a5-809f-96351662ba41@computerix.info>
Date: Thu, 29 May 2025 15:56:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Klaus Kusche <klaus.kusche@computerix.info>
Subject: 6.15.0: objtool "unexpected end of section" errors with clang 20.1.5
 and lto
To: Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>
References: <b248a0fb-e182-42e3-abf5-83945ee992f6@computerix.info>
 <20250113214122.g4lluwpzj3tnamx3@jpoimboe>
 <20250113235835.vqgvb7cdspksy5dn@jpoimboe> <20250114095159.GA1580513@ax162>
Content-Language: en-US
In-Reply-To: <20250114095159.GA1580513@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: klaus.kusche@computerix.info
X-Virus-Scanned: Clear (ClamAV 1.0.7/27652/Thu May 29 10:46:15 2025)


Hello,

Compiling 6.15.0 with clang 20.1.5 and full lto, 
I got several error messages "unexpected end of section".

See https://bugzilla.kernel.org/show_bug.cgi?id=220174

(kernel .config attached to bugzilla bug)

Klaus Kusche
