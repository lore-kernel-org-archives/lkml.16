Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA484039
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537320; cv=none; b=cFtP18yzKHef9fUcx2svz0sTQnLdrU/MxpDh1ICLZRMb72YgF5JrPpd7PnMENl0N+EjfcQAqwGELaV7rCIrGhSZFnR6DfgOA2KerGb8T7ZCPtt2jKRsCItNTaa1ihZINWat/atsBBIZG9MXzhB8sR2TJKVNgevH2oUyc+cFjc1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537320; c=relaxed/simple;
	bh=ytEdkfb9Cq6tZc0KOluGufNsxHHwxjPykXj8tPxkUhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fyj3WIvncJGirwYD2Kxu5I4kUwn/RQYtApY5nosgaf3Hrbfpssc4DjmBu6nMPDwgWxajVEaBCj8n9mrzdVi/cvLTTvp11HEK8TFF5eIM4VtJHLT5VnLXfGEAMniltOJBFt9M4U3SogJDEO8SJOE+9uJGXmvibtX1zJg3srv+/xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=g3vjsv9p; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="g3vjsv9p"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d434c84b7eso46443255ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1743537317; x=1744142117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5BGxV995iPbNsm0G9OmkNVQGbzPtq/umLW+mNxhnvk=;
        b=g3vjsv9pUvNO0Ih2y4CtgAatMsIEDR23JjcI6uSGlUgBNCVH8JNOhfJ/8F1A8CV+pY
         N8PRprSgbFLhU0EFi5FW1a7saHDHm/dIvSqUUnfkPdYA1ZT01LP9vHxQigavU6Owvq3U
         l25nE7o8AKPN5/HF1gPDgyWp5SeHaTZYpymsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537317; x=1744142117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5BGxV995iPbNsm0G9OmkNVQGbzPtq/umLW+mNxhnvk=;
        b=BTDtFKZkZmb+Oj62uLLQGzqiqhN3TcbVEajGAiw2lDefw9u6HQinuJ06w6ruKIta+O
         USOecSTWqcdpF6V6cnJBa6pSsasth6dGqBmna0MwK2+bOSRIlH38Y06cKSgEI/OjDNOU
         yb2CdEruEMe6OvIv/+Cohd1DdL3AqXPr3X2t9GwT9ip5+6CS1oEYUqnSgT1JPfufWbep
         fv0dVRYzJBXksiKqT4TpAeoMaXOMJoIlG/5+Zj+awVNf74CctZTELz2nwqidKA9NTNwR
         9kV32YvxRGWCAY89C5Eq7ZwzunnbBRkny/49is2FidBZVrfEbd846Xz76h7frnMKdtGd
         MkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWakflI+ymBXCYC6vehwaci80nb3FflXSC8+QHRQR3EuadCUOhex8/gPNCfBP5U7G8qvpmmWbmTdu25u+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/LbH9LMwptRLg9kJ+Kw9OxwGg9SgYcfZqgBxh0alVKxuDGLW
	mA6Uxx5wGDz4rc6r48FY2jkXaxk5k3wlcsm4dl9CbAFNtWUGPvXmauNUJdGC7g==
X-Gm-Gg: ASbGncuUcSPRiXHwqJU86Cn3ove6FIRnzsQp/10D7kKN3jxdNmeFp72D+49Wwl9s6kA
	DVQhHt1M9ciFkEeTYNU7ZQrpI5Jy9bmaW+n3V/fLzZSzS2ATmuINAMO9EKifkjSN+JXhlZeOrVu
	HvKk3SMitiCyivi1udpQRkWeH8Zn2SkXpVBkEpBg7dof0iCMPy3hzVGzena2xzD3lnY14NANYvl
	S+K/okZEKsya9aH86wR5Es/YtC+inn364liCYpOrMZgfAT7sLPxXclVYrUoXCwQZZfVEGTianHe
	QNsBpqAoKRtxJmwBsRC6zsImAuCTx4Ut8ACsV3AqX+NuEalnQl+yphvgpwHLY223ZbbmCfh20IC
	lTrA=
X-Google-Smtp-Source: AGHT+IE8Yzt70TZYcNhHaKZmfudRm9bqr4DZF9FrsdiV0SgnjyY2AA4L/NqUonhTzt1HtCqJmAo8IA==
X-Received: by 2002:a05:6e02:378f:b0:3d5:eb10:1c3b with SMTP id e9e14a558f8ab-3d6ca5b4575mr55992685ab.5.1743537317009;
        Tue, 01 Apr 2025 12:55:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f46487159dsm2569433173.97.2025.04.01.12.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 12:55:15 -0700 (PDT)
Message-ID: <bd773190-1cdd-4faf-be39-ea042d6e8124@ieee.org>
Date: Tue, 1 Apr 2025 14:55:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination
 checks
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
 <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
 <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 2:51 PM, Thorsten Blum wrote:
> On 1. Apr 2025, at 01:31, Alex Elder wrote:
>> On 3/31/25 1:39 PM, Thorsten Blum wrote:
>>> @@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>>>     	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>>>   -	/*
>>> -	 * The firmware-tag should be NULL terminated, otherwise throw error but
>>> -	 * don't fail.
>>> -	 */
>>> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
>>> -		dev_err(fw_mgmt->parent,
>>> -			"fw-version: firmware-tag is not NULL terminated\n");
>>> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
>>> -	}
>>
>> Interesting this didn't return an error, while others below did.
> 
> Should I keep it that way when checking for a truncated firmware tag or
> should this also fail like the others?
> 
> Thanks,
> Thorsten
> 
I don't know the answer right now, and I don't have time at
the moment to investigate.  Just keep that logic the way it
is, and make your other fix.

					-Alex
