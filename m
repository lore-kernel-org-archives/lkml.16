Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4F217578;
	Sun,  4 May 2025 23:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746401495; cv=none; b=OMxJ8Pqt2dyWF2gT8knw91m86I6Jfy7v4OI0ikEnF2objCERecAU5d7q2OwfbmoE3201JrjE9pOhf1NIZ7FDkfkDU2m0e4vkfYlsPpI6+qYp51PYGddFuzdaY6evTBs3nvA+KjzNBSJQ8/y35nGdWPT2U1JoWJErZGZw1Ilj23c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746401495; c=relaxed/simple;
	bh=5GtgY/EnvKFlpJ2uw99+BwLzQQ0PZUdXBdDqLf4Xn+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5BuPBM9lom2QoFv6fVy+/dncWGCbMrr7BDLlg0ijS7kQ3eu6Mm1IW5SrfLzoIldFpfbfAYa20Vbu4vLRQrCG6c8AXABh/iuXX1tAg2heOxyXpWGSXpRZ8vQJ5Lv3eRwBgDvzW7QeG20xJjVD8T77L4suG3VCkpHLWu/tm//wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+Yu98hD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+Yu98hD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3035858c687so2787743a91.2;
        Sun, 04 May 2025 16:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746401493; x=1747006293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1k0adX3nlVCzUCfyT6I0QyXQncvcxoU5bJZ8Verleyc=;
        b=Y+Yu98hDfjRKFOxvotDG3BZUEHWBq8HAf/SDuOUeUtaUo8nfO5wFI3JCi18nlbBBzz
         CtagM9F0xdh+VvpV5bJx3tg3hxEda6qk17DOxC1bZNjIP37ni61QluRsXGKXXBbX1aod
         IVqnCpgBtxsdM1v+w/PxUE/l82brnP+/mgzXT/+9HqzSAvKEE5gmnBQ+3DuxwaDvXwG6
         abE6qiBO2HuFVORodysYtD3dNf1vo9L0mtGNDPFNcm3bGPm/re/tZf/E7P7yp2Ib3tRV
         jwgivp7VIkYC8f7n+sWIWWVNwox3ohxsjBkkH07A41KsjSOKqy4JHO6kWnH6w2Mw84lC
         A3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746401493; x=1747006293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k0adX3nlVCzUCfyT6I0QyXQncvcxoU5bJZ8Verleyc=;
        b=SWML8KSYSGeieVjRI/WCyRuZwMSakHjV3qOu3HDRtee9f4oBQmNRKPJakmHzmSZyV4
         uelyg12A96nejVQGIRWh0B/OVoG0HkZObmSp3/eRSxWHGhmuhizCOKpMPwAsbiO7VsGG
         3n1bVYeHMFO0G14TMVRUiYu0snMDHqwjJaVngTd0bqo4eoF3qZ1KnW1K88zlDL0O7R08
         duOJolN41dRicgybU89S/jqjTmOAI2av8ju5Go/T70h5REujfVaBTAPLN1Cs1Uv2IGXZ
         5SJ6HCHh9G2SV6KiRGh1S6yrmbZ/+S1Fgz2341p3JBF33EqhsfRQ4ke1EhQJjbsi7O+Y
         tM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDIDjgggwazOiKrM4gchGR/IcbsY4VSm0bb5NkYnvxUSjkJtDeCeD2Qj8iMsvAY6ThEJN8lMfgThBPNjRU@vger.kernel.org, AJvYcCXgTLdZPuc5WNGc2vKrmtq88zy4lLNzwLU89jJCR1WRawYDRTLl6sSAoMSkxy2JRMX+72YxCQyl8w4nvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMACP+c5h9bq42dZvcWb7UGNCNxlGMAbGZFTmsf7JqKBnkFT4L
	JJqshoTizUSiHZjGK14iJpgTzBbI3I3tG9QpcSNVeavmhOR1TdmN9AypsA==
X-Gm-Gg: ASbGncsLjpkioTM7K0Zi3K4qw3HwPiFzgMr78opsqKGwDS1Byk8LGzFJGzLUFg5VDHf
	t9kdzGb6G4nzTjRf4iBFmIOB2wncHd4PJT/dtL5n3FyTsxCYaIvnq3mnsEwaQIV6oiVrTFhoA9F
	lxD0J2xPzBXPuibtpG2fO8w99QHAXiM7zroDYB3Zf+ocBWjRprrgLUmEOgicfYMhVbJFSUKObL8
	e3opXIuRBneWMnG8vlofCekhta0vs34Y2IPPRJawcNabpmWRfDTk7pw5H7PKk/G3WwQqCDMG+Gn
	iOiLfPCpWWDs6ea1/qT3UnNYXSIyrJqoFE2UACcYJVEOcYcNpDHIAURhJB5cfLKnjl/+lY+oyYz
	hsKgQ7TzFiX0ZLpelGG78MLe5
X-Google-Smtp-Source: AGHT+IHupJUM8SOyCsiTuXxkKu54Du+BzTghrqHsFNOu1cXqgRHmByJ7iSMj/852ykYP5BWtp/TPjA==
X-Received: by 2002:a17:90a:da85:b0:2ff:6488:e01c with SMTP id 98e67ed59e1d1-30a61a6f82cmr6957662a91.29.1746401493140;
        Sun, 04 May 2025 16:31:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522a3d0sm42392965ad.199.2025.05.04.16.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 16:31:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <310fe3a3-e585-46e0-aae7-3e4d41af1f53@roeck-us.net>
Date: Sun, 4 May 2025 16:31:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume failing due to SPD5118
To: Luca Carlon <carlon.luca@gmail.com>, w_armin@gmx.de
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com
References: <9625330e-e3e9-49ea-9979-653091dfbe16@gmx.de>
 <20250504184117.4795-1-carlon.luca@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250504184117.4795-1-carlon.luca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/25 11:41, Luca Carlon wrote:
...
> When I was told that the problem may lie in the i2c bus, I started to search elsewhere
> and this thread came up: https://bugzilla.kernel.org/show_bug.cgi?id=213345. I
> therefore provided in that thread some more info I collected.
> 

 From there:

[    5.416572] i801_smbus 0000:00:1f.4: SPD Write Disable is set

I think you are out of luck. The above is incompatible with spd5118 devices;
See [1] for details. I don't immediately see why that would cause the i2c bus
to lock up, but even if it didn't lock up the bus I don't see a means to get
this to work.

It is still puzzling that reading the i2c data using i2cdump fails. The spd5118
driver should not even probe if that is the case. Maybe Armin has an idea.

Guenter

---
[1] https://lore.kernel.org/linux-i2c/20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com/

