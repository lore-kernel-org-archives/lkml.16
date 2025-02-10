Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BC31A8F98;
	Mon, 10 Feb 2025 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173046; cv=none; b=e6AMrBNgRPGIk00GpnEZaS6iUASbyQKEQCrOwDFDMGQbJEuFe//CykUVCmC85Ddxbl7KXEloGU+gfS3aRsY2/nCMatAbgWCTF9lzUOcxvwAHvvly028I+X3onIGdk7nTu+jQzsSWWS09l21TMD6S6DyhEiYMPwByy8Jxami4y+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173046; c=relaxed/simple;
	bh=Qr3KvRXfVXUC4fGBTquS8pULvemMSqJ84dZFqKS8P9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=flRxAkIWQv6aBiH8PVGpQjug5c8rAnGBfcpbBwn4cyOjNcQsU+XE3tBKNpqceX/LM+Xq7VByx6XzMpKrzWm0WGDP7s64kyQlsnw3LaeLWCEM7AbOmW0jYVMgVUa7aWLMXgBLeHGy8NZoODvxrE6BdZ50DS3G2d8tkNKq3VyKYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk9NAND5; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk9NAND5"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab78d9c5542so469673766b.1;
        Sun, 09 Feb 2025 23:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173043; x=1739777843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo2heipiceaHB2Nmnf1kB/5KT83cunXSvv+kUMMr8rY=;
        b=Tk9NAND5t1apZHMzIbrWkx6XIWEu7Xz6Ub+KL1S4g1bd2RNGh4kqK7osyybycCE2+m
         JluqyMop5+DcEHRnwOG/qn1i9FAEJHw50snVdY7qDbuyeA2MRLF3Q1UUj4XKb/zLXvZJ
         8onOAAdIBFBe1SFypXCRP26PuWCmcCSN7yCNCNOmRrJ7Qgjh7ZJLLRGUmwYV3k8ohc/a
         trzvjmLFJpPJfHd0AMIXxsZmrTBVVzDZ6cIoqkhrB+D1mB9xoombf7UODc3e0LPE04ie
         kgUc9kXTtnPN2jVa9cl46f+OvZGdtcL+O0UqmMN9lY9Pm/h7Vi8LO/fybEjCMbjGKcvP
         guuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173043; x=1739777843;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oo2heipiceaHB2Nmnf1kB/5KT83cunXSvv+kUMMr8rY=;
        b=Jt32ralIU5bh4+I2ocVJ4wVvNcUsdyMwxjPQa96dJwGtkWn/ufFekoT5tYtdjqg9lu
         GZkoSUUhnkKGOsTPyzWpgYA2mxhFg5FTxEEKdYMwMPEFx6b74HRSsC+7SMQDL5OuSBeu
         ZGmFsEjNn5GpwdwrMoE2uWYYLcVdjWojM7qanahTyUdS3IKTCErzT0BnFypzQbebov6s
         gFmkU1RhRJ8ZWjHQeWD8M5kOZyDyZ5gXxsLJOjFBEdK+cIDff9ioVyMVKE9c2xjwdi62
         JLJFVQOJ96ENI7POZmc6GFA4JEVmm4uNyLbLtQLE0XhqwcxViZ4jl+3l5mvfcXpQpPca
         m7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/dQeVFpdHiAB9phY0+1x5mInUAHomHO+RRij7j60VClFC6GPck/CbwXThC1vMUOQFntXFYpZpvsB8@vger.kernel.org, AJvYcCVHWiIscSJW1Q+b70Pr5Wy5DRYrghmMLTBkyH1fjnytfT8a7sMMCsn29bW54yy6yk86b+FtwyD+NzuHnWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQU2KeDmBvrIt4mVDDVQLNCJQsdIQ3llLSWsIA/6VOyC777s1+
	5KXnpSgHZrWCyY5V+J+9izEB/2CMW7Eskyzx+3j4LBywAwfPxWis3mAVxw==
X-Gm-Gg: ASbGncvIQeuF1CKyB0MkUubb7hz3aAaEIDWW9HFPuvT6aGepwMFT5wdKpWadJTKZHpv
	f2j4lrLWHOHmyBRePjOIg6PkaX9Vm1C4SOC1MvnsvF/Zy+tklADnQwoVNcdrNkXzRM4ve8bGGLU
	LUQFb7/hPQkhaLGKvQ6fET84vT04pz7qTsO13P3ZgMr6kMrFv6L0qUbamcmLYXbaDQefVDgKgXu
	X9pkkvxKmSKZ5iXUnHoNzuwZ1D0VL5ghi5VZUtdRVso8po+QrK33cZ2Zv470n99TadRIlNDXVTF
	YN54WMmx2jTIlo4PwkvUWao4Eonz80Om
X-Google-Smtp-Source: AGHT+IF/h+50eAHMfXTyeEFFijBf8Gbgoj8WCG7YLesrDpdJbYKzdIijeRJQzYRUeicUPbznOdV1Uw==
X-Received: by 2002:a17:907:1b28:b0:aac:619:e914 with SMTP id a640c23a62f3a-ab789aad2d1mr1573769366b.16.1739173042667;
        Sun, 09 Feb 2025 23:37:22 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c0907e77sm172815466b.98.2025.02.09.23.37.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Feb 2025 23:37:22 -0800 (PST)
Date: Mon, 10 Feb 2025 08:37:18 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman 
 <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] xHCI: Isochronous error handling fixes and improvements
Message-ID: <20250210083718.2dd337c3@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

These patches reduce latency of error reporting in some cases related
to 'error mid TD' and Missed Service events and sometimes fix a failure
to give back such TDs altogether until they are cancelled.

Also included are fixes for potential packet loss or memory corruption
due to an obscure race. Whether it causes problems IRL is not known and
the worst case would be hard to reproduce, but exactly for this reason
if the worst case actually happens, it could be hard to debug too.

2/5 is a cleanup which makes 3/5 implementation shorter and simpler.

The first three should be safe. The fourth should also be safe, but it
relies on HC functionality Linux never relied on before, so I placed it
towards the end in case it would need some tweaks. I tested it on all
hardware I have and it worked just fine.

The last one is perhaps the most controversial, though it should be
OK with typical "complete -> resubmit" drivers. It's the only one here
which increases latency in some severe error cases. The intent is to
avoid potentially giving back URBs not yet executed by hardware.

Michal Pecio (5):
  usb: xhci: Complete 'error mid TD' transfers when handling Missed
    Service
  usb: xhci: Clean up the TD skipping loop
  usb: xhci: Fix isochronous Ring Underrun/Overrun event handling
  usb: xhci: Expedite skipping missed isoch TDs on modern HCs
  usb: xhci: Skip only one TD on Ring Underrun/Overrun

 drivers/usb/host/xhci-ring.c | 110 +++++++++++++++++++++--------------
 1 file changed, 67 insertions(+), 43 deletions(-)
