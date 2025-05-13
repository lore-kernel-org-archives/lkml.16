Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBC1DACA1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125753; cv=none; b=Nsnw7/9sTEpPV/0ogUaskUerwV6BoAsZa+IKTV5V7qASwRoAndakGBY4xieIUKQGtsdG4JnqjG2V4fTYhWS9neMWRooxYSEifOL+5ofz5AWj5Sj/MRlGOF/gGZ4H7D7nVGhoRGkwxmjIpwSAxBPzVW1ojlHuVAtY4WT4fY9Vr/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125753; c=relaxed/simple;
	bh=FlA4Z73YmMucL2qkcwm3wMLyAyQ+DVY0A6XSnz1J/74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PhCExf3LaY+Tdtrt1zuRT6N7KXGo+Gr33+vVFC9OZoDxrBLmMhA+yOAmUvwjoqmqcTbzb3mn9adhIu/ClcDb1dCeSxo6+5a+hSFgZLQlvGCIfyzMnYEpggDbC591m/JEWf1ql+/8hrhAK6sEDsWe4mbF5kmtB2CPHavdi5fAokA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LY69FhbV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LY69FhbV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso35885185e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747125749; x=1747730549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wzHz9DECU94KJHpo2O9vOv0duOq/pnIjhQ7L/t0oY44=;
        b=LY69FhbV0X/TpXVv0tccb9W/evJviBO3izWgKEYaEQ2PVzY0EuM1VF10k24+4433np
         pFIhETv0RM2b/1A8lPqpqDca/EGGwpZ3lF5iuJ/NbPj7LF8WzXjY+ZARZ/vVHQuvbS1i
         XBLg/KeL/yPTgfZ3Zj1j+rd9UHnfaYEB7ispk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125749; x=1747730549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzHz9DECU94KJHpo2O9vOv0duOq/pnIjhQ7L/t0oY44=;
        b=TGtQ8qVTQtPN9CrJmWKY66aifOgjI4xFhQuAu6Esox002Q9Jm0+bGL7twxWH3urluM
         AfJHJv+kL9CQ11gJHxq+pSKCKF94cCAAFt7zx8OSri6uyEtOOyVIRIKYgv/N0YS49yji
         Vait8GJcEJgr/wzFAdfBAW6NbwwSKui/zCv+Qp9bNwxwSN3n5Hyoc5PJwqgJkzaIaFDb
         6VylX1EwIAGbTvR8nlfdpWFHOPqHTR/1mgGi2wgcUQMjo/dMYYb5qfihCTEJtKM2y6RY
         NrXvzsbDfJfxM8R4iqJv30Flz7nQBHEBQ0k5SpiElBj/Bqpt40e7/cezY0TTg4ChbZOG
         PAuw==
X-Forwarded-Encrypted: i=1; AJvYcCWbV8s5qmTCSBLhnUpfXokSmMG4u2SfUmJcra1hiBEVlgSqBKvCsOJn2KL67q1FePuLOL2d5UYyTbGfAzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxPxHaq/HKZBI6GV84wTheVko8jMUsZWpVMzMSBti6urRDlDPz
	GzECrjWVv2RQmjQH5wewXfT0/aZ4KtzkCGy45kSHKPdOIOa1tpbuO9ElVB5/TQ==
X-Gm-Gg: ASbGncs8tpbI0TebQePzTAeB6AsFwlh+2PSM3juq0h1NiCLlwNZ2kDILM25+r4N6Vw6
	KPnajdsQvrRrdn+600TnVWt8g5kLe33a9QKG1WtHSLYKtSZjeSlaPfJ9KtboHKWQDppTSpVTMHH
	D1ABrvy0RSR9ixjxn31LUZYnq9X2UNpgructjgc9TuqTXmYbB7gzI7eTnYwg1TjVR9qUI7vEVum
	+evDsJZ/72El96BiEMylaYOuy3J1hpELtfjSZ0t9ct/O8hyukipue10IsE0g09t+zIIdt+mKF4f
	yRzdngkIKPKSTCF0mAptz6n29l953P2B7Iavwx+/qOiTrqKbgFLrMB1XhaN04SExEpVzTO6Je8F
	7oKcQ56SPrhZBhu6TaXE=
X-Google-Smtp-Source: AGHT+IFpMHp3eJ6oVXY0sfYrcBjX6a0dUoFB7Qs8f5zRrkb+2+HmDWaW2govqel8yZBeFl5OXIGDsw==
X-Received: by 2002:a7b:c014:0:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-442ead23ffbmr16266215e9.16.1747125749308;
        Tue, 13 May 2025 01:42:29 -0700 (PDT)
