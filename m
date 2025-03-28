Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DBC29A0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743214398; cv=none; b=gMAtjXqT3y9LH93hk7oVW3gGpe425lh/teVUtspCS0tNbeQnnniGxtlPQdl3PklWkCuB6JSs0pReviYDreDQrfOqZLwRHH4iFZUpHThdL9lO/gNj32ZuMSNSVoncsLASZwAP2kwO8RzPdHV9Y5HQA7Nc731JUJmg4UNZP64Y8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743214398; c=relaxed/simple;
	bh=T1X/gRub91tlDYfh552R1xXxVhzPhv5YrixEiwQxZlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c37T58bhIbM5bSDrYaNEuE4bHZx3lcRGoL3xOs/8oLQSEMrZo4RKtR24Z6bjxkym7/ijuXGLhJRC+SQdHU2G+3mitrDG247CEw3624x3biIax0Vu9kue4SFhr2h8nBbYMPqD7SCtTaRMeSQOjjnARsO2GJzpqxiNtgP5OpgQuyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com; spf=pass smtp.mailfrom=motorola.com; dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b=0WvXQAiW; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motorola.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorola.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorola.com header.i=@motorola.com header.b="0WvXQAiW"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SFbYxM017688;
	Fri, 28 Mar 2025 16:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM202306; bh=9j4odLxnceh7apcVAiP4Wd/
	cq+w+zx2Ev6TwhMMzuE0=; b=0WvXQAiW/76kFpea8kQSCe9+Lw1CeFh0JP5Xa74
	ZR8N/QsQpWkla++PYdW2ATRqe1SNflQDepOxM/P+EmxL0/AlKySeUKUWv++64+Ob
	IbhBS+TB6SZFsfOsGz8UKXmO+MGr6lFfFAf437d3LlBi9TvhruWj/BM94pox/CeN
	eQsWaLHVj5S9TB10RNh7N3YIYGpqc7N58kEDQjeaXIQwFhiq9yLop+0diKm/TcCZ
	taaf6d62STxe7SK1gBUKoh/A2CxuUJ+iqNxHHE72pNqXVe20mEpLFz/1IKzymIAT
	IwqGzMAYDWnYWPGzVFgHhM8IVi2HEfsBOMXa5R//PmODqZg==
