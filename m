Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249218871F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979194; cv=none; b=YjQYKnHrMMLguaMG4XQqHwgeKkCK9sx7EzXPPDhtCYPspU948yvBNmsMEwU8siR+CgjArqG/k4jsOP6KMy1fNy9EeykYwYl1lVmsG14CEUNPZtphvx/F55b1CNbpKtD0POiNHwoxATcuz0BldiU6Dn/NsWxCfEWoCYPLSqBO0D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979194; c=relaxed/simple;
	bh=vM/9xmqq+G+RCairpvICd/pL28J7lP2xlFARCgWArHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ju1z6jaP3GTGatb7TXXVrt3HWusroA4pS45uJSIUf9HyzFj+Phu5dmu+V0r7JaGnxgsiXKtytc9B21dhl/nbc+zLO0GhKEQWffUyTkSdgYFs/Rl0DHJ5K5jx3u/Ky8oGGHtPIR4dwSbKaLtjYXW1wz1zQsF83/hBYy/Xbl0Poj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kf7SjYAe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kf7SjYAe"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234b440afa7so18312895ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750979192; x=1751583992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCbQUhLpqfire/SFhHrIydc+K1fZgDEYUK8oj5zp/yg=;
        b=Kf7SjYAeM2KNd25Yk436B7KgymscHgKSNwilo06oJtzeo9oaiKIGwhaMENj4R6/eOW
         NOyyPIcdSg3rg3dLZw4OBYuW/zPN8pyaz79Yv0etqwNXHI8zyWXr7FwTY7KokEf1Ho+g
         5my+VNOjxgF1VKv8Y9XpMKTtHyDaL5n/v+5J7P8Q++lRdQfP71GIlvqJoUrTs6E4Z/41
         mSBB37npRrq3qNg5mApyi57BzPN6U6h+bm0ankzgoanWF0SHDZYaM4pFA3BcTPI4D4Gp
         dZ8SZTLXm0puzEYRUCx4BaYFD1AlVAjj4SdHgIFGHW2dTYrjQFn9p10DEfipJSE0KCLi
         wFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979192; x=1751583992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCbQUhLpqfire/SFhHrIydc+K1fZgDEYUK8oj5zp/yg=;
        b=DO6DPwpMgdTPEsiJc9TGtAOQi0zdtJMRrwrSzyMbbtplctTfKTr3G5F/8N6lrg3VZ2
         oPSCHmAXI7kwWmZ3AG+wcXrMMZmnkILPwSutCIPRg5BpMVoegRYNpxGv3bIZk/TNO5hO
         vdSZZuv3xOr595r/LFQlZmpLxayQ+4ueQOmr8V4TLaqkV5rzgh3GpEcNv0H4GnUQWpxM
         pZeJ/Oyuus2D7QrCP7asNj6HrGqj9t/wmBfjC0qjFqNSgFgUFZkXRS4lZhO4K7hA79Fo
         siJLP98/b3o4/vdp+Y48NAhjaoDzgm2oaRO6QZzU9GN1uxQ9hm/2ihRlswKrClgkniGP
         nneg==
X-Gm-Message-State: AOJu0YypcugSIifRVHb7wanPTO9VpRXbrjz+1RW7JFtoG756lWGWomw7
	ikEXHf8mi4GWYNh0j9NZrcxjwE3pJkHqObq7Oi3XZ/+Tt46SQWbNfT7W
X-Gm-Gg: ASbGncsWCqwbWkvv1LbEep6/px5EPQo6bvq+afty4/dIgbJ8Mq3iOjYhET6UXvxLOH8
	GfUvTvQLBUM7J2ebwCps7aagIgdHd64KA+/aV3JZq5x6gnLI5Igrujcqbmf20BV8hVJOResVULE
	X6j8Zrui2TvErj2jAJiECCpke5yo868VFSt1imjydS1pvo67eRv8F8NBvRmEQnDcuQbXjo3py2H
	Sr5VJZ0z/0fCintMBG6VG498Az7a4oPff5UgHZAfRdthgl889M2ZiDUqiLkK5Qs8CKAfgmETUBL
	fzUmTVRKDm9oyKkmdJe4SBTgxwNIzOnRUx3TCuH6tzCTjctWKFXRLCKRst7JY23RFF50ww==
X-Google-Smtp-Source: AGHT+IFvUUME0kNtua+RsrlGGMsS1fPf9D1Wos2a8zc3DvBgPZLWnsx4UrNwqvoAWLJTeloLmMk8bQ==
X-Received: by 2002:a17:903:1745:b0:234:ed31:fcb1 with SMTP id d9443c01a7336-23ac40d8b08mr10899805ad.20.1750979192313;
        Thu, 26 Jun 2025 16:06:32 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c94a8sm1308385ad.239.2025.06.26.16.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:06:31 -0700 (PDT)
Message-ID: <3fb32ef5-055d-4885-9233-a07ddcaa5154@gmail.com>
Date: Fri, 27 Jun 2025 06:06:26 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: Fix i3c_device_do_priv_xfers() return value list
To: Frank Li <Frank.li@nxp.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux i3c <linux-i3c@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20250626042201.44594-1-bagasdotme@gmail.com>
 <aF17sD+4F42RL0PL@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aF17sD+4F42RL0PL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/25 23:56, Frank Li wrote:
> On Thu, Jun 26, 2025 at 11:22:01AM +0700, Bagas Sanjaya wrote:
>> Sphinx reports indentation warning on i3c_device_do_priv_xfers() return
>> value list:
>>
>> Documentation/driver-api/i3c/device-driver-api:9: ./drivers/i3c/device.c:31: ERROR: Unexpected indentation. [docutils]
>>
>> Format the list as bullet list to fix the warning.
>>
>> Fixes: 0d2596508201 ("i3c: Add comment for -EAGAIN in i3c_device_do_priv_xfers()")
> 
> Needn't fixes tag here because it doesn't impact user.
> 

I found the warning on docs-next tree, though.

> subject:
> i3c: fix kernel-doc indentation of i3c_device_do_priv_xfers()
> 

Ack for the subject suggestion.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
