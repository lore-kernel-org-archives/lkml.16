Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014CC1C173C;
	Mon, 12 May 2025 17:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070257; cv=none; b=Oz/ybNeAtdz9V31ZB8ejq1TdvoagUVpiPj2b0kNYv1AWj4gt9r/32WzAK+ogIepTq4vKPI2+v3XCQPd8ZMorEB7LZa1XckNIMvJK/20xeRwjfmLSgnK9xc6/sjZKeebLWs83liLt1P21/FIkU0xmSHX071jxDXrJYoTdmxIgmBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070257; c=relaxed/simple;
	bh=uQvuRiI5kPMGlQPnZpqbJg0uCwAXBGPJ/G0MqmJdv5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kS3Be1u9Z7kZ/AwWKU+he7r9xWTm1OISOOqd9Qz4EbaAdCFaRQSKDp7/B8r11j9VAZlEJcRD+Tc2LiXHCgFyLgPWxMtTKHs8ee1egL+ShDaClhkhAEViITaC8Y/iwFxmbx7JUTEEZC2RpqNFPBluMc9qDMueCwu7wQbxSbpJOJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp3byPd9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp3byPd9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso35991435e9.2;
        Mon, 12 May 2025 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747070254; x=1747675054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sI4zsfQnGs3u1qkcrZ5bt4unz98es01LFver8RGkzzA=;
        b=Lp3byPd9g+95OZqsGQM7/L/CluYOkM8hvN69xhoijIQcIpCbimyp81gtNDQtYVtr53
         xoX0QKcksTL/VrCRGq5fUAfGwRkUwlZjEmfKOpG1zml5AaNqhsZ3WRjWedCNYHEi20Ai
         Fyjluhv3Zf0YtsPO0ww6cuQHG/eMYG5DlHIdA4xg9CEUtHzmGDhjH1D4yOp+36zWtuln
         Vr9lthBYqU3SrSo3Ad9vxWAuCnpXPn2RC3oASiJ+SM8FtEtA6UsXOBjtsEPIxAuFd/sk
         aWMp+WIdZY5jUiTtdgyawENjsV+VbBU6/RfGPDA+Rs3iWCF219IlXZjSSMpTKHnc6Aev
         laKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747070254; x=1747675054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sI4zsfQnGs3u1qkcrZ5bt4unz98es01LFver8RGkzzA=;
        b=GhSLWwXqjaAjCHT4A+wCZJpwTjisU9dovFQxOuNtWkDNP9xmU9fl4U/W9vmEYaWRGL
         hCCuzMm4b9pNRSK8AKmigUi5AfPUAQmhXkwl4bT7hlnyjmLwsYDBbmasmF+mp57esv+e
         SP5mQ0/gYy0M2BPEXZ4WkoN++ajHrSeiKUOv/aYa1nn0MfmBLqjIJzaLVBBn4MVjXBGG
         TU1Dkx26tLWpQYziV8PHVsaH/5RFObO3EycFPI76pI46QOTL08NrtXa8eIprzEqrVaAZ
         jfrz6UkarrRhGASJdh9v5OcNiqHy7E7yvPa49zw8ejXKoJyyp+v5A8KV3q6OwL+4hmQX
         1FfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUomn5QVuIiSQMUyydInYphxUSyMHUHkQPx30St9W7sAkZzyyT/ZjUOhsxZRXhOTcvjA+kEF/VgU9qMT6UPExNnwKw=@vger.kernel.org, AJvYcCWT7d33LnkVF5SblSx/YFS33xONBu3+/p2/BFDrDimh7Lv4UpIb6+p+Ml19uLKzHLML3CwBD82tOc7ieuLr@vger.kernel.org
X-Gm-Message-State: AOJu0YxqKfRanWqPcoNisyRKVMBsHw9R0J/XvSR09GECeB4wq1CQ8rXg
	5ZnShqk78eqOlVubiwG1b5J3t7zc7z8GGZXXipj2onxiEwZTtE1b
