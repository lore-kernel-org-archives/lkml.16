Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72ED1BB6BC
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247918; cv=none; b=ffJda+W+pr2zo0hqWg1n5kd5i3TsljUkIfq9Qv6U2812hJgniLFIspDH6BXbph2+QfSOdB+WTX+JTNpHUM/9AfDLPt6m7RR2zZ37fQI1Bv1jFBptWYo8O1PvvXVN5cwjxQbAX606CtSEX0s68rtOanKljKbvVUV0lbwzWiRXbq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247918; c=relaxed/simple;
	bh=iI0ePVIHGXyR7zGEY8vXECh4QVEz6Six9XPuHmBSdAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADeVxwv+alJoew9LXI5r9TLC+ql7Idguk3WeKdI+iOWERr1m/IOSuLaW9OMgBe4oNG+/t3fwkyWvVbQRfCKk/UJPR/aSaFxOv8ru6fu5oeHk7RcWkB7C9xA1AherZJVxlV66hrEB8Pl7HBnd9IL2dGyb07FcYBY2d4PdFekJ4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KpUYCp61; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KpUYCp61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738247915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgiE4FoOzUtDiv/Mw5xRoxpuCcm6arbkAbYB7wDmIE4=;
	b=KpUYCp613mPeIX+hbp+IypRsfob+5XobrckxJJd5eJ7uVqmh8lgxF4+VQh3mv15VFipHHg
	a8MAJ4LPfA2EAmOBP+DNzaf98wu2cvsGPFlGAZ5/LUyCafyg97MDrYABzmy4huvPrz83un
	SmOVuPR7gkm0RFL54NzlI1teqZdPE14=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-Kbl8lYn7PlSjQk9_F7lBdA-1; Thu, 30 Jan 2025 09:38:34 -0500
X-MC-Unique: Kbl8lYn7PlSjQk9_F7lBdA-1
X-Mimecast-MFC-AGG-ID: Kbl8lYn7PlSjQk9_F7lBdA
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38a684a096eso374007f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247913; x=1738852713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgiE4FoOzUtDiv/Mw5xRoxpuCcm6arbkAbYB7wDmIE4=;
        b=Y6S2MMt+M36HxrmdEcL1bzDzFVzd8iVt7spm0bvLg15BwMpQ7d7OOXig/fONFjALBk
         h5g3Ylr8yTGpQrv6S8p8vHKwylDi7bNQ489VzVIv89p7Qn9UkLAq/yPW9xfx4KadyQcy
         9yyiQ6EtGY9jH8ExuYRuZUJDopKJxZKUSA5OooFPTUthfrvz4E4W2acgz7ddZEd1m6DA
         ago8x5ZlpPx+wL+6OdfzbSp/6E8RRsBzSSAFO9/02SKQPibR3+ZyfHAUqTJiVhF7Zr50
         hbGpKch7fUistJH9odxaH/SnhNLjSBCWqOnQF4SbfaevDOIecGEwDPSa3qPH7gtPTb/t
         79jg==
X-Forwarded-Encrypted: i=1; AJvYcCWZltSRsruI0XStGEdq6N5lOdcqB60xIVNmeGOyAhTvnfpkO8nBwR1kpP+bkgQh7wtvrF5Qf2r8lhtc5QA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvSQHlbj+IYFu4Olf280r3jPRDZsXNlRW1okdRHgL0+e9g1US
	ZYoWrx1ckcu6IBLB0/GTN/uI/rtj0n7k/T4x23Q0WYLRZGmfRBcAJcwUtqnDHLMJCtg3R0LlH+m
	manXeg8+DKtvjSfV+wncyWjpVxDtTwMvFh0j3OlLszGXH2wwMi9JegnTsleGsUQ==
