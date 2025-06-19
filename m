Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39130E828
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356686; cv=none; b=ktzz4IZslzM3sGcIl2xdhUZ2Z5dWK0x8r5zsOycH/BBlfR9vM9EpYvAc0zvYv2lQunzXRF49qD0epX+LtC33vBv+ABUkjguVijRQbUaey4PpE14YmDNWvsnRhziIw+/YN3gY8UHA7GAjg9RTF48L0fQKjQsTvL27OY+vmcKzA0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356686; c=relaxed/simple;
	bh=q+b1EzuZO0BKyVhbFFd1X1ZVFlrGa0a5FCIcHLIPEDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IF1+dFaJmoWeVVe5zNQHqsHurb8De2yHaSDJzfu2ZNxCK1pIpKFAKavs5kYz6NDfioTYylwFBlD6miE5PtXbNzH6Z5YdRcQHG9f6i7MUKy/KdIfWtBhYqN8CFn9Ogt+b3qqL3zyuNfrEn3c/DYF2JUvBv9oXdHnn9NjRswe2Ml8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Z/w6/SIA; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Z/w6/SIA"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so827291a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750356683; x=1750961483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F1ViY++JCslwslFZ2ivTe1AaApjS3uUEi0/MYj45rTI=;
        b=Z/w6/SIARfh6gQBOiekvt4yWLMM3zfy63neO359d7qwPYDzt1BRZlHDeO+xg+ZdD9j
         bJ5sRcytgUHB4AuHURXjnxJShu6s8ZnakOFZ9tgVDG/PZR+9unw05MvwqUmleq10ngSr
         dEOwTYHgZrPqlrQEpOfCcK8f899SKHL7olI1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750356683; x=1750961483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1ViY++JCslwslFZ2ivTe1AaApjS3uUEi0/MYj45rTI=;
        b=GDjpl82dqu+shCn5OUpu3Z3TxCX+NrDk9R0hNaE6rmT6nBBuF72CQ8AxOwg66EMDNK
         YdQZ/jLWXdsvcZu06xv0Byo2z2zyHJvpsooM9DUj+9eeY9TPqIcQhDadzXl4yJtfgz63
         Rw9wEqou5XyJ2PPpBxKXloqGCPM10lf4gXFOe3qbXHdYeLfiX8hsO1xZAUJcp1IZ8fm4
         1TcHL/gTahQOM8lyRt4AUTEvCfGdd9dnfvUTZ4VE8ymGLKQMF2E4CgY8RPVMN1X926y+
         tEbzY1bF0Z94YIboBF/P12jLa1Y/LVC75KuQMFdGZXgZzj6UdCWheRBVU6yqBXE4dg/R
         nw8w==
X-Gm-Message-State: AOJu0YwMtrSh4B2j2fO3TDn+41XTHRtlnEF++HsVdh6SwlGhlLur5HDa
	/WuVVaDXpZ4I5zP5TSdIzQPPNskajW+3bWDIfAFvhCM2ZfDZMhcobtRvEWZlz4Ynzg==
X-Gm-Gg: ASbGncvQbls9PDICrnj6AEDQridNXy/l7Xl9+HyY0Z9jIte3SO8xIAEj/hG/ixBvABz
	JEJqi4t+XTec0U1M67QYZWABdFnMoIxHvjF8Iz7TOAHo4RE/EIiMPN82y4WKBr47L7m/aAR1MVW
	AdVsGsAEegj9dFEldjUd0WHEZFcrZ54SFX1euaj9ATa7p91QiNAkXOd6FbS0qEsSvK8oKccJEo5
	didMgK5sD06HfzNW+KyHNQQGxgVZdE2/nQMInbBVJ+WIytBkchU1UJ+/Y22r3W3Er/T4wjkuMuT
	w3cm7aOrlXz3y4HFl6vqJ9IO3hpyMXX3Eh2bGcuZEV6zpt7DU8mBE1g/1vyp7Fo8lv2tMF+4pqs
	oc5XfM4IrqKqmoRDRjqCDacCLtg==
X-Google-Smtp-Source: AGHT+IEUwsHN1GrfJdg9ZSt6e4DoOjhiR7sdM1DnwW5pSqQE0YhERlCw1nOK3dyoDhOAzyvBdUbgbA==
X-Received: by 2002:a17:90b:538d:b0:313:283e:e87c with SMTP id 98e67ed59e1d1-3159d6347famr291618a91.3.1750356683084;
        Thu, 19 Jun 2025 11:11:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e19bsm2548531a91.12.2025.06.19.11.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 11:11:22 -0700 (PDT)
Message-ID: <44bc4834-da10-49fd-90bb-0ca63746aae8@broadcom.com>
Date: Thu, 19 Jun 2025 11:11:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 David Regan <dregan@broadcom.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Dan Beygelman <dan.beygelman@broadcom.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, kdasu.kdev@gmail.com,
 JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>,
 Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu@gmail.com, dregan@mail.com
