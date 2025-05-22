Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA0E178CC8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936401; cv=none; b=Zi/Of0WBQDexpoMr55PpDqJxRGPuMxRxyOPQ1Yni0sF0WCq6Kq3TLYiUNDSegsJuoX+LMBwsvtvYdUqXajZnBkm8kZMnOrjqDHOMo9GahlMqag+8/rzW73TeKdrXgMDhSKt/ATkocUkTwx4ITq0IUhn7rOVnaku5VY6g2bvadWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936401; c=relaxed/simple;
	bh=2DqPO9m+tgbAe4Ckhbo5jvNcDR5GpfJRlEmFsuvh7eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOn68nkRN1zWxDXN/ow5NkLv7Y2pWaY5QhVKZXz/Mb67dmscpIr1e03eLAbUlnyoS3EYvHfQ0HgCIRhsQs2MOsM3YpDFlVEqOdHfC0X7q2SPHVIMKI01YURv5QFYiZjdNXmA/rHHQy4rTGu4nNNjzhFusstt+RcqjhkVE/XCpOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=APNh+yyk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="APNh+yyk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acacb8743a7so27396466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747936398; x=1748541198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2DqPO9m+tgbAe4Ckhbo5jvNcDR5GpfJRlEmFsuvh7eA=;
        b=APNh+yykN5WzXSd8MGJYYl6QU6PrVRcvrfj8LopRumsow4rZFSED+qKGIofQ2vnuE5
         Wi4fDMwxIaI/N28UTXBatH4arAoz9BG7wLBq6kxAaujLtlJ1e/9NKU7yVSmEWpt3o8ck
         Tr8kXJ9ctZ4Z0Fly08iffuQDGA/GldyA+I77Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936398; x=1748541198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DqPO9m+tgbAe4Ckhbo5jvNcDR5GpfJRlEmFsuvh7eA=;
        b=oLJAETLTFoKp66aadBxSrw4QMPU0jTcYFsmODOjt6yDsh2x/D/oZPNe1S9epIQa+iD
         OVZZPTZBuiLvwq5RAmAtTYe0k4AMgF91rH2kzeY94K6hh74olh+IO07pPRYXB8REUrMb
         PzZYt2cRSNvTBxgD+5Jrtu5b9yAQEkJ+a9632w/BZAyzwHKE6CP15CO5I9uv18W2s2yC
         PxTEp2C0sJ682qlp+oBQ5Z+YBCkPCUVZBlrFRB9S/g/arZ3cJTzA+2f/afzmxTOkGcC/
         gtPxERlxV6GFnhpaXk75dtQ5uQ5TqzJl475kMGosZ9WAfFBh43JITnpHxoW1HoXYmWOz
         /kMA==
X-Forwarded-Encrypted: i=1; AJvYcCW1PYNgMQt8uh68cFRY8Q4/joHma+DNuGiZPf3YOHbYjyR/gZWg/7ngyM0/VTGGeYZIbc40io9y2bNb838=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNt4W3bVBmLk8Hvum4jeqfXKOgzI/QI0MiVJBZfbXpSbQnCew
	b+NdDfBTlnQcVjs09k2qmuk7j374aoT8VZb85AntM/QlUoSN2FR2DIWWgaXjtm7qXTo=
X-Gm-Gg: ASbGncsTDzRrdELS//FhKeTix22Cbmp51d4ldn19VkyygwQWW8te0eCZ1AQ4PoHaMlv
	fb76C3FtiAEESx/cXwHdIg1r1uNGO7uwb5xd/wUsDXU3CqTFxYlL0NAdl/SqwCltibfYi3/CUwd
	XuUTcR7VxU6ehX/f8cgW0K/hYGM7OSWKx3r7Re+ftbHiFWoaydGZ2IP87lMAz3qOGBx9fSyjiFV
	IAww9XEglxyNl8Dqd+E1+UIe6c+R/vi5seXD1YDPhP2RaRsGOsSe0zCVKfbGfCXLbLd4mxvdWuh
	pqDKiJV7Rm21R5kItAKgZGnCRPeAFPLY0fX097zQJ+TWqwT9/AF9jQG3xVvBE/BGh7MRmE6S+I3
	0wq0kARKxp2xUFouol5zOhw44ma4=
X-Google-Smtp-Source: AGHT+IFLMQBu1Plj4cfIFHd3VJU8a91RL1azB4BMNmVoJ1voM+eiW3mvxk1mnmsU/iC8ey7cqZj44A==
X-Received: by 2002:a17:907:2d29:b0:ad5:4737:f030 with SMTP id a640c23a62f3a-ad64e2887c6mr37969266b.1.1747936398314;
        Thu, 22 May 2025 10:53:18 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4b6d18sm1101141966b.153.2025.05.22.10.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:53:17 -0700 (PDT)
Message-ID: <ad8d3a12-25f3-4d57-8f34-950b7967f92b@citrix.com>
Date: Thu, 22 May 2025 18:53:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/fred/signal: Prevent single-step upon ERETU
 completion
To: Dave Hansen <dave.hansen@intel.com>, "Xin Li (Intel)" <xin@zytor.com>,
 linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 peterz@infradead.org, stable@vger.kernel.org
References: <20250522171754.3082061-1-xin@zytor.com>
 <e4f1120b-0bff-4f01-8fe7-5e394a254020@intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e4f1120b-0bff-4f01-8fe7-5e394a254020@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 6:22 pm, Dave Hansen wrote:
> On 5/22/25 10:17, Xin Li (Intel) wrote:
>> Clear the software event flag in the augmented SS to prevent infinite
>> SIGTRAP handler loop if TF is used without an external debugger.
> Do you have a test case for this? It seems like the kind of thing we'd
> want in selftests/.

Hmm.

This was a behaviour intentionally changed in FRED so traps wouldn't get
lost if an exception where to occur.

What precise case is triggering this?

~Andrew
