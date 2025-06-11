Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D8F2D543C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631189; cv=none; b=lAJI3NK9OEC9o0BZ0AFFf7A9j+QGxJu3R3P/7pWi/SYnX4i8MQhlQ65WJYH5/DECfCelGHlUMLq6Cs1l9+01XZDh+GGH+rFZ4koTO1bs87JcUjUsjRt2JfaZfdDSZsV+s9W+tqjxYqqEYMgIIERpbi5PFbJWlKmO7Kk24UIBIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631189; c=relaxed/simple;
	bh=sqlinEn+WadRkpr66v6lQ6O2iAs13ZkHYy7D1blDOqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cLJnACXCRnl1h6VLltC6nI+NohUoimngUEzPWu2Z9QRN9XOfhD2aoGefnM8AXtvRF8dFXI2eimZzYDu197CEbmVT/hmxoKKCeRjJAJFNO9VSC4hDkm1+ZOJm6GeOH/johyP9ovKJMu/Y1wGT6td4eR3tv2osuBt+F5qlKQ7WjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=c87wWJWR; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="c87wWJWR"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so7532428a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749631186; x=1750235986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sozhA9SLLboh+8HTdUnRws+mKBzTVepTF173TS6LEE4=;
        b=c87wWJWRGrfj7doXRccelH1NqoAAeYF6rv3Eo4d6F/DH3WUDGSOPD+NN44cHPCATKp
         H88DQNHcmwT/6X1Xhy4buup4X9bQDQt2Hhk3OxQ7wixn+2xxxlbGpdP08P3NxgW9KyhP
         TD7YE8x6+NnV3EWKzrZ91rKw8dcgfSmkPfhdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749631186; x=1750235986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sozhA9SLLboh+8HTdUnRws+mKBzTVepTF173TS6LEE4=;
        b=wBiU5Ocl/NdTs+Qj2+P+IaWVauWiIqpnagW2OeM1FZIpf8uvFp1hHKvWqQEi9jUU83
         e2qRuy4IkUEgGQJ0wglBimDwWnJGdkhX0cKalJowvWz99JnJxkev7dq432w/wI0+iIO9
         kDD4nmtXpBD42ue4XbpaVltrjpyslSwZ0l/N80GyFv5emVaeUo7ulxaTt6PDPR6w2bzY
         eiE+joo3RV/nZT1Rkku225IVgdspK2LrqlmeRaAwu9Nx6Pc68DhDFWLs/QMMZ4Y9e89i
         bhdYc+nwRa0m156N7jvPrL1Y7UfOx2VATguYyTQWQ3nCwO1pfZySOsCjcLlMgo0bhXp8
         OF4g==
X-Forwarded-Encrypted: i=1; AJvYcCUX8uU+hskNBQyY+u15CmySq0eiv7XYhIhWWIVxsFQbFvPbsk3TnPOsd6MOElBKSWe3ich4yo3E1/UHtrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziQpl14UEEJ/hVlR2+0LdbBnvq6VURRNKwBC0ieFLnXVAZD7uA
	JWFy3VvrzBPwv6asY5E++TXIgkkkxkuiwH8hKvDetrv4+60sLzWzvsaB2RLs0ojf7dHdJ2TRk/r
	9+TxA/13YRA==
X-Gm-Gg: ASbGncv56wcQWvTNVBZswYXmirBWOES46WC6eP5cOI5raeCb489HK6iXPUKwGSJzUue
	qXmSawmx9KNdCwxSyGf72oafEcjfMIkA9kb/KB/r2+ruvw1TZLDlhWknDX59F14iVRmfS8p+r2K
	Qx89m+OG3u8lacuS6hnee4cxN7MNCEcmnAIG1XVSJiZzVJCSjgiHWp6CcMhVFnvD6PVIKhnBtJZ
	2SEa9U1PkDWYQ9IA6oXE57EBeM+YFvmA+df1XxnSdEMClQnuGK/YmfThZBssxExV8cSDvcezyMz
	CO78VRoLBrS4gMOoIyp/BYwiIQGmZPG2qWIOWGJgRTPP/gT/s52ODYaTruMZRgJNzbVxSK+KO9f
	t
X-Google-Smtp-Source: AGHT+IGy/zHKkLoCqd0X2olDp98Qxa0qdVeeG437zq+tGKaNriTn7CidMfefy/lb+POVB1pfKAU92w==
X-Received: by 2002:a17:907:7290:b0:ad5:a121:6ebc with SMTP id a640c23a62f3a-ade8c3a296dmr185909966b.0.1749631185945;
        Wed, 11 Jun 2025 01:39:45 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7c786sm874845866b.172.2025.06.11.01.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 01:39:45 -0700 (PDT)
Message-ID: <876382a4-432c-42c0-adda-cc992d9ffcbb@neon.tech>
Date: Wed, 11 Jun 2025 09:39:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/mm: Handle alloc failure in phys_*_init()
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech>
 <a404d023-e0bb-4dc8-8952-accba299ab50@neon.tech>
 <a43965e2-f0f2-40d5-b7cb-f79bd0261d06@intel.com>
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <a43965e2-f0f2-40d5-b7cb-f79bd0261d06@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 16:07, Dave Hansen wrote:

>> +		 * phys_{ppmd,pud,p4d}_init return allocation errors via ERR_PTR.
> 
> 			 ^ typo?

Oh- yes, good catch, thanks!

Em
