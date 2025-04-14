Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96599198E75
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644010; cv=none; b=AVc5pfgL7hrn72HxFyOMjP+eL3lXd8nbVfWA02MAzR+aGlGUhVrDgFx2UGEj/2UhPA9B5sMQze6zCzBQSpkUYw1sq62b1RCE0ZpVHsuEIFGy481Ui+LurYKoxXZDVkJd7MzIa7TsXWdKUK9h0ecG5zwTdVfu8YzF5oC4EPNQ5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644010; c=relaxed/simple;
	bh=Nra1mpWoP5sQLftUMhfcDPhNz7Sv3fQY2wbk5ql7ko8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvNjsSFCwu5TIoahJHNMBiD7okFjjqCcEXvg36aCEr00lFwb5DtCnki58MTHYzZ29/4729zEt+tH793ZjlG4GRx6mFRmUUvjWmFZ8Og+h9uPWp9SoHm5UC4EhWxU9Z/WXdvPp/s6B0PXVvCV38NuaMUdTBpJQzE7LmdTycqgUyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V8RL/MwH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V8RL/MwH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso8936272a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744644006; x=1745248806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E3eldVPI5Q1ujWT/qKPC5xtzIi2Rh5pkkoRJ+cDKYak=;
        b=V8RL/MwHhWCQRBTNZKt6bKwIglejvfMWTR4Whjq8N1pC44AS17+QYWMutYtI5m12N3
         6dA0y4aAfOEqGr3PQZnIrZtOeyKxSLBy5sswC1ARwdUb4mlew37bb32szEgBNeDxiBCF
         7ZToAVt8ddJd0TVxGBnjuUtD5eO33Dc6Y7XERAxSEjm/L3675ROr6v23txFKwuT6f5L0
         sTnLAHTEJu1XaXbOorF7YIpqnTjePfhWHCSY2Q/O+ddviLehWu4QGP7H55b93MlOOmzZ
         efZClq7fE6p71qcvnUv2NYNE2g4mXRvnu0tdHc3PcaYpCm2n2XF8vTxjG/adGR4oJDSh
         VFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644006; x=1745248806;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3eldVPI5Q1ujWT/qKPC5xtzIi2Rh5pkkoRJ+cDKYak=;
        b=VJJfaowiLQRmnEd9YPZls0V04xOJg6jdTT4MLWgrTLsCgvTje90gk6b2AaU1/0NZxy
         xTJgPhZW5KttRFaMah6QK+3MHyfCT3OafdJwldh0bx713avFHGfmXtWDT2uvRAjw4yF+
         QLhEwfI3zHZ9b1BQ2I/Mw79l/s32qQ/RUqsPDPw/c5zWP9zf0spdIgYEkzRvO984lXxk
         GCelMDUFyOyYNopOo+n3+yRd+uJ10OY2/t9bMgWt3U/KRceAxd/7zca0TmHRerdiv1Si
         YOrKhhak4kqwEglXOgNPIGXfHWQQ9oV3PSOhebDegmYtKSqHaAdP5isgxqM95SOgjzXG
         V4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVORv1CvIHCOYdWtovLkRVufcQQ5ldmhpQvN2TKuX9yxo8VCR7CjwVEvnajekTEX3n9alvRjQtKidMDV3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDnntMiaJpw1lXqn3q42ciKG8Iq/ppjJzkyZysL6Z5iMkhQEsI
	pHIGhS0jkRt1O39OAgw8d24X5m+U4hqs2nPNEeIW7zocT9KBydyl7MMKiC7q3eM=
X-Gm-Gg: ASbGncsd92+Ly6voRh9OVqCgyMrZYGOCmNOBe1bpieo0InVSc7T0pNWN8mL19wxw+cE
	cvFdpRPKpl1MEg6f7oD0Q3dB7wpcirzE/j/gdtzag+NmLNS/rEGBp7JcyIZJozivcsIjCSLiuyb
	6J1PmG0KPqkD249Q+UOsx7mZemV1hL0p3I2pMBcs+/VlAqRY07xX0z22fDHx8KH5ypXvY/7T/4d
	89SsYBsMfALQzDAMhBdNaaQgcoSlBqVtIXRAWfuCUs897hmahmsLUpNhRI8fiN8oUEY6luAYJi1
	LA2XK0R8c12/Mi+Ya95EWGGjJU2dDnlEebFAQm2tVCNhiw==
X-Google-Smtp-Source: AGHT+IEvy812owaQx6M28LZuTkkV4ORbIJ/FlLqhFlOi5etpRo0lXPmCLLnaAtTat+5Gb6xR967YvA==
X-Received: by 2002:a17:907:3da1:b0:ac6:fe8c:e7bb with SMTP id a640c23a62f3a-acad36c1be4mr1310513466b.55.1744644005931;
        Mon, 14 Apr 2025 08:20:05 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc363sm940250166b.146.2025.04.14.08.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:20:05 -0700 (PDT)
Message-ID: <38b92d8f-8793-4d0c-b3eb-658f5437a567@suse.com>
Date: Mon, 14 Apr 2025 18:20:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -tip] x86/asm: Replace "REP; NOP" with PAUSE mnemonic
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20250414145033.10511-1-ubizjak@gmail.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250414145033.10511-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14.04.25 г. 17:50 ч., Uros Bizjak wrote:
> Current minimum required version of binutils is 2.25,
> which supports PAUSE instruction mnemonic.
> 
> Replace "REP; NOP" with this proper mnemonic.
> 
> No functional change intended.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
