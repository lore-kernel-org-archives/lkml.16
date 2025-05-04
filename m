Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F92119F489;
	Sun,  4 May 2025 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746384084; cv=none; b=GZDXGdESposLfvwHp+OHhwxfk+0Epd2/43K9N1WGZV6/u0+fci3zp7sAk+Y7NBnOSV/pS8gxbnH6ukfzW2Id2b9Stf1YqPwi21xE4sMzAuntDEsMvCseVxr7e7Do+fStp2axVhskRH/rWF52biaPDFvWbzwoIFQJRd9S1b7LjyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746384084; c=relaxed/simple;
	bh=LCuS5NoxIHqW7U/55a3sx8jUo05O82HlTJ+VcahI7u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSv7ip7SZOphV/taNdoeH26+niCseX9gtYK8easLDWt2zxuajqmb5pfWvLmKHTAQldgztsOQ8EKzQYGfFT/xWk09MxdVltNK5/Mv+CfhJQnsxjEmH1nqOcAHS0sjLIokgAebqu9mwErqCCTTCtMRu+/gSAQh+yqIOxsBytcgfB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkIRcbI7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkIRcbI7"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb5ec407b1so634465966b.1;
        Sun, 04 May 2025 11:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746384079; x=1746988879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FoJU6gJaDGitgWGlVAW43BYakx3dl8orcQipQm/HMY=;
        b=OkIRcbI7aqvgnyoBHILvpdOyxLRd8v43v66NSTGKk/wtWxxLqupm+N54t5eYqYlF2X
         yN4f9z32XkhRY7h6ZZQ3ui+Fylu3DEw1+SnxapLL2301KmkFEFAitnIWer9Qf+8Gb0F5
         eh2YwfSA98E2FeGXDM5nLsRmH164pXdld5qPSGeg5QLQpnGTKb6II1MO0/SXJ7WRU5t9
         mUV4jMSF8T+s+pbHvTjRvTCMjrz2HWlgDkA3nXb38mQ2swXvhQIe22Ch8lg8BOBlIXPu
         0TMLbCQFDeVVRl7uoZuwiUEGacxtPOxY/T4a1MMY+xR5q58ynuCYgNmvxrtDqA2lxIIN
         fiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746384079; x=1746988879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FoJU6gJaDGitgWGlVAW43BYakx3dl8orcQipQm/HMY=;
        b=j1zzcGYcnuEX8UrTLj/wCrxOFoZtOHRnHmLvAHDZ7/PNZysWg2oE+vQ0wkcDA2eT2d
         svTXzRcPkcAZwR1OyYpK5k/8n7URTyK75/GUPI8oBNIrpWuqAlTD1obIzTjNZtxH61tB
         Gx706gELbN7f4TndrFM9ivp1WWH2HRkRhpRQ5qaUA/odHzHNpQyCszLnmy1BmyQX0vMy
         SOGgKlcIKMuXDoWbSdDmiZH5omhbAtVo77o0wwrGBFGxyj5cQ2HtLafOpbMhOoLizKmr
         9Be8M06iwiztInenyu4hQuSP2lmefwHOzDHCeeE98Bf9x3wU7lrbeyF6EVUib7HF+x8d
         vMCg==
X-Forwarded-Encrypted: i=1; AJvYcCV/eBy7HCBUWqqYCWPu01lNpVBjN/oEZfTwt4W5mJi539OWbPkNfLMuSxPObOCv5GbOn0QLoyuGvH2b4YU1@vger.kernel.org, AJvYcCVAJ8PGdQBJJbWIF7IFSuWl0jCT0tqvHk+FxtRwxq+PnwvEl08lmZhhb59QSGpufuXQI/+/mWTFAvNYlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPZvUpmyOJaCQHs0J/axOD03SFV3JOrr7/lKz5qu1vHRKCM80Q
	AkYTxTAvNBjKTUiYu9mvzst6X+pC9GsQ7VUefKCGWuHmlnHjZlH6
X-Gm-Gg: ASbGncsqEODXFveeGb4kDCx94vyCvv7QETpLPa2P+5rrsI1LvTTutKqTesCBLiWeXyt
	/hlGNgiUbJ1lPRBCfpS7D0b/I16eSzcxHHneb4DhBHYVqgWol1nsfMZqg7/atxPlmTPxxF2m9sU
	yBUAkZ5b3q7DgwrQU5F91SxpSmFuviZ84wIC484sLnvq9MZA++CMjvWrevi3Uir0hraMmexn+aq
	0O5rXDubf1igArJJ+8J1x0m0G61tFHSvH5hUfk2Owp3BWzcE/I3XumkZgPK9AmTjf7QnuvLobqP
	QM8iZQVyuQO4FvJbDGKN5EHvaHM1iZQ8hbfjdtpxlkO3Ywmo4KVUZ9/L08WzCWe9DcAZj4i5mBf
	pooA6BYJmrBlvxQVxI093HLoNDzo=
X-Google-Smtp-Source: AGHT+IGcVy2BmP9mdTZ/08ewUk+k9GqfugKPdeUvqNO+PamBR4KorE6NmevFhG419TK3CNg6KkNXJA==
X-Received: by 2002:a17:907:970b:b0:aca:d5a1:c324 with SMTP id a640c23a62f3a-ad1a45bead1mr390805666b.0.1746384079008;
        Sun, 04 May 2025 11:41:19 -0700 (PDT)
