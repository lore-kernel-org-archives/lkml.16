Received: from out0-198.mail.aliyun.com (out0-198.mail.aliyun.com [140.205.0.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23341876
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743392800; cv=none; b=dbHYnqcvNdf3NyDZ4EDDtmiqfu9GrJ1Sq+QfyARgZKJmPSuXhk2OtvlY9Fmy77qqPoHrjNpvGBOOgoNvwByrrB+FC3a5SybpCb4xghgFAOIQOiefJoXIXaODGMP0tHqHaGKOdUr2iUE9mighXg7n4IVPQcwJD44EkDcBeLUWEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743392800; c=relaxed/simple;
	bh=TzBB0l6N4FbAR6mm5grZhlimbJljRz6duBfTSBBP3w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9t7G3hT+Ddbh25NvRNEwK84z5RfT2HJnWrTiZsqyFrFf46zGoV4HeSB9cEHW0wqhk5BupEuQE8vt/jOtluymK2nDEO8n6NqjrTiK6U5gp+ERJh/ktfmA37fZEzZZia2cArUnwuKkl8kDenCMplqQFEPrREa+mfPXxAH+I3AQ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=s3JaeCwj; arc=none smtp.client-ip=140.205.0.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="s3JaeCwj"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1743392787; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=FOECTYiRadUvXQOkdUdg2dMUu/42oly6B7QwQ5w5GPk=;
	b=s3JaeCwjopKb9NEDQ+T3RLCs31U9/UG1IbK5ZG3EQuxnB0rg5iNI4oHR709Dj53YLRw0YrjON9P7yq/AZ/YEhml3JBkkc+79+6HbVDPXdSvp1x8e1ix1mkVWal2Vmjec3pbw4RGveDy3ALbCSQq0zmJkdFPHvPGpHJHFEw1Wg2o=
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.c8Zkjm._1743392786 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 11:46:27 +0800
Date: Mon, 31 Mar 2025 11:46:26 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/3] x86/mm: Correct the actual count of available global
 ASIDs
Message-ID: <20250331034626.GA88569@k08j02272.eu95sqa>
References: <cover.1743250122.git.houwenlong.hwl@antgroup.com>
 <0954cb7ec766d6d1e0b66a93876762b516ae9bae.1743250122.git.houwenlong.hwl@antgroup.com>
 <a84047c77c1a5f16b0d25f0cee6fe86487d14a5b.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a84047c77c1a5f16b0d25f0cee6fe86487d14a5b.camel@surriel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Sun, Mar 30, 2025 at 01:29:25AM +0800, Rik van Riel wrote:
> On Sat, 2025-03-29 at 21:05 +0800, Hou Wenlong wrote:
> > 
> > +++ b/arch/x86/mm/tlb.c
> > @@ -279,7 +279,7 @@ static DEFINE_RAW_SPINLOCK(global_asid_lock);
> >  static u16 last_global_asid = MAX_ASID_AVAILABLE;
> >  static DECLARE_BITMAP(global_asid_used, MAX_ASID_AVAILABLE);
> >  static DECLARE_BITMAP(global_asid_freed, MAX_ASID_AVAILABLE);
> > -static int global_asid_available = MAX_ASID_AVAILABLE -
> > TLB_NR_DYN_ASIDS - 1;
> > +static int global_asid_available = MAX_ASID_AVAILABLE -
> > TLB_NR_DYN_ASIDS;
> 
> Unfortunately we are limited by the PCID space.
> 
> A process with ASID N will get PCID N+1.
> 
> The PCID space has the same size (and maximum value)
> as the ASID space.
> 
> That means we cannot use the top ASID value.
>
Thank you for your quick reply!

Since the size of the bitmap is 'MAX_ASID_AVAILABLE', the maximum ASID
value that can be allocated from the bitmap is 'MAX_ASID_AVAILABLE-1'.
This matches the comments stating that the valid ASID range for global
ASID allocation is [TLB_NR_DYN_ASIDS, MAX_ASID_AVAILABLE-1]. It is a
close interval so the size should be '(MAX_ASID_AVAILABLE-1)-TLB_NR_DYN_ASIDS+1',
regardless of the value of 'MAX_ASID_AVAILABLE'. Moreover, 'MAX_ASID_AVAILABLE'
has already taken the reserved PCID 0 into account; 'MAX_ASID_AVAILABLE-1' is a
valid ASID, and the associated PCID 'MAX_ASID_AVAILABLE' is also a valid PCID.
Did I miss something?

> Alternatively, I suppose we could have ASID and PCID
> line up, and always exclude ASID 0 from being used.
> 
> That might (maybe) be prettier code, but it isn't what
> we have today.
>
Yes, I agree. Excluding ASID 0 and using PCID as ASID makes the code
clearer in global ASID allocation.

> 
> -- 
> All Rights Reversed.
