Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA926AAAA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963085; cv=none; b=po0u7g02FECLRQEemUtZy60j3zUxGH9BIZ+fYaAZFych5EztkSdz8A0OQh1n7jkPsaQQ47Xx7aL9AHhueQ6LQh5CaVhdZuzfkT13SkOcl2M958NcxHAWbsQiB8td8FcNavflj1xS0qCFOQ3TxMq5/URln84fLfUZBBF7hMgDPAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963085; c=relaxed/simple;
	bh=YoNC21QRpvSFFog1sIo2pHLhmbI9Jf1P9KZW35k1YSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYXl0ZeCkHZmCWmwrvJNiO0uPCbUV5ugdkm2ZRHP6H93uHiMJXUkO0J6QNd0FEKXdH+pyCuS4qPdNE2N0q4aTpLLfWmWGltYQExndIlUrBNIoT5cgMtWk7lrNg9Ls0ac4Ocj053E/BaKBmOvEV/TRqS+IQKCr5B8qlW7wjlhN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ad+aQ2Dk; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ad+aQ2Dk"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-861b1f04b99so212926939f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745963082; x=1746567882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=ad+aQ2Dk9evFMlsUNRG1mNIaW6Lfx/SaAxPYLDoVPK1uxuq7hrZy/dDLR/8Jwp5r0U
         u36V7skpZGNSvLdu/ptpNwh64XSD6GVmvNqCAp0AftDfqE/3UyHvkM+7biuUafbNTNWm
         F/10nSnjBCKZXVm2HMYCKlo/QHZJBuQZy5Jp+O3ujKVG7ru965qyaWWBCHl6Ku4H9IKW
         UaGJqqKBXU80TMxjClFQs4zkwOycP+eARVxunceFx6Attr7Q2RO/DdkWK5XaT2G9vDLI
         y7nCBcFQkNKifuOvWudYxrABJ8q8pUz/tRDHFy7hvXWl7YoLaF0JPLg0diszkBqPPcxR
         euig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963082; x=1746567882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=IY6bK+JqnmwoC+zJbxdlGUzcQISighm5MMETVktSHWiFRYHSR0CesU7Oz3/Td6AuI2
         QeGUkpO8ilh3oihVx6B8VdHmN6pnZW8r+nadt8UxbJZ6XfAwcjsumCV3xKaztbmEybZE
         hYXG5kP++AsMAC3EjlBImCREnWalJGw1WOpr0gi3mt/G+iWhTqhXH7NUJqycpub1IR/R
         P5MidO1OpXi0oun9vQeIecMz72wsFm1KtRPGigx1rHY5RWMcz43VVD+gtId6eS5Hbqwh
         i4hSe3biZ47XSyYiaTK2DQkhrH9pyf6ZIMIKTeoKUUa+KxzZ63gu4t14eoWeCC/zI3RV
         PWuA==
X-Forwarded-Encrypted: i=1; AJvYcCXpdwih0jgCQ1rW2d2dRxGQ1/iuApGAqC3zOB+WgM11LkdAUDR5itm4MRY4hPMegpEYdagffpgi7gHfflQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJgJp6nxmJtNKQQ+W5xBSyeAOcOw513p1rgVGWCy/zlNJSvkuj
	t7VU3WVGf1qNuJ7KKN1wuZWdNzcELS19cIGo6hGd1Rrf9/mM1UnDOFVvycIOPws=
X-Gm-Gg: ASbGncuF05N+DEtoTQ2Xr49/r3gNdzjwQ7KgbNqiMe9Cl87FQNKt9iQ2eIHUToZzbGi
	tF0vbsj7P9QBnwnz+FeaYucj7BZUtMULsB1XDk255fHCsz935ve8d+chKMbM5kpy8iQXHkc2m2z
	Q5DgMRHd+XgpjltNmDhbY8zW42xZ6E/zLHuMId+L0JfZI6bVK+dlsbXAmFLEDlGAvIt+kYxW6Mo
	OsbC7iOF2KggEKLKYZVdxUYkp/lrgGGYhfiJ7mqXxuGlXXI1yIkISTgup3+Zkvet5ZO1NlarClH
	ihK9LrHjWEtBmHHG7BshiGynVeOaE19gJAeb4TIdZncAtu7aPg1G5NjHaW38GOcvhblY+Bsozzj
	JWvhJ
X-Google-Smtp-Source: AGHT+IHC804e4Eix/ozoxmgLuYyu4h8EDtpYTI9mJ8DxF3AanIg+BgD1P4qKeHonfHu4YLobsYIF/Q==
X-Received: by 2002:a05:6602:400d:b0:85b:577b:37c9 with SMTP id ca18e2360f4ac-86495f0f44emr144632039f.12.1745963082607;
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648c1df315sm42698539f.45.2025.04.29.14.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Message-ID: <8b345c2e-876a-4528-b8f5-fe97abd11cb4@riscstar.com>
Date: Tue, 29 Apr 2025 16:44:40 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
To: Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250418145401.2603648-1-elder@riscstar.com>
 <20250421134218-GYA42923@gentoo>
 <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 3:57 PM, Stephen Boyd wrote:
> Quoting Yixun Lan (2025-04-21 06:42:18)
>> Hi Alex,
>>    I'm good with this version, but would wait a few more days for
>> people to comment before taking them..
>>
>> Hi Philipp,
>>    Since these reset patches [3, 4, 6] are sitting on top of clk driver,
>> I'd assume you're ok with taking them through clk tree? I'd plan to queue
>> them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!
>>
> 
> No. Please put the reset driver in drivers/reset to get proper review
> from reset maintainers. Use the auxiliary bus to do that when the device
> is both a clk and reset controller.

OK.  I'll send v6 that implements things this way.  Thanks.	-Alex