References: <20250606165756.1531164-1-dregan@broadcom.com>
 <8734c9z2ye.fsf@bootlin.com>
 <CAA_RMS7EB2v_h44Ysdoe0=WjC+T4G_5_4O-9DbCBE5OyRNArkg@mail.gmail.com>
 <87h60dmn86.fsf@bootlin.com>
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
In-Reply-To: <87h60dmn86.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/25 02:07, Miquel Raynal wrote:
> Hello David,
> 
>> I'm not familiar with nandbiterrs but here's the results from
>> mtd_nandbiterrs.ko on my NAND set to BCH8:
>>
>> # insmod mtd_nandbiterrs.ko dev=0
>> [  676.097190]
>> [  676.098760] ==================================================
>> [  676.104609] mtd_nandbiterrs: MTD device: 0
>> [  676.108732] mtd_nandbiterrs: MTD device size 2097152,
>> eraseblock=262144, page=4096, oob=216
>> [  676.117089] mtd_nandbiterrs: Device uses 1 subpages of 4096 bytes
>> [  676.123188] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
>> [  676.130863] mtd_nandbiterrs: incremental biterrors test
>> [  676.136154] mtd_nandbiterrs: write_page
>> [  676.140761] mtd_nandbiterrs: rewrite page
>> [  676.145473] mtd_nandbiterrs: read_page
>> [  676.149621] mtd_nandbiterrs: verify_page
>> [  676.153625] mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
>> [  676.160678] mtd_nandbiterrs: Inserted biterror @ 0/5
>> [  676.165647] mtd_nandbiterrs: rewrite page
>> [  676.170363] mtd_nandbiterrs: read_page
>> [  676.174508] mtd_nandbiterrs: Read reported 1 corrected bit errors
>> [  676.180606] mtd_nandbiterrs: verify_page
>> [  676.184609] mtd_nandbiterrs: Successfully corrected 1 bit errors per subpage
>> [  676.191662] mtd_nandbiterrs: Inserted biterror @ 0/2
>> [  676.196631] mtd_nandbiterrs: rewrite page
>> [  676.201342] mtd_nandbiterrs: read_page
>> [  676.205487] mtd_nandbiterrs: Read reported 2 corrected bit errors
>> [  676.211586] mtd_nandbiterrs: verify_page
>> [  676.215588] mtd_nandbiterrs: Successfully corrected 2 bit errors per subpage
>> [  676.222641] mtd_nandbiterrs: Inserted biterror @ 0/0
>> [  676.227608] mtd_nandbiterrs: rewrite page
>> [  676.228356] mtd_nandbiterrs: read_page
>> [  676.228749] mtd_nandbiterrs: Read reported 3 corrected bit errors
>> [  676.228751] mtd_nandbiterrs: verify_page
>> [  676.228829] mtd_nandbiterrs: Successfully corrected 3 bit errors per subpage
>> [  676.228831] mtd_nandbiterrs: Inserted biterror @ 1/7
>> [  676.228833] mtd_nandbiterrs: rewrite page
>> [  676.229530] mtd_nandbiterrs: read_page
>> [  676.229922] mtd_nandbiterrs: Read reported 4 corrected bit errors
>> [  676.229924] mtd_nandbiterrs: verify_page
>> [  676.230001] mtd_nandbiterrs: Successfully corrected 4 bit errors per subpage
>> [  676.230003] mtd_nandbiterrs: Inserted biterror @ 1/5
>> [  676.230005] mtd_nandbiterrs: rewrite page
>> [  676.294177] mtd_nandbiterrs: read_page
>> [  676.298337] mtd_nandbiterrs: Read reported 5 corrected bit errors
>> [  676.304436] mtd_nandbiterrs: verify_page
>> [  676.308441] mtd_nandbiterrs: Successfully corrected 5 bit errors per subpage
>> [  676.315494] mtd_nandbiterrs: Inserted biterror @ 1/2
>> [  676.320464] mtd_nandbiterrs: rewrite page
>> [  676.325174] mtd_nandbiterrs: read_page
>> [  676.329327] mtd_nandbiterrs: Read reported 6 corrected bit errors
>> [  676.335426] mtd_nandbiterrs: verify_page
>> [  676.339429] mtd_nandbiterrs: Successfully corrected 6 bit errors per subpage
>> [  676.346483] mtd_nandbiterrs: Inserted biterror @ 1/0
>> [  676.351452] mtd_nandbiterrs: rewrite page
>> [  676.356162] mtd_nandbiterrs: read_page
>> [  676.360308] mtd_nandbiterrs: Read reported 7 corrected bit errors
>> [  676.366407] mtd_nandbiterrs: verify_page
>> [  676.370409] mtd_nandbiterrs: Successfully corrected 7 bit errors per subpage
>> [  676.377462] mtd_nandbiterrs: Inserted biterror @ 2/6
>> [  676.382432] mtd_nandbiterrs: rewrite page
>> [  676.387142] mtd_nandbiterrs: read_page
>> [  676.391287] mtd_nandbiterrs: Read reported 8 corrected bit errors
>> [  676.397385] mtd_nandbiterrs: verify_page
>> [  676.401388] mtd_nandbiterrs: Successfully corrected 8 bit errors
>> per subpage
> 
> So far the reporting looks good (and the nandflipbits output looks
> correct as well).
> 
>> [  676.408441] mtd_nandbiterrs: Inserted biterror @ 2/5
>> [  676.413411] mtd_nandbiterrs: rewrite page
>> [  676.418122] mtd_nandbiterrs: read_page
>> [  676.422267] mtd_nandbiterrs: verify_page
>> [  676.426194] mtd_nandbiterrs: Error: page offset 0, expected 25, got 00
>> [  676.432727] mtd_nandbiterrs: Error: page offset 1, expected a5, got 00
>> [  676.439260] mtd_nandbiterrs: Error: page offset 2, expected 65, got 05
>> [  676.445868] mtd_nandbiterrs: ECC failure, read data is incorrect
>> despite read success
> 
> Here however there is something wrong. We do expect a read failure,
> instead of returning wrong data. There is still a problem, I do not know
> if this problem was there before though, but this must be fixed.
> 
> Hello Florian, if you have time, I'd welcome you opinion on this patch :)

I don't think I am entitled any opinion on this patch other than 
confirming the register offset locations. Both William and David have 
far more experience with this NAND controller and devices that I do.
-- 
Florian