Received: from va32lpfpp02.lenovo.com ([104.232.228.22])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 45nrfq1cj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 16:15:49 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (unknown [10.62.177.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by va32lpfpp02.lenovo.com (Postfix) with ESMTPS id 4ZPQcN5k1nzxd6r9;
	Fri, 28 Mar 2025 16:15:48 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4ZPQcN1WR7z2VZ18;
	Fri, 28 Mar 2025 16:15:48 +0000 (UTC)
Date: Fri, 28 Mar 2025 11:15:44 -0500
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
Message-ID: <rzmxyxnufxrti7nxw3i25dil4bcqjzwqty4alwikm7bgbpjbju@dx5leafgss5l>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <a32cjyekuecoowzbitc2xykilvpu6l3jjtityp7x5hw7xbiysp@5l2lptwmqiug>
 <802963a0-32bd-49e8-82b1-34443acdd5ae@arm.com>
 <epnxrdkidbrjyjzapms7dfsvjcc7ewewjue7khbuxhresy5x5n@hyhokacdi2yg>
 <bcaa98c0-4218-470d-981d-9ab0894d3b1b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcaa98c0-4218-470d-981d-9ab0894d3b1b@arm.com>
X-Proofpoint-GUID: By7ecez9b07SC0eYU3xi0wyy38YFY6RM
X-Proofpoint-ORIG-GUID: By7ecez9b07SC0eYU3xi0wyy38YFY6RM
X-Authority-Analysis: v=2.4 cv=IoAecK/g c=1 sm=1 tr=0 ts=67e6cb35 cx=c_pps a=7qI18unSaIz3cJfMvNS4Ww==:117 a=7qI18unSaIz3cJfMvNS4Ww==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=ohFQ4D2nnO60rt9TArUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280112

On Tue, Mar 25, 2025 at 06:11:24PM +0100, Kevin Brodsky wrote:
> >>> Where overwriting f_op is a "classic" bypass of protection systems like
> >>> this one.
> >> Indeed, this has been pointed out to me on a few occasions. On that note
> >> I should reference the follow-up series that aims at protecting struct
> >> cred [1].
> >>
> >> Using kpkeys to ensure that the task->cred pointer itself is mostly
> >> read-only is not straightforward, because there is just too much
> >> existing code that directly writes to other fields in task_struct -
> >> meaning we can't simply make the whole task_struct mostly read-only.
> >> What could be done is to split out the cred fields in a separate
> >> kpkeys-protected page, and link that page from task_struct. There is a
> >> clear overhead associated with this approach though, and maybe more
> >> importantly we have just displaced the issue as the pointer to that
> >> protected page remains writeable... I'm not sure how much a page-based
> >> technique like pkeys can help here.
> > __randomize_layout accomplished some of what is necessary here, while
> > accommodating contemporary hardware limitations, albeit to a finer
> > granularity and lesser degree. I am also not sure how well it works on
> > production systems (yet! It is on my TODO list in the short term), or
> > how much protection it really implies for an adversary with a "read
> > gadget" that can determine where to write (either from associated asm or
> > from the struct itself).
> >
> > But...
> >
> > (1) After thinking about this for a few hours, __randomize_layout implies
> > something valuable: under circumstances where this is supported, because
> > we assume the struct's layout itself is modifable, it becomes possible
> > to introduce a canary value _not_ for the modifiable portions, but just
> > for the non-modifiable portions, store this canary value in a strictly
> > read-only region of memory that also tracks pointers to the structure,
> > and ensure uses of the non-modifiable fields must always leverage the
> > canary value stored in this secondary region.
> 
> I don't think this can be enforced with pkeys, since the overall struct
> would have to remain RW. But I'm not sure I completely understand how
> that scheme would work overall, or how __randomize_layout is a
> prerequisite for it.

Hi, so __randomize_layout is interesting only in that it demonstrates we
can modify the layout (and therefore associated code accessing fields)
for a given datastructure.

When I wrote the previous email, I thought maybe we'd be able to use it
to do more, but not so much any more.

However, the "real" idea here is:

(1) "splitting up" each RW data structure ($X$) into mutable and non-mutable
parts would be difficult and difficult to maintain, so I was looking for
a solution outside of that.
(2) The primitive we do have, thanks to POE and this patch, is
the ability to make a page of memory writable only from a specific
context, and read only otherwise.
(3) The well-trodden solution is to allocate a field on a second,
independent page $p$ when allocating $X$, with some field/hash/magic to
guarantee the integrity of writes to the immutable fields of $X$
(sometimes called shadow memory).

Valid, CFI-guaranteed functions would have access to $p$, and would
be instrumented to update $p$ with a new hash of the fields of $X$
when updating $X$, but likely something more performance-friendly.
When readig from $X$, the data is pulled from $p$ to ensure the
field being read from $X$ is valid and has not been modified. It is
not possible to modify $p$ outside of the valid contexts in which
we can modify the read-mostly or constant fields of $X$.

Importantly, this does not rely on the confidentiality of $p$, which I
think was an issue with trying an approach like this with ARM MTE
previously, or at least the version of ARM MTE that Juhee Kim et al. at
Georgia Tech broke with speculative exectuion, iirc.

I think performance is difficult here, but that's more of a development
concern, I hope, than a concern in theory.

> 
> > [...]
> >
> > It may be possible to write a plugin modification to
> >
> > https://github.com/gcc-mirror/gcc/blob/12b2c414b6d0e0d1b3d328b58d654c19c30bee8c/gcc/config/arm/aarch-bti-insert.cc
> >
> > To also inject the POE/register set instructions conditioned upon the an
> > expected privilege (kpkeys) level of the executing function.
> >
> > Instead of adding code to set the privilege state via a specialized
> > callgate function, having this function's call explicitly tied into the
> > GCC CFI instrumentation pass. Determination of the specific "key level",
> > i.e. KPKEYS_LVL_PGTABLES, could likely be determined by the file
> > name/path via the compiler, or many other clever mechanisms, potentially
> > with support for exceptions via function attribute tags.
> 
> Right I'm with you now. This is actually something we considered, but
> I'm not sure it really helps all that much. Adding a guard object to a
> function is basically the same amount of churn as marking that function
> with an attribute, except it doesn't require compiler support. It would
> get more useful if you wanted all functions in a file to switch kpkeys
> level (using a compiler flag), but for the purpose of making certain
> data mostly read-only, I doubt you actually want that - the granularity
> is just too coarse.
> 
> A different angle would be use an attribute to mark struct members,
> rather than functions. That would instruct the compiler to switch kpkeys
> level whenever that member is written (and only then). You would
> probably want to forbid taking the address of the member too, as the
> compiler can't easily track that. That said this doesn't solve the
> bigger issue of existing code expecting to be able to write to other
> members in the struct. It most likely works only if the kpkeys switch is
> done when writing to any member of the struct (which may get very
> expensive).

We agree. Doing something like this doesn't crash stuff, but it makes
the phone sluggish and terrible to use. (-: Hence, I may try the above:
keep the struct read-write, but when reading from "critical fields"
(pointers to function pointers), require the compiler to inject a check
for an integrity value stored on a mostly-read-only page. That integrity
value can only be updated by code that is resonsible for writing said
critical fields.

Since the supposition is things like f_ops don't really need to change
much ($p$ does not need to be accessed much), and otherwise the data
structure is fully writable, the performance impact seems like it would
not be significant.

That said, and if I am not mistaken, the downside is it'd require
Clang/GCC support, same as CFI.

> 
> > [...]
> > Noticed as well, just now, the reliance on the static_key for branch
> > unlikely ... the following data structure (at the end of this email) may
> > be of interest as an FYI ... it can be used to track whether the kernel
> > self patching API is only being used to patch expected locations.
> >
> > I use this right now with additional checks that the instruction being
> > written for the indirect branch matches the expected offset.
> 
> Are there exploits out there corrupting the address of a static branch?
> This seems difficult to me in practice because the __jump_table section
> where the addresses of instructions to be patched are stored is marked
> __ro_after_init.

There are a couple of different ways. You can do the attack this patch
is intended to prevent, change the page tables unwillingly to give
yourself permissions to write to the static key struct as part of a
larger chain, there's the ability to inject code into a kernel
module to call the patch text API and use it as a write gadget for the
rest of the kernel, etc..

There were a lot of claims back in the day that kernel code would be
marked strictly read-only by the EL2 secure monitor or kernel proection
systems, but there's self-modifying code built right into it under many
KConfigs. To have a guarantee of CFI you kind of have to ensure the
kernel can't patch itself.

Maxwell