Received: from localhost.localdomain (host-82-56-126-113.retail.telecomitalia.it. [82.56.126.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c02b8sm354556766b.118.2025.05.04.11.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:41:18 -0700 (PDT)
From: Luca Carlon <carlon.luca@gmail.com>
To: w_armin@gmx.de
Cc: carlon.luca@gmail.com,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	lucas.demarchi@intel.com
Subject: Re: Suspend/resume failing due to SPD5118
Date: Sun,  4 May 2025 20:41:17 +0200
Message-ID: <20250504184117.4795-1-carlon.luca@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <9625330e-e3e9-49ea-9979-653091dfbe16@gmx.de>
References: <9625330e-e3e9-49ea-9979-653091dfbe16@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Please you load the i2c-dev module (sudo modprobe i2c-dev) and share the results of the following commands:
> 
> 	sudo i2cdump 1 0x50
> 	sudo i2cdump 1 0x51
> 
> This should return the register contents of the spd5118 devices. Please make sure that the spd5118 driver
> as been blacklisted and unloaded before executing those commands.

Hello,

I followed what you asked:

# lsmod | grep spd
# modprobe i2c-dev
# lsmod | grep i2c
i2c_algo_bit           24576  2 xe,i915
i2c_i801               40960  0
i2c_smbus              20480  1 i2c_i801
i2c_mux                16384  1 i2c_i801
i2c_hid_acpi           12288  0
i2c_hid                45056  1 i2c_hid_acpi
i2c_dev                28672  0
# i2cdump 1 0x50
No size specified (using byte-data access)
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will probe file /dev/i2c-1, address 0x50, mode byte
Continue? [Y/n]  
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
10: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
80: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
90: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
a0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
b0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
c0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
d0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
e0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
f0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
# i2cdump 1 0x51
No size specified (using byte-data access)
WARNING! This program can confuse your I2C bus, cause data loss and worse!
I will probe file /dev/i2c-1, address 0x51, mode byte
Continue? [Y/n] 
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
10: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
80: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
90: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
a0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
b0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
c0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
d0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
e0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
f0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX

> Could you also please tell us the name of the RAM sticks you are using?

Of course. I have two 32GB modules. One was provided with the machine and it
would be difficult for me to reach that physically. The other one is simple
to reach and I installed it myself: it is marketed as Crucial CL46 - CT32G56C46S5.
This is what I can get from dmidecode:

Handle 0x0002, DMI type 17, 92 bytes
Memory Device
        Array Handle: 0x0001
        Error Information Handle: Not Provided
        Total Width: 64 bits
        Data Width: 64 bits
        Size: 32 GB
        Form Factor: SODIMM
        Set: None
        Locator: Controller0-ChannelA/B-DIMM0
        Bank Locator: BANK 0/1
        Type: DDR5
        Type Detail: Synchronous
        Speed: 5600 MT/s
        Manufacturer: Micron Technology
        Serial Number: E97A5953
        Asset Tag: None
        Part Number: CT32G56C46S5.C16D   
        Rank: 2
        Configured Memory Speed: 3600 MT/s
        Minimum Voltage: Unknown
        Maximum Voltage: Unknown
        Configured Voltage: 1.1 V
        Memory Technology: DRAM
        Memory Operating Mode Capability: Volatile memory
        Firmware Version: Not Specified
        Module Manufacturer ID: Bank 1, Hex 0x2C
        Module Product ID: Unknown
        Memory Subsystem Controller Manufacturer ID: Unknown
        Memory Subsystem Controller Product ID: Unknown
        Non-Volatile Size: None
        Volatile Size: 32 GB
        Cache Size: None
        Logical Size: None

Handle 0x0003, DMI type 17, 92 bytes
Memory Device
        Array Handle: 0x0001
        Error Information Handle: Not Provided
        Total Width: 64 bits
        Data Width: 64 bits
        Size: 32 GB
        Form Factor: SODIMM
        Set: None
        Locator: Controller0-ChannelA/B-DIMM1
        Bank Locator: BANK 0/1
        Type: DDR5
        Type Detail: Synchronous
        Speed: 5600 MT/s
        Manufacturer: SK Hynix
        Serial Number: 2C3B11DE
        Asset Tag: None
        Part Number: HMCG88AGBSA095N     
        Rank: 2
        Configured Memory Speed: 3600 MT/s
        Minimum Voltage: Unknown
        Maximum Voltage: Unknown
        Configured Voltage: 1.1 V
        Memory Technology: DRAM
        Memory Operating Mode Capability: Volatile memory
        Firmware Version: Not Specified
        Module Manufacturer ID: Bank 1, Hex 0xAD
        Module Product ID: Unknown
        Memory Subsystem Controller Manufacturer ID: Unknown
        Memory Subsystem Controller Product ID: Unknown
        Non-Volatile Size: None
        Volatile Size: 32 GB
        Cache Size: None
        Logical Size: None

When I was told that the problem may lie in the i2c bus, I started to search elsewhere
and this thread came up: https://bugzilla.kernel.org/show_bug.cgi?id=213345. I
therefore provided in that thread some more info I collected.

Please let me know if I did something wrong.
Thank you.
Luca Carlon
