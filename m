Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467F2135D7
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959349; cv=none; b=hMqSblVUU707wqSGo50EW+z565x5Z9Qf9QUmG1FYUWGnAHlL7eHSq+H2XfRkJd0pIlwMFcjEGx1Q9vMqryeAY+0i50kboWtQ0fal2rPsWQ5oLX2/mmPujLeFYAAspoD8hz1XVpdEDvk27PRORwhQ2nfmygt4XSRUcehebL6oDpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959349; c=relaxed/simple;
	bh=owqT5Dg+crvKyuGwL4S60bIfz9jQaJ4PE7SMHfA70y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mx+fHWK2zU/AU8Pr0uYuPebMMSFlZkP/vnuxFAc1NVGaoasXza8wI0y/YdlqOhXe90+jJSZ0cyUekvT0EyLoseP82pcDup+xaWw9mtSKo51qBa/Ubi8EFFaqHzvTqSAwJboIoD9Jrk4Yo8wV1cU+2NSGylxC+g+wb8Juf2DAc64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=XOprbVTK; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="XOprbVTK"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a774209cf0so14938001cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1750959346; x=1751564146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kq5YiwCJOc6rM6hfYT6kDVkrdlebVMFigkkEqCw26Wg=;
        b=XOprbVTKM7S4P3uS7aFLIGwt02Gxazu12VJqK/hs/aAlMwcz/XlBFkXBaUWZ7eeazi
         iPPcfGDhCTLN53TvkfuGGjEd88j6fsDs9cwpK6jTARXjfzNBnKIrgc27eLgLY1EReLT4
         Xs13L8mKdW05bwu3/WGFc70RY6/xTy3AHs4uuLfOEWBvmLt0uFVFSUAAhG98uTN+x1BM
         c0Hww22d0GocyUShHhtj+wU+LhloJfcJg/Bc8fB4nnKU4GaQB4QE/bh21rp9/Q+ApYgG
         gPGOFBWDaUTGUIcI86U+WgkUnjA0KKRkQRMrCJHJ1lUS4cedfe/rgR3LXGZat1+BIDig
         W+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959346; x=1751564146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq5YiwCJOc6rM6hfYT6kDVkrdlebVMFigkkEqCw26Wg=;
        b=ZZCVBQIUKFRQdDIooYGaKqv4G7Sj+rlBv5KQwtVkyH0tyJ0zeZb7rleonRsWZNnc5X
         SWlHHHZ5byupbXFNZoVn+9T0s4dLrGCN2ztYOberi4UtVDvZTYmD+G768+d8Gq/ho4cl
         y/571YiQmz01ui1lHkNgZSvcAuY3jhKhDqqdKfT0DX7LCcXim4wE3390Hj+bOlnAATR6
         qyZ8AwILgvcO3ayZArspdmqdXQ2q7Sr0XX+cQ1HbFdpE7jiW5yRLMR5Ji7/LawhkvE/C
         J8XPSxlsCbNTeCIGl/qMetXgX6UZSfs/SnfizMdob2OjnykBmkaR6TMHzsYSJp8RiA5L
         5dww==
X-Forwarded-Encrypted: i=1; AJvYcCWn1K6IbQ4SJ53CvQFxMokXtbGGLgPTVG24NQ3ecNWahjEPma8nImxFb44yQkLeJgrrt/bX2gf1X7Cu/cU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cwbS/yQ6WehOBTPMjGPinEFqSlOBJGPVVmjLRf+8ISLcxFS+
	9LqB/+SJJsKl3BJOCO7/Pd7P+HNFJ8qXsf+BJOdNQS16vXB0vQnWcJNy4PCWyBDTFg==
X-Gm-Gg: ASbGncseRfuyqlOzUWgBCNquJPgWkd4ut0PDv6CKrlfPyz3NIUBIEClIn1CyYzQvQyC
	2a2/zLKbbuFcr8sBvTG6lF6/wPWeGjxcWMUc+GUnm9YMcDYJudMA/X50prtV7SVYLuq6tMAVn1M
	XfYt6xPNoxfDaVbd0yQ6sCm2YlTKQ5LfxY6H6YGbxsukvi5PC58EUPLLNaFI29f5TUxzy80deQn
	xJgz9D+MOsGKWJXqhdLD1X0F2vQZjzFG0404JFBxr26m0Vqa6qRmVkE2F2ZMSQWSH4VIAWXk0yx
	L19Dq8fHKm8hmpqm8X6Zr6Ef3bh/O1tjZpAKSFor6XpEMo8u4utF+34nM7RGq0k2JtoWJHw=
X-Google-Smtp-Source: AGHT+IF4aBQ7fvxJXfKi7QHAZH93XBf4dITeJb2LNxUlqLidVkaBB1/OMarQUabX97CPuzGxK0Hq3Q==
X-Received: by 2002:ac8:5a4b:0:b0:4a4:2cb0:2b29 with SMTP id d75a77b69052e-4a7fcbd4724mr6757961cf.35.1750959346392;
        Thu, 26 Jun 2025 10:35:46 -0700 (PDT)
Received: from [172.24.25.40] ([65.222.209.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44316d85esm27760785a.35.2025.06.26.10.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:35:45 -0700 (PDT)
Message-ID: <f8988d47-d84b-4cff-ba20-9b3341879354@zetier.com>
Date: Thu, 26 Jun 2025 13:35:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: musb: fix gadget state on disconnect
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
References: <20250624140930.25887-1-drew.hamilton@zetier.com>
 <2025062456-cameo-directly-fc66@gregkh>
Content-Language: en-US
From: Drew Hamilton <drew.hamilton@zetier.com>
In-Reply-To: <2025062456-cameo-directly-fc66@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Tue, Jun 24, 2025 at 10:16:30AM -0400, Greg Kroah-Hartman wrote:
 > What it does show is you missed the many thousands of changes that have
 > gone into the tree since -rc6, is this still an issue in 6.16-rc3?

Retested against v6.16-rc3 and confirmed both that without the patch the 
issue is still present, as well as that the patch still resolves the issue.

 > What commit id does this fix?

It seems like this issue has existed for the MUSB driver since the UDC
'state' sysfs attribute was defined in v3.1.

Thanks,
Drew
