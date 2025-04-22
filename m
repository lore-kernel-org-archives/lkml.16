Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432A276056
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321974; cv=none; b=HqZ+3fTtMnbx2sLa5qXimKAvaxtbhW8CTO+xOanJwnvY/CXHnbF7Ox/H725ye8ylkj8Ln4saokSpafandHAnUHOrSvBI00vS2Ak2GPp7rT1xeERSBi50r548H0Qlv5ZRk6IS6c4gZlxvaSge440NS3pSdBrYKUw1K0CSPykJaLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321974; c=relaxed/simple;
	bh=gE+ihbtz5g3vP0Vibg5Xj0k7tkkJTIZuoEK+y6CIP1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9BLG0Lm6wHQ+reoloRjPEQ0Y73H0wA+sMv+Os5hYeXi85XbpPU8967X6Mjpvwn5E9ANRcSmmXSTMc7HuKUU+c7GfARYwbov5gkVma4NO70vdEEgbABFqFX84IytO7A6hIJMS/4/9tXz9pu9jje8CTUx9PN/v9C20Yy52rwTRto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HCEOPFyg; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HCEOPFyg"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2279915e06eso50906855ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745321972; x=1745926772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aEq6bOVOJtLkZttL9T4pxEaQVgSJPvJbn2Yk/YAOwz0=;
        b=HCEOPFygLaeD9/pCKZixHw0HZXxpRTBrQKaDPML2t7Qdv4hldnGIzhOHZf0CZl9Vhm
         ISyz/pvMx/5EBn4Hds/Ada8yjuGYLtDnfHdVI2RIF0F4VJFLjyhyMNtFrEFDNpmzNK6C
         j6HpdUoWfgdk0QQMAVt4VRG2msNjloKDjbWk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321972; x=1745926772;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEq6bOVOJtLkZttL9T4pxEaQVgSJPvJbn2Yk/YAOwz0=;
        b=dsJiC5cgdlog1/D+7GAfxoyXQIc62nUTdExu/Q55gsIJcbpNYlUYz4zJjdZ/mUr09t
         iwlhhlAIvb/h2HvHU6Jxb6lC/pOuTCqOZLFXQ41puYyeAMpH+O8VMQlTIExptfYt1hBK
         Q6C0TFTRgbaQMaSoQbh4+UMCR9svKo6HCu5fRrWmakFOJejcN34XHXJiyxP892dsjFfW
         /rDAjDnOK+uj3q6kyAdQKHgI+Z4frxmYmoD5A/WfAXfl2xlB1iXGytYGwCF2+til5enF
         BLHxnXndL8f7eH29VveTUAX+z1T6X6zmb/hA/3S/6MEvxK8sPr/wHpZZrwz5wRRz7d3h
         G27Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRkDgVuyc7L0Kh74YU0Rfe6NKoL9A2+TZF+Y03Z3Z1zK0aNFXab8qh+p70ivMLFHaUon92jMe1yLhlBDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF6pgZhaqr3A/j1DShJ3D/QhC0uN0Nh05HiXAyv7mWspx6KSPC
	PwtcxZj2gyO7aU7DioYlkMRrkG5WcqSrWhNFQVYWNDULubmtofu349HgKScuk5R0TpUmMZJxUFx
	YTA==
X-Gm-Gg: ASbGncuxQbxu35mVuAXf/IA979YIWr56G2a5QhFEoFKK4+H9JCP2w4DrUdkVifcZ90e
	Uq6uplqpkVkl6cRRPhcW3ev8hpDPKOD53QEa/cpYFbHpbhNABTPX0acfL66z44899G7V+yptDBq
	ooWslLIjRFoDSVKljj5rH3EYyK4pYcKxhBxqbaBGlCcYJVVJ+jnjYLe3PqsLVGJ5SKcUWt+1L3L
	t10DScDbdMQ5tBOWsbu9jwjuiUethvJzygQ6oM2wjHiHetR+9nGM02mUZGTjqET8ytxWkW/Fgeh
	Lkx+2DhXsola9KpLakcpy4LqWDpfaJCh0xEPdtaZkllHhzsw42QfsSlDXQr1iW/vWEzG
X-Google-Smtp-Source: AGHT+IFKojdUh0sNb4Ebb1JmWK12MQdXSOdAiqRFGDE22Idk5RsvtjW5M/GTepe3dep46IbCS2UQwg==
X-Received: by 2002:a17:903:22d0:b0:223:66bc:f1de with SMTP id d9443c01a7336-22c5359e919mr226215295ad.21.1745321972509;
        Tue, 22 Apr 2025 04:39:32 -0700 (PDT)
Received: from [10.176.68.112] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf3391sm82639865ad.60.2025.04.22.04.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:39:32 -0700 (PDT)
Message-ID: <15f43f65-2f2f-4fc6-8210-60afdd9be004@broadcom.com>
Date: Tue, 22 Apr 2025 13:39:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] brcm80211: fmac: Add error log in brcmf_usb_dl_cmd()
To: Wentao Liang <vulab@iscas.ac.cn>, kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20250422065938.2345-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250422065938.2345-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/22/2025 8:59 AM, Wentao Liang wrote:
> In brcmf_usb_dl_cmd(), the error logging is not enough to describe
> the error state. And some caller of the brcmf_usb_dl_cmd() does not
> handle its error. An error log in brcmf_usb_dl_cmd() is needed to
> prevent silent failure.
> 
> Add error handling in brcmf_usb_dl_cmd() to log the command id and
> error code in the brcmf_usb_dl_cmd() fails. In this way, every
> invocation of the function logs a message upon failure.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v5: Remove finalize label.
> v4: Fix spelling problem.
> v3: Change patch name and comment. Move error log into brcmf_usb_dl_cmd().
> v2: Remove redundant bailing out code.
> 
>   .../broadcom/brcm80211/brcmfmac/usb.c         | 23 +++++++++++++------
>   1 file changed, 16 insertions(+), 7 deletions(-)
