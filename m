Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C82AD32
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738981768; cv=none; b=Pj3r7rEvTcB7KN79rj+EBin+erUxHipVTA6R3TA2uh3dd3MJoFTHOxfoOwxH3JIQ9dOKRIKs85Mo5eH05sawOMA+Q75OtJacLdnytxnrKK2/t0fCum/KOdEORRp55QXzo+HoS9CXfsTsquLiHa+7/OnBuVFUdps5o5akwSdYxBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738981768; c=relaxed/simple;
	bh=NlE0c/goklhyrex43zcGsD7PFk87+S6VxljxOhxhH98=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=Ltv8fK1bN1ZcWf3/jv/h6ZWWmdagCzU/p9wYYHHXGUv5Wr818vWXq4mjeIQXwdDLgn23fe1OdzT99KT0wglMdEmplNMNJEBbfebDbw2h6ZZYfE4dmVcshkbDD3tiFHRyiXCjDf1550k75bbWQ04RwBdvPGtctVNFQPbiA3fxXNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gZwS2XMl; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gZwS2XMl"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5182Hn86001311;
	Sat, 8 Feb 2025 02:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ail4CJ
	U3TJFbpAwgmrAR4hkQyy247w6qY6sp7QwAy4I=; b=gZwS2XMlLlbjhNBWSFMSlC
	vvqAoLam1WpPRS3jrTc0ifn/AsqgUFrt4HnHyDPEK8kZ33pC4y0WaOZkS344rctk
	23sKv4VOwd0LNUVBkRV8gcsRemGstN2wLQa7DWSB1C0nijD4fy08RB5su5GhUnHw
	szArfHcwwPyhZ5R05JuW/XOMmjLf3EztDpVEkzAVe8QAqwepB1DAKsYj9Bae1Sdu
	yd6oV3cOY12vHb/IZS8g1pa9jHF/z4GECa5YPpR5HqF3wq/PD1btkhxT4KktWzu5
	cpRRyS9uzf/vhDwGrQ7roCBx8rmzRF9kIJpeMpFRvs3DX4uobx/O4pHSK0CXAtIQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44nc08nfqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:29:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5180N9Dk024493;
	Sat, 8 Feb 2025 02:29:19 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxnpema-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 02:29:19 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5182TGFn29819554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 02:29:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D348558059;
	Sat,  8 Feb 2025 02:29:16 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D55B58043;
	Sat,  8 Feb 2025 02:29:13 +0000 (GMT)
Received: from li-34d1fccc-27cd-11b2-a85c-c167793e56f7.ibm.com (unknown [9.171.30.135])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Feb 2025 02:29:13 +0000 (GMT)
Message-ID: <019d7c10173cd0db81f497e3cfa39491fa8cd2ee.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/time: Export boot_tb and log initial
 timebase at boot
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Kajol Jain
	 <kjain@linux.ibm.com>, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, disgoel@linux.ibm.com, hbathini@linux.ibm.com,
        adubey@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Date: Sat, 08 Feb 2025 07:59:11 +0530
In-Reply-To: <1394492b-0e18-4b47-b5d7-3b8744eeb897@csgroup.eu>
References: <20250204063948.643852-1-kjain@linux.ibm.com>
	 <1394492b-0e18-4b47-b5d7-3b8744eeb897@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-26.el8_10) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0GFRnCRQS8ROGc6YHVNwdc9GGS7Btt9w
X-Proofpoint-GUID: 0GFRnCRQS8ROGc6YHVNwdc9GGS7Btt9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080017

On Tue, 2025-02-04 at 11:28 +0100, Christophe Leroy wrote:

Hi Christophe,

> 
> Le 04/02/2025 à 07:39, Kajol Jain a écrit :
> > From: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > 
> > - Export `boot_tb` for external use, this is useful in perf vpa-dtl
> >    interface, where `boot_tb` can be used to convert raw timebase
> >    values to it's relative boot timestamp.
> 
> A modification of boot_tb can be catastrophic. I would not export it as 
> is as it doesn't need to be modified, would be better to provide it 
> through an accessor, for instance a function called get_boot_tb()
> 
> By the way, it is only modified by time_init() which is an __init 
> function, so boot_tb should be marked __ro_after_init instead of 
> __read_mostly, then in that case it would be more acceptable to export it.


Thanks for the review and suggestions. Yes `boot_tb` is just initialized once
and is never updated again, I’ll update the patch to mark it __ro_after_init.
I’ll also use an accessor function (get_boot_tb()) instead of exporting it,
as it will be clean and maintainable.

Will send a v3 with the updates.

Regards,
Aboorva

> 
> > - Log the initial timebase at `time_init` as it is a useful
> >    information which can be referred to as needed.
> > 
> > Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/time.h | 1 +
> >   arch/powerpc/kernel/time.c      | 4 +++-
> >   2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> > index 9bdd8080299b..b6fc5df01d53 100644
> > --- a/arch/powerpc/include/asm/time.h
> > +++ b/arch/powerpc/include/asm/time.h
> > @@ -23,6 +23,7 @@ extern u64 decrementer_max;
> >   extern unsigned long tb_ticks_per_jiffy;
> >   extern unsigned long tb_ticks_per_usec;
> >   extern unsigned long tb_ticks_per_sec;
> > +extern u64 boot_tb;
> >   extern struct clock_event_device decrementer_clockevent;
> >   extern u64 decrementer_max;
> >   
> > diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> > index 0727332ad86f..6e8548f0e48f 100644
> > --- a/arch/powerpc/kernel/time.c
> > +++ b/arch/powerpc/kernel/time.c
> > @@ -137,7 +137,8 @@ EXPORT_SYMBOL_GPL(rtc_lock);
> >   
> >   static u64 tb_to_ns_scale __read_mostly;
> >   static unsigned tb_to_ns_shift __read_mostly;
> > -static u64 boot_tb __read_mostly;
> > +u64 boot_tb __read_mostly;
> > +EXPORT_SYMBOL_GPL(boot_tb);
> >   
> >   extern struct timezone sys_tz;
> >   static long timezone_offset;
> > @@ -943,6 +944,7 @@ void __init time_init(void)
> >   	tb_to_ns_shift = shift;
> >   	/* Save the current timebase to pretty up CONFIG_PRINTK_TIME */
> >   	boot_tb = get_tb();
> > +	pr_debug("%s: timebase at boot: %llu\n", __func__, (unsigned long long)boot_tb);
> >   
> >   	/* If platform provided a timezone (pmac), we correct the time */
> >   	if (timezone_offset) {

