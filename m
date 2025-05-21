Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F5778F59
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841340; cv=none; b=TktiaJtEG/eL31+9erNdaU3D1Hfyos2vGKXMdWxuRN2p1nEIerIMrrpfVZxZfAnKpfGK8eTQVezuFSNXOOq/JZYsCzjnDAaFIZyszHCkSZEvx3ZqahXek3HYPwbBF7cNUccqGxcB7jLObHKMqRoYFDOacFHu3HiefjMMZh2YTDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841340; c=relaxed/simple;
	bh=CZ8mZSIZauTco4Hi30L1eLkRMCkJBERFNrOe6megHp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emzVtHKQDvlVz6AKxd5mhepi6fwpBVk537z43+1KaCbA62CiAaEbOxe+FcqKzG6BmKjgZ1kblrAO8JJ7wdaxIbQ0BUCWiUDQ87Gc/084Xmir0s5WwG/t1EAoTgmGNeTGIpVhUdnvRPFel3P4nRFkSZW1UG1MRw+2V1G8ZsZLN8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=W7I6DI+C; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="W7I6DI+C"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 824A740E0192;
	Wed, 21 May 2025 15:28:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PIbF4dnBzpWM; Wed, 21 May 2025 15:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747841332; bh=t4Vcb1MmaFPNgn5E1Zzt7CZzWwTUpZCGUSm2kv4k7Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W7I6DI+CRHUxW6ntlGg113djDlDdObS5l0tzHELhabENMsSrJho2ZFIHJk2/Y7I+X
	 4PMpFaDerTTCTfSzTnSRMg3T8f+6+YQRLvKum/74ng99F5R+3cBnQWx4OIA3Y2kQYx
	 TmPJN/lnmFZqRPg++i70fz4uuNBAw+4zMgOGc3reJ8pKmp+Q0DdxwoyoYXB79QnA+F
	 gAEdC8Bb5csnej5BJnz6h/FSaAtp/JmLsEcty6VUAAoO0omYwRkFKWCnJGQTJGJn04
	 hQlTUe1tTToZEa1KpkL993SOJ9P5QJc/JC/io/drMTxPQRfo+4nHzY0pO/Tp2EDadq
	 6vGkDGhYWsa6ArT5MPBHzLW/EM/IiO/mJTmQnYKccnngokvQY1fMXnGMbwyKCYQRWs
	 TayMGmsyUXt112HlBy+J1gcwfXVb0FkXEOHquvnkZZLB1bVZGG8/6x4R3WbCEwc3Ci
	 6neAkbnV1a6spD60BsAF+2HjukLTKBMuvkOEBZZaYpoRbokwQJSXnUUk1yGv9QZM56
	 L55WlhPZO/w6iGQFlyZrfpvNPyauUfTADrD9Qra/zaNdvheGUQr+uRzD17DSVTOIh6
	 sFNc0n80Rvn8PIVYg0zLpQlaIChxchYqMNQoqWIj024e08CSSeFs6FxHpM/7XwZqaU
	 sr6GoZd+3ol6FQY+pIm9W5uQ=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E884B40E0239;
	Wed, 21 May 2025 15:28:41 +0000 (UTC)
Date: Wed, 21 May 2025 17:28:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/20] cpu: Define attack vectors
Message-ID: <20250521152834.GEaC3xIlODfZuSsXav@fat_crate.local>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
 <20250509162839.3057217-3-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509162839.3057217-3-david.kaplan@amd.com>

On Fri, May 09, 2025 at 11:28:21AM -0500, David Kaplan wrote:
> +#define smt_mitigations SMT_MITIGATIONS_OFF

Oh fun.

Let's make that explicit before someone goes and shuffles the enums:

diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 4da2ee8d9144..fdf552fd8a8b 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -203,7 +203,7 @@ enum cpu_attack_vectors {
 };
 
 enum smt_mitigations {
-	SMT_MITIGATIONS_OFF,
+	SMT_MITIGATIONS_OFF = 0,
 	SMT_MITIGATIONS_AUTO,
 	SMT_MITIGATIONS_ON,
 };

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
