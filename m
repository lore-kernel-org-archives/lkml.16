Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A960A20469A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523227; cv=none; b=qzDnTMFjyXG43lLYI0y/MN/9VMdvyZJXdfYRw5hyevQOoO2J5K3/wr9sR19pMq++GF3YiMawE0J462Bm140OEbgU0JVdjmoc4Xe8y6muoXp7wEEzFGSI9lYp42swNbPdCMiNjHAGR0cwHX8GbpZe0N16LUm0vtk+6/mBZyAapLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523227; c=relaxed/simple;
	bh=QqEUdEqyZaXoYp93bkORWrF73OCbCV+oWE3RpPznNDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwgwAXQfNM/rAmz5XImMBhE70is3+tQPM/XR/TSfv7c5VINCoZ0TJ+sl2P8KxsHkQ/sZTHGyczluPbUE4KiCsRI+4FK8rCoeGu696MAoikGfES06ty8WFXg0oYnEsWlp3beKSzQVEBKPOFmiRBoyLtLlbZeZYd0/+HUx+4GE944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LNlR9ENf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LNlR9ENf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac29af3382dso909214466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743523224; x=1744128024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GiPjzGtcKFBBJ6BxSCUQklK8yGDaLBUf6bpExJ4Ry8=;
        b=LNlR9ENfTcbIJy0HtXJp8vmCsQNi1QLCrVjPD1nG1wN+4B1atIQ8J7P8NNrTXgmXI3
         CiMHz0ebjWwU95SsNA2b9ZgMBSA0saIy/dZF+G13YSpv5DGCmg9NBNQMe5d9Hkf84E89
         zMOyt75I1nB2unvmhU+iMq10/D6hl9Ub+QuSNxL1s32S59g7uUFXp5OW2pSrLyQcPOMA
         yEKb6aAOtJRvEhUCp1ftCqcBCuZcngM6tnLR8Iarmm5QGWb67KwCr/FLS+19FwSM94Si
         KxYbWiWYq4d1ljT/H9l9mFYEsH7Xl4gnHGJ6HDaKWcc7ouOpmptt5eRuBzd7ndzoE0Zv
         hghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523224; x=1744128024;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GiPjzGtcKFBBJ6BxSCUQklK8yGDaLBUf6bpExJ4Ry8=;
        b=YlOtknkSoFdlcDAqUYSLsZLdLQsPIvMd0wtkYAFdz9xtIfEYJg0HkeMV7gnZj+Zlsg
         f5gWswRhp4+kSpilSWkqdFMAEzt/kdNFi8tLUAezhCPV2bEJX+N772CThXmMCrpmLGYH
         +27OGVBT+ss80vbdhsqt4Y2wiA4x5qnllzuaTdBALXcRwvCe45nSrPkTgUNy9dIA8DaT
         XrzeM5D3pvQIrov4gtSfzhsEE8RodLNpjG2/rResDoYMTrUw2A/+KSwxaNGrh2y/FKLq
         LzqPZd1wa+yOB6A+yUW9Ni2cGKpw2SJmmqe1Yl7ztZxPkDhmtM9pRYh0M7BW7QwcYMs+
         XLvA==
X-Forwarded-Encrypted: i=1; AJvYcCXnUZ7FzQo41UR3r/ras+zHCbnUwF+X7I2bexsw3IbNJNKwXhkVgDJovfEAacSVyLJ6TKStbQbTspS3d1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YztOt6qIcBx0cZXyk/TSbu7DFo+evrR3WPBBdsWe1ubnkJCAFWg
	vvjvFxS2Lodug2W6mJpFaqzcZuWQ0p2OUtbEk7Lhjzfy5+wQ4/RPTypqXzCo+Ps=
