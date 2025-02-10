Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B06225D7;
	Mon, 10 Feb 2025 01:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739150308; cv=none; b=NBgZdLeq9WixFst21c5HLjWAIBCPw0AdK63F0PL9WE6kOcIA3MlLotwFPNZFsc7BbMSM4V/jkfDjBo3bYIfc8LQXg2K7+ua2xZHSEZzCQ+TauDhgiNBhZ6JOHhenJ4Xo2+3NeqnlBmO+wJG6QwQmpHlQC1a/VkRBF1xkBYtEdGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739150308; c=relaxed/simple;
	bh=daT6zVmufzYakIvNPPfT9sxGtST7RMT+oUHTc4nb89A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=UGVOnc32pyLmxjE3BvH8PUbb8AtDWxJIWZZkPy/dnaO7bQBm4guHnfxjsHtq7MtZiRkl078uUQVhrbNGNJSXx9VaSYJexhtl3NZXiX8mOWyesQZFcApl65MAUxNoqXm1zwKWkPrBoRZjuohB/0/qPymM7YJQVC7LYIQy65yqg20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrKRpPcE; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrKRpPcE"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5b1837d182so3929084276.0;
        Sun, 09 Feb 2025 17:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739150305; x=1739755105; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daT6zVmufzYakIvNPPfT9sxGtST7RMT+oUHTc4nb89A=;
        b=RrKRpPcEeXP0zH8drSCn/BJ8QJhPSLhjdleUGdILy1Ul7lXglVDC779N9m+w3SJEmS
         wSJBau/Cakl2SaR587SxGxla/trE2SjdH5PNAy4qvE4oxXMo1t2cnp03XvGn7/pvPRLJ
         t0FmR2XnDhL6Jw3c8rWNRFN7kdXvVaOZlHLiuqXM59EPvv9ikHyFsVP3fdByL4p+qu/9
         IXuY7MgkMmYZvM3QQ25IK1gAI3y2LbZsnK81kys/09586J1MhpcckgJ8+g7IbG6RCM+N
         Qx37s/fX2MUpi5xN04/mwc4lOEyPEXYCHdFLhZQjjBUV0DVfwR7Le6UfDz9TYnCTjsKe
         34cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739150305; x=1739755105;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=daT6zVmufzYakIvNPPfT9sxGtST7RMT+oUHTc4nb89A=;
        b=TjE3eAK3xmL5H1PwKCtkoPcxsC7zue9W8FjXKp9kiKmudNPiMftic1K6iK35Kbc7h0
         EjgJvBn7eIMRRd2B4a5DP1MEu3xgl9iVw6pEafzJoqeG/xSB9j2xwVx9N+db8f3Uh2jq
         P0YjVEvJ3tg5gkxB+/pEaJCg/h+4edhbxMlXWy3jZP1lr+amDsSIibdm8RMhQvZ/FZUp
         kACKLD87ryTGdtfa9R4wfvUVIdXvFHr4K+3NmvQtDbnHxezRHJcFaGonxXndS2Hf2Iil
         ZzCIoxCEXWd5k1kX5LWgYDVsimYP+ShMrxgq58cMx1Sjbd2E9391n7RjIJIRnFNkWUku
         ThCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb2019or5qnXprQDz7Nwu07/PIVPrx0zSgYMhXRimTfiWV2pCossLIfn5CnOW775uJX6P33Nrr93ckL9Y=@vger.kernel.org, AJvYcCV/agY+Vs5E9nsg7iQeGSPO/XnvplAw4LgORKFuw2Pnag9YJ4k54EFZ5BtczBjKd1tfgM+vEuCBpBuTTw+NKDFrS8tNHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/bCxhDQiZB9VAbE4UeYCm2ke8VpVP0h+AZNvOTDiVvHcqa4Nl
	fPgiv0a9+yA3/NVE8e/QU3ppfFhJhK9GCyT/1vlsUKKdF+35OCZSQBd+TQ==
