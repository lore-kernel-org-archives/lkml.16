Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4E28640E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295579; cv=none; b=kfzB0Ly2oBDAEuXiNeZbTmR8Ql68BZ1YfNB0Ao90Cl+sHlQ4WUvjuzVJdET2UGW2N9RvYhoIPxXzw5jzKV5f520D0pQymCTU8Ix3CVMwWxihdA/SqYmbhZPdLqyDSPhW8+Z1nlE5y0/FB1LnHBwRCBlQpiDEazm2fvGRCpxBm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295579; c=relaxed/simple;
	bh=LLSA81dEpfotMW2BCtI+KSDv7wAuB/dDQNWxIfwaveM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qtwUQp7qtu3j3nO0BWlflO0O+aCxyR37e8MCGfUhf0UHesSXO6pcf26YD0onNhfC5sT5hjAsmnAHTNs99USeeZsjZHvL3O8feNoqcPED5ePRlgUwsGXejtYSOLdY54T+pTzO9h9j7aHmCQ+jk/MfSU9LWcpTMzFs0a2wEFW4FJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VP7v1YHr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VP7v1YHr"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e331215dbso12622185ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747295577; x=1747900377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IvNR65OMpeku0Lr1LhMN0RPeuqeI1QVzpCtc/xjP3nc=;
        b=VP7v1YHrvAkU7i7eXg2VS5pJAwyv4GDn6DOIDxkO1I3akf0pIbj4aGboIzEjoUpwW0
         4qfeJaAN3W0y0rl1pL1RyxwG4twzHU/eqJMxPmzS7BKHVKzU4sHh95+y2oo14PUc037e
         Ij45s/+AC7T5EJgE2V8Vy7O1XkDtDKAvLdpJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747295577; x=1747900377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvNR65OMpeku0Lr1LhMN0RPeuqeI1QVzpCtc/xjP3nc=;
        b=VYko6y5GHoO7Fv5Ydfe0rSaCDSLjrR9wrhTFZPUHWv83WXc6wIo7iRvpAx+7v5Thao
         jKQ1pIm566prCn78xLhVWj5CUU/fvk47+Arphk8S5M3GJmT437qXzZsUB6vyxQ2k+SHo
         fkkPZXYAOmxWSuPQBZIexSH9veIIjU3Tahd//+TUQkc4T47dy0hL4inNaQs0jQkgds0p
         VMYPJwHqI1Bm7nAgyM8T77hCKf+xo235xdOzE2dVTfZy+jY32L8uMbkUCl16gm3IauYn
         HXr9XEMoM78Ln5M9tnkNhBg6C0SqBFWjKvqPAxZxSVKfbAyNiYmkAs2WnC2rk753SBGf
         zTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPgqK5RIL+aHwqcR3uFadKWO/nt8Dd2GtJFZk355JI35ayUvdsvsfNScTGleDVF+WSMQr0wW+EMvAfmhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvrE8vUIkFDk+dhcP/B0MtvJmGYn7a8vDXaAK3/9dTWrGlzlD/
	K9JVzNRa1WamhTeOeaFzUoYeUMwEgizNQ4pLF3NX4pqY+XzpncwjMFMnhyL37A==
X-Gm-Gg: ASbGncvX2Bd0ZevhiaGK7WiOoTt2nyyOSx5ciyhKNm2Iky+LH+QhzJIvg9VPY8eOkgD
	4rytJN9+eeo99ZgLnPEjrDpIpoPGN4JBoI+2SxIorV8fQJEPgg8Oc6Loql5mVs945kJWBEF0728
	k2LLSPNbrVgh/CrNiuJRjZE1rAFzf8d985VBe8H46rJCRq2PKe2nOPiKEUFZmXRacrWk50htZ3l
	TkIe8GHCSK5qNQJ/T3UNvYd/yLaVM/pXHR9ErVpEzuRbk0UuiDN3dSFYO+UEC1UDR88TyPR7UjO
	aBiqGr5vIJq8VT70Vw8voF7eepLkJQF+uA6uctspPSDRzlj62L//k7ZuDklR3tIk61BnWMwQaUQ
	Zm2xDtc5D37i7V72swKvyqwVS/moA9cMLPqYrZgmEtoRlb+lmKg==
