Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C3F256C81
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197687; cv=none; b=ILSDIW2MflkKaIBT5JB7Q1lpan22bt4fbFFwgtHR4pfroNsQT/Q0OHYGBQsCZDhaKT1Ef7SoVd4iNpGWv02EHf8r2p/vah+y0Tq5nyzju1ULeR3NEQw86uNaa8tqbbp8LUItmp3rOzmwDY9xabJ/IiL0mPWtUMjnVfxBYwBFxFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197687; c=relaxed/simple;
	bh=RpJVwCDKSnByw8jtUR+cMwoe+OU/wu1hEclu+sJDocE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=ezkUC/J2wntSguoAj+FVQ7lxrHw/9x8OVNs3rQzG6xsb0JCm4XBPFfccojpFlRMPBG1ANDet7LADNZ6ldsrC1Zo62WUvfNc2ZDNwcHp7yg36QHMzkwaGzZOGbuSdYWqLOgCmZNzc7FMwc7L6eavTRTjcBReuI/9BN1lWv+o9ZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yzhds76e; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yzhds76e"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30572effb26so2118809a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746197685; x=1746802485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :reply-to:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APu7gvDG+GWIH3CqaZfGtDjeCKACn6athf5zXmMCeek=;
        b=Yzhds76eaOQr2njwQU5f9nPC1YVy34MCcet94KqjdhZYmtlqsngK+2siuJzjLpu7eU
         Zqv9z5ImAl5iYPsDkyVPWxgh/jRQM2Z5BKBJf/keBHdKZu+943f2/7thr9dGsHlFDeTu
         hFusV2bSuqNohCi6U8aJ28tNWx5DRfP24GQokGIQTMqTlM4UIS+ibpnpTkwJAYcXSUUS
         YW+Ozu+HV0iH4auF+Tsp/FsegDnP9S2atEXidnJI+2xhcwShx2RWsuC8bag1V1ToVT93
         X5euz488YP+ehb9hRGS+SASl/kUCJvu5MlNJ0twFfDwD3hLyG/14Sc+g3xo7U9uAoRol
         1+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197685; x=1746802485;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :reply-to:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APu7gvDG+GWIH3CqaZfGtDjeCKACn6athf5zXmMCeek=;
        b=dOLkTWRp6qnQjbHZePE9lmd9qajTkBJu3v6THxscEAsNPEyR2a2XVpOYw//Ujylhg5
         xDxxwA7kgaQk66aJI/c1RlPhLkXlDMxsCor6ZVi1zAYBbqHbu+LyYwjE0g7wQRJq10QA
         jep/2EI7W8j+bdW4rOFTrNHZJjmWiF3Yg44DBl1c9zSkI+zOMPi/IIF0gHzWooDS78Vz
         xpJTGZRVRHNZj6zGJJsQw0bblN6X0XIIC/9ZSpUC0lscPsmHm/ZbeZ/v32d86kx2WGIP
         fVGVA26r7fCkIo/bj/Rm+4hpcWE5JjfDL6Yg5/rLhzrDped9n/nR9sQTYkS/NjaJeWOt
         KWyw==
X-Gm-Message-State: AOJu0YzEpYqmBnnIF7D1czwLopxFmpRcp9GP2s7FtU3rXZnHHgEoEUdi
	ztl2M5Tlb9Iu4WoTO3SB2Bhdi8R+JsJVb1XhzHpR/XywtgnalMR6C8zB0B/oOcw=
X-Gm-Gg: ASbGncu65u+FozB8AO1CpK9n7QEFFDRjJRwNhmECv802QAWh77zqVlGIjn8jdp3xSCP
	3u3Xa4hQD4/piTjMawUaxEknJX1hBmwllRt12wQtl9xnb2ARLO2DXfWIMb0qlb2DLIeen2VK4gi
	FeiZQT4s5Hvl7McccQzdphcUpG5mbjVZppEQijciI8eAV/dI9bQVxbdqPXWG+3BwJh90KSCaD0o
	nDJQLKn29s/TdMo0JzOKWJ59R1GsDqNT/GjSqRjp470uOzfRjQrGHpkpCal4/a06cMFFHMvZe1i
	4vCQaPH9ViQUWba2cC1UGB60AfqUl6ufgsRuLcPzpIbKUqtk49jathRyDxE3IYAa94cmUh0ATO2
	NsiaUNKbI/jKuwqJ0
