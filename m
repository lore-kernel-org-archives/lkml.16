Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B981E9918
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341187; cv=none; b=eh7hiKgXpheWI84d+2ofHNvnmx0F8oZlw5SrV53WgBPQIeRUfMCYIBRzGrVxMhWreC6ZXSjIGAXXwxtTMn8bkuzO1AQ05ptb4EeLjKBFwcSfWf+276ulAJABjMRyfSRDkRbKRfQiMjPZh4cIKY4yLGG9kqGO8oB5iiGGyGzASJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341187; c=relaxed/simple;
	bh=tjspVQq8om2BA6jhnVUF8cRfoahJyy48H8fEM0u1PXE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/LIedup6Liu1w7f2sbvrk2bBpo4oZPJAnWl6h6PnMy53NU7Cx19yc5ybP54FulkmX0tlMq4PrVmvaX9YPfL5U/eJDYpEiE0mMkwazpQZUqgr+/kr1wnMtLExcKxwTr7FyXMo0CC2XqdiwKRUZtz5INpSPE8ta+xG+/H7YjWwUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bvAKeIOk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bvAKeIOk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738341183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbPvxv+SJlJsHXlpjSxo+uQOUl1d7qOYXt+GAFt8ziw=;
	b=bvAKeIOkZzesXX5DCzf/SjdC/T28496orwOK9XQYZsixXszhk2Hd6wItmNS3sq/m4XzyAc
	Go95COZKzwdndGWVoJ3oQWbtJgZ59f5pET1A88bKuNzoERcS1cq5lBEm6xnjCmK9fQ/+wK
	trX+Lp3RNebp69RElZcY9QSPLNNFsns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-HaELLgx6MfWppNxMb1EwAw-1; Fri, 31 Jan 2025 11:33:02 -0500
X-MC-Unique: HaELLgx6MfWppNxMb1EwAw-1
X-Mimecast-MFC-AGG-ID: HaELLgx6MfWppNxMb1EwAw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43651b1ba8aso16157285e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341181; x=1738945981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbPvxv+SJlJsHXlpjSxo+uQOUl1d7qOYXt+GAFt8ziw=;
        b=Qv/q5wAWAIvhFiFBLmMHY+D6tWEe7VKC1vTWnabHUpX934xgHY9NWJKx1ljS0rJTZX
         4VTeti2lTgYSf+tQbk/BwuhInQECo4alGCXlRPZt9AL/fq+j/mY5Cm2MXsLomk7+xjhG
         tBlQMBS2KaAXi5yzfdi+EFm07LX5CknrFBEaSVu4To0BP7zQNo3byGT7HJ5n2QY0ytqJ
         T77Fi1/np4SO7Yad9FFQyG3sEn8xGQjlhdDSyj2fKe1IN6Ia4z1sGnzAoZVRLzfdKsvz
         xH6RE654lz6frAlL4VQTzfuLX033OQRA3HXVjBekFyno3S5Vd1wGvXN9uZNsiWR245lt
         FE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwWZCYXW5qSohJrVFeDt5YklzLfvz7H1AzTzQKSwLIY3KeNF6st9K8yJSQIIYpC6H3OGx92JztbDEUVcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztkat3RDL7KuziNQVprBZqhc4a95WS8EDWvjU/Vx4wCQhu+gWh
	UQCLU3mleBsxQGT3aoM/UOo/e8UP8usBfw1ar6QcQXFUtiJpD6tH3nS6Hhd14xs6tIWqPYkkMh5
	Czhfj+/VquHXkIIkqJAC2Q497kmzBvbfsNxDM/XsnPbAhpjekYtR9EcOaDWi7Tg==
X-Gm-Gg: ASbGncsYL5FZAJb6VdI8tWa2FmO1GZ0SC+gk5cDtCYXhzaa8teh6qb4kM5w1ZZOeR44
	FIiWLecLC5hNJfUWcSUQ937prTEq3XuvKGF6CYfSJvoleFZC/1F+HTTuoLAyufmljM9UawEDOVR
	S/4G1IxUfbi/34u81zjjlzfJw4nPNvd1aA56VoD2ID2fzGJfKv5KzCE48gjuGvNocOX4+PgQPGG
	JSM9cIay2MGjBZVS0nImYBUmr3IVs51V/j/5xdXyUvkA4fb3cf0C1zafkWShufkwF9J0Ol8N0eD
	eBizaPeDa0/PQEBM/v4QcDqdyZv6hUPrFNoIyyAvrlY+tkbJeTAc
X-Received: by 2002:a05:600c:3d9b:b0:436:e8b4:36e7 with SMTP id 5b1f17b1804b1-438dc3c38admr112271765e9.8.1738341180849;
        Fri, 31 Jan 2025 08:33:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcOFxsjUhU9CdddNzvHKzuADNZc07txN0oT/OjZdAi60VQ/jXqydMTXzb7vPmV+145bHw/CA==
