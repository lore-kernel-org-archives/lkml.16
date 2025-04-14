Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C571FDD;
	Mon, 14 Apr 2025 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644192; cv=none; b=b7FERyXDoZpDoPWafvpnLV/Cr2K+v2FlKaaIAtKy9NLtAS/NBmh4yDB55YQUJHFuLqlFmXIYI5cfFBjtkmAz2QNZYgfvsTi37XsJ3TVY2EDSBpPH74huCJSC3dNNmW8IDNW9GtqXqh8bi33J9Cq7WRuwU9RcFfU94ZeqQ7s1TmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644192; c=relaxed/simple;
	bh=TSEJYpeg45C2YolbxMVrd9LtZkHJ08PeYewx5YqW4wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uu+ICLdgQ7up4rU5HaBSs8FYrbScF0L6Jgtcm9W77l3c2Tb+Zz1zf7Zl38hUOP0FO30yMoyiSOPUpjgqJIYLo/FTEPln0SknG94aKN2snrMLAB0oLv5sdIhqAwkCbyyo+th8PjA0+051kkFDwaaCajiN1KuYdNytYYV9m5KfDUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcinJMpO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcinJMpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651C0C4CEE2;
	Mon, 14 Apr 2025 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744644192;
	bh=TSEJYpeg45C2YolbxMVrd9LtZkHJ08PeYewx5YqW4wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HcinJMpOf3DSpOyVita7hjXYfS8dZVxtAs4exUtuLwFmyL8w62wEEMcbxb8aiKpCH
	 F1HxK27fzfKclUBb+A0UsiQ+/99Vqy/rdIiS6j3/2LyGFtiC6yh66r5OXDH0t3PGn1
	 wWQ4iY5EB96nF2s1Exot9w5nd1hjwKBNQlojY8FlpZhpWlpWCMePsT9Q8Ajv/F7TZR
	 KWuttRBWtDB1cooShZrgmVl4vqjorywSjUcSG1CligoI3Skt/AJzMU0nbiIiray09n
	 ARPyoKd+Af+L1pBoT//oLZQuKDPz2k54LyFd4StVAmJITswdB4LusB6rnAuDMgqdAL
	 4nJV1Ev880r/A==
Date: Mon, 14 Apr 2025 17:23:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Christian Ludloff <ludloff@gmail.com>
Cc: linux-kernel@vger.kernel.org, Pi Xiange <xiange.pi@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tony Luck <tony.luck@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	"Ahmed S. Darwish" <darwi@linutronix.de>, x86-cpuid@lists.linux.dev,
	x86@kernel.org
Subject: [PATCH -v2] x86/cpu: Add CPU model number for Bartlett Lake CPUs
 with Raptor Cove cores
Message-ID: <Z_0oWnbcjsekHXJd@gmail.com>
References: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>


* Christian Ludloff <ludloff@gmail.com> wrote:

> > +#define INTEL_RAPTORCOVE IFM(6, 0xD7) /* Bartlett Lake */
> 
> Please fix this. It has the core and the product reversed. That is, it
> should be INTEL_BARTLETTLAKE and /* Raptor Cove */ to match
> the bulk of that file.

I switched it around for this commit - see the updated patch below.

> And yes, you also want to fix this for INTEL_PANTHERCOVE_X
> and /* Diamond Rapids */ entry.
> 
> The macros refer to products.
> The comments refer to cores.

Please send a patch if you have the time.

> Consistency, please.
> Sanity, please.

Amen!

Thanks,

	Ingo

==================>
From: Pi Xiange <xiange.pi@intel.com>
Date: Mon, 14 Apr 2025 11:28:39 +0800
Subject: [PATCH] x86/cpu: Add CPU model number for Bartlett Lake CPUs with Raptor Cove cores

Bartlett Lake has a P-core only product with Raptor Cove.

[ mingo: Switch around the define as pointed out by Christian Ludloff:
         Ratpr Cove is the core, Bartlett Lake is the product.

Signed-off-by: Pi Xiange <xiange.pi@intel.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Christian Ludloff <ludloff@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: x86-cpuid@lists.linux.dev
Link: https://lore.kernel.org/r/20250414032839.5368-1-xiange.pi@intel.com
---
 arch/x86/include/asm/intel-family.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
index 3a97a7eefb51..be10c188614f 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -126,6 +126,8 @@
 #define INTEL_GRANITERAPIDS_X		IFM(6, 0xAD) /* Redwood Cove */
 #define INTEL_GRANITERAPIDS_D		IFM(6, 0xAE)
 
+#define INTEL_BARTLETTLAKE		IFM(6, 0xD7) /* Raptor Cove */
+
 /* "Hybrid" Processors (P-Core/E-Core) */
 
 #define INTEL_LAKEFIELD			IFM(6, 0x8A) /* Sunny Cove / Tremont */
