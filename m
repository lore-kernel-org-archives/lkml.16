Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF21BCA1B;
	Thu, 30 Jan 2025 23:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738278616; cv=none; b=gkxW8EnKA06M8YRFv0P2BF2tDQ3/V9liSKmqFxcGab/y6WAw0SFDwMXuQkvggkvZgZNZB+3QFVAJKUMnxPkPB/ntMIyvjVRThIAD0oVZvSPxly6jA5MzOd9rgUQHTBqxgrYtuJ8QHnGXjrBhCqerETEBcSmX9Wct0zxzk6qlDck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738278616; c=relaxed/simple;
	bh=YAdNwrQg3KfujGA4xTvnJ7thNZJr6kjNDjOP7T28GTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJdb9LF7SVmopxN5EdCGIwbIwdrzzv/LnC1WuDo9XakQVlawU8BlWvhpggEA4P0SNm0OH7EBYJb5NuyUrtCHHDtLY/F1rosA7LTdZZhO2v849N6ilpOvvMf55QiJCB1vR0jjnQsHe+z6G/iaQI6mvNF4plQrlxbHaod7wEoitdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0H1/MAI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0H1/MAI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436281c8a38so9917535e9.3;
        Thu, 30 Jan 2025 15:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738278612; x=1738883412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYSfrspZpcalFQy7DGPov9HLaRO54OMeKc3JEmAB2IM=;
        b=G0H1/MAIUy2jmNAJN5e9r03LhDLVqqRWK4isuspF9xq2MfgkUYxqZlKYgdwEPqhNNH
         NgotRQPCZcPA5qiajMuWhzfeiMMi9AICpI+SDskdAwKiA3L57WB6jUHVsPHkjyJKmyKx
         1fkLAlS92g//OpGYALsrNAt3XyXMjMbFNX83+9ya/RlQw0+9aIuk4Hf239sNK4QnNng+
         lxe09lcTraD1n6QgZTDN5UaspDOX0mXCe6ustQtdiuQRhVDiLcIM4xyS0j34pc+gsELl
         YQUCKepuqt3wm7kDwQ3mXXI+dyYA0KRgz2r0crnscvHvGn9JsFe7rMLxW81UgN3Owgxg
         jKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738278612; x=1738883412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYSfrspZpcalFQy7DGPov9HLaRO54OMeKc3JEmAB2IM=;
        b=vgvJ9I0aiEa/vcuHRX9oyb46ivwsEERSYwL6nxjmCfhlipPHSBSfi+V0w7nh4lkZ1d
         TkcFcTjF9hzxtg6CvUuXStQg6mqPkpBxB/KsXSrjCoAW0bDsuybJb/XJFacjT/zzyG1f
         xgVNuaYnFdcgsQFi4NF/I3iRmZTsqlPOFAf0ma+U/P59kkmxgAr6H7prdEPLBZfwAsKI
         cD305a5nM3iaasyFk1NZ7JvXelQkRD/NHca8qCrjrlL7eVlgSCsNYLMB6v+OQwlP2UGA
         Nl2TrMC3o49dkNUuaf0YpDBy/gc1Axu4Hyd9DkbkmW0bTthXczOzMQZG+vzVLle2QWYP
         z6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+XPthFhEFPII37diJ8lc04lUdaaMrOXqe09fgZQHq8ShgNjK72GL66h1idZUnwXL4vtceycO5cIU=@vger.kernel.org, AJvYcCXKiAe+jfPxtF7S8fYUaE+ItNHaZWXI2CHz/R4R3pBJIgfYX1NRCGgaCBiphkx3zH1rispbP+96z49aRSxo@vger.kernel.org
X-Gm-Message-State: AOJu0YwThygq3EB7ObIZnITyCF1dujYCzTZJbxbUL3MBZuA+eWSQjSAY
	PB37/VUFMVeSQbQpy94PcBjovQS7F8pyInzH1iRMME+kXX2WvuQ4vaqsTtIrF1o=
X-Gm-Gg: ASbGncstqz4oPqaSGUBRW5xAn294yR+sMZ7Z4r9CUAbyjEd1hsdhTFioktS1419pSYH
	V49F3hZGh/4kerhMjFC5/8oKZ1ifqKWKHJI+9lCuLeXhSqX5qM5WEozlPLuZ2gR07HXljHUC/ua
	GX07/EcR64KRzwyyHywM0452cpeYxmS4FnBfefZQjotRd/q83PISKDYVoTiLSw0cc4cUgA40nPz
	qLkxoM2Q71rI2b5gTjmXQv8ThyxsY3WU7idRA7JqSRca1MAClLLvcMRQbIBuCZAoVhtU+Zvn7LO
	VmQ6e9v1d+RHBB1eiNyVT5mrvvM1
X-Google-Smtp-Source: AGHT+IGHatIBqExc2QjMBxlMrxHJ7JJTUTvxVUuF1NV9bbMeXjnFByTNOWJSOdIRyooq55YwHK2bRg==
X-Received: by 2002:a05:600c:3d9b:b0:434:effb:9f8a with SMTP id 5b1f17b1804b1-438dc3c3554mr87706875e9.15.1738278612188;
        Thu, 30 Jan 2025 15:10:12 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc263f0sm72338575e9.9.2025.01.30.15.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 15:10:11 -0800 (PST)
Message-ID: <0414bdb1-2258-4164-af60-c40118d0d7f4@gmail.com>
Date: Fri, 31 Jan 2025 00:10:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.25 11:40 PM, Christian Schrefl wrote:
> This commit allows building ARMv7 kernels with Rust support.
> 
> The rust core library expects some __eabi_... functions
> that are not implemented in the kernel.
> Those functions are some float operations and __aeabi_uldivmod.
> For now those are implemented with define_panicking_intrinsics!.
> 
> This is based on the code by Sven Van Asbroeck from the original
> rust branch and inspired by the AArch version by Jamie Cunliffe.
> 
> I have tested the rust samples and a custom simple MMIO module
> on hardware (De1SoC FPGA + Arm A9 CPU).
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
> I've updated my Rust ARMv7 patches. 
> Not much has changed since v2 but I want to send it out again
> before sending it to Russell's ARM patch tracker, since I should
> hopefully have more time to work on this again.
> 
> I'm not sure how exactly the patch tracker works, I assume I
> should just sent it to the tracker once all review comments are 
> addressed and it has sat in the mailing list for some time? 
> 
> I've kept the Tags from v2 since nothing signifficant has changed,
> I hope thats fine with everyone.
> ---

I have now submitted this as:
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9441/1

I hope I've done that correctly.

Cheers
Christian