X-Received: by 2002:a05:600c:3d9b:b0:436:e8b4:36e7 with SMTP id 5b1f17b1804b1-438dc3c38admr112270925e9.8.1738341179214;
        Fri, 31 Jan 2025 08:32:59 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b61f1sm5162786f8f.68.2025.01.31.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:32:58 -0800 (PST)
Date: Fri, 31 Jan 2025 17:32:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/13] tests/acpi: virt: add a HEST table to aarch64
 virt and update DSDT
Message-ID: <20250131173257.3b0f7df0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250131164919.7955a110@foz.lan>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<7036f18f9c25852aeae6526d424e259211a0c9cd.1738137123.git.mchehab+huawei@kernel.org>
	<20250129162953.5c525555@imammedo.users.ipa.redhat.com>
	<20250131164919.7955a110@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jan 2025 16:49:19 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 29 Jan 2025 16:29:53 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Wed, 29 Jan 2025 09:04:18 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > DSDT has gained a GED device to notify errors:
> > > 
> > > --- a/DSDT.dsl        2025-01-28 09:38:15.155347858 +0100
> > > +++ b/DSDT.dsl        2025-01-28 09:39:01.684836954 +0100
> > > @@ -9,9 +9,9 @@
> > >   *
> > >   * Original Table Header:
> > >   *     Signature        "DSDT"
> > > - *     Length           0x00001516 (5398)
> > > + *     Length           0x00001542 (5442)
> > >   *     Revision         0x02
> > > - *     Checksum         0x0F
> > > + *     Checksum         0xE9
> > >   *     OEM ID           "BOCHS "
> > >   *     OEM Table ID     "BXPC    "
> > >   *     OEM Revision     0x00000001 (1)
> > > @@ -1931,6 +1931,11 @@
> > >                  {
> > >                      Notify (PWRB, 0x80) // Status Change
> > >                  }
> > > +
> > > +                If (((Local0 & 0x10) == 0x10))
> > > +                {
> > > +                    Notify (GEDD, 0x80) // Status Change
> > > +                }
> > >              }
> > >          }
> > > 
> > > @@ -1939,6 +1944,12 @@
> > >              Name (_HID, "PNP0C0C" /* Power Button Device */)  // _HID: Hardware ID
> > >              Name (_UID, Zero)  // _UID: Unique ID
> > >          }
> > > +
> > > +        Device (GEDD)
> > > +        {
> > > +            Name (_HID, "PNP0C33" /* Error Device */)  // _HID: Hardware ID
> > > +            Name (_UID, Zero)  // _UID: Unique ID
> > > +        }
> > >      }
> > >  }
> > > 
> > > New HEST table:    
> > 
> > diff might be a better here,
> > you can have it during make check when expected tables haven't been update yet.
> > prereq for that is to have 'iasl' installed (usually part of acpica-tools package)
> > and adding V=1 to env vars, something like this:
> > 
> >  V=1 QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/bios-tables-test  
> 
> Hmm... didn't produce any diff here. I added a diff generated by
> hand (calling iasl before/after the GED wire up patch and manually
> running diff).