X-Gm-Gg: ASbGncuy+Obv9FXYaPrBCs/IWE8Xz/VgfqTqMzLk+xxNL91KrFXvsYEJ0Z3eUx7MTYr
	mHrayaFYxdi72NLC5hlYmnORT5PAUmdAWMCxPDsH6LWLof+WMtNNoScvI5LxQnuLYbNMYyr/wjZ
	a3OwMHGTF/hoDeCLGDU5+rgskt32CeULydWklMQb+MvmXIwga5CEMZyttoft6ejcGKMe97gLe9D
	o1MsDaHuPxellH59jjxDHa3Y+LVV4dTOmgVrnuSiMdhScy/LO1lkwNGlJ+90XBs1Zp3P6VWef/x
	qNiqmYZWINvenmeTYmpWRIGx55CcsQXRI/1NKNfWdmCs92NTsCy0EIx/1juL
X-Google-Smtp-Source: AGHT+IGGhiXNqRzyHtTj0NAIXIGvE9xMerOYHkQi/TV8Lg/UZ3Deb1FG5nKQNXm8mF8W2zKnsNuGYA==
X-Received: by 2002:a17:907:d89:b0:abf:75d7:72a2 with SMTP id a640c23a62f3a-ac738be70a3mr1082249266b.38.1743523223808;
        Tue, 01 Apr 2025 09:00:23 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71971bf3fsm777015766b.182.2025.04.01.09.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:00:23 -0700 (PDT)
Message-ID: <b98a0890-dbe1-42c9-a43e-2f30a06ca21c@suse.com>
Date: Tue, 1 Apr 2025 19:00:21 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] x86: Cleanup NMI handling
To: Sohil Mehta <sohil.mehta@intel.com>, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Kai Huang <kai.huang@intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Jani Nikula <jani.nikula@intel.com>, Tony Luck <tony.luck@intel.com>,
 Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28.03.25 г. 1:46 ч., Sohil Mehta wrote:
> While reworking the NMI-source patches[1], I spent quite a few days
> understanding the existing NMI handling code. The intention of this series is
> to fix the inconsistencies and redundancies that I encountered.
> 
> This series also includes improved documentation to make the code easier to
> follow. It does not introduce any significant functional changes.
> 
> I have tried to split the patches logically to make them easier to review. Let
> me know if some of them should be combined. The patches are in no particular
> order and can be picked up independently.
> 
> The documentation updates in patches (5, 6, 7) are to the best of my ability.
> However, I would really appreciate extra eyes to ensure it is precise.
> 
> The updated NMI-source patches will follow this series sometime later.
> 
> @Ingo, I tried to format the commit references the way you prefer:
> 
>    Commit:
>      feeaf5512947 ("x86: Move sysctls into arch/x86")
> 
> However, checkpatch seems to dislike it, so I reformatted them as below:
> 
>    Commit feeaf5512947 ("x86: Move sysctls into arch/x86")
> 
> Is there a specific guideline for x86?
> 
> [1]: https://lore.kernel.org/lkml/20240709143906.1040477-1-jacob.jun.pan@linux.intel.com/
> 
> Sohil Mehta (9):
>    x86/nmi: Simplify unknown NMI panic handling
>    x86/nmi: Consolidate NMI panic variables
>    x86/nmi: Use a macro to initialize NMI descriptors
>    x86/nmi: Remove export of local_touch_nmi()
>    x86/nmi: Fix comment in unknown NMI handling
>    x86/nmi: Improve and relocate NMI handler comments
>    x86/nmi: Improve NMI header documentation
>    x86/nmi: Clean up NMI selftest
>    x86/nmi: Improve NMI duration console print
> 
>   arch/x86/include/asm/nmi.h      | 49 +++++++++++++++++--
>   arch/x86/include/asm/x86_init.h |  1 +
>   arch/x86/kernel/dumpstack.c     |  2 -
>   arch/x86/kernel/nmi.c           | 87 ++++++++++++++++-----------------
>   arch/x86/kernel/nmi_selftest.c  | 52 ++++++--------------
>   arch/x86/kernel/setup.c         | 37 ++++++--------
>   include/linux/panic.h           |  2 -
>   7 files changed, 122 insertions(+), 108 deletions(-)
> 

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

