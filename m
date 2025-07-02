Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1223196A6;
	Wed,  2 Jul 2025 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470952; cv=none; b=V6LH5T9tODS54xDLMfHesKUJP1dScXshaN5OD1ThF0XfQEWP0fyxI3LSCZAu88o1z8A4OSPWfbOekK4fw/La9m07lSktoYXeQfw7DXI6cKHlIvqQDm1GcECtcPfnE4c3tbwARv6ZpymL/L+D4ZzzF0DpHfvhNDJBzXhvCOnIltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470952; c=relaxed/simple;
	bh=DIVtpJyOyPpBV3jsXPfHwDTWXm0sMJUqHpkKsOz9tG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmRxK4NGL2+7LkHRi7kvEEYL754G4L7+kMhh46J2FFR4d5cc5XCN+IIXB6NxsDmmIr7ypqCPTrhz3RBT9CryztF6NQIAkR8ZxACRttYB70lNxXBPbDyH38mT2IQnws6hgzTrupRsN+nB0ebCwdTqE1tOU8qr77+QDyZJfNwkqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=N3UDuJzV; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="N3UDuJzV"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562BhBna013840;
	Wed, 2 Jul 2025 15:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=LT8MrQoDOTRKxigqpBeaX5AfIjpnL3
	pPdUjdYwwpxTw=; b=N3UDuJzV2qkIS42HLcCqDn3glH1w2AhmblCjov0Wi6K8mV
	tNi6gGvUYy6dH+zzYsD6BweiJQGnv0HLa6cPdoX8JkJDbRMZoHhzN0RYPUu0uh08
	oLfCK3b3SsvLvO9VLOKJu/4RnYa65SiHUyFGQZXA/ziYvHeJOtrA+2M39F9mShXo
	VFYpeWcsQdFKmd6GB1DR1XNAIgiIj1dZkBpCcl21+hfIvg212EGHTSrriIRSFN3w
	Or6Tz+jE5tXEMXIgqixhf2db1D7OjQviW/xYYN7Ti3gfr1xMc9O4zw4U7iVunknf
	thQtW2quHtBwV/vBtLQOt9dS3iTC9Z4XBTEbmmqg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j5ttege4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:41:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 562FFgwB021430;
	Wed, 2 Jul 2025 15:41:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47jwe3fy7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 15:41:41 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 562Ffe4M52887876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Jul 2025 15:41:40 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFD322004B;
	Wed,  2 Jul 2025 15:41:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4794B20049;
	Wed,  2 Jul 2025 15:41:39 +0000 (GMT)
Received: from osiris (unknown [9.111.76.138])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Jul 2025 15:41:39 +0000 (GMT)
Date: Wed, 2 Jul 2025 17:41:37 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>,
        kernel test robot <lkp@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702154137.71390C24-hca@linux.ibm.com>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
 <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rzSZKD88pI7zC4H-vnOX33ke_WMYIpVe
X-Authority-Analysis: v=2.4 cv=UtNjN/wB c=1 sm=1 tr=0 ts=68655336 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=jomxwG4-OkzSqjtvfHYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: rzSZKD88pI7zC4H-vnOX33ke_WMYIpVe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEyNSBTYWx0ZWRfX78GKUy/4hMnC U0FXTyxWpUMTuXgvmlS7ia/tk7Kj+kzzCrQlNONEth9qK2MuFXZMIbQu5/pDbO5/Ev5KvhhYVyM /L3HJ/N3LbuGMsdF1zInPJ4aYZYw05kunuUQMUtkw/5eK2LtvMbagKgJnu1Lw5pld401HLRxoC0
 WiFY2XG7zXENdD2gtAzd7xOkgbNFkrICd4ZpZ8e707X5kbgYs70DTq8aQtmGrFXoRwtk8jKXgKC vZYf2W5JsOoYb3FJyfo304BtjCyi+yjqWlmXuwJfHzJXFhNLLi7Zp0QpgAQZbUZSmgpmhhMezFT f0AhrLM4Xo1pIWRkcMM8mbdsH7TAgDVoWe7mNd3cnjsNizVe6JiWeSRlH2jq2N8s0bWmMZ2Fjj7
 tj3MukNpkSbhGait4ZsGxbKySnQ+m7zpqMopD3sbBf8OQ4wpSnxd/SbYm25biyUfA2ooRYx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020125

On Wed, Jul 02, 2025 at 05:07:39PM +0200, Peter Zijlstra wrote:
> > > > diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> > > > index a185855ab158..46d9eb64bd18 100644
> > > > --- a/arch/s390/include/asm/bug.h
> > > > +++ b/arch/s390/include/asm/bug.h
> > > > @@ -9,7 +9,7 @@
> > > >  #else
> > > >  #define __BUGVERBOSE_LOCATION(file, line)			\
> > > >  		.pushsection .rodata.str, "aMS", @progbits, 1;	\
> > > > -	10002:	.string file;					\
> > > > +	10002:	.ascii file;					\
> > > >  		.popsection;					\
> > > >  								\
> > > >  		.long 10002b - .;				\
> > > > 
> > > 
> > > IIUC this also needs a trailing "\0" as per the link above, or this
> > > won't get a NUL-terminator (but will build just fine).
> > 
> > Yup, I ran into this before. Let me go fix that commit.
> 
>  + e7e26cfad96c...2a20b2730147 core/bugs -> core/bugs (forced update)

Thank you! But wouldn't you also need to merge Nathan's patch [1] into
the loongarch commit (or maybe you are just about to do that)?

[1] https://lore.kernel.org/all/20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=core/bugs&id=5d476f66e6add0b709a09d60feecff3a2d156800