X-Gm-Gg: ASbGncumg/+DQq/olz7BfvxIXLFU3BT8PmuuKcpi8CxU0aSXypaKw7xDjoLi/dNqdDk
	/m2j3EFsNInpzDOJQ7nr1J0pfSB4b9pUIu2KPMgGxTPsXfTUJgDRYh16XDMoGrDJanbskJXj0k6
	o8HY7WevNgTi74+wtD+i+m62sx3jpMaywX56ix/uVCsmfiQE2ryTg+sSX2nMAYtD+EebtC1EDi+
	xlofKLeVpmwZcfOOwm0HZU4iHDL+vUormwT365XKHPo/ffypXzCTsXoVvp/Mnc5l3ZEGWbtggm1
	fhxmSXxdv/wEhlyaB/zyLvqvYXLIPhNWsnl+zxDuWLymD/a0eV75bXEr5L6R9p5sjvoAWvbi9hu
	Vlu3CxeZ3+QmirZv0
X-Google-Smtp-Source: AGHT+IHl3N2ydHbkwjBPrum+F97wwz3+Z7Oye0ZT7idcXbNUhXq1nwXfd7bUz0B5x+zT/NfFKcnA2w==
X-Received: by 2002:a05:600c:b91:b0:441:b3eb:5720 with SMTP id 5b1f17b1804b1-442d6ddeb79mr109443795e9.29.1747070254035;
        Mon, 12 May 2025 10:17:34 -0700 (PDT)
Received: from [192.168.0.33] (85.219.19.182.dyn.user.ono.com. [85.219.19.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm13381332f8f.14.2025.05.12.10.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 10:17:33 -0700 (PDT)
Message-ID: <81a6627f-f569-4174-9d15-37615ea58458@gmail.com>
Date: Mon, 12 May 2025 19:17:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: Theodore Ts'o <tytso@mit.edu>, Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
 linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu>
 <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
 <20250512144402.GA200944@mit.edu>
Content-Language: en-US
From: Attila Szasz <szasza.contact@gmail.com>
In-Reply-To: <20250512144402.GA200944@mit.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

At their core, tough software decisions often involve economic trade-offs,
weighing ideal solutions against practical constraints like development 
time,
budget, and acceptable risk. This doesn't make a particular decision
fundamentally wrong from a computer science or program correctness (à la
Dijkstra) standpoint, but rather reflects the real-world limitations under
which software is built.

Mounting pendrives in 2025? We're just not there yet.

On 5/12/25 16:44, Theodore Ts'o wrote:
> On Mon, May 12, 2025 at 03:22:12PM +0200, Dmitry Vyukov wrote:
>> This is not even about auto-mount. Let's say I am mounting a flash
>> drive that you gave me, how do I ensure it's a safe image to mount?
>> Removable media, portable drives, and some use cases related to
>> mounting images stored in local files either deal with images with
>> unknown origin, or can't provide 100% guarantee that the image wasn't
>> tempered with.
> >From my perspective, the answer is simple.
>
> You run fsck -y on the file system image.  If fsck.FSTYP isn't capable
> of sanitizding the file system image to make it be safe, then that
> should be considered a security bug for fsck.FSTYP, and should be
> reported as such.
>
> Does the user not have the latest version of fsck?  Well, they should.
> If they don't have the latest version of the kernel, or any other
> system software in the TCB, then they could be unsafe.  And that's on
> the user.
>
>> Question of resources for fixing is orthogonal to classification of an
>> issue (if it's a bug or not, if it's a security issue or not).
> No, but the resources available should inform the trust model, and
> assuming that users should be able to blindly insert any random USB
> thumb drive, or blindly mounting any untrusted file system image, is
> not a trust model that is realistic.
>
> If you want a different trust model, then give me the resources.
> Otherwise, don't try to impose an unfunded mandate on me.  Because I
> will ignore you, for the sake of my mental health if nothing else.
>
>       	    	     	      	 - Ted
>
