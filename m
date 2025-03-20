Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AC41E32D3;
	Thu, 20 Mar 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459450; cv=none; b=nvOq6unqoJpHM5T7CNLfTnqJI0Lrseth8WzDuqA0Nr+Watsdgl7xbj0kZqRuX2dGazB0mZM6n6R+CGVw4+q8YHTAH6P0xp8eW016tb3TWc3U1vrqJ7OpjSjwVx+IVur6yD1mPN1XU+Q+ypFHy+MQBmp8dM/qtRrErEfjz+fBAH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459450; c=relaxed/simple;
	bh=v+FOAUR/wqoAqHaoplhVPRBHIikWSf8V1laXOuxnNfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbkh1NNoyXigaEacVgsZbDhXfXpIoGSMq8NgdVQ8etgKHcEoTpNo14RLxmeIjVCkd4d3dtopH0nymDZ2Ith5rObd7wqLPdJ1kXSAtb0zeQF2/+8N0ES+wPRhDbkYTDSA73wGSl1sYmC46vNdxTJp7kqU4XykgVkNTXsSX480XgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEkJKg+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEkJKg+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EF6C4CEDD;
	Thu, 20 Mar 2025 08:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742459450;
	bh=v+FOAUR/wqoAqHaoplhVPRBHIikWSf8V1laXOuxnNfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEkJKg+eJogLP7TusVxf7b7P/d9nFvPAwJ5TKX+AvnXMsyoNB9Uf9tgOI6jR88QCM
	 JkYvO2jo5I7eAB1u9/xJZpDu+Oopr3mT2NVSZ/EvU3R7jh6dZlhAZ16GVDmlTvpffq
	 iiSDgZBbF1JkdErKodK9X7EiWFC3Yg13LAnitCwjXwRjzEy8zMTLp1Wq3sscrIIWeM
	 FgmpDRVRnJ37VPZfmcEgw3YliLJJdIJCmGuvzrskhLpVCAdq6HYTXmRZnTX/wOuHDY
	 YyGVPP0jB0PQbEJ3m2aeUQfqftuMQ8nfawOMqXiDaJiTxOpnJPFcSB1Wf3yRH0h/Eg
	 AMVe5byYQWq0Q==
Date: Thu, 20 Mar 2025 09:30:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, 
	bp@alien8.de, catalin.marinas@arm.com, dave.hansen@linux.intel.com, 
	dwmw2@infradead.org, ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, 
	corbet@lwn.net, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, 
	robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 12/16] arm64: add KHO support
Message-ID: <20250320-muscular-cougar-of-apotheosis-e4c80b@krzk-bin>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-13-changyuanl@google.com>
 <55a5e3f3-1b3f-469b-bde0-69abfff826e4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55a5e3f3-1b3f-469b-bde0-69abfff826e4@kernel.org>

On Thu, Mar 20, 2025 at 08:13:24AM +0100, Krzysztof Kozlowski wrote:
> On 20/03/2025 02:55, Changyuan Lyu wrote:
> >  
> > +/**
> > + * early_init_dt_check_kho - Decode info required for kexec handover from DT
> > + */
> > +static void __init early_init_dt_check_kho(void)
> > +{
> > +	unsigned long node = chosen_node_offset;
> > +	u64 kho_start, scratch_start, scratch_size;
> > +	const __be32 *p;
> > +	int l;
> > +
> > +	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
> > +		return;
> > +
> > +	p = of_get_flat_dt_prop(node, "linux,kho-fdt", &l);
> 
> 
> You are adding undocumented ABI for OF properties. That's not what was
> explained last time.
> 
> NAK.

Also there are checkpatch warnings :/

Best regards,
Krzysztof

