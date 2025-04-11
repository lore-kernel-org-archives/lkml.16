Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80970238C08
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369684; cv=none; b=RUotKnj5D08EcoR2JZXYFcDw1Lbtb5VKzLyfrtGD10V0GwOsP21hu2A8hZRiuLnW7vCMQMj2+DaomoUGSfIQ90nZ2CHeK6IFN8VDurQvKtzQw9+KVSsesOlunNUi5KxV9nplN48wOerogLOT4unzojRONCO7DE1/QmCPYQ8wL8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369684; c=relaxed/simple;
	bh=Xt3HnaLjnmfu3dmsKJ+Lpqr7W9FxtsAPlW98fpknUrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otbj2YglmtuPOSHBpFgILkSWth2orv+fItyabB7UPyO+XQ5Cwyx+fE3SZ+uVHUXsQpfFmttxESyXkP/IRTMzysTESgoPgh0G7j4xSuvPkrqziq4jKazPwaORAAu10ySdP38latHSONyK5pYDeDuMA1ad3jnhF0AlEGHghdAcSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FTuTOidj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FTuTOidj"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4164440E01FF;
	Fri, 11 Apr 2025 11:07:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7q0eZ2auchsl; Fri, 11 Apr 2025 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744369671; bh=3eLRUX41W6VApjLhj24T7O5VZEN+1pBEnQln+Zvqtzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTuTOidjj9iBAos2bf3/to0ecfFXSGcJpyR7Mjjc+C0O1rrKeDLURiSukLW3zg8bi
	 OFnBLpeTouotbl3pYexcZsvWjnIsoHr+lbMR8Vqt7ADdpGE/dQUIhKDg0aBTuTAVh4
	 PriOQxuUyqrVLnTTINwuR1OQ1A70R3ykaMZqspkAJmXljlfgo5eGyiv8UbWUTGQdZU
	 NzIdgZMdnGYBRgNsn0P/YgXx78Oh1c/a7KyqWIEGfr0Dj44Wrc2IODJrgW8f+UoBhf
	 wZXUVHz/YUmfS7MQuKnf0OwU6HvPMCW/ESZRU3vwWOFT3Ch9zjNNS7M/MQpSHJSRam
	 H3NEATdL5LcgRw1aIHDImYfGTWX0QpopRlnErXmnw8G8Wj10xQw657uA25Q3FhqMdS
	 7ZYSn9S2NrqD6u/wCFzmYuDGohphXaMkt3UKhXERnBBQthNqk2Q5ZEvFCAOXHBOHJM
	 P3zC0VnH1bWMxXFOitFz73CLpGQN24nDf5V8bV3KHdhQeCqM0bMYRA9GRKSmQ3zenD
	 UTuNHM4/cEzdPnIpP026dUHlzUo50vqSWQJ8dluKl7TG6lPrSGWdllqnSW7kdQLBCs
	 gS9Ad0QQJNurLSCNBx8T9y2VySDqFQ2UhIlDn1Mqf4c7v+CZuLecbrDgdv9+9Vcom+
	 cQWzvFbNFUO56vj8lB6DWmnQ=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C909C40E0243;
	Fri, 11 Apr 2025 11:07:42 +0000 (UTC)
Date: Fri, 11 Apr 2025 13:07:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Consolidate the loader enablement
Message-ID: <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
References: <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
 <875xjcteq2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xjcteq2.ffs@tglx>

On Thu, Apr 10, 2025 at 01:53:25PM +0200, Thomas Gleixner wrote:
> It just exists to make the above a one time operation. What's wrong with
> having:
> 
> static void __init microcode_check_cmdline(void)
> {
> 	if (cmdline_find_option_bool(boot_command_line, "dis_ucode_ldr") <= 0)
> 		dis_ucode_ldr = false;
> }
> 
> and call that once at the proper place?

Yeah, I had that done for the mk_early_pgtbl_32() to avoid doing __pa gunk in
the loader. But if we're going to do it unconditionally now, I don't need the
tristate anymore.

Lemme zap it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
