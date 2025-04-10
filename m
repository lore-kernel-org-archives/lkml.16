Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16D720C47B;
	Thu, 10 Apr 2025 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275763; cv=none; b=a3YrUyCD0OJh5IhN4xvZqEfuIE1hfrNAHWpsp8kE69ms3XKw/zkh95xmRAjeYs8sj8HbKT2goXhAee+41OR2r6f0g3Y8t/v4DIZ2jPDtRdMznVDMj9+1yHjBjSOEnlqhdDk1d9NdgJ/E7lC8jOxfQdBI983CkLU7i3x7/P/bdjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275763; c=relaxed/simple;
	bh=bllAD+cgiv1Z1edj2jYna3KvAuphRh3kkdTtKJRFHUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0m+RoB16pobrV5W45PVU2yKsjRgQHWgS4kwU5BxtYdo50Tj/viERRUrq8hCSl7/n1f+1E30oIt/zttlU4HSNAxIEqaUEk4U6VjjSP1Gk2PVxigPt/rxS8JL7dnyeC/gyTWoGg2Aj1Zfdyx8maP4eMCNqMvlgu4Th/iq+bhe1Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyXdU9fw; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyXdU9fw"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so694391e87.1;
        Thu, 10 Apr 2025 02:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275760; x=1744880560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPa0k5nD0Exazdw2igx5RaaUvNYpfB1zvFvevijz4Tw=;
        b=OyXdU9fwu5kfv7sNOk9uvbVgm2MiLVUWcsTv6XsRnqsXxY0NSO3rAYdI16Fl/LgJRg
         wi7n3g6VWI7RIRPYn+QyGUPdZ/rCIwXrEbNfQTaI3E1R5THac5uosuHTB8CElRUbGT9m
         ca08Vw7O9bP8pF8Wl3tuLW26CDqDP9pqgSdyPomH+NqJJUhlj3Mh0rN2Q3/Wsn9/bShK
         lkVoCIxUfhMbDHIwg+YgAvpgN7eEJFf9jM4zwlsm5pja/hs04nKyYuEDhLm8H3bPLyvP
         f16vsl3vEfhZisaKZV54fO0A989FwhZr/ZvxyELzOrH6uOYVgs+h/oSQndl302ipvVKh
         W5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275760; x=1744880560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPa0k5nD0Exazdw2igx5RaaUvNYpfB1zvFvevijz4Tw=;
        b=caHKqfS86CQrveilIme2UZ9lDul7qaGEi67T6ALPDt36YR8FMaLMNBtxJb83qvcgGM
         ThCwRYohx9iGCTja+zd4a8oVfGoY1ad3cGPduddzAVEdpB6XsrOruLtNptTaErVlASJa
         v+MhYRH9DP3MME0YSppoM8UNHTY6mBFY2ESzRX+DPUDxRrjnS5+TyxD4AF1NTxbhLx/9
         i0ptVQjlGCEadkUX7LF0XPo/lMXfDBUrzyvvvmTsYXFhjB13adwK0NFSmWL3vstuibgb
         dWT33YhpTpZ17IcjLjHK5CWGRbJhWJN0DvQn6zoQrT2ALeU/Ov+7OteZVY+TmMJdiija
         4oyw==
X-Forwarded-Encrypted: i=1; AJvYcCVvZBu2kEdRHkuC29EpMR39aNLZe5i5ZTgFh7mL+guXyhx+xolAZnvMJzRLS+XZ4WwgH6WOf77tiUoTqu8=@vger.kernel.org, AJvYcCWM2rRnJdbg0cdYzX4EPPh/iTvoU/3krtxYjX19biCBN138LCGxF7wrzUydtybFflM7dw/LGnTBFqN91MPh0tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1AqC4QBDMOsNUvedD/i7kyqKz1QmVINM2IWFHD92PzxwGjynY
	YCdmkijhwM3XevK7vugJtmekXkS99rslzpmJLadD0I4lL0eLUDcKg7Ookw==
X-Gm-Gg: ASbGncs2uFJCjGP1a35LVkMOJHhPkZ7g3MxYFX8QTz535IC6CW75pO8NO9mzXwyva8a
	su1avjVsVwP92ObcEU46tFizjec4MQy7m4LpMBBpkLFvM7Uwhp3ORMsM68fTFedYh3Iz08GOYZm
	C/hDXpDXlPgHjkweGJzQbilQQyhemu1bNx2CadhhXR2u7F/HiynqO7Zyf65NL6LRoMMU/ZGlsVf
	WG5N8XbP7f+AF+F+kv6hZwNYOlo54yED25Np74kFKpZzJxtYuQuQwUQOuaKd9TUYqjhPHAKgLbr
	rVc7CrVxqE6gutuWP3Jud3ogpILTtWJaHoRNNM5pcUr9vPbXYDAwuqCICNHkDW1b/Y4xQRWyZat
	BJQlY8QbCCCEA45bH1Q==
X-Google-Smtp-Source: AGHT+IEk+k8B4oGNxYpPH7f91Gk3apdsXRejQvJa+4EseHotya2Zs/Azwvg7bCqIMKicblqllhvG3g==
X-Received: by 2002:a05:6512:a81:b0:549:6451:7ea0 with SMTP id 2adb3069b0e04-54caf5aeb17mr504169e87.19.1744275759611;
        Thu, 10 Apr 2025 02:02:39 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm83394e87.44.2025.04.10.02.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 02:02:39 -0700 (PDT)
Message-ID: <4a48338e-64a1-4740-ae1f-7458507a009e@gmail.com>
Date: Thu, 10 Apr 2025 12:02:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rust: dma: add as_slice/write functions for
 CoherentAllocation
To: Alexandre Courbot <acourbot@nvidia.com>, a.hindborg@kernel.org,
 ojeda@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
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
 <20250326201230.3193329-4-abdiel.janulgue@gmail.com>
 <D90XDHJWABTC.1VM2A3KYOT0UL@nvidia.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <D90XDHJWABTC.1VM2A3KYOT0UL@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

On 08/04/2025 06:08, Alexandre Courbot wrote:
>> +        }
>> +        // SAFETY:
>> +        // - The pointer is valid due to type invariant on `CoherentAllocation`
>> +        // and we've just checked that the range and index is within bounds.
>> +        // - `offset` can't overflow since it is smaller than `self.count` and we've checked
>> +        // that `self.count` won't overflow early in the constructor.
>> +        unsafe {
>> +            core::ptr::copy_nonoverlapping(src.as_ptr(), self.cpu_addr.add(offset), src.len())
>> +        };
> 
> How about leveraging as_slice_mut() so this unsafe block can be removed?

as_slice_mut is still unsafe, no? So we couldn't remove unsafe block still?

Thanks,
Abdiel