that can happen due to stale files which rebuild-expected-aml.sh creates
(I'd check 'git status' output).
And well, rerun configure after iasl has been installed.


> Anyway, as HEST table is not checked, I dropped it file from the tests[1],
> and placed on patch 12/13 just the DSDT diff.

if it's not checked, then it would be better to add it before changes,
and then update here (with new layout)
> 
> [1] tests/data/acpi/aarch64/virt/HEST
> 
> >   
> > > 
> > > /*
> > >  * Intel ACPI Component Architecture
> > >  * AML/ASL+ Disassembler version 20240927 (64-bit version)
> > >  * Copyright (c) 2000 - 2023 Intel Corporation
> > >  *
> > >  * Disassembly of hest.dat
> > >  *
> > >  * ACPI Data Table [HEST]
> > >  *
> > >  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
> > >  */
> > > 
> > > [000h 0000 004h]                   Signature : "HEST"    [Hardware Error Source Table]
> > > [004h 0004 004h]                Table Length : 000000E0
> > > [008h 0008 001h]                    Revision : 01
> > > [009h 0009 001h]                    Checksum : 68
> > > [00Ah 0010 006h]                      Oem ID : "BOCHS "
> > > [010h 0016 008h]                Oem Table ID : "BXPC    "
> > > [018h 0024 004h]                Oem Revision : 00000001
> > > [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
> > > [020h 0032 004h]       Asl Compiler Revision : 00000001
> > > 
> > > [024h 0036 004h]          Error Source Count : 00000002
> > > 
> > > [028h 0040 002h]               Subtable Type : 000A [Generic Hardware Error Source V2]
> > > [02Ah 0042 002h]                   Source Id : 0000
> > > [02Ch 0044 002h]           Related Source Id : FFFF
> > > [02Eh 0046 001h]                    Reserved : 00
> > > [02Fh 0047 001h]                     Enabled : 01
> > > [030h 0048 004h]      Records To Preallocate : 00000001
> > > [034h 0052 004h]     Max Sections Per Record : 00000001
> > > [038h 0056 004h]         Max Raw Data Length : 00000400
> > > 
> > > [03Ch 0060 00Ch]        Error Status Address : [Generic Address Structure]
> > > [03Ch 0060 001h]                    Space ID : 00 [SystemMemory]
> > > [03Dh 0061 001h]                   Bit Width : 40
> > > [03Eh 0062 001h]                  Bit Offset : 00
> > > [03Fh 0063 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [040h 0064 008h]                     Address : 0000000139E40000
> > > 
> > > [048h 0072 01Ch]                      Notify : [Hardware Error Notification Structure]
> > > [048h 0072 001h]                 Notify Type : 08 [SEA]
> > > [049h 0073 001h]               Notify Length : 1C
> > > [04Ah 0074 002h]  Configuration Write Enable : 0000
> > > [04Ch 0076 004h]                PollInterval : 00000000
> > > [050h 0080 004h]                      Vector : 00000000
> > > [054h 0084 004h]     Polling Threshold Value : 00000000
> > > [058h 0088 004h]    Polling Threshold Window : 00000000
> > > [05Ch 0092 004h]       Error Threshold Value : 00000000
> > > [060h 0096 004h]      Error Threshold Window : 00000000
> > > 
> > > [064h 0100 004h]   Error Status Block Length : 00000400
> > > [068h 0104 00Ch]           Read Ack Register : [Generic Address Structure]
> > > [068h 0104 001h]                    Space ID : 00 [SystemMemory]
> > > [069h 0105 001h]                   Bit Width : 40
> > > [06Ah 0106 001h]                  Bit Offset : 00
> > > [06Bh 0107 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [06Ch 0108 008h]                     Address : 0000000139E40010
> > > 
> > > [074h 0116 008h]           Read Ack Preserve : FFFFFFFFFFFFFFFE
> > > [07Ch 0124 008h]              Read Ack Write : 0000000000000001
> > > 
> > > [084h 0132 002h]               Subtable Type : 000A [Generic Hardware Error Source V2]
> > > [086h 0134 002h]                   Source Id : 0001
> > > [088h 0136 002h]           Related Source Id : FFFF
> > > [08Ah 0138 001h]                    Reserved : 00
> > > [08Bh 0139 001h]                     Enabled : 01
> > > [08Ch 0140 004h]      Records To Preallocate : 00000001
> > > [090h 0144 004h]     Max Sections Per Record : 00000001
> > > [094h 0148 004h]         Max Raw Data Length : 00000400
> > > 
> > > [098h 0152 00Ch]        Error Status Address : [Generic Address Structure]
> > > [098h 0152 001h]                    Space ID : 00 [SystemMemory]
> > > [099h 0153 001h]                   Bit Width : 40
> > > [09Ah 0154 001h]                  Bit Offset : 00
> > > [09Bh 0155 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [09Ch 0156 008h]                     Address : 0000000139E40008
> > > 
> > > [0A4h 0164 01Ch]                      Notify : [Hardware Error Notification Structure]
> > > [0A4h 0164 001h]                 Notify Type : 07 [GPIO]
> > > [0A5h 0165 001h]               Notify Length : 1C
> > > [0A6h 0166 002h]  Configuration Write Enable : 0000
> > > [0A8h 0168 004h]                PollInterval : 00000000
> > > [0ACh 0172 004h]                      Vector : 00000000
> > > [0B0h 0176 004h]     Polling Threshold Value : 00000000
> > > [0B4h 0180 004h]    Polling Threshold Window : 00000000
> > > [0B8h 0184 004h]       Error Threshold Value : 00000000
> > > [0BCh 0188 004h]      Error Threshold Window : 00000000
> > > 
> > > [0C0h 0192 004h]   Error Status Block Length : 00000400
> > > [0C4h 0196 00Ch]           Read Ack Register : [Generic Address Structure]
> > > [0C4h 0196 001h]                    Space ID : 00 [SystemMemory]
> > > [0C5h 0197 001h]                   Bit Width : 40
> > > [0C6h 0198 001h]                  Bit Offset : 00
> > > [0C7h 0199 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [0C8h 0200 008h]                     Address : 0000000139E40018
> > > 
> > > [0D0h 0208 008h]           Read Ack Preserve : FFFFFFFFFFFFFFFE
> > > [0D8h 0216 008h]              Read Ack Write : 0000000000000001
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
> > >  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
> > >  tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
> > >  tests/qtest/bios-tables-test-allowed-diff.h   |   2 --
> > >  7 files changed, 2 deletions(-)
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
> > > index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..a182bd9d7182dccdf63c650d048c58f18505d001 100644
> > > GIT binary patch
> > > delta 109
> > > zcmX@3@k4{lCD<jTLWF^ViDe>}G*h$dM)euOOwJsW4+;nC=*7E+g>V+Q2D|zsED)Gn
> > > zoxsJ!z{S)S5FX^j)c_F?VBivHb9Z%dnXE4&D;?b=31V}^dw9C=2KWUSI2#)?aKwjt
> > > Hx-b9$X;vI^
> > > 
> > > delta 64
> > > zcmeyNaYlp7CD<jzM}&caNqQoeG*i3NM)euOOit{R4+;lM%f`Egg>V+Q2D|zsED)Gn
> > > UoxsJ!z{S)S5FX?-*+E1W06%jPR{#J2
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> > > index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..af1f2b0eb0b77a80c5bd74f201d24f71e486627f 100644
> > > GIT binary patch
> > > delta 110
> > > zcmZ3ac}|ndCD<k8oCpI0)4_>c(oCIR8`a+lGdXii78eO-)SH|wBICY5U~+W=mjDBo
> > > yK%2X(iwjpnbdzL2c#soEyoaX?Z-8HbfwO@#14n$Qrwc=LlO#wDl9aJAR0;r(tsHj%
> > > 
> > > delta 66
> > > zcmX@7xk!`CCD<iokq83=(~XH-(oDVX8`a+lGdZzO78eO-l%1R{A|oB$BpDDM<irv0
> > > W;pxH~;1^)vY~akm5g+R5!T<noi4jWx
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
> > > index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..10436ec87c4859fb84b3ecb7bba5788f38112e59 100644
> > > GIT binary patch
> > > delta 88
> > > zcmbPheA1Z9CD<k8q$C3algUIbX{MH08`WnBGdXcjJ}4Z_<jXo)OvH<SfxzVI1TFyv
> > > qE`c_8R~MJfaU%At($P(lAPz^oho=i~fM0-tv#~J)M|`NK3j+W#;TF9B
> > > 
> > > delta 44
> > > zcmX?UJlB}ZCD<iot|S8klg&gfX{L_p8`WnBGdXfiJ}4Z_<ij#qOvGz*p@=Oj039?8
> > > AE&u=k
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
> > > index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..0524b3cbe00bfe552de824dd1090bd00a208c527 100644
> > > GIT binary patch
> > > delta 110
> > > zcmexwz1oJ$CD<iITaJN&sbC_PG*jDyjq2XAOwJsWOJsu?^(LQ?m2qDnFu6K`OMrn(
> > > ypv~RY#f7UOx=Au1JjjV7-ow*{H^48zz}di=fg?WD(}f|rNfM+6Ny^w5Dg^+WYaFrw
> > > 
> > > delta 66
> > > zcmZ2&^WU1wCD<k8zbpd-Q^!OuX{N5b8`ZsKnVi@sm&gV)%1%BZD<d7<BpDDM<irv0
> > > W;pxH~;1^)vY~akm5g+R5!T<oNArgiF
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
> > > index 029d03eecc4efddc001e5377e85ac8e831294362..8c0423fe62d6950f9098983d86bfee256d7d003a 100644
> > > GIT binary patch
> > > delta 86
> > > zcmbQHbx4cLCD<jzNtA(s>E%Q&X{O%5jp|7vOwJsWyG4Q-^(NmJk>Ot;Fu6K`OMrn(
> > > opv~RY#bxqO5n1WzCP@&RBi_T)g*U)2z`)tqn1Lfc)YF9l01l28<p2Nx
> > > 
> > > delta 42
> > > ycmX@4HBF1lCD<iIOq79viGL!OG*hGhM)f2SCMWjE-6Fw^vXk$N$V}!Dl?DLb(h64q
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
> > > index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..8b0cf87700fa1799c0f8e48610ce4b7ff751dd1f 100644
> > > GIT binary patch
> > > literal 224
> > > zcmeZp4Gww0z`($m;pFe^5v<@85#X$#prF9Wz`y`vgJ>oO1_mw$28RFt85lu)5N2Ru    
> > > tU|?_nkxwi^d=43qAPxXkD*#pd?>_{9%>kRuh}CQksCsrH%$C4mHUOJBAprmY      
> > > 
> > > literal 0
> > > HcmV?d00001
> > > 
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index 46298e38e7b8..dfb8523c8bf4 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1,3 +1 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > -"tests/data/acpi/aarch64/virt/HEST",
> > > -"tests/data/acpi/aarch64/virt/DSDT",    
> >   
> 
> 
> 
> Thanks,
> Mauro
> 

