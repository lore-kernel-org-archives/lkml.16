Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405892A1D8;
	Fri,  7 Feb 2025 04:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738903833; cv=none; b=rbU0xp7cQUNS+cUK3Gndh8abYcRMNKUAWatBpzCoxaVyp4onEmSMs2CpKF69dW8/UBZ/oTF4j1ff+mt9C+8ziPqMUGWRi3eV49kYJfhm+sN2KEkYkytydTOj2SwEwrLXDIlIusIL0L+4eqLjBFdTDnHIHFGZr04eEaB3Q/gcoSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738903833; c=relaxed/simple;
	bh=929Exw51MEvbwVtcyaVIc6NPKRlggudvA42S70626J4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=q+6oWaX6/7l97lXR1iSPUbUmz6nbyefyoQlOXd9yXJpMTavn7uP5aT3P9BHuXT/xMMxLI0RFpvQ+tpU1ds0IUoBGcMJoCIILxDZvtui6WIOUBdVEIeGbYjOouVSJSVZqit5M7vhSEKF4oW2nawvVh4kNwRMVCkxmXy79rRen2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=On3L20QT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="On3L20QT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C32C4CED1;
	Fri,  7 Feb 2025 04:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738903832;
	bh=929Exw51MEvbwVtcyaVIc6NPKRlggudvA42S70626J4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=On3L20QTFvBoRzk52pz2o4yw/IhLGEHzp1u8xRVp0xO85cLpGUYcclJZ2Y3ygco1V
	 M5q/ZLQT4hzi5FemSU+WzQVhqTnsrlqjK+Df1nMm2hYV+KDSDKy1Uy3h//gt1Csa9S
	 XOzvTPH1QHsbJh22r9A6pQfp4DZgWwmsJnqoNW7Y=
Date: Thu, 6 Feb 2025 20:50:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, Andy
 Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, Eric
 Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, James
 Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, Krzysztof
 Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Pratyush Yadav <ptyadav@amazon.de>, Rob Herring <robh+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky
 <thomas.lendacky@amd.com>, Usama Arif <usama.arif@bytedance.com>, Will
 Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Message-Id: <20250206205030.38d84d4062786c9e36a825b6@linux-foundation.org>
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

My x86_64 allmodconfig sayeth:

WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xca (section: .text) -> memblock_alloc_try_nid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xf5 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x100 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x11d (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x129 (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x14e (section: .text) -> memblock_phys_alloc_range (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x261 (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x26d (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x29b (section: .text) -> memblock_alloc_range_nid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x334 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x33f (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x363 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x371 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x3a1 (section: .text) -> scratch_scale (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x3af (section: .text) -> scratch_size_global (section: .init.data)

