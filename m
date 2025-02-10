Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1992125E458;
	Mon, 10 Feb 2025 19:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215414; cv=none; b=t/HiYVPGt8M9TCCr55rz8c3ZX3p2gpKRrQSUjbMz7onAiUGfHmoZdkvhT05WKIL3oXfMr05FxjYstYMSB9gAM0fZn29FphXb1Nc4TRhdXZU7Jf5AH+WF4sENdOz4g5K9+OoA7Ot1Edg/iGa2b8KMRTHtIAreDDJHtvRNhCZpWSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215414; c=relaxed/simple;
	bh=bo1L9Wj3LPfe66x6wir/aRh+fXOIVaFlc8qBuYVzyck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUuWV7wk+GH5ouBV5KbbcHcZnu2gUB4PyblTx1jS2rhoi3+q9kOOZY9CaEXtgAvl2xle45L76D0+1vLjQ5xT3PdqFbcgGdbm5vSP/WzlIg5Dz9j0VOpVHkNxF9yXj4uthuIE8QhVqdeJEJ1fXsx1zdZ73VhcT6D8KA2qhZ3V/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVyivWqB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVyivWqB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so3653731a12.1;
        Mon, 10 Feb 2025 11:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739215411; x=1739820211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QtZsigcbjvTm5j101KI4qSkvqwJPsHqrFWjZqJf7GgU=;
        b=RVyivWqBzuZQRRUGyE/XruYP3mKh7YgCRZUoHfGS6x8CjkE2QsZ8HNh8ks4Q2H6UE8
         HvqZCk9LNBjv6lhktFbymwAPf1UpvBp4YOTumi5n/XYAuNrl8Q2rspzlSX+rmKEUlQ05
         6Uzfzwc3TIJ9Ff9QLOKV1VGMtes6vV8tV4iwgtiVT60rAelMeUtOif7i6qcm2kA5Sol6
         YciDiaWZScVLWXeAQ/0QYynjnkdrDce2F9+vkNaWMFFtOat5KLoobZzMw3PcIaDQndPO
         sBkw3lyDL4L+MY1FZ9WJz3NjAy+aNtLoZpxDoY5PHVoxX4vJ7sJKrOld1ZBuGogrx2i7
         5X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739215411; x=1739820211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtZsigcbjvTm5j101KI4qSkvqwJPsHqrFWjZqJf7GgU=;
        b=LPdNzwgLFF8O1Z2Qq5zp1JK+FSwFYSsUDL2RscR16tOei+HrU4Dpfa877uMa5o9Kdi
         FE1uBrb2iE2U9xTcQjadunvkQlxeLQfsjpCOjMOW/mnEFapwWcHlkX8kiTtCsEnSyzTz
         LUO8RpjrMSX7R8XwpLwy9F8+ttkiaY1/xgBcyWPiDGvace4JCaLZpVyALymZ3XHgIeOt
         mZg6sctVOU43eh6goJ0feKLkMY9E/7KhWSVnaS9S61hhvJnmoFTxJ96E6aHc5gs8jhhv
         UyvXZZ4T/rBK6e22NuQ4Pb2+wRHkt31ih+9vuMJxaJ1LEZH4F2xfR0iGXvBUFB5+MsoG
         rPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK8OBrjk+SAsQ/wbDEynoeZC+8DvZtktQnA+rMgROyK7IL23safETqjpq7QeSD+/Vu5X0L/uDLedsW@vger.kernel.org, AJvYcCVilvF2MadqFWdgicxBlJ+iV+yGq4uEYOZt4e2bT+K2iOKsL9U23uQKZE1T2OxGl5/ibr7W8vn5sIRSvF0T@vger.kernel.org, AJvYcCX2h2XWAxrK7Jk9XpWPgygvKxcgyBbqp/sKEWz7Ngeoe05vjrIicoQYAQetuHEksLkiRXjmQ/w7Kq3P@vger.kernel.org
X-Gm-Message-State: AOJu0YyvhA0U3RCKLUypM/gnF+OrM5qXe2uzwsWhrj5LuakrSAGlYCTc
	erig+GKCEpyfg8Wfz+fXvEtPqU8bj1YdWDLN8R+Q7NzP7lz3cYM+