X-Google-Smtp-Source: AGHT+IFSpZxUm3nW0rV/eSnFpka7GR4cBly2hIHCiYL6L0EnhwUuDXWXIzI5q61JAKvaPMUb4XrxJQ==
X-Received: by 2002:a17:903:904:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-231b3970aedmr36537915ad.2.1747295576724;
        Thu, 15 May 2025 00:52:56 -0700 (PDT)
Received: from [192.168.48.133] (mobile-166-176-123-50.mycingular.net. [166.176.123.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271f61sm109996575ad.142.2025.05.15.00.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 00:52:55 -0700 (PDT)
Message-ID: <1cc01fd7-79fd-462d-923e-5ff0bf61b489@broadcom.com>
Date: Thu, 15 May 2025 09:52:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
To: =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 William Zhang <william.zhang@broadcom.com>
Cc: linux-mtd@lists.infradead.org, dregan@broadcom.com,
 miquel.raynal@bootlin.com, bcm-kernel-feedback-list@broadcom.com,
 rafal@milecki.pl, computersforpeace@gmail.com,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Dan Beygelman <dan.beygelman@broadcom.com>, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, jaimeliao.tw@gmail.com,
 kilobyte@angband.pl, jonas.gorski@gmail.com, dgcbueu@gmail.com
References: <20250514062341.774919-1-noltari@gmail.com>
 <b11623aeea01338715215084fc34107d@mail.gmail.com>
 <CAKR-sGcg5yCiQFV5yriD+Lv1MiV1wXVQo1_q_Eh-=UNAP-idxA@mail.gmail.com>
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
In-Reply-To: <CAKR-sGcg5yCiQFV5yriD+Lv1MiV1wXVQo1_q_Eh-=UNAP-idxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/15/2025 7:06 AM, Álvaro Fernández Rojas wrote:
> Hi William
> 
> El jue, 15 may 2025 a las 3:42, William Zhang
> (<william.zhang@broadcom.com>) escribió:
>>
>> Hi Alvaro,
>>
>>> -----Original Message-----
>>> From: Álvaro Fernández Rojas <noltari@gmail.com>
>>> Sent: Tuesday, May 13, 2025 11:24 PM
>>> To: linux-mtd@lists.infradead.org; dregan@broadcom.com;
>>> miquel.raynal@bootlin.com; bcm-kernel-feedback-list@broadcom.com;
>>> florian.fainelli@broadcom.com; rafal@milecki.pl;
>>> computersforpeace@gmail.com; kamal.dasu@broadcom.com;
>>> dan.beygelman@broadcom.com; william.zhang@broadcom.com;
>>> frieder.schrempf@kontron.de; linux-kernel@vger.kernel.org;
>>> vigneshr@ti.com;
>>> richard@nod.at; bbrezillon@kernel.org; kdasu.kdev@gmail.com;
>>> jaimeliao.tw@gmail.com; kilobyte@angband.pl; jonas.gorski@gmail.com;
>>> dgcbueu@gmail.com
>>> Cc: Álvaro Fernández Rojas <noltari@gmail.com>
>>> Subject: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
>>>
>>> Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
>>> removed legacy interface functions, breaking < v5.0 controllers support.
>>> In order to fix older controllers we need to add an alternative exec_op
>>> implementation which doesn't rely on low level registers.
>>>
>>> Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
>>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>>> ---
>>>   drivers/mtd/nand/raw/brcmnand/brcmnand.c | 178
>>> ++++++++++++++++++++++-
>>>   1 file changed, 172 insertions(+), 6 deletions(-)
>>>
>>>   v3: add changes requested by Florian and other improvements:
>>>    - Add associative array for native command conversion.
>>>    - Add function pointer to brcmnand_controller for exec_instr
>>>      functionality.
>>>    - Fix CMD_BLOCK_ERASE address.
>>>    - Drop NAND_CMD_READOOB support.
>>>
>>>   v2: multiple improvements:
>>>    - Use proper native commands for checks.
>>>    - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
>>>    - Remove host->last_addr usage.
>>>    - Remove sector_size_1k since it only applies to v5.0+ controllers.
>>>    - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
>>>    - Use j instead of i for flash_cache loop.
>>>
>>> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> index 17f6d9723df9..f4fabe7ffd9d 100644
>>> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
>>> @@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
>>>   #define CMD_PARAMETER_READ           0x0e
>>>   #define CMD_PARAMETER_CHANGE_COL     0x0f
>>>   #define CMD_LOW_LEVEL_OP             0x10
>>> +#define CMD_NOT_SUPPORTED            0xff
>>>
>>>   struct brcm_nand_dma_desc {
>>>        u32 next_desc;
>>> @@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] = {
>>>        [FLASH_DMA_CURRENT_DESC_EXT]    = 0x34,
>>>   };
>>>
>>> +/* Native command conversion */
>>> +static const u8 native_cmd_conv[] = {
>>> +     [NAND_CMD_READ0]        = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_READ1]        = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_RNDOUT]       = CMD_PARAMETER_CHANGE_COL,
>>> +     [NAND_CMD_PAGEPROG]     = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_READOOB]      = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_ERASE1]       = CMD_BLOCK_ERASE,
>>> +     [NAND_CMD_STATUS]       = CMD_NOT_SUPPORTED,
>> Do we not need to support nand_status_op()?
> 
> We do, but NAND_CMD_STATUS and NAND_CMD_RESET are handled in brcmnand_exec_op():
> https://github.com/torvalds/linux/blob/546bce579204685a0b204beebab98c3aa496e651/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L2506-L2523
> 
> 
> 
>>
>>> +     [NAND_CMD_SEQIN]        = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_RNDIN]        = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_READID]       = CMD_DEVICE_ID_READ,
>>> +     [NAND_CMD_ERASE2]       = CMD_NULL,
>>> +     [NAND_CMD_PARAM]        = CMD_PARAMETER_READ,
>>> +     [NAND_CMD_GET_FEATURES] = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_SET_FEATURES] = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_RESET]        = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_READSTART]    = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_READCACHESEQ] = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_READCACHEEND] = CMD_NOT_SUPPORTED,
>>> +     [NAND_CMD_RNDOUTSTART]  = CMD_NULL,
>>> +     [NAND_CMD_CACHEDPROG]   = CMD_NOT_SUPPORTED,
>>> +};
>>> +
>>>   /* Controller feature flags */
>>>   enum {
>>>        BRCMNAND_HAS_1K_SECTORS                 = BIT(0),
>>> @@ -237,6 +262,10 @@ struct brcmnand_controller {
>>>        /* List of NAND hosts (one for each chip-select) */
>>>        struct list_head host_list;
>>>
>>> +     /* Function to be called from exec_op */
>>> +     int (*exec_instr)(struct nand_chip *chip,
>>> +                       const struct nand_operation *op);
>>> +
>>>        /* EDU info, per-transaction */
>>>        const u16               *edu_offsets;
>>>        void __iomem            *edu_base;
>>> @@ -2490,14 +2519,149 @@ static int brcmnand_op_is_reset(const struct
>>> nand_operation *op)
>>>        return 0;
>>>   }
>>>
>>> +static int brcmnand_exec_instructions(struct nand_chip *chip,
>>> +                                   const struct nand_operation *op)
>>> +{
>>> +     struct brcmnand_host *host = nand_get_controller_data(chip);
>>> +     unsigned int i;
>>> +     int ret = 0;
>>> +
>>> +     for (i = 0; i < op->ninstrs; i++) {
>>> +             ret = brcmnand_exec_instr(host, i, op);
>>> +             if (ret)
>>> +                     break;
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
>>> +                                          const struct nand_operation *op)
>>> +{
>>> +     struct mtd_info *mtd = nand_to_mtd(chip);
>>> +     struct brcmnand_host *host = nand_get_controller_data(chip);
>>> +     struct brcmnand_controller *ctrl = host->ctrl;
>>> +     const struct nand_op_instr *instr;
>>> +     unsigned int i, j;
>>> +     u8 cmd = CMD_NULL, last_cmd = CMD_NULL;
>>> +     int ret = 0;
>>> +     u64 last_addr;
>>> +
>>> +     for (i = 0; i < op->ninstrs; i++) {
>>> +             instr = &op->instrs[i];
>>> +
>>> +             if (instr->type == NAND_OP_CMD_INSTR) {
>>> +                     cmd = native_cmd_conv[instr->ctx.cmd.opcode];
>>> +                     if (cmd == CMD_NOT_SUPPORTED) {
>>> +                             dev_err(ctrl->dev, "unsupported cmd=%d\n",
>>> +                                     instr->ctx.cmd.opcode);
>>> +                             ret = -EOPNOTSUPP;
>>> +                             break;
>>> +                     }
>>> +             } else if (instr->type == NAND_OP_ADDR_INSTR) {
>>> +                     u64 addr = 0;
>>> +
>>> +                     if (cmd == CMD_NULL)
>>> +                             continue;
>>> +
>>> +                     if (instr->ctx.addr.naddrs > 8) {
>>> +                             dev_err(ctrl->dev, "unsupported naddrs=%u\n",
>>> +                                     instr->ctx.addr.naddrs);
>>> +                             ret = -EOPNOTSUPP;
>>> +                             break;
>>> +                     }
>>> +
>>> +                     for (j = 0; j < instr->ctx.addr.naddrs; j++)
>>> +                             addr |= (instr->ctx.addr.addrs[j]) << (j << 3);
>>> +
>>> +                     if (cmd == CMD_BLOCK_ERASE)
>>> +                             addr <<= chip->page_shift;
>>> +                     else if (cmd == CMD_PARAMETER_CHANGE_COL)
>>> +                             addr &= ~((u64)(FC_BYTES - 1));
>>> +
>>> +                     brcmnand_set_cmd_addr(mtd, addr);
>>> +                     brcmnand_send_cmd(host, cmd);
>>> +                     last_addr = addr;
>>> +                     last_cmd = cmd;
>>> +                     cmd = CMD_NULL;
>>> +                     brcmnand_waitfunc(chip);
>>> +
>>> +                     if (last_cmd == CMD_PARAMETER_READ ||
>>> +                         last_cmd == CMD_PARAMETER_CHANGE_COL) {
>>> +                             /* Copy flash cache word-wise */
>>> +                             u32 *flash_cache = (u32 *)ctrl->flash_cache;
>>> +
>>> +                             brcmnand_soc_data_bus_prepare(ctrl->soc, true);
>>> +
>>> +                             /*
>>> +                              * Must cache the FLASH_CACHE now, since
>>> changes in
>>> +                              * SECTOR_SIZE_1K may invalidate it
>>> +                              */
>>> +                             for (j = 0; j < FC_WORDS; j++)
>>> +                                     /*
>>> +                                      * Flash cache is big endian for parameter
>>> pages, at
>>> +                                      * least on STB SoCs
>>> +                                      */
>>> +                                     flash_cache[j] =
>>> be32_to_cpu(brcmnand_read_fc(ctrl, j));
>>> +
>>> +                             brcmnand_soc_data_bus_unprepare(ctrl->soc,
>>> true);
>>> +                     }
>>> +             } else if (instr->type == NAND_OP_DATA_IN_INSTR) {
>>> +                     u8 *in = instr->ctx.data.buf.in;
>>> +
>>> +                     if (last_cmd == CMD_DEVICE_ID_READ) {
>>> +                             u32 val;
>>> +
>>> +                             if (instr->ctx.data.len > 8) {
>>> +                                     dev_err(ctrl->dev, "unsupported
>>> len=%u\n",
>>> +                                             instr->ctx.data.len);
>>> +                                     ret = -EOPNOTSUPP;
>>> +                                     break;
>>> +                             }
>>> +
>>> +                             for (j = 0; j < instr->ctx.data.len; j++) {
>>> +                                     if (j == 0)
>>> +                                             val = brcmnand_read_reg(ctrl,
>>> BRCMNAND_ID);
>>> +                                     else if (j == 4)
>>> +                                             val = brcmnand_read_reg(ctrl,
>>> BRCMNAND_ID_EXT);
>>> +
>>> +                                     in[j] = (val >> (24 - ((j % 4) << 3))) & 0xff;
>>> +                             }
>>> +                     } else if (last_cmd == CMD_PARAMETER_READ ||
>>> +                                last_cmd == CMD_PARAMETER_CHANGE_COL) {
>>> +                             u64 addr;
>>> +                             u32 offs;
>>> +
>>> +                             for (j = 0; j < instr->ctx.data.len; j++) {
>>> +                                     addr = last_addr + j;
>>> +                                     offs = addr & (FC_BYTES - 1);
>>> +
>>> +                                     if (j > 0 && offs == 0)
>>> +
>>>        nand_change_read_column_op(chip, addr, NULL, 0,
>>> +                                                                        false);
>>> +
>>> +                                     in[j] = ctrl->flash_cache[offs];
>>> +                             }
>>> +                     }
>>> +             } else if (instr->type == NAND_OP_WAITRDY_INSTR) {
>>> +                     ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY,
>>> NAND_CTRL_RDY, 0);
>>> +             } else {
>>> +                     dev_err(ctrl->dev, "unsupported instruction type: %d\n",
>>> instr->type);
>>> +                     ret = -EINVAL;
>>> +             }
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>>   static int brcmnand_exec_op(struct nand_chip *chip,
>>>                            const struct nand_operation *op,
>>>                            bool check_only)
>>>   {
>>>        struct brcmnand_host *host = nand_get_controller_data(chip);
>>> +     struct brcmnand_controller *ctrl = host->ctrl;
>>>        struct mtd_info *mtd = nand_to_mtd(chip);
>>>        u8 *status;
>>> -     unsigned int i;
>>>        int ret = 0;
>>>
>>>        if (check_only)
>>> @@ -2525,11 +2689,7 @@ static int brcmnand_exec_op(struct nand_chip *chip,
>>>        if (op->deassert_wp)
>>>                brcmnand_wp(mtd, 0);
>>>
>>> -     for (i = 0; i < op->ninstrs; i++) {
>>> -             ret = brcmnand_exec_instr(host, i, op);
>>> -             if (ret)
>>> -                     break;
>>> -     }
>>> +     ctrl->exec_instr(chip, op);
>>>
>>>        if (op->deassert_wp)
>>>                brcmnand_wp(mtd, 1);
>>> @@ -3142,6 +3302,12 @@ int brcmnand_probe(struct platform_device *pdev,
>>> struct brcmnand_soc *soc)
>>>        if (ret)
>>>                goto err;
>>>
>>> +     /* Only v5.0+ controllers have low level ops support */
>>> +     if (ctrl->nand_version >= 0x0500)
>>> +             ctrl->exec_instr = brcmnand_exec_instructions;
>>> +     else
>>> +             ctrl->exec_instr = brcmnand_exec_instructions_legacy;
>>> +
>>>        /*
>>>         * Most chips have this cache at a fixed offset within 'nand' block.
>>>         * Some must specify this region separately.
>>> --
>>> 2.39.5
> 
> BTW, can anyone from Broadcom confirm any of the following?
> 1. There are no low level registers on v2.1 and v2.2 controllers.

Correct.

> 2. Do low level registers exist on v4.0 controllers? They are defined
> on 63268_map_part.h but the NAND drivers I could find never use them.

They exist. The changelog for the NAND controller indicates that 
starting from v4.0 onwards, the NAND LL operation is supported.

> 3. Are the low level registers bugged on v4.0 controllers?
> 4. Should the low level registers be handled differently on v4.0 controllers?
> The issue is that trying to use them on v4.0 controllers for
> GET_FEATURES would leave the NAND controller in a weird state that
> results in hangs or timeouts while trying to read the NAND.
> This happens on the Sercomm H500-s, which is a BCM63268 with a
> Macronix NAND that tries to unlock through ONFI.

That I do not know however, William and David hopefully do know.
-- 
Florian