X-Gm-Gg: ASbGncsDzcCTlbDpcVs1QaofXesuU/ZhgvvJSEymdJjXfYjI+2f44IzkiUxyU06yeqN
	80a098m3/yWaLojisAkjVoBwrUgRR1uUji83M23ZTfin6Sg+d7T0L1QBQdzkmJnVbuW4E5XHDHh
	+xpIpHYRqaHqnO5AIJVY1QfOsGFMXkMO4H7rXBw/47G2M489n4Ckn9y/Uksdps5IKzmxhCnDwuv
	vCPC1lo/g+7b6pcLV8H431LgHKYu2sU/v9Pcik11+QhBJurev9kQdvFGqFk834WImrudBZOxchm
	m0B2ADRqwyWr5ejrp7wIIISIJVcuQMH+ImIcQrGXUINW7gaB80LO
X-Received: by 2002:a05:6000:1882:b0:38b:f03c:5bbc with SMTP id ffacd0b85a97d-38c5195e5fcmr5088130f8f.19.1738247913085;
        Thu, 30 Jan 2025 06:38:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbV/sWshrdZhajcEm6ev76AV43Yg6Ta4vaWNe4sJ9G1m559H1nibuG1D9Z7w1qHPW2kocQNA==
X-Received: by 2002:a05:6000:1882:b0:38b:f03c:5bbc with SMTP id ffacd0b85a97d-38c5195e5fcmr5088104f8f.19.1738247912662;
        Thu, 30 Jan 2025 06:38:32 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f17dsm60641185e9.23.2025.01.30.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:38:31 -0800 (PST)
Date: Thu, 30 Jan 2025 15:38:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] tests/acpi: virt: allow acpi table changes for
 a new table: HEST
Message-ID: <20250130153830.2e4e081d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250130140324.06cdd4bf@foz.lan>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<1390b46682f2bac3587239d03a0ba22d18a9a044.1738137123.git.mchehab+huawei@kernel.org>
	<20250129160328.2f66584c@imammedo.users.ipa.redhat.com>
	<20250130140324.06cdd4bf@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jan 2025 14:03:24 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 29 Jan 2025 16:03:28 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Wed, 29 Jan 2025 09:04:08 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > The DSDT table will also be affected by such change.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>    
> > 
> > move it right before the patch that would actually make changes to tables (10/13)  
> 
> Table changes happens on two patches:
> 
> - patch 03/13: acpi/ghes: add a firmware file with HEST address

this one shouldn't affect bios tables test as it only checks ACPI and SMBIOS tables,
and hest addr file is not either.

Do you really see test failing on this patch?


> 	HEST table was added here
> 
> - patch 10/13: arm/virt: Wire up a GED error device for ACPI / GHES 
> 
> 	DSDT changes happen here.
> 
> If the idea is to avoid make check to fail between those two patches,
> we need either to split them on 4 patches (one before/one after each
> change) or do like I did on this series: whitelist before patch 3,
> update after patch 10.

It would be better to group patches that should change ACPI tables
close together so that a pair of whitelist/update could cover it.
However it depends on how many changes are there, i.e. acpi diff
should be digestible for a reader. So there is no hard border here,
just use common sense.

However when the whitelist is covers all series where only few patches
actually result in tables change, that miss-leads the reader since
whitelist patch basically tells 'watch out for changes since this moment'
and 'update' patch declares no more changes should happen.
The same applies to bisection, where closer the gap between
whitelist/update the better if the test case is the trigger.
No need to be fanatical and do it around each patch,
just make it observable (i.e. some small range of commits). 

  
> 
> Regards,
> Mauro
> 
> > 
> >   
> > > ---
> > >  tests/data/acpi/aarch64/virt/HEST           | 0
> > >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> > >  2 files changed, 2 insertions(+)
> > >  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
> > > new file mode 100644
> > > index 000000000000..e69de29bb2d1
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index dfb8523c8bf4..46298e38e7b8 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1 +1,3 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > +"tests/data/acpi/aarch64/virt/HEST",
> > > +"tests/data/acpi/aarch64/virt/DSDT",    
> > 
> > the list in not complete so 'make check-qtest' still fails
> > [12/13] has complete list of changed files
> >   
> 
> 
> 
> Thanks,
> Mauro
> 

