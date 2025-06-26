Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219378F2F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958369; cv=none; b=iLjmwcHXoaEqsOLjgqk2MGuOmytg7x3WK6Qb2Hhx7qkDWbf9osqEK8BiASYjcOSLAlHfKAWnPFKneiZm/5ysEUnmkTjxGl8abT8yos9VpxwborbIgaooJ387i+/HoVrR7ztJdE+c1FtYPtQ6HWi+XSQGCxX+d4vWBNiiJiPLSD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958369; c=relaxed/simple;
	bh=nDbbC4Hd9/3B+vhCQ1wjsPmR72rrMSVbY68DC68o54c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnmxu8Gwl3cux006lf9xZ0ihODqzyX0eEeU8PAwYCm0V6urERzTPTQl/uv8fBCD9qa7Qzaga/xFOGd2yIY/bKRff0JpWaiZy71JvH5+uCZTu8sEV4Tab5/GlK8Qo0YFP6oFUe5hozMarDBl/hNpFQkxqrEN5xZH4TTS0ffPFhp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HRxRzThR; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HRxRzThR"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748e378ba4fso1742609b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750958368; x=1751563168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NtZRDmDAizpW4/XBY5edDAXk7j8AwfqYz0MnAvJx1HQ=;
        b=HRxRzThRTJ50H3Iw/4YuR22CJAwn5SZSADAdE3G3jpoA6wTT8ot2MESw88wp5B1TUh
         lqPQnVf6lNQqetlQsV3mAdtB8msVfvVdjVz98TlX4/9cO3ugywIqyNYcvCI6Szo2BQ9r
         zRbRpSnI+/F7QruRTcgBvNnfbCYT0nit4WL2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750958368; x=1751563168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtZRDmDAizpW4/XBY5edDAXk7j8AwfqYz0MnAvJx1HQ=;
        b=mzV1sAlHjEn0WAF/cjVeFGGVTxl5vVi/eaPSmfMeNIAilrw5IwGyDMBuCA2BFVQSME
         /SWFYAcMplXNigTcRZFr5M2rmzf8wTgakl+7ZacQb8QHlAmwWFJV0erJT3hJwqKPbEv2
         aUmX4i7Ev0Rgj4mKAUgzMxvTR9CTr1EAGTS0bFG5r6EqIrGUEzI/jvIn8ZUQJ0BECixx
         gBq7EQ+OO+9PLiopJSlEZgUt+SlVyBP5N34djNuE1eCYjSbejHGaLzA3FdrmL2TaOHvv
         slEH9xf4IOgQ/dW5m/n6Ab1IuiFziUkQUgPn2n/QFVg9uNlucP2H8ZTI9GKbu06znG1n
         6RCg==
X-Forwarded-Encrypted: i=1; AJvYcCXi35HkEbm0awQ2yRwq+X3KqoJn21PS23Ot2Swqajnjgbo4skYtXoS+NJlAb5bQqQu5IQMSV5QZmiivNlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfG/O1TIt+psWTFpnl/iQPTWUkxG2JBYyy5r/JMzjUw5QpTYsn
	p0OPXJQrlpN1oCLVv3Lh4SEYgITFj9m1Y3pNyNknFrzSbjsDH3AR8BnzujspbNm5PA==
X-Gm-Gg: ASbGncupjkbroT/suKa7Z68FQh8sAIyGwVDtwTmNN+zrTns9aqwcyT5oATuiez7HsNr
	Edbj9l+GKBJW8TOMtEfJsCNlJOFcOZF0vH7H9+kgKOsJC7Up7i1bNYrCEDzjYJGh/9R0OSki2hI
	f1YUS5qhdp5PbZ8dxMUIzx9ZPjxxrRyrD7nG1j8dLqvaGn2p7k2kaC961tv9/8z2BNWXBmFuAi6
	PRwIQn0eM9n7Egh52Mf9v56s010qurPk6Ty8Tu2EazU3bOaJwgq0MBOwvzxRrufyG8T2XRUppwY
	yBdNrrAFin71fZKNkYqFA30C6Rq80BB6PJsOk1GVmJiUdhpSSeLkZ7tWGHQWupMK/5ANjwGy+Fj
	bK9V+PbZwZ+6IRhAXO6u8/D3rcQ==
X-Google-Smtp-Source: AGHT+IFEFBCC0pNWKqWjl/nW7VN5jN8ypvsYJMVUKK/PSMS5q0p9HDSKxuQ24OXpG2wTZaN9wqvZYA==
X-Received: by 2002:a05:6a00:3c95:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-74af6f40b91mr14622b3a.13.1750958367445;
        Thu, 26 Jun 2025 10:19:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540be24sm217577b3a.20.2025.06.26.10.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:19:26 -0700 (PDT)
Message-ID: <afda0ce3-d824-4a4e-9b91-58e57e649aa0@broadcom.com>
Date: Thu, 26 Jun 2025 10:19:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/gdb: Fix dentry_name() lookup
To: Illia Ostapyshyn <illia@yshyn.com>
Cc: akpm@linux-foundation.org, jack@suse.cz, jan.kiszka@siemens.com,
 jlayton@kernel.org, kbingham@kernel.org, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
References: <87pleq4ete.fsf@yshyn.com>
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
In-Reply-To: <87pleq4ete.fsf@yshyn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Illia,

On 6/26/25 10:01, Illia Ostapyshyn wrote:
> Hi Florian,
> 
> I have previously submitted (and resent due to inactivity) an equivalent
> patch here:
> 
> https://lore.kernel.org/all/20250428142117.3455683-1-illia@yshyn.com/
> https://lore.kernel.org/all/20250525213709.878287-2-illia@yshyn.com/

Ah my bad, I had not seen your submission, then it should be taken 
instead of mine, but with the Fixes: tag added so that your patch can 
get back ported to stable trees.

> 
> However, looks like d_shortname is not suitable for entries with name
> longer than D_NAME_INLINE_LEN characters.  Although this matches the
> previous behavior of the GDB script (before 58cf9c383c5c68666808), I was
> planning to resubmit a v2 that addresses this issue as well.

Sure, please do! Andrew can you drop my patch in favor of Illia's when 
it shows up?
-- 
Florian