X-Google-Smtp-Source: AGHT+IHn7Y8AVYxoDs0398AiB0UwBhBWtyMBWcsUNuI/tSXRCHjv9HaSrzogEksiiNkjADgvql5Ezw==
X-Received: by 2002:a17:90b:57cc:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-30a4e692471mr4374925a91.32.1746197685063;
        Fri, 02 May 2025 07:54:45 -0700 (PDT)
Received: from 179-190-173-23.cable.cabotelecom.com.br ([179.190.173.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f0aasm6423373a91.35.2025.05.02.07.54.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:54:43 -0700 (PDT)
Date: Fri, 02 May 2025 07:54:43 -0700 (PDT)
X-Google-Original-Date: 2 May 2025 09:54:41 -0500
Reply-To: sales1@theleadingone.net
From: Winston Taylor <sglvlinks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: wts
Message-ID: <20250502095441.4F3E93927FC16CE9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello ,

 These are available for sale. If you=E2=80=99re interested in purchasing=
=20
these, please email me

 960GB SSD SATA 600 pcs/18 USD

S/N MTFDDAK960TDS-1AW1ZABDB

Brand New C9200L-48T-4X-E  $1,200 EAC
Brand New ST8000NM017B  $70 EA

Brand New ST20000NM007D
QTY 86  $100 EACH
Brand New ST4000NM000A   $30 EA
Brand New WD80EFPX   $60 EA
 Brand New WD101PURZ    $70 EA

Intel Xeon Gold 5418Y Processors

QTY $70 each



CPU  4416+   200pcs/$500

CPU  5418Y    222pcs/$700

 

8TB 7.2K RPM SATA
6Gbps 512   2500pcs/$70


960GB SSD SATA   600pcs/$30
serial number MTFDDAK960TDS-1AW1ZABDB


SK Hynix 48GB 2RX8 PC5 56008 REO_1010-XT
PH HMCGY8MG8RB227N AA
QTY 239 $50 EACH


SAMSUNG 64GB 4DRX4 PC4-2666V-LD2-12-MAO
M386A8K40BM2-CTD60 S
QTY 320 $42 each


Ipad pro 129 2021 MI 5th Gen 256 WiFi + Cellular
quantity 24 $200 EACH

=20
Ipad pro 12.9 2022 m2 6th Gen 128 WiFi + Cellular
quantity - 44 $250 EAC

Brand New NVIDIA GeForce RTX 4090 Founders
Edition 24GB - QTY: 56 - $700 each

 Brand New ASUS TUF Gaming GeForce RTX 4090 OC
 24GB GDDR6X Graphics Card
 QTY87 $1000 each
=20
Refurbished MacBook Pro with Touch Bar 13 inches
MacBook Pro 2018 i5 8GB 256gb quantity $ 200 EACH
MacBook Pro 2019 i5 8GB 256gb Quantity $ 200
MacBook Pro 2020 i5 8gb 256gb Quantity $200
MacBook Pro 2022 i5 m2 8gb 256gb quantity $250 EACH

 

Refurbished Apple iPhone 14 Pro Max - 256 GB
quantity-10 $35O EACH

Refurbished Apple iPhone 13 Pro Max has
quantity-22 $300 EACH


Apple MacBook Pro 14-inch with M3 Pro chip, 512GB SSD (Space=20
Black)[2023
QTY50
USD 280


Apple MacBook Air 15" (2023) MQKR3LL/A M2 8GB 256GB
QTY25
USD 300 EACH


HP EliteBook 840 G7 i7-10610U 16GB RAM 512GB
SSD Windows 11 Pro TOUCH Screen
QTY 237 USD 100 each


 Best Regards,

300 Laird St, Wilkes-Barre, PA 18702, USA
Mobile: +1 570-890-5512
Email: sales1@theleadingone.net
www.theleadingone.net

