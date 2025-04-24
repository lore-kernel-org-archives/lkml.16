Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE418A6AD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503792; cv=none; b=cinU6H3t715DVXSNsuGLe2wjqL7+NaskfYSFoTRv/d2mjmUP4yM79/q67kKVZaA7qp+8Nrpvi60lB7n7Z7uSIgumu+1ABGA/nBUky2wS1j5BeGYMTQUUZC277JQlJLAS7n3vFFKYIPzZEQSPY2KLiQHxCgkYgJ10MocF8Rplgak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503792; c=relaxed/simple;
	bh=Byl8wGqJTtnl74RJ2YKMT0DDlnonSferfdT8IKzK5+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2ORUVERkJtojOR7FneF1c33zMdukrCu3UbkJgNTunW1rHmaScSA71WfTMpVh5OgB7QIeh0A023tEehCEGmB2zscygElawAYrtOYSaIR6noelj0pulnfZHCW4T9ab56wl5l3KoltegfjZ8sZ4wDlM1laATHEIZySPICwDLJHRfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gqI10tR6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gqI10tR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745503789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
	b=gqI10tR6664EVHaUzsi6pGv6tz0HdbE9geKp9ilsJrCv/IGdHdIl3F+t87ZV5iEWJ36BFT
	90ww/K6AwKDagRwpzvjf85EZ5QIlj0H5iBbyf6dpvyMJHbcAUl6S24WnFsa6qAyHGrCAeF
	PakxFVdr+Mlayu7wN0mHe39Alz4ycjw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-HWxBboayONCgymVSkwlNJA-1; Thu, 24 Apr 2025 10:09:47 -0400
X-MC-Unique: HWxBboayONCgymVSkwlNJA-1
X-Mimecast-MFC-AGG-ID: HWxBboayONCgymVSkwlNJA_1745503787
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913b2d355fso366586f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503786; x=1746108586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
        b=aDqrza19I/JPwlQeckg8TUyLUgHwMDvX2p5T9HixT6YAyFYuVoK/EF6YATCo/z5lTR
         mG856Gxlek02v0eQ584ohhbjsy4JPESjx48Xqxg52R0RI8mA3vmrzC+JE3N/l7i/ltQs
         jGUAVQu3YR9CdZdwLzVsiESW5bZMXOfekwb+/+/WC4sbHWoSkBddpjRAwJUFUE27pim0
         K3Jd87eNNz/Su6Lcnlw9VQvHCU/+FbUYddTDUgJzueB55CAXXmnl9YV6druyn+53qE4+
         kZSplgvVNc/CrTRiZOk51dgJAnlGGhEI2wD8Y0B/I9OlEGDXZGLjC7xMBvgQ+ttXqxMT
         H7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWvdpOQEbBNqSMaAL+eyui8m3eOUSux+dSEf+67b24uYYAJRxIKYQ+Z0P1M7NKhwRKupT5QzKrfNYiys38=@vger.kernel.org
X-Gm-Message-State: AOJu0YwarDmRog6Yn8C6ukvfWHT1vTjP0UURKzriaw/8MA+H/M8yX6XL
	IddM0NiyE70DkkNeuxQogT9jcD8VS3ZY6pMmnt/BSLmwACQl6E+JFwnn6rZI7+OuKir6xLexYm9
	EwotsjJNyhSdCUw/cYMjdwShrf5odymCq0g6+XVakK2+vujfDS1uQVQ72+tyIaw==
X-Gm-Gg: ASbGncsC6z8BeZJFpNBgBjkKVaIng+eLWLgJu3bDCxTa2XrI4mkm8fstk3Kj+w/8nOy
	oeTMrhRFhxHWN4lSFO3NZPXutjpblfcnk2V7rSOBanbiVU+AxostQINVXxF6AwIeD/X1qEtFE1Z
	RwY754mef9D3StW1Cb1+9aBzxfQpIdx5W2jZ0VLwcVyCO/ZgTGsgf9KnSNrFvU4srP5E9kHudxU
	BDz/UXeWmOGUBQsGc2Ct0Pz4sJtDOg8cTdb1Yy9rs4XprTSJ3GaP3fEy/H3zgspSxpALUbg3WUW
	EUfJcP7xsnI5bszLnxezUEfpQA==
X-Received: by 2002:a05:6000:40dd:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a06cf564f6mr2030215f8f.19.1745503786450;
        Thu, 24 Apr 2025 07:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCLnvnPrTr2kA4EPsTX8eBJWla0qlNHBLrDC/aXaOPuzLScpVQ0iwMUi89EkItUdIH45LJew==
X-Received: by 2002:a05:6000:40dd:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a06cf564f6mr2030125f8f.19.1745503785858;
        Thu, 24 Apr 2025 07:09:45 -0700 (PDT)
Received: from t14ultra (109-81-82-22.rct.o2.cz. [109.81.82.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4945sm2217236f8f.47.2025.04.24.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:09:44 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:10:04 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
	jstancek@redhat.com
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <aApGPAoctq_eoE2g@t14ultra>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>

On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Weiﬂschuh wrote:
>From: Anna-Maria Behnsen <anna-maria@linutronix.de>
>
>To support multiple PTP clocks, the VDSO data structure needs to be
>reworked. All clock specific data will end up in struct vdso_clock and in
>struct vdso_time_data there will be array of it. By now, vdso_clock is
>simply a define which maps vdso_clock to vdso_time_data.
>
>Prepare for the rework of these structures by adding struct vdso_clock
>pointer argument to do_hres_timens(), and replace the struct vdso_time_data
>pointer with the new pointer arugment whenever applicable.
>
>No functional change.
>
>Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>Signed-off-by: Nam Cao <namcao@linutronix.de>
>Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
>---
> lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> 1 file changed, 18 insertions(+), 17 deletions(-)
>

Hi,

starting with this patch, I'm seeing user-space crashes when using clock_gettime():
   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock

It appears to be unique to aarch64 with 64k pages, and can be reproduced with
LTP clock_gettime03 [1]:
   command: clock_gettime03 
   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC 2025 aarch64
   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with libc spec
   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV

or with:
--------------------- 8< ----------------------
#define _GNU_SOURCE
#include <sched.h>
#include <time.h>
#include <unistd.h>                                                                                                                                                                                                                          #include <sys/wait.h>

int main(void)
{
         struct timespec tp;
         pid_t child;
         int status;

         unshare(CLONE_NEWTIME);

         child = fork();
         if (child == 0) {
                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
         }

         wait(&status);
         return status;
}

# ./a.out ; echo $?
139
--------------------- >8 ----------------------

RPMs and configs can be found at Fedora koji, latest build is at [2] (look for kernel-64k).

Regards,
Jan

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
[2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401