Received: from [10.229.41.178] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm158253275e9.13.2025.05.13.01.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:42:25 -0700 (PDT)
Message-ID: <a563cb0b-0bc5-4dbe-b570-4d45c1b14641@broadcom.com>
Date: Tue, 13 May 2025 10:42:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 linux-mtd@lists.infradead.org, dregan@broadcom.com,
 miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com,
 rafal@milecki.pl, computersforpeace@gmail.com, kamal.dasu@broadcom.com,
 dan.beygelman@broadcom.com, william.zhang@broadcom.com,
 frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com,
 jaimeliao.tw@gmail.com, kilobyte@angband.pl, jonas.gorski@gmail.com,
 dgcbueu@gmail.com
References: <20250513080151.565359-1-noltari@gmail.com>
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
In-Reply-To: <20250513080151.565359-1-noltari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/13/2025 10:01 AM, Álvaro Fernández Rojas wrote:
> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> removed legacy interface functions, breaking < v5.0 controllers support.
> In order to fix older controllers we need to add an alternative exec_op
> implementation which doesn't rely on low level registers.
> 
> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 160 ++++++++++++++++++++++-
>   1 file changed, 154 insertions(+), 6 deletions(-)
> 
>   v2: multiple improvements:
>    - Use proper native commands for checks.
>    - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
>    - Remove host->last_addr usage.
>    - Remove sector_size_1k since it only applies to v5.0+ controllers.
>    - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
>    - Use j instead of i for flash_cache loop.
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index 17f6d9723df9..2b519dfcac5d 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -2490,14 +2490,163 @@ static int brcmnand_op_is_reset(const struct nand_operation *op)
>   	return 0;
>   }
>   
> +static int brcmnand_exec_instructions(struct nand_chip *chip,
> +				      const struct nand_operation *op)
> +{
> +	struct brcmnand_host *host = nand_get_controller_data(chip);
> +	unsigned int i;
> +	int ret = 0;
> +
> +	for (i = 0; i < op->ninstrs; i++) {
> +		ret = brcmnand_exec_instr(host, i, op);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
> +					     const struct nand_operation *op)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct brcmnand_host *host = nand_get_controller_data(chip);
> +	struct brcmnand_controller *ctrl = host->ctrl;
> +	const struct nand_op_instr *instr;
> +	unsigned int i, j;
> +	int cmd = CMD_NULL, last_cmd = CMD_NULL;
> +	int ret = 0;
> +	u64 last_addr;
> +
> +	for (i = 0; i < op->ninstrs; i++) {
> +		instr = &op->instrs[i];
> +
> +		if (instr->type == NAND_OP_CMD_INSTR) {
> +			if (instr->ctx.cmd.opcode == NAND_CMD_READID) {
> +				cmd = CMD_DEVICE_ID_READ;
> +			} else if (instr->ctx.cmd.opcode == NAND_CMD_READOOB) {
> +				cmd = CMD_SPARE_AREA_READ;
> +			} else if (instr->ctx.cmd.opcode == NAND_CMD_ERASE1) {
> +				cmd = CMD_BLOCK_ERASE;
> +			} else if (instr->ctx.cmd.opcode == NAND_CMD_ERASE2) {
> +				cmd = CMD_NULL;
> +			} else if (instr->ctx.cmd.opcode == NAND_CMD_PARAM) {
> +				cmd = CMD_PARAMETER_READ;
> +			} else if (instr->ctx.cmd.opcode == NAND_CMD_RNDOUT) {
> +				cmd = CMD_PARAMETER_CHANGE_COL;
> +			} else if (instr->ctx.cmd.opcode == NAND_CMD_RNDOUTSTART) {
> +				cmd = CMD_NULL;
> +			} else {
> +				dev_err(ctrl->dev, "unsupported cmd=%d\n",
> +					instr->ctx.cmd.opcode);
> +				ret = -EOPNOTSUPP;
> +				break;
> +			}

You could probably use an associative array here to limit the amount of 
lines?

[snip]

> -	for (i = 0; i < op->ninstrs; i++) {
> -		ret = brcmnand_exec_instr(host, i, op);
> -		if (ret)
> -			break;
> -	}
> +	if (ctrl->nand_version >= 0x500)
> +		brcmnand_exec_instructions(chip, op);
> +	else
> +		brcmnand_exec_instructions_legacy(chip, op);

I would add a new function pointer member to brcmnand_controller in 
order to avoid doing this test every time we call brcmnand_exec_op().

Thanks for doing this work!
-- 
Florian

