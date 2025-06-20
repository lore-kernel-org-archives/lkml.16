Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEC22253FF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443982; cv=none; b=Syda0s3XckyAkSfaNUT924acYDTfG8OB6D0l3TKz3J/3KsiZe0mzhtM8mc7iwuhvTK0Od7QB9aPJEirkhaRJXNU2BzZrrUflsZs2b7DwuzX5ujqKjDVOMwk1fm4V0+bpxtxJ6H6hIosvZhPqTkNtZ3B7jVndDFQSksdaKXzDbHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443982; c=relaxed/simple;
	bh=+7NtCA43bsez6bUdTG1wD0QkjcrHy+XFZlsqnjxCZsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSaKvqmCAOFnGkMOPhWluqXDGtIpgDv9xiRNNUCL8QWjueqMi1e00o12PbDdBtPwR9wl/LvzEUVAk0bPftJ4CgFFIwSgZXH6ug5L1qKZ5PPJjHLCKwMcxVmMc7t08GFaZejaFdzJwA/a4jeCji1WIBvWRPF8mske7zSte3Dh8/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JnNB9a6c; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JnNB9a6c"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748fe69a7baso1841611b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750443978; x=1751048778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bAdtzechH+/jToDWtrbsn48FtzSxEB4fuWaCjYhcRS4=;
        b=JnNB9a6cPWJvzZ75zuzqED93OIV6YE6kZ50U+McKNvIFPRUupg9cWL+cTawvgRJCSg
         5iWg12++QyxvNXshOwAt/mLGCle435kw5z7LlZ3uGuzj6iKMmcSnz2axJQYEJK8qtx4L
         0cstjaPKMQ5rSSFYVBOF01mTUW5ulm8ha4jpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443978; x=1751048778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAdtzechH+/jToDWtrbsn48FtzSxEB4fuWaCjYhcRS4=;
        b=aszjN/ZVDeaYiqAuhvDRLGRzY1i4XquGBymhYk7QYSO9H0jNmU4aNTxR38lKKA2wY0
         3hIBlq8YM3Qc8TsMktz9prIFPHmcHTQUxCGNAfPEQhPHO0bhLJkj/3OPzlufMlJaf6yh
         cevIAO4h2DjOE0AoaCrbVvkVZG2+9TmLo+wd3SdkTZIwng0ks4OOzO9NCK9h6dTIUTrk
         CTcEkm+uisA/HylxMoIiQkTOW2DprUgh9m22bj8qwUImYVI2eKtbi9dosEKC6QStiB+T
         SrEMvigldYCg9KMSWqQ6QZm9JIrPkzfajYc6L3vZbRX7nOUl1eh/SRmYOWT5FN5VbgKn
         CE6w==
X-Gm-Message-State: AOJu0Yw8UsfLB1oIiEyKkLnLnSe1kdjBQ/TAV2LCgFOcrpj0z2RH0RVA
	IIA3On7CJ24QMWQUCmYYGYqyz1ycHW8lR2C+04ogeVHuOOJgE5HWhJthOahmv6I/fedYzq8xXnO
	9qdQ0uyXXRpEYU/PvZKSSVzNbbJ4KMbQzjkQmEu9GIiu2kjf0e1x65/Sg4DAhOF9M9tv/ZMLjfc
	QVDSxIvlcA5mFpDhbBZUJpZZdb70drO1o2lYk2tC8D6HLXasbk30nHwSdaDKRt
X-Gm-Gg: ASbGncvtH76eFt9f+seJMu9GNFpk9ELgdWkUF3b1xICqjW8CsGRP/zZf1Osf2VNOD0r
	YfWwQVrasn3X97Aw9ElRj7sI7jp7dbCIifiOO5edmNDQoA1OIzDFIP8hncDauBiCG6eq3W+poDH
	glnq0GNEQv3QMvAncvSG3+KJpL9XN9D8mJLJhbIDVU2ESypk+H87s10c1ktEHZJCcImF5MK3AvI
	DmSm4b+jwTcsRGvkXrE6locAgnwkZgIJpMZqHQTpzfKS/YWawxyxqOJpyy9Me5APq4YuijFZR9/
	azTQDre/dTklFSedAdffMFNAlm9i+7sEYT3aZiQ/VZsz08SRrlB5Z1Gy+xOo1nnAsAa6YpgqA/K
	CUChjzQ4+CG9esqyVxUJCY1i0GQ==
X-Google-Smtp-Source: AGHT+IH2+W3SELbAA/vJhDhyYip7ILWWMoOFTLWJMmsiJD/4X9D9HqQrZAwoUZNXs0KACUqLU2sQBg==
X-Received: by 2002:a05:6a00:1817:b0:748:34a4:ab13 with SMTP id d2e1a72fcca58-7490d4b89e5mr6075050b3a.6.1750443977932;
        Fri, 20 Jun 2025 11:26:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119ac5bsm2176137a12.20.2025.06.20.11.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 11:26:16 -0700 (PDT)
Message-ID: <8ad1c722-62ad-48f6-80b2-8f07b2e84bae@broadcom.com>
Date: Fri, 20 Jun 2025 11:26:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/gdb: Fix interrupts.py after maple tree
 conversion
To: linux-kernel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250620181446.477246-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250620181446.477246-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/25 11:14, Florian Fainelli wrote:
> In commit 721255b9826b ("genirq: Use a maple tree for interrupt
> descriptor management"), the irq_desc_tree was replaced with a
> sparse_irqs tree using a maple tree structure. In the interest of
> providing both a minimal bugfix as well as something that is unlikely to
> break in the future, invoke the irq_to_desc() function directly from
> within GDB in order to obtain the interrupt number. This requires us to
> handle the gdb.error exception to continue walking the tree.
 > > Fixes: 721255b9826b ("genirq: Use a maple tree for interrupt 
descriptor management")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Humm, looks like we might not have a choice than to be able to parse a 
maple tree within GDB. While this approach of calling irq_to_desc() 
worked correctly on x86 under QEMU, this failed on arm64.

pw-bot: cr
-- 
Florian
