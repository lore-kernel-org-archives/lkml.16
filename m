Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DB293453
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914933; cv=none; b=GtsDoELrV8CcLZgnOEFFfdjTk4yUrtIP0K2gbe7Ihr5mm/ut0gGJjnNCsGxifnsH8/5CZ+TX3RIzAnB+oztzfO3Xixv8YHRUqmr9lH15B3zKFMSAV/TamTUjRL/TZNF0WFkmdATNC2NXX5a49GoB9G8ae1WU9O6lC7aemBUm3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914933; c=relaxed/simple;
	bh=51rPKNWy28yHEQF5vKFIvy3xEvik4jtPFbzVCWffIjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj18GMsovk3Xa4aIZ8HtiZjiKcbhAiMLd7nC+sszP5yJ8mq+jL63Gqpn4GEj4z4iMCHFWN+o2mGfw+RXRazAXdQyLoJHlV+7/3QZryWQk+FodQCOJNslOWsNfvOKKY1FMY1glQUl4TVZ4Kkz3Sshfu2ZGoBAKUwnc34lqvEEa78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jQS+oPEw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jQS+oPEw"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E403440E01DA;
	Tue, 29 Apr 2025 08:22:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IPaWyLf-IvJ4; Tue, 29 Apr 2025 08:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745914921; bh=3CaGAPewZFSnVcYCOgKAQQmZ9XkXLsxzrSeWCgPXUSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQS+oPEw4ODjn7I6/MVlU9MF63n+93F2EeiAaC5YY+nwYD7rs+qxYH922tpFa5j0y
	 bdGvDlgTWv7iX0UiOWirJOCBoQfynHW+sDMalHB1LEdtfB8yaWpEGxlwl1S7rf4PK5
	 eEzAQKwLpwM3/UxXXvJuKcMKHrqmYeoSlvTZtOuJFfGLo8EUBFXhShRL/Q9YvvjNc0
	 3iI23JIuG3VwTVDclkSldxhIc30EliyX4r1YaNm0JnBvhffveotjSSuFXOYPqb8Xef
	 gkDJpxZpEdqGvljJP/mZKVTPzK5AxpEdRnBS08XVhkQzybVCf41I4INPiBWfydumOh
	 e6XAMMwMAla6fj+HIt1a7vVrn66fwuDlNjIGKvthKOqxfgN3F+Z0P58OK9Po+AM+9H
	 WJlV/xttDFka6z/Iu6NXusZNQkk2DRqh82TJ3f2O5jlMRzuD0XpnrNHUYEMERlL0Ak
	 sz6zZLMV4B4YGa38BQGiEKEQ5KPwN6m2Y/G3IfbcMIk1gzmBIRR/OnVgdC20T1QKbO
	 JIb+aRlAsRToaRU4bhx37sKyN1kNQ+tNptke7ABTG9Xa8O2acZqbvG6Td8EazFjF07
	 YRMeJkPFCCS/VMWfxg3kHKrpyTPiWsOLlktVBUpHvsSsvnsmWSjv3aJaqZfE9aXLX5
	 2U32jmm87PbEggm27/ZlbFP8=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8774440E0214;
	Tue, 29 Apr 2025 08:21:51 +0000 (UTC)
Date: Tue, 29 Apr 2025 10:21:43 +0200
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
Subject: Re: [PATCH v5 10/16] x86/bugs: Restructure retbleed mitigation
Message-ID: <20250429082143.GCaBCMF6MCxxwZsfs-@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-11-david.kaplan@amd.com>
 <20250428185939.GBaA_QG-bWQ7WQ3vlY@fat_crate.local>
 <LV3PR12MB9265CC8CA5922E081A5BDAD394812@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265CC8CA5922E081A5BDAD394812@LV3PR12MB9265.namprd12.prod.outlook.com>

On Mon, Apr 28, 2025 at 08:55:13PM +0000, Kaplan, David wrote:
> It's really just following the same order as the order that the select
> functions are called, which largely matches the order in existing code.

Oh ok, as long as there's not any undocumented magic in there...

> While this is mostly true, there's still a few dependencies with the update
> functions which are clearly noted with comments.

Ack.

> Yeah this makes sense.

Ok, merged in.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
