Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289D619066D;
	Mon, 14 Apr 2025 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744618739; cv=none; b=JBI0UIBY8Vba7pl+ax/AkpoyZ+PZb1TWGX2HfVcfaDl6bHe/Jnfksx6/2IfOrwFpnJMgR0o09bzK+GDB/YlUpJB3em1zYXZ5poKfbI3wtADQg58iWyzTHm7cKaXJ0ADQeqTF7mjcaXB7boX+TcLKY6h+iSJYrmkNqQe2TcXhU7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744618739; c=relaxed/simple;
	bh=NAUH6JxFCjUR5Kz8NJ0hgi+TtaaG3aiby7vc/ny+m90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i97WjwbMG81C2byKZEZosJwzJI3kC4Qjl0qLqS0GMMKsylyUsS2FSvhmMhcrSxBa6usz3PXGFpKvym+EGRvXboWSFLTFjvmdXZ5gfkZkSKb3nQmymcZDZ6Rgdes/Ia9PNSUrVUaZq2peFkgviRtxP4H2enYhRKyZPFPpjR25mX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj5Gr98C; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj5Gr98C"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54298ec925bso2146079e87.3;
        Mon, 14 Apr 2025 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744618736; x=1745223536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NAUH6JxFCjUR5Kz8NJ0hgi+TtaaG3aiby7vc/ny+m90=;
        b=Gj5Gr98Cn7rV8n/6kt6noKldgKYgwK96REW++N0tHtxmBp4lsGQDOoM3JMv5c2vJy1
         Z9R9d/pmda4ezR0W+XTC5ZmG7zNQkNACUhqD/az8LEdvuSppbVJ2ItUfuvQRl+nzFogU
         rOeeFjlV7GeG7I8iW2vGCRXItv23CAZEGmHw9PIQPtK+rYUpQroQj2Gndk+i+QKv7Udt
         9G9iZLSZz0P8qVSB3Azi2sPOWOCValCMqdfJl49es9Lv6h18Ygke55NxJN0yuKYlQQcj
         S28iMQ1Qk4O1H/KoIUEBFQG+qVwLQl9xrWl+xOcJHI8xLNYUEk8zTq3jBS3R9RXqcG5U
         3Ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744618736; x=1745223536;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAUH6JxFCjUR5Kz8NJ0hgi+TtaaG3aiby7vc/ny+m90=;
        b=tMOc0WBuCoXZjcm3RRfE5CDRB9gDFpu4ADMbY+pPxvXx+GrynXdfyp1X8nJ848Xxnq
         EkV8C/9ViAeESJZRqAhLzksH76gIClcDFdBhUKv8pXekdL5pdncQ3xfNire/1t3cbuOg
         ubUOgvn8E43ZlnkHEC1Gl+fsKHqZXITpf5MUzTQhHVsKnR1mLabuiqU9qJ665jr+CTvX
         xD2oMfpVl/F90jvjpBa12nK1DdRT9CL1p/HgORrgRMpIDx0+Oyn/zbuvNRJ+XFQ6eCyQ
         cHZujZrTMPmt8EgnM1MfzLsZWZ960o3F4cS+T36aETRchG85ZNywJVAz3uOQXihRcSkh
         2AXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhDSDe1FwUaEbVoJgF++YFMDb7cYf3fKPrRSw6SAvhLllmfh95rkM1VIXwincBT/Y9fmB7EdJRA+Upx7E=@vger.kernel.org, AJvYcCX8GP98kNUCASuLmuK4DSARiP9vW5L7WwA7SpvOvWXb5IuNsiWNbS7jDC+BEuu3cuGSdXDvPlPH9E3S@vger.kernel.org
X-Gm-Message-State: AOJu0YykoUOKDPYi+CybG5WPC/iOeSoL5yXwXnZrKNoQk7OGoQmAX8DD
	opX2AKtUHo9TvffFf1ciuWu+0MCXY/F5ZhlVRzTVY32jr4aX/uPa
X-Gm-Gg: ASbGncv8LmR5lBKZRAarKmICb0AN4MPT3N3g/ATRzG++29qYUBSvJ3P9eAovEgl5wpb
	cM60In/D3f+8ErH6IYnj3s9e528tGTnRK51aVdsA1iM3SjDWGXoBaiHE+zsH8zqA36OPCu3C0uY
	/BLvFmG1jjSzODLi1giZV+L7VOyyU8YtlQXo/OUxdVskbIxUmCitAvp6fEo46+TOIjtEVTnDr5R
	m6CMnFKGwtHfL1god2JnDCWrpMFvbHuiPft5bkTWSN0azIYDs/ZrguEm8WNOZ4jvhw7CxgdzKAE
	l+RHAPEKLiqPTEWOk0IzexYWRS2iumEkS4VxRNxq7T8cjGsCHetzsiALRw==
X-Google-Smtp-Source: AGHT+IHiuwiPU4doHW/IUceu6jbhkBnNhnfwwEK7zwxkj4sXRDcqk5ADmX+myDIN3Uz2KmEOVP1IVA==
X-Received: by 2002:a05:651c:2122:b0:30c:1441:9e84 with SMTP id 38308e7fff4ca-310499d61b4mr30689251fa.13.1744618735814;
        Mon, 14 Apr 2025 01:18:55 -0700 (PDT)
Received: from foxbook (adtk197.neoplus.adsl.tpnet.pl. [79.185.222.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4661dd3csm16194381fa.112.2025.04.14.01.18.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Apr 2025 01:18:55 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:18:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Jonathan Bell <jonathan@raspberrypi.org>, Oliver Neukum
 <oneukum@suse.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] usb: xhci: Don't trust the EP Context cycle bit when
 moving HW dequeue
Message-ID: <20250414101850.2d6becf2@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I ran into an annoying bug in VIA hardware, where Endpoint Context
state is not updated when it's supposed to and Set TR Dequeue issued
by the driver sets wrong cycle state and the endpoint stops working.

This can be triggered by stalls, which are relatively common:
- some card readers without a card inserted
- disk I/O errors
- failing SMART commands, possibly issued by daemons like udisks2

I knew immediately what to do, because it's a known bug and Raspberry
Pi has a fix for it, which they submitted upstream but it got reverted
later. The revert is puzzling, because it was a boot issue, happening
before the changed code is supposed to run.

If the problem wasn't misdiagnozed and blamed on a wrong patch, I can
imagine the workaround could put the chip in a bad state which caused
problems after rebooting. The commit surely had a blatant endian bug
and VL805 is prone to locking up hard under some unclear conditions.

This is my attempt at a simpler, and hopefully correct, solution.
I tried to come up with something stable-friendly, but the patch is
not marked for stable becasue it wouldn't compile anyway. If there
is interest in having this in stable, we can trivially backport it
(a matter of end_trb/last_trb rename) and submit later.

Regards,
Michal
