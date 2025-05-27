Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C51FE46D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335934; cv=none; b=NRmjCGNirFsZX9aw7G0OD5g84803x6RMn6gdZEOptEz+NZFb8EFw+YL9jSm/OUDNNopdwpS9B+zgIMC0dGx0Fdf2SM4Ibc5Y9Buel5DSBBJpqSBr8n4PKbadidzzFSNHtq/4B1S45N9GJoyw8fjFRaanJfx6HLPp98vsn8TXCpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335934; c=relaxed/simple;
	bh=4mSKtba4yH/6S4y+/PV83qun/HcTtQ/B2r4C5DqnP1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUGTARwvYGPJ+a4SgJe2ZdRMUk/kzBypcRTYHEA5s+xw6KZccR9JaSED9FJgCDvfqv6UlT1Ouas3s6l1Elyk8v/YXn0fDCLrD0BzRxCxl6c5M5nOqpQPACnKBGN2JD165V+yBT1FSsw8QEBTqCAImM/7UviAMiXjk3qBZ68b148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=cDkza7l3; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="cDkza7l3"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4d33f971aso1645112f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1748335929; x=1748940729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mSKtba4yH/6S4y+/PV83qun/HcTtQ/B2r4C5DqnP1o=;
        b=cDkza7l33Py6g4Coa2OrK61vrK0m+2jYKt1UnZ9oNEnaw70b2T0PyuoRqMoPpOsfHQ
         0HLEW55OpncZBOY8nqxRR9u2PLQF2iuOB/ICte8vxXtBv7QWiRmoaOtervY6R6jA9QR0
         m5AwMmlBwgfX6d5rJyEHr7K11HIbms2csz9WYeW27NliVCbL5uIfxn8fQkN599gEioxV
         asvGpGGsJaUtE6n0Us0vLVkDEQDp/Y1x7lJGuMuICrQe8KHqPpRAIl4iNgR9R8g8kLlx
         iLXXcI63cMjm6iMU49sF8Z8q0V9SRaob4Z1bKTWs7tqY24KkYc5kIakw4RD/xv5FsS6f
         /h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748335929; x=1748940729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mSKtba4yH/6S4y+/PV83qun/HcTtQ/B2r4C5DqnP1o=;
        b=nGkUtBWcYMhY4XrDn29om5JskTFLDVILKPKDcuKlAe8VhaxLniupo1Kv8QY4eYbsMY
         RKgo3wEbuAH84aXz8SMTcoISRkG7mXtSvYN9ReriIQVuwQ/N3r9ukajuOSlsCnRZYy+e
         LWMlJOkm7hDAH9RvdQS9++ekLdgL/wlTJCsoJZLd4fATHj2sjZq3tY7RDHGNzhqkrx/t
         SVX40g6A9+WE4pjS3/NfTggR3LcJ20QgVD/DtnXemMNoB82CJMUbtCuJ0UxghlrUTEiL
         4T8+Rdkw0uVYC3tz9alHNe2+bipLYoSY106Hvku3eOroFodHJ/6hHbXCUvxaocR1p16+
         bSEg==
X-Forwarded-Encrypted: i=1; AJvYcCWnnB7ab7tCta/KbwN0LfojRv8ErpkDMy7M4yBk67eCbJzVkGpuljLodJuBv+IJmwmPhbcrEiw7rZNlDxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQLJk5ltIsuHtEat8hNniSvKv+kRrkOxG9E7S0HOu/WeO4KmTQ
	65N4KuMCIYIU8ERjUKzcwG/C1LNC0tydOMF9XOfVpLcL8tA/G2iDhZqj7V0gFhG8oU4=
X-Gm-Gg: ASbGnctrQmueOgIx646OP23VOu+sLi490W1FAT/psGHO1orkNpN0vSNokp5grjo5SaC
	zT28cksEHODbW/Lyfv0DCvoqA5Qe9PCNaVpei7Wm5UJRFf6TWb2dr3EO77hY7/CGX32cFA0joiS
	oID2d9V4Fd0UJEDlYsBEr2SQ79TMHkwJ3nEamJZKG3qkqYYl10jn8P6uRm7JyX2bD8nCNPBA+UF
	rbF5XGmXwiSRqG1UyXrpIm/J6y7DUu7Qa64sfY5LLZ1BMc3ImFxPhxBLFIkzADpuCwRU+isEDTi
	LK8cjChqmAnI7F/pA24rJsyqzUGj8p9LOF1FfyiZ2InqBGTXUiZtYxLEGTuzgC05SRxzHP6oCCd
	0YNuacL/81fRh2c05NhM/yRxa3tw=
X-Google-Smtp-Source: AGHT+IFfujMszzRhLDZ4PQR9OlTYbQFnFLu3AYpbNNyivRDUe3CYGLHt0XR6JINggLt7Mrt+OkN0Mg==
X-Received: by 2002:a5d:64ea:0:b0:3a3:7753:20ff with SMTP id ffacd0b85a97d-3a4cb45f1f4mr10543773f8f.35.1748335928526;
        Tue, 27 May 2025 01:52:08 -0700 (PDT)
Received: from [192.168.3.93] (178-116-3-140.access.telenet.be. [178.116.3.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4dc7e69c8sm4196245f8f.95.2025.05.27.01.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:52:08 -0700 (PDT)
Message-ID: <db649de3-f070-414a-8201-3a5406a4eaf7@hammernet.be>
Date: Tue, 27 May 2025 10:52:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: fix "memebers" typo in
 filesystems/mount-notify
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
 <7e386efb-8f7b-4bc0-9ccf-784ddbdcce78@linuxfoundation.org>
Content-Language: en-US
From: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <7e386efb-8f7b-4bc0-9ccf-784ddbdcce78@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 5/22/25 23:34, Shuah Khan wrote:
> Change the shortlog to indicate test clearly. Check a few logs
> for this file for examples. Here is how the correct format looks
> like:
>
> selftests: filesystems: fix "memebers" typo in mount-notify
>
> SZend v2 with this correction.
>
> thanks,
> -- Shuah

Thank you for the feedback. I have sent a v2 version of the patch a couple of days ago titled:
`[PATCH v2] selftests: filesystems: fix "memebers" typo in mount-notify`.

I did send it as a separate mail thread, which was probably a mistake.
In the mailing list history I've noticed new versions being sent both as new threads and in the same thread.
I also could not find a clear answer in the documentation. What is the correct way to do it?

Kind regards,
Hendrik

