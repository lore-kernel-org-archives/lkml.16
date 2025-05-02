Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF7746E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199948; cv=none; b=tm9Ed5qM7J3kHVC7tE1NoNkqNMCap488yxzsdXqsHTxoHyyDteNkRNmwAmBYZOBJZ+1nnqQqInhV2O/j03PKLF85ftDSMiTczyr+IXSs0JHDeOwgDOsf59i11CE/qGMlC0zSuK1BS0IIETFV0loGOGo7bLwy+2PcCEUZ/3W8jUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199948; c=relaxed/simple;
	bh=1QD4I3mCyYaNaMIMuS+9whhJ/gokYI1bJfEzqcT0mDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihiGCq7lUBvnDLdnUJDFwyqIJYtgMiF8kxStB43PI4bUS2/T/BtBx5f4zKOOaCpm12f9iSwjHpI3roFpd81dwK4wiDo0lvvQhrPozX0S3hcgjE3+cmtgswkfbaVxAVOBgCGWnjkKId1xODFMTw4q+BxUQ/l9UHbBVNwwv9/CGXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUq5I7lL; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUq5I7lL"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22928d629faso22380475ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746199946; x=1746804746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qtTrDZaLM1OTi3c+ufQv0ByyqNVp2EOBeBrlFHkBdSM=;
        b=fUq5I7lL/B/TO++UyopK9dnSk+J/6+BZVQ6Z+/dY77bl4jthXBRJLI3/EqQ3nVn5tP
         UKTs/NHrYhMEPCB7WFnIPFuYpxOME4jHNBa+dRHr6rkkpMBQ7ztdb54i6puHuXPK+j9z
         Wg8M/xse2iWP82t5YZUGCLhN3iPD74/aRhDjqbRPU+oX/n3aAZkSBli+x+lZ5xPeD1SN
         TYeMAhVJ89G78m5/ZGZ7Ce4WcZOwq0V2UTuAqFeZuU0/hYUpVIfg0R1MG16ut3G4bI4m
         ZTZRpAF3xQFmF+fvZgFHnZ9lHbNlL5rgMSxU2j32FO5d/42BwpbQ9ofG8E9gSNTLbZO1
         Fs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199946; x=1746804746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtTrDZaLM1OTi3c+ufQv0ByyqNVp2EOBeBrlFHkBdSM=;
        b=nhCeDJW+L6F+xSUVK2GQAlE0CSWZrRMRD/mmFveLhPWEMb/iqLjPX8IYp4gk6R3/9v
         hNhZKq/fdUvghHkzCSABl2B5Hxtz3LKpPONcULgGYYg88DPN0teuTHUQcxxIqzKSOV8U
         fpFnPJZScW9QON898syvHCZ+G0PHg9jxGULQ4iJeXVagtjvvFgJ3HthwWDp+3P/kUs4P
         fPhzomFoQ8GZDO0RpGdvj3blfS5WUaxtDwI1jMnGvhQhcw2mfgVpaiRE38Gm2qTEhjKa
         Y2Y4tVso3sRquCLftRDmnWa0sIdw6p6KAeMwRZMpTvTjCWQXf8pee/b3ndeSDIQKzgJC
         ahwg==
X-Forwarded-Encrypted: i=1; AJvYcCVMb+mFZi//MOh13uaolrYwVYSi/rarB/FWEZyXIDEP7ZyyqHtSk3b04RheGzfqhmuu6ZwU6Ak3GIW1lf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxACjHiuBfKct4YAceSGbt+1GKxigJQftBR9viWX6pqyNSK/T3s
	6Iq2FBdpXu73FpIBpZs/GurSM7YrFG493tgBr7muxRT3UNUIlp7W
X-Gm-Gg: ASbGncu62LlrV1NNtSGYEP4IGmm6uwd3peLlubOzk6xsscbAd5Nb5ehaqDMPvMZ+8Mj
	OET4vdsJ9baRNxoKTfNiYAPo0QJg1A4LMsTS4vqKBI0tU84npDkF7xVLffQrub897svHAeTlK/j
	bxU9BLTx8ofGsAbHbp/QrSv1BmmGNmn/HkN75bZ8RhIF/ulqCmugwFstpoiOrRNOYoxyqDSAD7C
	TRZaq4ChzOz00v4lDuppe2Dy6mmdJ6TxAfN//i19UAmYyWglZ1LBiChZsU1E3XLaEeJ2lunTqVD
	1VrqR7QMob/CTPoH6juSOYyaK+U9/uKKVf8UxeRS
X-Google-Smtp-Source: AGHT+IGMQGssqJtUu8Gx793l3mU2B7KrDB/iU/KB0bbYuoa5G091ejNxqvFkfNPR2wxTOCtl6PUtkw==
X-Received: by 2002:a17:903:11d2:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-22e10342223mr46613565ad.23.1746199945979;
        Fri, 02 May 2025 08:32:25 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e9edfsm8925715ad.75.2025.05.02.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:32:25 -0700 (PDT)
Date: Fri, 2 May 2025 11:32:23 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
Message-ID: <aBTlh5RdqqyQbQFn@yury>
References: <20250427185242.221974-1-yury.norov@gmail.com>
 <2e033056-c2a0-4a91-8b4b-c5e53bdfb171@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e033056-c2a0-4a91-8b4b-c5e53bdfb171@intel.com>

On Thu, May 01, 2025 at 03:06:18PM -0700, Reinette Chatre wrote:
> Hi Yury,
> 
> On 4/27/25 11:52 AM, Yury Norov wrote:
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > 
> > cpumask library missed some flavors of cpumask_any_but(), which makes
> > users to workaround it by using less efficient cpumask_nth() functions
> > 
> > This series adds missing cpumask_any_andnot_but() and makes
> > cpumask_any_but() understanding the RESCTRL_PICK_ANY_CPU hint.
> > This simplifies cpumask_any_housekeeping() significantly.
> > 
> > v1: https://lore.kernel.org/all/20250407153856.133093-1-yury.norov@gmail.com/
> > v2:
> >  - switch cpumask_any_but() functions to signed type for CPU (Reinette);
> >  - change name for the new function to cpumask_any_andnot_but() (James);
> >  - drop O(n*log(n)) comment. cpumask_nth() is slower, but still linear.
> > 
> > Yury Norov [NVIDIA] (4):
> >   cpumask: relax cpumask_any_but()
> >   find: add find_first_andnot_bit()
> >   cpumask: add cpumask_{first,next}_andnot() API
> >   x86/resctrl: optimize cpumask_any_housekeeping()
> 
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 
> Does anything in your "bitmap-for-next" branch depend on this
> series? If not, would you be ok if this series goes upstream
> via tip (pending confirmation from tip maintainers) to make
> for smoother upstream of resctrl patches that touch the same area?
 
Sure, please take it with the resctrl material.

> Thank you very much for doing this work. 

Thanks for warm words. :)