X-Gm-Gg: ASbGncsSZ1hGYQvBXtwslXkz952vZI3Hxflpd5xwa0XXfOLb9WlY4WMkJQ4cVoc34PF
	NkkpnLHIkzxgdmik47P/T0mmC3d95ijNI4i4muGW34ysu+JVVSxqsq1WJQKBatzdgrtkxfZLp4j
	K+UBY1puxoiurgXaz/QjqpNAg+KTgJ32Ce1Zc2qdoaWALajjL7ns/lOypuFYSfDuIFTr8rxqF1N
	wyL6/f75/XRyYx+5YlgTJ3S9HN/pLi5vFjRS4H7tpn6z1cgVVmtPVvu5L348Tycf12MYMvBaUoN
	Hyq5SdA=
X-Google-Smtp-Source: AGHT+IGViJJNXyso0QbBbMM7UhZRatKT0qMtEpUJIi6D40/1eb520ogA06ehSInai9JUvTK1Koc6oA==
X-Received: by 2002:a05:690c:4493:b0:6f9:c7ef:4cd9 with SMTP id 00721157ae682-6f9c7ef5000mr65934257b3.7.1739150305333;
        Sun, 09 Feb 2025 17:18:25 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9d950a342sm5982837b3.115.2025.02.09.17.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 17:18:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Feb 2025 20:18:22 -0500
Message-Id: <D7ODBVBQFOGF.BV2A80SGPAYK@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "Hans de Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Limonciello, Mario"
 <mario.limonciello@amd.com>, "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi
 platform driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
 <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
 <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
 <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>
In-Reply-To: <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>

Hi Mark,

On Sun Feb 9, 2025 at 7:54 PM -05, Mark Pearson wrote:
> Hi Kurt,
>
> On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
>> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>>> Thanks Kurt,
>>>
>>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>>> Hi Mark,
>>>>
>>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>>> When reviewing and testing the recent platform profile changes I had
>>>>> missed that they prevent the tpacpi platform driver from registering.
>>>>> This error is seen in the kernel logs, and the various tpacpi entries
>>>>> are not created:
>>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before probi=
ng
>>>>
>>>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>>>> called before platform_driver_register(&tpacpi_pdriver), therefore
>>>> devm_platform_profile_register() is called before tpacpi_pdev probes.
>>>>
>>>> As you can verify in [1], in the probing sequence, the driver core
>>>> verifies the devres list is empty, which in this case is not because o=
f
>>>> the devm_ call.
>>>>
>>>>>
>>>>> I believe this is because the platform_profile driver registers the
>>>>> device as part of it's initialisation in devm_platform_profile_regist=
er,
>>>>> and the thinkpad_acpi driver later fails as the resource is already u=
sed.
>>>>>
>>>>> Modified thinkpad_acpi so that it has a separate platform driver for =
the
>>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>>> successfully.
>>>>
>>>> While this works, it does not address the problem directly. Also it is
>>>> discouraged to create "fake" platform devices [2].
>>>>
>>>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>>
>>>
>>> Yep - you're right. Moving it before the init does also fix it.
>>>
>>> I can't see any issues with this approach, but I'll test it out a bit m=
ore carefully and do an updated version with this approach.
>>
>> Thinking about it a bit more. With this approach you should maybe create
>> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you can
>> pass a NULL (*probe) callback) to avoid races.
>>
>> platform_create_bundle() only returns after the device has been
>> successfully bound to the driver.
>>
> Unfortunately having a null probe callback doesn't work - you end up with=
 an oops for a null pointer dereference.

Are you sure? I just tested this on the for-next branch and it works
without issues. Also checked the code and (*probe) is only dereferenced
safely inside platform_bus_type's probe. Maybe another pointer is being
deferenced? Keep in mind that platform_create_bundle() also registers
the driver so maybe there is an issue there.

--
~ Kurt

>
> Thanks
> Mark

