Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F4221FB7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704410; cv=none; b=TGzWMqkcmh1fW/OtOsUh1NagL+vzygPzXgtPbtXGUjVCdxXEfITOYDouolLMnHzKq8rN/DP1qFQPMCUxMBgPkhOgLQ1vOQbDp8xPSAH6km5cNpL37zwBm1vKvQL+Qf1RwSCTi7NtIRVw61MBQI49E9Y79s846uFk5AxDCv+45Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704410; c=relaxed/simple;
	bh=Fx9zrUTk3i8S1DAJFlFt9wfUwkt0xKS/Y7jdzQ/hcQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eog93/3QUcEtzPsd2C/zlnWfxEUti0boV3FTCEEVKIKstE5hnc8RfwQaarpVD4jf3AnmEBPyV1sxM4CgjMj0tu4pxGjXXif2seV10Z1dYhFUN4eWUj7hpXbuzsNn6cju+X0R094XReaFZ0lDS2lskFlQiaeCmwS8Ed7EXIzVpAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1n4X3MHN; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1n4X3MHN"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85e15dc801aso74450539f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746704407; x=1747309207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gCgDIEvIXJ5HjkEoan0OBOu/905mhsNatvjj6Ubkh0=;
        b=1n4X3MHNci+FmI0NH/1OGC3AVHX6Nlx2xFPTWjJRqDLQ4Ru1QsnOai4yo3oPbpUzGf
         EFiDOHXk7jn0tW7QXV3aiJhhiai4rHO2Py8e0BtW2xSnfz9tl8t7Qt1NyeVpNHvrqUZg
         h3FJA+141YBdjpLIZ/Gji6bJIH+cTvN+y2Ce5JhcES540B6djvp7CWJ2zY1gN8T5LmKs
         fL3xzuJGHt1J7j7WjvSbk3ExrWP2lnRtNBH1fRP5dLKjRo+NC1/DMON0zaZ+JSSeiDBt
         CU6IuwgFrzTGoRBnSID09Cud7iDG830VMVYzIZxXhhdplG6mBJ2ARlXCI9Z/Xu42vwly
         3A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704407; x=1747309207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gCgDIEvIXJ5HjkEoan0OBOu/905mhsNatvjj6Ubkh0=;
        b=UtL3gM0Si+8ZK0a6OmWI2m9CoC2ldu8za8+KzuQUNfav1RKlhThHZxus46dYU+Ll4B
         T4k1WHB9Jj+9KnMIiYp+CG9L/bCO19UiTxGtbvsViXZDJdY1ygxxZavmdEKs2++EjE2u
         rjpAz6TLj8WDiS44ZCEm6rg7jdJbSnUam/yCuDUnERIQLcNEIdMLAf89b+7k6bwD8iLO
         wlnSChPJoQa5kXKlCrCJIS9mSZBkwsVU20WJ15dd3FTXcN/LeqKtBFVfZk0+m/WhGJ0O
         rZFvG6bdN8k8A3OrLuYqyRJr+hph8ocmMDLuCyJDBQgLdS+Ntm38CxxOlDW1blLbxT+V
         YIhA==
X-Forwarded-Encrypted: i=1; AJvYcCXJneC6G4tSTwyl0K6kwzSIxsCdL/FwTaSSSdBlxs3nue2cHtQ2ggmHIbTmrN2ltrATYOuRJpZWjkbunM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpDoaVoCxTnSAHC2trfuDI/PBRCUMN1z8Q87P1xHAgY9jOKu1H
	5G46M0tnmVja1b0m2sCXCO5+sYNzBRyx0a7gKgWVa9SU7c+w4+5jmHJg+eNjaHM=
X-Gm-Gg: ASbGncsFQz9ZGHLdji5irzag3KJHjxofwOd1m9j8Q64QaGFB2MJy/lKHbJAU8UFhE8a
	IGdwhrptOoEnUE4IF7LhRwJTBE7g10DfE82n2G+uKEAYGVWBSeqegUs1uIXAR93tV9TtzCdrjKL
	BxeobJXb2SNMOmFf7jRB2lzAMOE86kWpSyvJtKLZk4te4TlMHtNYB5VBR/JV+kgGUthMZhdNx7I
	UOHICmLttn3beEvBVqCcwl5q6+avcr8OuaLfpereV+ljRXYiRu+dapbL388nFrlkGmbSwrY5kn0
	UNJZLZ/AAUXnyRcfT366ZgNV+Isjep78aFZe8/7bwJHx01ihaHPhgiBwG7tNDXTx6qWJ090SOhW
	5zuBd
X-Google-Smtp-Source: AGHT+IEgQbpeES+TFJhbzId8HdAIkJfo3yOl1pgxcIDfMs+gyDWkgbwTLja1UcaM/Qo0ZByBfH3ZrA==
X-Received: by 2002:a05:6e02:3805:b0:3a7:88f2:cfa9 with SMTP id e9e14a558f8ab-3da7390856dmr72096535ab.11.1746704406737;
        Thu, 08 May 2025 04:40:06 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8e1f7sm3145496173.121.2025.05.08.04.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:40:06 -0700 (PDT)
Message-ID: <d6649f6f-574d-4ba6-8db7-d3087f421386@riscstar.com>
Date: Thu, 8 May 2025 06:40:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] soc: spacemit: create a header for clock/reset
 registers
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-3-elder@riscstar.com> <aBwwBSfnkw6XUOLA@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBwwBSfnkw6XUOLA@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 11:16 PM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:33PM -0500, Alex Elder wrote:
>> Move the definitions of register offsets and fields used by the SpacemiT
>> K1 SoC CCUs into a separate header file, so that they can be shared by
>> the reset driver that will be found under drivers/reset.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 111 +--------------------------------
>>   include/soc/spacemit/ccu_k1.h | 113 ++++++++++++++++++++++++++++++++++
> 
> CCU is abbreviated from "clock controller unit" thus the filename seems
> a little strange to me. Will k1-syscon.h be a better name? We could put
> all syscon registers together when introducing the power-domain driver
> later, which could provide an overall view of register layout.

I'm OK with making that change.

To me the "CCU" was the that IP block that offered clock and
reset controls (and maybe a few other things?).  But renaming
it, given we're separating the functionality more clearly,
is pretty reasonable.

Thanks.

					-Alex

>>   2 files changed, 114 insertions(+), 110 deletions(-)
>>   create mode 100644 include/soc/spacemit/ccu_k1.h
> 
> Best regards,
> Haylen Chu