X-Gm-Gg: ASbGncsMsBllJhbe8I+gIRaKMZgjYHWUGWjpC7IayMHgEmNb1M0MBeeuI44iwu0OVHn
	djTUPNQ1/G44BjN2x0sHSeFNdVi3NNpVzkqffzbZaWXmQGiTV+3cKDgwQKeyACrj317MOVa+F+v
	MbDKxeRHOHltkAyecbhULpM4+8njVcamFtpCVa5tk8381hunfAvNOJnK1jpDITmdvZsrNvC8fKM
	U4rmJyxQ8973cVgSt71Q/Yb/C4Q7TWPPEtsBGLLr4YKhjKN2RGjh4yFquJj5e5WwowSaQloV8Mw
	oSc/KfST/Mi7IZNLnW47C0Z9k4EJEYt9MjZir8uAlA2l9mEJb1IkgFKlq9Pn2kVTuUu/Fl3zeM1
	Ca0J1h6lZqkUv2Y73hKMWlqd6PbJCcc6tGRLh
X-Google-Smtp-Source: AGHT+IF/23AcB67iWvajFyguUYo+hNf5d1vgNVCh3bKbxXjl5QTAQyB5gM51SgTWW/92t+M5Ayz2Nw==
X-Received: by 2002:a05:6402:2388:b0:5de:45b4:6f9e with SMTP id 4fb4d7f45d1cf-5de45b4705cmr9921617a12.21.1739215411022;
        Mon, 10 Feb 2025 11:23:31 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:2347:e8ed:bba7:b74a? (2a02-a466-68ed-1-2347-e8ed-bba7-b74a.fixed6.kpn.net. [2a02:a466:68ed:1:2347:e8ed:bba7:b74a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de541fb84bsm6142738a12.54.2025.02.10.11.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:23:29 -0800 (PST)
Message-ID: <795371f5-b11a-4348-a838-f56326d5ca2c@gmail.com>
Date: Mon, 10 Feb 2025 20:23:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] usb: dwc3: Avoid using reserved EPs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: <20250203191524.3730346-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 03-02-2025 om 20:10 schreef Andy Shevchenko:
> 
> On some platforms (Intel-based and AFAIK ARM-based) the EPs in the gadget
> (USB Device Controller mode) may be reserved for some special means, such as
> tracing. This series extends DT schema and driver to avoid using those.
> Without this the USB gadget mode won't work properly (those devices that
> "luckily" allocated the reserved EPs).
> 
> Ferry already tested the previous versions, but I ask him again to
> re-test this version which is significantly rewritten. I have not
> applied given tag just to be sure we got it carefully tested again.
> 
> Changelog v2:
> - added minItems to the schema (Rob)
> - revisited code and add NULL check to avoid crashes (Thinh)
> - rewrote helper function to return error to the user if parsing fails
> - elaborated in the commit message why we need this quirk (Thinh)
> - addressed miscellaneous style issues (Thinh)
> 
> Andy Shevchenko (3):
>    dt-bindings: usb: dwc3: Add a property to reserve endpoints
>    usb: dwc3: gadget: Add support for snps,reserved-endpoints property
>    usb: dwc3: gadget: Avoid using reserved endpoints on Intel Merrifield
> 
>   .../bindings/usb/snps,dwc3-common.yaml        | 11 ++++
>   drivers/usb/dwc3/dwc3-pci.c                   | 10 ++++
>   drivers/usb/dwc3/gadget.c                     | 60 +++++++++++++++++--
>   3 files changed, 76 insertions(+), 5 deletions(-)
> 
Retested this on v6.13.0 Intel Merrifield and found no problems due to 
this patch. With simultaneous iperf3 on cdc eem, and a disk bench mark 
on mass storage, it is possible to overload the gadgets causing no or 
delayed responses (delayed until killing iperf3) on gser, eventually 
causing the host side to need a reboot. So, nothing new there :-)

Thanks!

Tested-by: Ferry Toth <fntoth@gmail.com>
