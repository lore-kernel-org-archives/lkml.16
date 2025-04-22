Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71BC253F35
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312170; cv=none; b=O8x/Q8OLECE2Lii4DPtqFdcce2zgw6pyNUY6D04tR2nGupdvPqyInuNntQA6EbEEgEwDUNHGev9grpzAUrhGg5WOpHfKQZnMtU4mJVqrrYujt9Jg3bLZKSZOglaGFHpSxtTljNMRA+vZ29suCWojCwGs6PvzNTTfnyXrzQ9XQa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312170; c=relaxed/simple;
	bh=qXI2HAsvQf2w1MSbA7K9uGxTvVYRPO2tahW3Jx9mG3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k2KNTI+weemhKwb+LjzoV4w5rLC8se+MOKV+E8Yy31u+31SdDDRnb6H375/my5elIEpWkyn/xBu9uyefZlNDg01dBBrdQhVyrjlowa5FSrxBfU2mB/QWnU0zZe2B76xjTF/nsyiI6iiW91QTU1W/FCq6ZVZwu6/GATabStDlOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jFsfhbpV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jFsfhbpV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4537940E01FA;
	Tue, 22 Apr 2025 08:56:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id juvRHB7T_svc; Tue, 22 Apr 2025 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745312156; bh=rFDFhcg8aeoqfceJP/IDVW6dcvhJCDAYgx/s5YA2aL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFsfhbpVOsJZPJdNLautem6k/UOl3CTiXdmmoxM425+hhCF5PYO1tHyTfRL7KuTme
	 HxV11eXLUrWPhRjPL8ENUzlEHaXGU6EnwC4/Yi9GyOZxDwnqPSG/tHSOyMWBksQpGI
	 vKGS34Flc1RATmaGHwce4g5We9VHpy+Ri8vxXGJDa3IiNzSCElBme59E6qmhumkbfl
	 MkuAJdRQFnbJf593p7LZsvVXx+M0LbCxVPr3rbTVc/NU3dKJ1xZKNPgWubyElMIxsw
	 AWQXP/FFuQmZHzu8625AJ+fnI6Hr1ny9Ipkndmu7zAVQLF6rQqvJ0m1cdk1ReO2h0g
	 nBjEMPn7Pqz81oCBv8cmlwGzf4Z4iCT3OFcFZIv/BywxY9c2gXr3RAbeW66FylN3fa
	 6AaWjNpxVxiRnzrRQPAY1ga8Z33JNRAC8W9fzvcCm5BCBci1BPr9VRpO9A9fRrLQtr
	 aGSdH1UUKiiieYDfqoAZzDzpWjjjJBrYYVIdBe/lU7fWNF5NIJl0OKf7mBXk0E8NIE
	 MZF4rcxz1QR1VlknKo90l9+cGxPuGl25Gbmuy5Zlr621moN4I4a5qdL6ThUbEX9jUo
	 Pmejh0v7ggSWAwZ2nw6Rci5toYkdkSiaWmMcOmXEj9kFp+sBOXzuiFu/O68kT/dc53
	 893kZJCgr3PVvQL36CfKJgkE=
Received: from rn.tnic (unknown [78.130.214.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5E5D540E01F6;
	Tue, 22 Apr 2025 08:55:45 +0000 (UTC)
Date: Tue, 22 Apr 2025 10:56:46 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/16] x86/bugs: Restructure TAA mitigation
Message-ID: <20250422085646.GBaAdZzlRuyJmo4Tct@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-3-david.kaplan@amd.com>
 <20250419123655.GRaAOY5yCyIz6TYcCC@fat_crate.local>
 <LV3PR12MB92651777DD5C8A010E010A8794B92@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB92651777DD5C8A010E010A8794B92@LV3PR12MB9265.namprd12.prod.outlook.com>

On Sun, Apr 20, 2025 at 09:03:25PM +0000, Kaplan, David wrote:
> No, because taa_vulnerable() requires both X86_BUG_TAA and X86_FEATURE_RTM.
> 
> In taa_select_mitigation() there is a difference depending on which of these doesn't exist which sets the mitigation to either OFF (if unaffected) or TSX_DISABLED (if no RTM).
> 

Yah, another mis-designed thing from back then. If RTM is disabled, then
TAA is mitigated. Period.

And us making how a vuln is mitigated into a separate thing is
unnecessary complication IMO. IOW, TAA_MITIGATION_TSX_DISABLED shouldn've
been done, in hindsight.

But whatever, another topic.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
