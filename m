Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065C18C01D;
	Fri, 28 Mar 2025 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160634; cv=none; b=pYEcAPsmPduFA5wzMJ/ikln9jd43xflBJEyivir1N6JzGrNVf/dZ4hf+CqnEXwcNJKxoGugMH8M9Dxf61Qr5vUiK2q8UanHw/OmXbjWVsJEPCkjCAvzOXse5SP8oDnsOdEFYIh+OU8fdrH5eyyFoNvpeQh6z0h9KVG7Y3Zjy/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160634; c=relaxed/simple;
	bh=ATmkCr9/LRwvdnKxS3aGj5ubD3sZ7z0EHrruuITaLOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDkHAiEmts1izAGFH3iC7S1yM9AA8UUI3DysttCR9PZDFmKm5sYUE61uhBpZi5YIbnPxylIOlFCxqtbs4HJvN6X48yLO96YyPWfkZsV1uOEszpAPlrIUkNST61aXHSaXZJ81Z5W8m0FS3d5lQZMmCA0DkXRAjKRtM2fG4BVvY90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKm5CryN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKm5CryN"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54af20849bbso48404e87.0;
        Fri, 28 Mar 2025 04:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743160629; x=1743765429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rKihExt9HYKQ9h38yM30v9LllX8UfcKsGYU9/UYaes=;
        b=bKm5CryNpbRP4NM0d2k35R3T2GN1U2mXMZR2433J9AUBwy72/mR8jWmLPKRKniOK8u
         xoyV7fzhx7oUbGY4CbMAoM3d2hP3YosuQVr4sOPG+w3PdfjJReI8M9dJUKrZSv0TibhL
         yXT1Sgdq3CDa0OZikT+01n9FfrF95Ed/JHunD0zL9qxA6nnqSDG4UbMi4qOT2hyzRBtj
         ClzUCA2AkFvN4FTtxMDlIWI//qofI4lI/1ScHlBkjnYXD97qW7I8Y7vGOGqZcN1fbNPR
         MX0kW2JfpYq9K5f0bE0WVek2r6iypcLmy0KFrgkmcRBdPryBs2ZvYpdM2d+3U/g9reFi
         GjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743160629; x=1743765429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rKihExt9HYKQ9h38yM30v9LllX8UfcKsGYU9/UYaes=;
        b=tJKHLVJZJUpmcuSg9PiBkG+vKbLLS27BKf1UaL1iGWcMUoyZV4QEQYPPYvhBoPBykH
         /moxnGbJ5MuP6JzLFy6zmUG/nFt/Uq3gU00cnioVusCPTIKG2p0mUuMLTW1RpiR+jbNX
         mg2pVnzsqEC1O40wySm77g5WgqvgCIwxcbSeBpjESRkx6il75uQWp3wF109eaZfHPumG
         Uk2ziQL9e6WsGW55W05HX1xePKoXxSAhcAR8XwXaQsHUuax4En0vAIgbx3tqIPtKRXgB
         oB61feaqx4GRVXEbcz+b2OuxHvZlQrY1MjYASWHroplxhBrxY+iTf4YQtLfdENxxEALd
         pk6w==
X-Forwarded-Encrypted: i=1; AJvYcCUezfLAh4VADlbj5HKeIBwCob8Ok/KvYPHmQ9PiS7fSaPnkJwXbyhIXBo9MDfT6WF1DBYt2j1AyQ7MRLp5ItUY=@vger.kernel.org, AJvYcCVnPfQVefk1G8nG7FlmDbo0OHeWkuk1+eY/pWHmxIvaRDwzryXwN/AsVqX1EB2LfbSoQD7oNdwcJRIWG7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiINEZDcvytz/uA+IlbthhsS641PHK7QXhwClUIbkilval8dv
	JrTRbZGnpKoQSKTVA9FlCZAUyHlOxfRKsNPgjb9SZ12waXXFHXT2
X-Gm-Gg: ASbGncsOdOh2Kgmi+8PCsdkAHJ9SPeNtNE+5oUX4D8NM4GTNTqFgmjRcNRCXdRHvR4E
	Qed9SZh6jubMRFcL5ntjtEfW6QXU24Nbdzf+/xC86TZrHgOhBh6bCk10HCXqyP/Ah7y27iwYmk4
	XV87Ftux+mtMbsPjp6jIB5gILoUmKpTRANUq6SRokRYY+RkNv4to/fDwtM8DTVu9zTj6bHx9qdr
	/ohnwM/O9WjOPoIui1+TJ2ZZPj3jEdaIv9JXbBTUVFHMQ63gh0Y8IaebOnqFO5loBW4nqBmIwAi
	00kM4GbPGfx8/ytcRkIiVxlkEhLV75vMPTevA2uqmeHe0WTByx1A5hG4t0mp+RhobMSrpQCxs32
	MA/ljfxDK1agwPk9fW11qxg==
X-Google-Smtp-Source: AGHT+IGDXfJRX8+c/mHqwDZ+4Z803ZCEpKU/+JV3WpAa4Q8rcBv2/VrqaEaFPiYE5fRE2QgTz4TElw==
X-Received: by 2002:a05:6512:1317:b0:54a:cc75:3d81 with SMTP id 2adb3069b0e04-54b011cf63amr2756090e87.4.1743160629278;
        Fri, 28 Mar 2025 04:17:09 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1d9asm270614e87.100.2025.03.28.04.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 04:17:07 -0700 (PDT)
Message-ID: <f2c36d1e-cde0-420e-a19a-fda479d79572@gmail.com>
Date: Fri, 28 Mar 2025 13:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: dma: convert the read/write macros to return
 Result
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 "open list:DMA MAPPING HELPERS DEVICE DRIVER API [RUST]"
 <rust-for-linux@vger.kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20250326201230.3193329-1-abdiel.janulgue@gmail.com>
 <20250326201230.3193329-3-abdiel.janulgue@gmail.com>
 <CANiq72mjGf1pBG7PM7fKJA_EZkphp5he2H9pvg1mxJYZb-WGxw@mail.gmail.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <CANiq72mjGf1pBG7PM7fKJA_EZkphp5he2H9pvg1mxJYZb-WGxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/03/2025 22:48, Miguel Ojeda wrote:
> On Wed, Mar 26, 2025 at 9:13 PM Abdiel Janulgue
> <abdiel.janulgue@gmail.com> wrote:
>>
>> As suggested by Andreas Hindborg, we could do better here by
>> having the macros return `Result`, so that we don't have to wrap
>> these calls in a closure for validation which is confusing.
>>
>> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> 
> I would suggest:
> 
> Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/87h63qhz4q.fsf@kernel.org/
> 
> Maybe also consider if Co-developed-by etc. makes sense since he
> provided the diff.

Thanks! Andreas, would you be okay if I add the Co-developed-by tag?

Regards,
Abdiel
