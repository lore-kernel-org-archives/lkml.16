Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8F190664
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807969; cv=none; b=qBbZqjyNSYtPv21kWM+1IW2O/+JKAAwjBJ4na/b8x8p292avqPkK5RBHy2OhZAdJPCEsjlS13dAlbZcSQslPJzxATAQZh2Bwpg9AamlbycoEJ3CC/n9bwRtTCUGnwheLvLbECZf7m+j78RScyrqnfBnnmbp48VjGC4QSUwv2f4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807969; c=relaxed/simple;
	bh=9plsle3xhilIscWtN80aVYEmbDNhgd7b9z+Vcv7fJNw=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=SDJtxexKUmjYc9KQVfGBCWITGkUpDIu3pd9ZN8mnavI00FPaZtzdZjSY+qVWrPMOIA9OMzL55I4b+kqfeDvJpeSaMYW6H+3mpu7XrfMBJGfGJiWTUEl0dY9SqKQ0YHa/ptATlYPxaJAv8wNVrRyfk7255AAkFiOlnl1S+OW4Jrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Kt4KOY5Q; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Kt4KOY5Q"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d38b84984dso160634485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750807967; x=1751412767; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeW71QVolHQc9XFtJ5X/We4h7FBJVSJJ3quBDuyBJMw=;
        b=Kt4KOY5QvevxhjR31oBXxaQRWgMES/N2zEePcT80JzurJMRrodDmOBCly633i1Lha2
         js7ms6/eS1MpNpdOdOIPxtMUPQoZvPQITSR4B5jd1wSX1cI+mwdqOVSnCxxpFGxyLT1p
         S7BgJASFaDCiPkLmqTKeIwTP1JNFz0NwutStH6FFFebK+S5zgOucd1nCBlyXvLalaNod
         JhaJAgm1iZxaDgxJbR/2wJIhLKGrUdo0iAIUqusuXsPLT1yuquJjN8HNMeLZ558K06/3
         C1vHfsJaVjnaLp8IYUszmGF5tgtw5DvFtXpCvhLOxSJsC/79MSIIbgqRrTWOyjszjjwz
         tIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807967; x=1751412767;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XeW71QVolHQc9XFtJ5X/We4h7FBJVSJJ3quBDuyBJMw=;
        b=kiX/C89rNhHXfX7mDj2IEDgkfnoRZ0wNN/w7E28GU7X4f4yl9iP2fFF/Np7oir36w9
         Z6nxJb2JVwsQcsKAmivlOzmhUH9qUXtPgjr1h96UWl/8ZZGKsj3hs+UWirAGfUJDjEk3
         D6IOwfPtjlEWwSFSEjYV0NGdi6d+WWMHBUGrCu7qQbGd7TMl9RCjqbq6lChB5eik3rV5
         4gIL9GN4Vg8JC7zcQ47ujpATl8yf3Ny6qZ/yXH9EY+6DuKE54oqzCTZx1MxxdsJbrgFI
         FCnWjus/q91olZ/NSX42HQUQ//uDrhbLCmvKn5OOO/pCanrrpduipbnTU/MY0Db6vtND
         owoA==
X-Forwarded-Encrypted: i=1; AJvYcCUXwJdyl4x53OcjpBEvHDc4/MT9daoF9BmHPmw++C/I747aV3/Hm8FmKWm7ZMMwo44go49aCwJxzuWvc6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSzxQYzuDtGjyERSZEVbqXOWCubsVkS8eBYv4X/4ArD1bHfGk
	FmWpbaxmWERU23JiXLX3hd0IpPMSDVzv59ZTLjnfxS5SN42PVnZ95+C7hMAQ5RKvjw==
X-Gm-Gg: ASbGncutPikEv6i3HWLqUzrU7Klpfqzsla7AlhHGMNHTtlU6jYV/lZSYtGhHKaLI7LX
	O7BNhNfygDoqn7LAU4AgASSGl1RgOJphxlBZx38UqJpiCHRAwTXlr0OWyAwZ0NN1oiARcL+QcrC
	C0M72F7/fJA9vYQHeVES3erFfaC/0uUcbZ3KbCE9WjCi8v5xkOcU9R7yFOzYAwttDP9LH2HI3Gw
	SjweZsqkQrk9HOCX6RyM2twub5vR/b1DCarRmBsduhqt5esdHoa5OH6wnyEvvTBnfpH5etAwDhH
	RaS+WQa/4K7lSOu/AiKdCXewtqHBM8bh/J3O6xgHB1bwplh9tX8ZBw5Ul3n5f8s/rpNuwVmFxjv
	x9ALX9QvbhDeFk7YO2cozX77BRPkj6TE=
X-Google-Smtp-Source: AGHT+IFmpTDa3Q7jBgXHoXXWbdTLlDC6+XgCE8TmlP1MQKwjZ0tjBgSroBHg8qJ3R4JT9IeEALD73Q==
X-Received: by 2002:a05:620a:2589:b0:7d0:996f:9c48 with SMTP id af79cd13be357-7d4296c9e4cmr152296385a.9.1750807967077;
        Tue, 24 Jun 2025 16:32:47 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fd09538369sm62013446d6.60.2025.06.24.16.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:32:46 -0700 (PDT)
Date: Tue, 24 Jun 2025 19:32:46 -0400
Message-ID: <c6da4c0e398d393b06e4257c8beaac3f@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250624_1155/pstg-lib:20250624_1155/pstg-pwork:20250624_1155
From: Paul Moore <paul@paul-moore.com>
To: Yue Haibing <yuehaibing@huawei.com>, <jmorris@namei.org>, <serge@hallyn.com>, <casey@schaufler-ca.com>
Cc: <linux-security-module@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <yuehaibing@huawei.com>
Subject: Re: [PATCH] security: Remove unused declaration cap_mmap_file()
References: <20250624014108.3686460-1-yuehaibing@huawei.com>
In-Reply-To: <20250624014108.3686460-1-yuehaibing@huawei.com>

On Jun 23, 2025 Yue Haibing <yuehaibing@huawei.com> wrote:
> 
> Commit 3f4f1f8a1ab7 ("capabilities: remove cap_mmap_file()")
> removed the implementation but leave declaration.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  include/linux/security.h | 2 --
>  1 file changed, 2 deletions(-)

Merged into lsm/dev, thanks for noticing this and submitting a patch.

--
paul-moore.com
