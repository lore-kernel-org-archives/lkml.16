Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB21F3B8A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744670686; cv=none; b=OE3FWRVi8mMCZ8D06t99vbv6tVziQs82fYhka5u4YoAYmUuOSgai1ddNInSPSsDTDCWpndsfcjO9qxf0ZsaB7jVoicmoKbIstiR+DKBQ0bD79RjITWHWkZWwrFyTGqV9A2JKMLSHNHpkj7tBvkWm0pUcBswTMBDBWhDv7CoEjd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744670686; c=relaxed/simple;
	bh=56qB/2wKyC11dSrRzs+c96QpcbMQPqfpOrXHX7qikkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhLFO75iKQAaFn1z5scaHYsSbtbzuF5wJogP6PnE+556/hRnAnIHeduOyZWLLvQ6NeBOdYQ54S7ggJacUqTfZLe214LuCUmnzTfPrvTnl5wE1pb185iAO5F94ydzjicffWJRVY56fHPnWiLUxWO5QPCqTOXTvrY+cJiOCBRyMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=37MtPe2+; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="37MtPe2+"
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 53EFjn3t019360;
	Mon, 14 Apr 2025 22:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM202306; bh=D/cPLBpNaY7IG7s+uxYBLEg
	AEukvVZ/Jx8w1LcX6TNY=; b=37MtPe2+ewGYz44vyX13gc57Ay5RFeM2siTG2Oz
	F2Hvw0Gfjeq8J3ufftdGtpkdI0rRVDHcDtej8L25TtUqxX0WGd+1h+soQqpzWk7E
	4Uf8CJ7+3TLVYtdJM5JThfDxEj79+CDg7KYxkYfOVuomYq4LcKP8FZL736i7xfua
	AuyK2Zflm9vXippfTyTxJewid7eqwg2GT87POBS0S10Hyu+SSxacsTdNs2A16uBP
	IBvA4m3FP+3a3J/65oTwVN4OedwlI2CmPJhxGGNwRBe7TIZME4i1XDNFylbvZuiD
	cLivrO9O1RoPm7cP0k6XPx/sD20tu2TxTCldCy4wMcqbj0Q==
Received: from iadlppfpol2.lenovo.com ([104.232.228.81])
	by m0355090.ppops.net (PPS) with ESMTPS id 4603gukden-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 22:43:24 +0000 (GMT)
Received: from ilclmmrp02.lenovo.com (unknown [100.65.83.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by iadlppfpol2.lenovo.com (Postfix) with ESMTPS id 4Zc2Pb3CLkzYkjct;
	Mon, 14 Apr 2025 22:43:15 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp02.lenovo.com (Postfix) with ESMTPSA id 4Zc2Pm0bBkz3p6l2;
	Mon, 14 Apr 2025 22:43:24 +0000 (UTC)
Date: Mon, 14 Apr 2025 17:43:20 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
        Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Pierre Langlois <pierre.langlois@arm.com>,
        Quentin Perret <qperret@google.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        x86@kernel.org
Subject: Re: [RFC PATCH v3 00/15] pkeys-based page table hardening
Message-ID: <fv3ijx6vcha2hfn5m2py4h73ympmgbur6wruwoej5pbz2lhjfc@t5j7gfa5j674>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <a32cjyekuecoowzbitc2xykilvpu6l3jjtityp7x5hw7xbiysp@5l2lptwmqiug>
 <802963a0-32bd-49e8-82b1-34443acdd5ae@arm.com>
 <epnxrdkidbrjyjzapms7dfsvjcc7ewewjue7khbuxhresy5x5n@hyhokacdi2yg>
 <bcaa98c0-4218-470d-981d-9ab0894d3b1b@arm.com>
 <rzmxyxnufxrti7nxw3i25dil4bcqjzwqty4alwikm7bgbpjbju@dx5leafgss5l>
 <107650bf-a8c1-4a71-a302-2e80abd5d062@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <107650bf-a8c1-4a71-a302-2e80abd5d062@arm.com>
X-Proofpoint-ORIG-GUID: u5D-UadS7v89dy-zw2UEWuH7V_j9ffAh
X-Proofpoint-GUID: u5D-UadS7v89dy-zw2UEWuH7V_j9ffAh
X-Authority-Analysis: v=2.4 cv=EvPSrTcA c=1 sm=1 tr=0 ts=67fd8f8c cx=c_pps a=Bzw+04pMMuzJwu0RtP1G/Q==:117 a=Bzw+04pMMuzJwu0RtP1G/Q==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Pj3cbH4x630mQXpL76YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140163

On Fri, Apr 04, 2025 at 09:57:02AM +0200, Kevin Brodsky wrote:
> On 28/03/2025 17:15, Maxwell Bland wrote:
> Overall this seems worth investigating. I wonder, have you considered
> how accessors would find the shadow memory? It could of course be linked
> directly from task_struct, but then nothing prevents that pointer from
> being corrupted. I can't think of another cheap way to link $p$ though.
> This is not a full-blown shadow memory approach, so I'm not sure we can
> reserve a whole chunk of the address space for that purpose.

Hi, apologies for the delay again, I had much fire to put out last week.

I saw you posted a V4 for this, so I'll close out this chain.

W.r.t. the above, it may be possible to segment the RB tree in vmalloc.c
and designate an allocation region for this purpose. I did something
similar to enforce PXNTable-across-vmalloc a year or so ago which ended
up successful on a production device.

I plan to experiment a bit with different approaches and will probably
send the code to the mailing list once/if I get something together (also
if it isn't pre-empted by someone smarter and faster doing something
better).  (-:

> Indeed. For experimenting a Coccinelle script to convert direct access
> to certain members to a function call is probably easier :)

This does keep it in-kernel, which is nice, and I will keep this in mind
as I write.

Thank you for the discussion and patch, as well as the newest one!

- Maxwell Bland
