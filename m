Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABEC272E60
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749142206; cv=none; b=SV6HhbShMtzWe6qOGj4/nnfC2lYfQvgS30zsla0/3rIvuuFkg/Lw4vzrcULOxbcDRT54ifBfOzfek6nFpwuEReSD3JGnjIZ1GxcmtcJZSouE6mjQFFO6QwHjy4tTo2+chP7Xz0qX5JiaoGmOud4fH6NQzUMcQqY4VL4hejLV7ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749142206; c=relaxed/simple;
	bh=5yD0PvMAQQ3XN8Fa5txtl6/IIVYJpcPJ9bokJkUxS0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dXZ9kaUZuLw2/2V/d8tX0FW79hst+MtJLwnjMcaPOLB5JbvYg4kRzfbr8lQQrMOJIgsvK+A23cgQCsoGNQl9qlslIGCxxCIt6PjSsopMASfTGdFEecuHj5fgkBb/e0KS1vvpyQ+Q9L17RTZzWR8kVCYLTThLBFliCfCViK2iqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wAagZnuF; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wAagZnuF"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7480d44e6f9so1191525b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749142204; x=1749747004; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLTPXPCNlsILu6jl+2bKHHB8KGvKcIrJx7gvSPqEvlo=;
        b=wAagZnuFURQYq7ApcpmZ9gcKqkExals7nfd5BFlgjW4L7V+Bd8aHQXoKOWz8z125Jn
         pwOjiP2mRC6uqjNxVPttIUION606MU/J5hbi0qzQPN2wR7ld2m7Ei6dolOCnw+k/NgDo
         N0VpmccV4hIUcySTMjfFEiDFqj4FLmypDZuMKyS3Eq8EiUVFPqa4SFVYnN3/2BLazXSJ
         6CM2yJCVoeYZjKYyKEkBNz+2Cjmj6Xy8fCIT12qvlG+2rhSKUrDkZc2zbgihRx2njBXF
         nZlFZ2BIG4wnq4HYwEZA+OPvZbyWD9dvzgOkQih0IdrZa477ujn2w2yIffNwvjTpOtLi
         aHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142204; x=1749747004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLTPXPCNlsILu6jl+2bKHHB8KGvKcIrJx7gvSPqEvlo=;
        b=Apw8Tk7Ayuzfwz2rGSHUG0Q6jNHe9bj7oSRXD7Uhv88Wjj+zw49HVj1k3f8WVOuaeo
         eIz87JAWzb1TOjlq0H9VBJ//AMzSIn7keh3dUupSdKmnVf9zVEiWE15YnpHGddeQD22E
         tu7efUfX+F7EK612IqUPJE8zBA5PzH1+dGxBsYOoawin5jTkC9xk1Jyf193roiwpNaHD
         YiKCiw7mGO4T+NxEv8xtGsY91SZY76AMiRQQC5hu6TQqXbKoCgC35gqgFSjJZGoBwh89
         OW43fax63uwqW6NF0t1OTivGd1OovJXLNVQBcs6jevymWVEPm29Nh3J+rtR/rBjx/niI
         msww==
X-Gm-Message-State: AOJu0YxPJAjN1WCPRpZjh/Ada1yk+xOaU2XlLU+DhSTERVUHr+qEhFxr
	9jTaED5Yc8QKo6qVPAapVwWNYd5jwj1SjcdoL58nJMC5T+htboq2igcFeJcBi5tMPFrYXbnBPz8
	FaHG4FQ==
X-Google-Smtp-Source: AGHT+IHSmz97ipsoKiWytBBdVnEdth+nXlg7KYI1vLpnEw2twPv9cYfqKXfk72Q3vYVaW+m3AQHLiwnbdK4=
X-Received: from pfst26.prod.google.com ([2002:aa7:8f9a:0:b0:736:47b8:9b88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3c88:b0:736:5753:12f7
 with SMTP id d2e1a72fcca58-74827e523e7mr699482b3a.3.1749142204576; Thu, 05
 Jun 2025 09:50:04 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:50:03 -0700
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605163544.3852565-1-riel@surriel.com>
Message-ID: <aEHKu-0g6_MBiAST@google.com>
Subject: Re: [RFC PATCH v3 0/7] Intel RAR TLB invalidation
From: Sean Christopherson <seanjc@google.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	bp@alien8.de, x86@kernel.org, nadav.amit@gmail.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 05, 2025, Rik van Riel wrote:
> This patch series adds support for IPI-less TLB invalidation
> using Intel RAR technology.
> 
> Intel RAR differs from AMD INVLPGB in a few ways:
> - RAR goes through (emulated?) APIC writes, not instructions
> - RAR flushes go through a memory table with 64 entries
> - RAR flushes can be targeted to a cpumask
> - The RAR functionality must be set up at boot time before it can be used
> 
> The cpumask targeting has resulted in Intel RAR and AMD INVLPGB having
> slightly different rules:
> - Processes with dynamic ASIDs use IPI based shootdowns
> - INVLPGB: processes with a global ASID 
>    - always have the TLB up to date, on every CPU
>    - never need to flush the TLB at context switch time
> - RAR: processes with global ASIDs
>    - have the TLB up to date on CPUs in the mm_cpumask
>    - can skip a TLB flush at context switch time if the CPU is in the mm_cpumask
>    - need to flush the TLB when scheduled on a cpu not in the mm_cpumask,
>      in case it used to run there before and the TLB has stale entries
> 
> RAR functionality is present on Sapphire Rapids and newer CPUs.
> 
> Information about Intel RAR can be found in this whitepaper.
> 
> https://www.intel.com/content/dam/develop/external/us/en/documents/341431-remote-action-request-white-paper.pdf
> 
> This patch series is based off a 2019 patch series created by Intel

Do you have performance numbers?  IIRC, the reason that 2019 series never went
anywhere is because RAR wasn't a win for bare metal.  Though I believe it _was_
a win for KVM, due to the cost of an IPI being significantly higher (requires a
VM-Exit => VM-Enter roundtrip).

> with patches later in the series modified to fit into
> the TLB flush code structure we have after AMD INVLPGB functionality
> was integrated.

Please provide diff stats in the cover letter, e.g. so that sub-maintainers like
myself don't have to scroll through every patch to figure out whether or not there's
something that requires their review/ack.
